# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Tag(models.Model):
    name = models.CharField(max_length=50,verbose_name='标签名')
    paixu = models.IntegerField(verbose_name='排序',default=1)

    class Meta:
        verbose_name_plural = '标签'
        verbose_name = '标签'

    def __unicode__(self):
        return self.name
class Category(models.Model):
    catname = models.CharField(max_length=50,verbose_name='分类名')
    catname_en = models.CharField(max_length=50,verbose_name='分类英文名')
    paixu = models.IntegerField(default=1)

    class Meta:
        verbose_name_plural = '作品分类'
        verbose_name = '作品分类'

    def __unicode__(self):
        return self.catname

class Work(models.Model):
    title = models.CharField(max_length=100,verbose_name='作品名称')
    cate = models.ForeignKey(Category,verbose_name='分类',default=0)
    tag = models.ManyToManyField(Tag,verbose_name='标签')
    desc = models.CharField(max_length=255,verbose_name='作品简介',default='人生苦短，我用Python')
    thumb = models.ImageField(verbose_name='作品图片',max_length=200,upload_to='work/')
    content = models.TextField(verbose_name='项目详情',blank=True)
    linkurl = models.CharField(verbose_name='项目链接',max_length=120,blank=True)
    spend_time = models.CharField(max_length=100,verbose_name='项目周期',blank=True)
    add_date = models.DateTimeField(verbose_name='添加时间',auto_now_add=True)
    paixu = models.IntegerField(verbose_name='排序',default=100)
    hits = models.IntegerField(verbose_name='浏览量',default=0)

    class Meta:
        verbose_name = '作品'
        verbose_name_plural = '作品'
    def __unicode__(self):
        return self.title
