# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.http import  Http404

from django.shortcuts import render
from django.http import HttpResponse
from .models import *

# Create your views here.

def index(request,id=0,catid=0):
    all_cate = Category.objects.order_by('paixu')
    all_article = Article.objects.order_by('paixu','-add_date')
    catid = int(catid)
    if catid:
        all_article = all_article.filter(cate_id=catid)
    if id:
        try:
            cur_article = Article.objects.get(id=int(id))
        except Exception:
            raise Http404('没有此文章')
    else:
        cur_article = all_article[:1][0]
    context = {'cates':all_cate,'articles':all_article,'farticle':cur_article}
    print context
    return render(request,'article/index.html',context)
