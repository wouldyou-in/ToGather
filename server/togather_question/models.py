from django.db import models

from user.models import Group

# Create your models here.


class Question(models.Model):
    public = models.BooleanField(default=True)
    title = models.CharField(max_length=30, null=False, blank=True, default="")
    content = models.TextField(null=False, default="", blank=True)
    answer = models.TextField(null=False, blank=True, default="")
    complete = models.BooleanField(default=False)

    group = models.ForeignKey(
        Group,
        on_delete=models.CASCADE,
        related_name="question",
        null=True,
        blank=False,
    )

    updated_at = models.DateTimeField(auto_now=True)  # Update Time
    created_at = models.DateTimeField(auto_now_add=True)  # Create Time
