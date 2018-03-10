# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


# Create your models here.
class Category(models.Model):
    catname = models.CharField(max_length=50,verbose_name='分类名')
    paixu = models.IntegerField(verbose_name='排序')
    parent = models.ForeignKey('self',verbose_name='父分类',default=0)
    def __unicode__(self):
        return self.catname

class Article(models.Model):
    title = models.CharField(max_length=100,verbose_name='标题')
    cate = models.ForeignKey(Category,verbose_name='分类')
    content = models.TextField(verbose_name='文章内容')
    thumb = models.ImageField(max_length=200,verbose_name='文章图片',upload_to='article/')
    add_date = models.DateTimeField(verbose_name='添加时间',auto_now_add=True)
    paixu = models.IntegerField(verbose_name='排序', default=100)
    hits = models.IntegerField(verbose_name='点击量',default=0)

    def __unicode__(self):
        return self.title

class Tag(models.Model):
    name = models.CharField(max_length=50,verbose_name='标签名')
    paixu = models.IntegerField(verbose_name='排序')

class Work(models.Model):
    title = models.CharField(max_length=100,verbose_name='作品名称')
    tag = models.ForeignKey(Tag,verbose_name='标签')
    thumb = models.ImageField(verbose_name='作品图片',max_length=200,upload_to='work/')
    spend_time = models.CharField(max_length=100,verbose_name='项目周期',blank=True)
    add_date = models.DateTimeField(verbose_name='添加时间',auto_now_add=True)
    paixu = models.IntegerField(verbose_name='排序',default=100)
    hits = models.IntegerField(verbose_name='浏览量',default=0)

    def __unicode__(self):
        return self.title


