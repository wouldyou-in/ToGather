from django.urls import path

from .views import PromotionAPI

urlpatterns = [
    path("", PromotionAPI.as_view(), name="promotion"),
    path("<int:promotion_id>/", PromotionAPI.as_view(), name="promotion_with_id"),
]
