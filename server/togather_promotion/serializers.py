from rest_framework import serializers

from user.models import Group

from .models import Promotion


class PromotionSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(read_only=True)
    title = serializers.CharField()
    content = serializers.CharField()
    link = serializers.URLField(default="")
    thumbnail = serializers.URLField(read_only=True)
    contact = serializers.CharField()

    start_date = serializers.DateTimeField()
    end_date = serializers.DateTimeField()

    group = serializers.PrimaryKeyRelatedField(
        queryset=Group.objects.all(), write_only=True, required=True
    )

    class Meta:
        model = Promotion
        fields = (
            "id",
            "thumbnail",
            "title",
            "content",
            "link",
            "contact",
            "start_date",
            "end_date",
            "group",
        )

    def create(self, validated_data):
        return Promotion.objects.create(**validated_data)
