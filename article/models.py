# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


# Create your models here.
class Category(models.Model):
    catname = models.CharField(max_length=50,verbose_name='分类名')
    catname_en = models.CharField(max_length=50,verbose_name='英文名')
    paixu = models.IntegerField(verbose_name='排序')

    class Meta:
        verbose_name = '分类'
        verbose_name_plural = '分类'

    def __unicode__(self):
        return self.catname

class Article(models.Model):
    title = models.CharField(max_length=100,verbose_name='标题')
    desc = models.CharField(max_length=255,verbose_name='简介')
    cate = models.ForeignKey(Category,verbose_name='分类')
    content = models.TextField(verbose_name='文章内容')
    thumb = models.ImageField(max_length=200,verbose_name='文章图片',upload_to='article/')
    add_date = models.DateTimeField(verbose_name='添加时间',auto_now_add=True)
    paixu = models.IntegerField(verbose_name='排序', default=100)
    hits = models.IntegerField(verbose_name='点击量',default=0)

    class Meta:
        verbose_name_plural = '文章'
        verbose_name = '文章'

    def __unicode__(self):
        return self.title


