# Generated by Django 3.2.9 on 2021-11-26 11:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('togather_question', '0002_question_group'),
    ]

    operations = [
        migrations.AlterField(
            model_name='question',
            name='answer',
            field=models.TextField(blank=True, default=''),
        ),
    ]