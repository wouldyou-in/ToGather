from django.urls import path

from .views import ApplyFormAPI, ApplyContactAPI, ApplyAPI

urlpatterns = [
    path("", ApplyAPI.as_view(), name="apply_get"),
    path("<int:apply_id>/", ApplyAPI.as_view(), name="apply_id_get"),
    path("form/", ApplyFormAPI.as_view(), name="apply_form"),
    path("contact/", ApplyContactAPI.as_view(), name="apply_contact"),
]
