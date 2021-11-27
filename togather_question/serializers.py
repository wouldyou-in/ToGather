from rest_framework import serializers

from user.models import Group

from .models import Question


class AnswerSerializer(serializers.Serializer):
    answer = serializers.CharField()


class QuestionSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    public = serializers.BooleanField(default=True)
    complete = serializers.BooleanField(read_only=True)
    title = serializers.CharField()
    content = serializers.CharField()
    answer = serializers.CharField(read_only=True)

    group = serializers.PrimaryKeyRelatedField(
        queryset=Group.objects.all(), write_only=True, required=True
    )

    updated_at = serializers.DateTimeField(read_only=True)
    created_at = serializers.DateTimeField(read_only=True)

    class Meta:
        model = Question
        fields = (
            "id",
            "public",
            "title",
            "content",
            "answer",
            "group",
            "updated_at",
            "created_at",
            "complete",
        )

    def create(self, validated_data):
        return Question.objects.create(**validated_data)
