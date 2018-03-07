# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2018-03-07 06:15
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('article', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='hits',
            field=models.IntegerField(default=0, verbose_name='\u70b9\u51fb\u91cf'),
        ),
        migrations.AddField(
            model_name='article',
            name='level',
            field=models.SmallIntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='article',
            name='add_date',
            field=models.DateTimeField(auto_now_add=True, verbose_name='\u6dfb\u52a0\u65f6\u95f4'),
        ),
        migrations.AlterField(
            model_name='article',
            name='cate',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='article.Category', verbose_name='\u5206\u7c7b'),
        ),
        migrations.AlterField(
            model_name='article',
            name='content',
            field=models.TextField(verbose_name='\u6587\u7ae0\u5185\u5bb9'),
        ),
        migrations.AlterField(
            model_name='article',
            name='thumb',
            field=models.ImageField(max_length=200, upload_to='', verbose_name='\u6587\u7ae0\u56fe\u7247'),
        ),
        migrations.AlterField(
            model_name='article',
            name='title',
            field=models.CharField(max_length=100, verbose_name='\u6807\u9898'),
        ),
        migrations.AlterField(
            model_name='category',
            name='catname',
            field=models.CharField(max_length=50, verbose_name='\u5206\u7c7b\u540d'),
        ),
        migrations.AlterField(
            model_name='category',
            name='paixu',
            field=models.IntegerField(verbose_name='\u6392\u5e8f'),
        ),
    ]