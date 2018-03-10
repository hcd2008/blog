# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import *
from django.utils.safestring import mark_safe
from blog import settings
# Register your models here.

class CategoryAdmin(admin.ModelAdmin):
    fields = ['parent','catname','paixu']
    list_display = ['catname','paixu']
    search_fields = ['catname']

class ArticleAdmin(admin.ModelAdmin):
    def thumb_data(self,obj):
        if obj.thumb:
            return mark_safe("<img src='%s' width='140px'/>" % obj.thumb.url)
        else:
            return 'no image'

    thumb_data.short_description = '文章图片'
    list_display = ['title', 'cate', 'thumb_data', 'add_date']
    readonly_fields = ('thumb_data',)
    search_fields = ['title']
    list_filter = ['add_date']
    list_per_page = 5
    actions_on_bottom = True
    actions_on_top = False

    class Media:
        js = (
            'article/js/kindeditor/kindeditor-all.js',
            'article/js/kindeditor/config.js',
            'article/js/kindeditor/lang/zh-CN.js',
        )



admin.site.register(Category,CategoryAdmin)
admin.site.register(Article,ArticleAdmin)
