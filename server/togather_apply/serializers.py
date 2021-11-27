from rest_framework import serializers

from user.models import Group

from .models import ApplyForm, ApplyFormQuestion, Apply


# https://stackoverflow.com/questions/28945327/django-rest-framework-with-choicefield
class ChoiceField(serializers.ChoiceField):  # Choice Field 리턴을 display name 으로 해줌
    def to_representation(self, obj):
        if obj == "" and self.allow_blank:
            return obj
        return self._choices[obj]

    def to_internal_value(self, data):
        # To support inserts with the value
        if data == "" and self.allow_blank:
            return ""

        for key, val in self._choices.items():
            if val == data:
                return key
        self.fail("invalid_choice", input=data)


class ApplyFormSerializer(serializers.ModelSerializer):
    name = serializers.BooleanField(required=True)
    email = serializers.BooleanField(required=True)
    phone = serializers.BooleanField(required=True)
    department = serializers.BooleanField(required=True)
    age = serializers.BooleanField(required=True)
    gender = serializers.BooleanField(required=True)

    group = serializers.PrimaryKeyRelatedField(
        queryset=Group.objects.all(), write_only=True, required=True
    )

    class Meta:
        model = ApplyForm
        fields = (
            "name",
            "email",
            "phone",
            "department",
            "age",
            "gender",
            "group",
        )

    def create(self, validated_data):
        return ApplyForm.objects.create(**validated_data)


class ApplyFormQuestionSerializer(serializers.ModelSerializer):

    question = serializers.CharField(required=True, allow_blank=False)
    require = serializers.BooleanField(default=False)
    type = ChoiceField(
        source="question_type", choices=ApplyFormQuestion.TypeChoice, required=True
    )

    apply_form = serializers.PrimaryKeyRelatedField(
        queryset=ApplyForm.objects.all(), write_only=True, required=True
    )

    class Meta:
        model = ApplyFormQuestion
        fields = ("question", "require", "type", "apply_form")

    def create(self, validated_data):
        return ApplyFormQuestion.objects.create(**validated_data)


class ApplySerializer(serializers.ModelSerializer):
    name = serializers.CharField(default="")
    email = serializers.CharField(default="")
    phone = serializers.CharField(default="")
    department = serializers.CharField(default="")
    age = serializers.IntegerField(default=0)
    gender = ChoiceField(choices=Apply.GenderChoice, default="X")

    answer = serializers.JSONField()

    apply_form = serializers.PrimaryKeyRelatedField(
        queryset=ApplyForm.objects.all(), write_only=True
    )

    created_at = serializers.DateTimeField(read_only=True)
    updated_at = serializers.DateTimeField(read_only=True)

    class Meta:
        model = Apply
        fields = (
            "name",
            "email",
            "phone",
            "department",
            "age",
            "gender",
            "answer",
            "apply_form",
            "created_at",
            "updated_at",
        )

    def create(self, validated_data):
        return Apply.objects.create(**validated_data)
