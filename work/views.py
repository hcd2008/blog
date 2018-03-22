# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse
from .models import *

# Create your views here.

def index(request,id=0,catid=0):
    tags = Tag.objects.order_by('paixu')
    works = Work.objects.order_by('paixu')
    if id:
        show_work = Work.objects.get(pk=id)
    else:
        # 显示的文章
        show_work = works[:1][0]
    context = {
        'tags':tags,
        'works':works,
        'show_work':show_work
    }
    return render(request,'work/index.html',context)