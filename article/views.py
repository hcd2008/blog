# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse
from .models import *

# Create your views here.

def index(request):
    all_cate = Category.objects.order_by('paixu')
    all_article = Article.objects.order_by('paixu','-add_date')
    first_article = all_article[:1][0]
    context = {'cates':all_cate,'articles':all_article,'farticle':first_article}
    print context
    return render(request,'article/index.html',context)