# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import Article,Category
# Register your models here.

class CategoryAdmin(admin.ModelAdmin):
    fields = ['catname','paixu']
    list_display = ['catname','paixu']
    search_fields = ['catname']

class ArticleAdmin(admin.ModelAdmin):
    list_display = ['title','cate','thumb','add_date']
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