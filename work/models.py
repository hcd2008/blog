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

class Work(models.Model):
    title = models.CharField(max_length=100,verbose_name='作品名称')
    tag = models.ManyToManyField(Tag,verbose_name='标签')
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
