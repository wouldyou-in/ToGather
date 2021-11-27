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

from user.models import Group, User

from .serializers import PromotionSerializer
from .models import Promotion


class ValidateAPIAbstract(APIView):
    def validate(self, request, group):
        if group != User.objects.get_subclass(id=request.user.id).unique_name:
            return False, JsonResponse(
                {"status": "fail", "message": "Group Verify Error"},
                status=status.HTTP_406_NOT_ACCEPTABLE,
            )

        return True, None


class PromotionAPI(ValidateAPIAbstract):
    def get(self, request, group, promotion_id=None):
        group_object = get_object_or_404(Group, unique_name=group)

        if promotion_id:  # id 지정할때
            promotion = group_object.promotion.filter(id=promotion_id).first()
            if not promotion:
                return JsonResponse(
                    {"status": "fail", "message": "Not Found"},
                    status=status.HTTP_404_NOT_FOUND,
                )
            else:
                return Response(PromotionSerializer(promotion).data)

        else:
            promotion = group_object.promotion.all()
            return Response(
                {
                    "promotion_num": promotion.count(),
                    "promotion": PromotionSerializer(promotion, many=True).data,
                }
            )

    def post(self, request, group, promotion_id=None):
        validated, result = self.validate(request, group)
        if not validated:
            return result

        if not promotion_id:  # 홍보물 생성
            request.data["group"] = request.user.id
            serializer = PromotionSerializer(data=request.data)
            serializer.is_valid()
            if serializer.errors:
                return JsonResponse(
                    {"status": "fail", "message": serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            serializer.save()
            return Response(serializer.data)
        else:
            ###TODO 파일 업로드 / 구현
            return Response(200)

    def patch(self, request, group, promotion_id=None):
        validated, result = self.validate(request, group)
        if not validated:
            return result

        if not promotion_id:
            return JsonResponse(
                {"status": "fail", "message": "Not Found"},
                status=status.HTTP_404_NOT_FOUND,
            )
        else:
            promotion = (
                Group.objects.get(id=request.user.id)
                .promotion.filter(id=promotion_id)
                .first()
            )
            if not promotion:
                return JsonResponse(
                    {"status": "fail", "message": "Not Found"},
                    status=status.HTTP_404_NOT_FOUND,
                )

            serializer = PromotionSerializer(promotion, data=request.data, partial=True)
            serializer.is_valid()
            if serializer.errors:
                return JsonResponse(
                    {"status": "fail", "message": serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            serializer.save()
            return Response(serializer.data)
