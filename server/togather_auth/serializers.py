from rest_framework import serializers
from rest_framework_simplejwt.tokens import RefreshToken

from user.models import Group


class TokenRefreshSerializer(serializers.Serializer):
    refresh_token = serializers.CharField()

    def validate(self, attrs):
        refresh_token = RefreshToken(attrs["refresh_token"])

        data = {"access_token": str(refresh_token.access_token)}

        return data


class EmailSerializer(serializers.Serializer):
    email = serializers.EmailField(required=True)


class SignUpSerializer(serializers.Serializer):
    agreement = serializers.BooleanField(write_only=True)
    group_name = serializers.CharField()
    group_unique = serializers.RegexField(r"^[a-zA-Z0-9_-]+$")
    email = serializers.EmailField()

    def create(self, validated_data):
        g = Group()
        g.name = validated_data["group_name"]
        g.email = validated_data["email"]
        g.unique_name = validated_data["group_unique"]
        g.save()
        return g


class SignInSerializer(serializers.Serializer):
    email = serializers.EmailField()
    token = serializers.IntegerField()
