from django.contrib import admin

from . import models

# Register your models here.


@admin.register(models.ApplyForm)
class ApplyFormAdmin(admin.ModelAdmin):

    list_display = (
        "group",
        "updated_at",
        "created_at",
    )

    list_display_links = ("group",)


@admin.register(models.ApplyFormQuestion)
class ApplyFormQuestionAdmin(admin.ModelAdmin):

    list_display = ("apply_form", "question", "require", "question_type")

    list_display_links = ("apply_form",)


@admin.register(models.Apply)
class ApplyAdmin(admin.ModelAdmin):

    list_display = (
        "apply_form",
        "name",
        "email",
    )

    list_display_links = ("apply_form",)
