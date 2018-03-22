from django.conf.urls import url
from . import views

app_name = 'work'
urlpatterns = [
    url(r'^$',views.index,name='work_index'),
    url(r'^(?P<id>[0-9]+)$',views.index,name='work_index')
]
