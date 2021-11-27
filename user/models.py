from django.db import models
from django.contrib.auth.models import (
    AbstractBaseUser,
    BaseUserManager,
    PermissionsMixin,
)
from model_utils.managers import InheritanceManagerMixin, InheritanceManager


class UserManager(BaseUserManager, InheritanceManager):

    use_in_migrations = True

    def create_user(self, email, name, password=None):

        if not email:
            raise ValueError("must have user email")
        user = self.model(email=self.normalize_email(email), name=name)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(
        self,
        email,
        password,
        name="ADMIN",
    ):

        user = self.create_user(
            email=self.normalize_email(email), name=name, password=password
        )
        user.is_superuser = True
        user.is_staff = True
        user.save(using=self._db)
        return user


class User(AbstractBaseUser, PermissionsMixin):

    objects = UserManager()

    email = models.EmailField(
        max_length=255,
        unique=True,
    )
    name = models.CharField(max_length=20, null=False, unique=False)
    is_active = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(auto_now_add=True)
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = []


class Group(User):
    unique_name = models.CharField(max_length=20, null=False, unique=True)

    updated_at = models.DateTimeField(auto_now=True)  # Update Time
    created_at = models.DateTimeField(auto_now_add=True)  # Create Time
