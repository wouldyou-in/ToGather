# Generated by Django 3.2.9 on 2021-11-26 11:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
        ('togather_question', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='group',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='question', to='user.group'),
        ),
    ]
