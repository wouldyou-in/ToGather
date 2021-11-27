from django.conf import settings
from django.contrib.auth import logout as django_logout
from django.core.exceptions import ObjectDoesNotExist
from django.core.mail import EmailMessage, send_mail
from django.core.cache import cache
from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _

from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.views import TokenViewBase

from user.models import Group

from .serializers import QuestionSerializer, AnswerSerializer


class QuestionAPI(APIView):
    def post(self, request, group, question_id=None):
        group_object = get_object_or_404(Group, unique_name=group)

        if not question_id:
            request.data["group"] = group_object.id
            question_serializer = QuestionSerializer(data=request.data)
            question_serializer.is_valid()
            if question_serializer.errors:  # 검증오류
                return JsonResponse(
                    {"status": "fail", "message": question_serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            question_serializer.save()
            return Response(question_serializer.data)
        else:
            if group != group_object.unique_name:
                return JsonResponse(
                    {"status": "fail", "message": "Group Verify Error"},
                    status=status.HTTP_406_NOT_ACCEPTABLE,
                )

            answer_serializer = AnswerSerializer(data=request.data)
            answer_serializer.is_valid()
            if answer_serializer.errors:  # 검증오류
                return JsonResponse(
                    {"status": "fail", "message": answer_serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            question = group_object.question.filter(id=question_id).first()
            if not question:
                return JsonResponse(
                    {"status": "fail"}, status=status.HTTP_404_NOT_FOUND
                )
            question.answer = answer_serializer.validated_data["answer"]
            question.complete = True
            question.save()

            question_serializer = QuestionSerializer(question)
            return_data = question_serializer.data
            return Response(return_data)

    def get(self, request, group, question_id=None):
        group_object = get_object_or_404(Group, unique_name=group)

        if question_id:
            question = group_object.question.filter(id=question_id).first()
            if not question:
                return JsonResponse(
                    {"status": "fail"}, status=status.HTTP_404_NOT_FOUND
                )
            question_serializer = QuestionSerializer(question)
            return_data = question_serializer.data
            return Response(return_data)
        else:
            type = request.GET.get("type", None)  # complete , wait

            if type == "complete":
                data = group_object.question.filter(complete=True).all()
                question_serializer = QuestionSerializer(data, many=True)

                return JsonResponse(
                    {"question_num": data.count(), "question": question_serializer.data}
                )
            elif type == "wait":
                data = group_object.question.filter(complete=False).all()
                question_serializer = QuestionSerializer(data, many=True)

                return JsonResponse(
                    {"question_num": data.count(), "question": question_serializer.data}
                )
            else:
                data = group_object.question.all()
                complete_count = data.filter(complete=True).all().count()
                wait_count = data.filter(complete=False).all().count()
                serializer = QuestionSerializer(data, many=True)

                return JsonResponse(
                    {
                        "question_num": data.count(),
                        "question_complete": complete_count,
                        "question_wait": wait_count,
                        "question": serializer.data,
                    }
                )
