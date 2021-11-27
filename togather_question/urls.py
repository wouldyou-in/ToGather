from django.urls import path

from .views import QuestionAPI

urlpatterns = [
    path("", QuestionAPI.as_view(), name="question_post"),
    path("<int:question_id>/", QuestionAPI.as_view(), name="question_get_answer"),
]
