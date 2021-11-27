from django.contrib import admin
from . import models


@admin.register(models.User)
class UserAdmin(admin.ModelAdmin):

    list_display = (
        "name",
        "email",
        "date_joined",
    )

    list_display_links = (
        "name",
        "email",
    )


@admin.register(models.Group)
class GroupAdmin(admin.ModelAdmin):

    list_display = (
        "name",
        "email",
        "unique_name",
    )

    list_display_links = (
        "name",
        "email",
    )
