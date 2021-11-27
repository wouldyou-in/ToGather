from django.urls import path
from .views_group import SignUp, SignIn
from .views import TokenRefreshView

urlpatterns = [
    path("signup/", SignUp.as_view(), name="group_signup"),
    path("<slug:group>/signin/", SignIn.as_view(), name="group_signin"),
    path("refresh/", TokenRefreshView.as_view(), name="refresh_token"),
]
