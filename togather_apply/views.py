from django.http import JsonResponse
from django.shortcuts import get_object_or_404

from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from user.models import Group, User

from .models import ApplyForm, ApplyFormQuestion, Apply
from .serializers import (
    ApplyFormSerializer,
    ApplyFormQuestionSerializer,
    ApplySerializer,
)


class ValidateAPIAbstract(APIView):
    def validate(self, request, group):
        if group != User.objects.get_subclass(id=request.user.id).unique_name:
            return False, JsonResponse(
                {"status": "fail", "message": "Group Verify Error"},
                status=status.HTTP_406_NOT_ACCEPTABLE,
            )

        if not ApplyForm.objects.filter(group=request.user).exists():
            return False, JsonResponse(
                {"status": "fail", "message": "No Apply Form"},
                status=status.HTTP_404_NOT_FOUND,
            )
        return True, None


class ApplyFormAPI(ValidateAPIAbstract):
    def validate_request(self, request, group):
        # POST 와 PUT Request 를 검증합니다.

        question_data = request.data.get("question", None)
        if question_data is not None:
            del request.data["question"]

        applyform_data = request.data
        applyform_data["group"] = User.objects.get_subclass(id=request.user.id)
        if group != applyform_data["group"].unique_name:
            return (
                False,
                JsonResponse(
                    {"status": "fail", "message": "Group Verify Error"},
                    status=status.HTTP_406_NOT_ACCEPTABLE,
                ),
                None,
                None,
            )

        applyform_serializer = ApplyFormSerializer(data=applyform_data)
        applyform_serializer.is_valid()
        if applyform_serializer.errors:  # 검증오류
            return (
                False,
                JsonResponse(
                    {"status": "fail", "message": applyform_serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                ),
                None,
                None,
            )

        return True, None, applyform_serializer, question_data

    def get(self, request, group):
        group = get_object_or_404(Group, unique_name=group)

        if ApplyForm.objects.filter(group=group).exists():
            form_data = ApplyForm.objects.filter(group=group).first()
            return_data = ApplyFormSerializer(form_data).data
            return_data["question"] = ApplyFormQuestionSerializer(
                form_data.apply_form_question, many=True
            ).data
            return Response(return_data)
        else:
            return JsonResponse(
                {"status": "fail", "message": "No Apply Form"},
                status=status.HTTP_404_NOT_FOUND,
            )

    def post(self, request, group):
        validated, result, applyform_serializer, question_data = self.validate_request(
            request, group
        )
        if not validated:
            return result

        if ApplyForm.objects.filter(group=request.user).exists():  # 이미 생성했는지 확인
            return JsonResponse({"stauts": "fail", "message": "Already Created"})
        else:
            applyform_serializer.save()

        if question_data is not None:
            applyform_id = ApplyForm.objects.get(group=request.user).id
            temp_data = []
            for question in question_data:
                question["apply_form"] = applyform_id
                temp_data.append(question)
            question_serializer = ApplyFormQuestionSerializer(data=temp_data, many=True)
            question_serializer.is_valid()
            if question_serializer.errors:
                return JsonResponse(
                    {"status": "fail", "message": question_serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            question_serializer.save()

        return_data = applyform_serializer.data
        if question_serializer:
            return_data["question"] = question_serializer.data
        else:
            return_data["question"] = {}

        return Response(return_data)

    def put(self, request, group):
        (
            validated,
            result,
            edit_applyform_serializer,
            edit_question_data,
        ) = self.validate_request(request, group)
        if not validated:
            return result

        if ApplyForm.objects.filter(group=request.user).exists():
            applyform = ApplyForm.objects.filter(group=request.user).first()
            applyform_serializer = ApplyFormSerializer(
                applyform, data=edit_applyform_serializer.data, partial=True
            )
            applyform_serializer.is_valid()

            if applyform_serializer.errors:
                return Response(applyform_serializer.errors)

            applyform_serializer.save()  # 기존 폼 업데이트

            ApplyFormQuestion.objects.filter(
                apply_form=applyform
            ).delete()  # 기존 세부질문 삭제
            if edit_question_data is not None:
                applyform_id = applyform.id
                temp_data = []
                for question in edit_question_data:
                    question["apply_form"] = applyform_id
                    temp_data.append(question)
                question_serializer = ApplyFormQuestionSerializer(
                    data=temp_data, many=True
                )
                question_serializer.is_valid()
                if question_serializer.errors:
                    return JsonResponse(
                        {"status": "fail", "message": question_serializer.errors},
                        status=status.HTTP_400_BAD_REQUEST,
                    )
                question_serializer.save()  # 세부질문 저장

            return_data = applyform_serializer.data
            if question_serializer:
                return_data["question"] = question_serializer.data
            else:
                return_data["question"] = {}

            return Response(return_data)
        else:
            return JsonResponse(
                {"status": "fail", "message": "No Apply Form"},
                status=status.HTTP_404_NOT_FOUND,
            )


class ApplyAPI(ValidateAPIAbstract):
    def get(self, request, group=None, apply_id=None):
        validated, result = self.validate(request, group)
        if not validated:
            return result

        if not apply_id:
            applyform = ApplyForm.objects.filter(group=request.user).first()
            apply = Apply.objects.filter(apply_form=applyform.id).values_list(
                "id", flat=True
            )
            return JsonResponse(
                {
                    "apply_count": apply.count(),
                    "apply_email": list(apply),
                }
            )
        else:
            apply = get_object_or_404(Apply, id=apply_id)
            return Response(ApplySerializer(apply).data)

    def post(self, request, group=None):
        group_object = get_object_or_404(Group, unique_name=group)
        if not ApplyForm.objects.filter(group=group_object).exists():
            return JsonResponse(
                {"status": "fail", "message": "No Apply Form"},
                status=status.HTTP_404_NOT_FOUND,
            )
        else:
            request.data["apply_form"] = group_object.apply_form.get().id
            apply_serializer = ApplySerializer(data=request.data)
            apply_serializer.is_valid()
            if apply_serializer.errors:
                return JsonResponse(
                    {"status": "fail", "message": apply_serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            apply_serializer.save()
            return Response(apply_serializer.data)


class ApplyContactAPI(ValidateAPIAbstract):
    def get(self, request, group):
        validated, result = self.validate(request, group)
        if not validated:
            return result

        applyform = ApplyForm.objects.filter(group=request.user).first()
        apply = Apply.objects.filter(apply_form=applyform.id).values_list(
            "email", flat=True
        )

        return JsonResponse(
            {
                "apply_count": apply.count(),
                "apply_email": list(apply),
            }
        )
