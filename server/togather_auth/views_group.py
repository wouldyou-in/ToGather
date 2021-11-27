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

from rest_framework_simplejwt.tokens import RefreshToken, AccessToken


from random import randint

from user.models import User, Group

from .serializers import EmailSerializer, SignUpSerializer, SignInSerializer


class SignIn(APIView):
    permission_classes = [AllowAny]

    def get_ip(self, request):
        x_forwarded_for = request.META.get("HTTP_X_FORWARDED_FOR")
        if x_forwarded_for:
            request_ip = x_forwarded_for.split(",")[0]
        else:
            request_ip = request.META.get("REMOTE_ADDR")
        return request_ip

    def get(self, request, group):
        request_ip = self.get_ip(request)
        email = get_object_or_404(Group, unique_name=group).email
        token = randint(100000, 999999)
        cache.set(
            f"emailLogin:{request_ip}:{email}",
            token,
            timeout=300,
        )  # 기본 5분

        # 이메일 보내기

        send_email = EmailMessage(
            "투게더 로그인을 위한 이메일입니다.",
            f"token 값 ::: {token}",
            to=[email],
        )

        send_email.send()
        return Response()

    def post(self, request, group):
        request_ip = self.get_ip(request)

        serializer = SignInSerializer(data=request.data)
        serializer.is_valid()
        if serializer.errors:  # 검증오류
            return JsonResponse(
                {"status": "fail", "message": serializer.errors},
                status=status.HTTP_400_BAD_REQUEST,
            )

        target = get_object_or_404(Group, unique_name=group)
        email = target.email
        if (email != serializer.validated_data["email"]) or (
            serializer.validated_data["token"]
            != cache.get(f"emailLogin:{request_ip}:{email}")
        ):
            return JsonResponse({"status": "fail", "message": "Information Not Match"})

        refresh_token = RefreshToken.for_user(target)
        cache.delete(f"emailLogin:{request_ip}:{email}")

        return Response(
            {
                "access_token": str(refresh_token.access_token),
                "refresh_token": str(refresh_token),
            }
        )


class SignUp(APIView):
    permission_classes = [AllowAny]

    def get_ip(self, request):
        x_forwarded_for = request.META.get("HTTP_X_FORWARDED_FOR")
        if x_forwarded_for:
            request_ip = x_forwarded_for.split(",")[0]
        else:
            request_ip = request.META.get("REMOTE_ADDR")
        return request_ip

    def get(self, request):
        email = request.GET.get("email", None)
        request_ip = self.get_ip(request)

        if email is None:  # 이메일 존재 x 시 오류
            return JsonResponse(
                {"status": "fail", "message": "Email Requried"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        serializer = EmailSerializer(data={"email": email})  # 이메일 검증
        serializer.is_valid()
        if serializer.errors:  # 검증오류
            return JsonResponse(
                {"status": "fail", "message": serializer.errors},
                status=status.HTTP_400_BAD_REQUEST,
            )

        if User.objects.filter(email=email).exists():  # 이메일 존재시
            return JsonResponse({"status": "exist", "email": email})

        if cache.get(f"emailVerify:{request_ip}:{email}") is True:  # 이메일 인증 완료
            return JsonResponse({"status": "success", "email": email})

        if cache.ttl(f"emailVerify:{request_ip}:{email}") > 0:  # 이메일 인증중
            return JsonResponse({"status": "wait", "email": email})

        return JsonResponse({"status": "none", "email": email})  # 아무것도 아니면

    def post(self, request):
        email = request.GET.get("email", None)
        request_ip = self.get_ip(request)

        if email is None:
            serializer = SignUpSerializer(data=request.data)
            serializer.is_valid()
            if serializer.errors:
                return JsonResponse(
                    {"status": "fail", "message": serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            email = serializer.validated_data["email"]

            if (
                cache.get(f"emailVerify:{request_ip}:{email}") != True
            ):  # Email Verification
                return JsonResponse(
                    {"status": "fail", "message": "You Must Verify Email First"}
                )

            if Group.objects.filter(
                unique_name=serializer.validated_data["group_unique"]
            ).exists():  # 고유이름 존재시
                return JsonResponse(
                    {"status": "fail", "message": "Unique Name Exsited"}
                )

            serializer.save()
            cache.delete(f"emailVerify:{request_ip}:{email}")
            serializer.validated_data.pop("agreement")
            return Response(serializer.validated_data)

        else:
            serializer = EmailSerializer(data={"email": email})  # 이메일, 토큰 검증
            serializer.is_valid()
            if serializer.errors:  # 검증오류
                return JsonResponse(
                    {"status": "fail", "message": serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            if "token" in request.data:
                req_token = request.data["token"]
                token = cache.get(f"emailVerify:{request_ip}:{email}")
                if req_token == token:
                    cache.set(f"emailVerify:{request_ip}:{email}", True, timeout=300)

            else:
                token = randint(100000, 999999)
                cache.set(
                    f"emailVerify:{request_ip}:{email}",
                    token,
                    timeout=300,
                )  # 기본 5분

                # 이메일 보내기

                send_email = EmailMessage(
                    "투게더 인증을 위한 이메일입니다.",
                    f"token 값 ::: {token}",
                    to=[email],
                )

                send_email.send()

            return Response(status=status.HTTP_200_OK)
