from django.contrib import admin

from . import models

# Register your models here.
@admin.register(models.Question)
class QuestionAdmin(admin.ModelAdmin):

    list_display = ("group", "title", "content", "complete")

    list_display_links = ("group",)
