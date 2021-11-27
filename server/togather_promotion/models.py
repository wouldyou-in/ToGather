from django.db import models

from user.models import Group


class Promotion(models.Model):
    title = models.CharField(max_length=30, null=False, blank=False, default="")
    content = models.TextField(null=False, blank=False, default="")
    link = models.URLField(default="", null=False)
    contact = models.CharField(max_length=100, null=False, default="")
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()

    thumbnail = models.URLField(default="", null=False)

    group = models.ForeignKey(
        Group,
        on_delete=models.CASCADE,
        related_name="promotion",
        null=True,
        blank=False,
    )

    updated_at = models.DateTimeField(auto_now=True)  # Update Time
    created_at = models.DateTimeField(auto_now_add=True)  # Create Time
