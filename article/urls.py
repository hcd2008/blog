from django.conf.urls import url
from . import views

app_name = 'article'
urlpatterns = [
    url(r'^$',views.index,name='article_index'),
    url(r'^(?P<id>[0-9]+)/$', views.index, name='article_index'),
    url(r'^cate/(?P<catid>[0-9]+)/$', views.index, name='article_index'),
]
