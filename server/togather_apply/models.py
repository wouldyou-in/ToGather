from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator

from user.models import Group

# Create your models here.


class ApplyForm(models.Model):
    name = models.BooleanField(default=True)
    email = models.BooleanField(default=True)
    phone = models.BooleanField(default=True)
    department = models.BooleanField(default=True)
    age = models.BooleanField(default=False)
    gender = models.BooleanField(default=False)

    group = models.ForeignKey(
        Group,
        on_delete=models.CASCADE,
        related_name="apply_form",
        null=False,
        blank=False,
    )

    updated_at = models.DateTimeField(auto_now=True)  # Update Time
    created_at = models.DateTimeField(auto_now_add=True)  # Create Time


class ApplyFormQuestion(models.Model):
    TypeChoice = (("S", "단답형"), ("L", "장문형"))

    question = models.CharField(max_length=50, null=False, unique=False, blank=False)
    require = models.BooleanField(default=False)
    question_type = models.CharField(max_length=1, choices=TypeChoice)

    apply_form = models.ForeignKey(
        ApplyForm,
        on_delete=models.CASCADE,
        related_name="apply_form_question",
        null=False,
        blank=False,
    )

    updated_at = models.DateTimeField(auto_now=True)  # Update Time
    created_at = models.DateTimeField(auto_now_add=True)  # Create Time


# https://enfanthoon.tistory.com/180
# Integer Field min max validate
class Apply(models.Model):
    GenderChoice = (("M", "남성"), ("F", "여성"), ("X", "응답거부"))

    name = models.CharField(max_length=20, null=False, unique=False, default="")
    email = models.EmailField(max_length=30, null=False, unique=False, default="")
    phone = models.CharField(max_length=20, null=False, unique=False, default="")
    department = models.CharField(max_length=30, null=False, unique=False, default="")
    age = models.PositiveSmallIntegerField(
        null=False,
        unique=False,
        default=0,
        validators=[MinValueValidator(0), MaxValueValidator(100)],
    )
    gender = models.CharField(max_length=1, choices=GenderChoice)

    answer = models.JSONField(default=dict, null=True)

    apply_form = models.ForeignKey(
        ApplyForm,
        on_delete=models.CASCADE,
        related_name="apply",
        null=False,
        blank=False,
    )

    updated_at = models.DateTimeField(auto_now=True)  # Update Time
    created_at = models.DateTimeField(auto_now_add=True)  # Create Time
