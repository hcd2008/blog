# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Category(models.Model):
    catname = models.CharField(max_length=50)
    paixu = models.IntegerField(5)

class Article(models.Model):
    title = models.CharField(max_length=100)
    cate = models.ForeignKey(Category)
    content = models.TextField()
    thumb = models.CharField(max_length=200)
    add_date = models.DateTimeField()


