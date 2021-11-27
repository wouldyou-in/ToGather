from django.contrib import admin

from . import models

# Register your models here.


@admin.register(models.Promotion)
class PromotionAdmin(admin.ModelAdmin):

    list_display = ("group", "title", "content")

    list_display_links = ("group",)
