# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import *
from django.utils.safestring import mark_safe
from blog import settings
# Register your models here.


class TagAdmin(admin.ModelAdmin):
    fields = ['name','paixu']
    list_display = ['name','paixu']

class CategoryAdmin(admin.ModelAdmin):
    fields = ['catname','catname_en','paixu']
    list_display = ['catname','catname_en','paixu']


class WorkAdmin(admin.ModelAdmin):
    def thumb_data(self,obj):
        if obj.thumb:
            return mark_safe("<img src='%s' width='140px'/>" % obj.thumb.url)
        else:
            return 'no image'

    thumb_data.short_description = '作品图片'
    list_display = ['title','thumb_data','paixu','add_date']
    readonly_fields = ('thumb_data',)
    search_fields = ['title']
    list_filter = ['add_date']
    list_per_page = 5
    actions_on_bottom = True
    actions_on_top = False
    filter_horizontal = ('tag',)

    class Media:
        js = (
            'article/js/kindeditor/kindeditor-all.js',
            'article/js/kindeditor/config.js',
            'article/js/kindeditor/lang/zh-CN.js',
        )

admin.site.register(Tag,TagAdmin)
admin.site.register(Category,CategoryAdmin)
admin.site.register(Work,WorkAdmin)
