# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2018-03-07 06:17
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('article', '0002_auto_20180307_0615'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='article',
            name='level',
        ),
    ]