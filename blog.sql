/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-03-18 22:35:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article_article
-- ----------------------------
DROP TABLE IF EXISTS `article_article`;
CREATE TABLE `article_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `thumb` varchar(200) NOT NULL,
  `add_date` datetime NOT NULL,
  `cate_id` int(11) NOT NULL,
  `paixu` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `article_article_cate_id_69d53e03` (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_article
-- ----------------------------
INSERT INTO `article_article` VALUES ('1', 'Django开发项目流程', 'Django也是开发web的利器！', '<p style=\"text-indent:2em;\">\r\n	1,创建项目Project<br />\r\ndjango-admin startproject mysite<br />\r\n2，启动服务<br />\r\n进入mysite文件夹：python manage.py runserver或者用pycharm运行<br />\r\n3,创建应用app<br />\r\npython manage.py starapp polls 注意不能用mysite这个名字会冲突<br />\r\n4，写视图view<br />\r\n打开polls/views.py写入：<br />\r\nfrom django.http import HttpResponse<br />\r\ndef index(request):<br />\r\n&nbsp; &nbsp; return HttpResponse(\"Hello, world. You\'re at the polls index.\")<br />\r\n5,URLconf：管理url和view对应<br />\r\n打开polls/urls.py:<br />\r\nfrom django.conf.urls import url<br />\r\nfrom . import views<br />\r\nurlpatterns = [<br />\r\n&nbsp; &nbsp; url(r\'^$\', views.index, name=\'index\'),<br />\r\n]<br />\r\n6,对接应用和项目的url<br />\r\n打开mysite/urls.py<br />\r\nfrom djanago.conf.urls import include,url<br />\r\nfrom django.contrib import admin<br />\r\n<br />\r\nurlpatterns = [<br />\r\n<span> </span>url(r\'^polls\',include(\'polls.urls\')),&nbsp; &nbsp;//注意polls后面没有$,否则就不对了<br />\r\n<span> </span>url(r\'^admin/\',admin.site.urls)<br />\r\n]<br />\r\n7,配置数据库<br />\r\nENGINE:django.db.backends.mysql<br />\r\nNAME:数据库名称<br />\r\nUSER, PASSWORD, and HOST&nbsp;<br />\r\n8,创建模型<br />\r\n编辑polls/models.py<br />\r\nfrom django.db import models<br />\r\nclass Question(models.Model):<br />\r\n&nbsp; &nbsp; question_text = models.CharField(max_length=200)<br />\r\n&nbsp; &nbsp; pub_date = models.DateTimeField(\'date published\')<br />\r\nclass Choice(models.Model):<br />\r\n&nbsp; &nbsp; question = models.ForeignKey(Question, on_delete=models.CASCADE)<br />\r\n&nbsp; &nbsp; choice_text = models.CharField(max_length=200)<br />\r\n&nbsp; &nbsp; votes = models.IntegerField(default=0)<br />\r\n9,激活模型<br />\r\n编辑mysite/setting.py<br />\r\nINSTALLED_APPS 添加 polls<br />\r\npython manage.py makemigrations polls&nbsp; 告诉django你创建了模型<br />\r\npython manage.py sqlmigrate polls 0001 查看生成的sql语句（可以省略）<br />\r\npython manage.py migrate 执行sql语句<br />\r\n10，创建admin用户<br />\r\npython manage.py createsuperuser<br />\r\n输入用户名和邮箱 密码<br />\r\n启动服务：python manage.py runserver<br />\r\n输入/admin/访问<br />\r\n配置中文：编辑mysite/setting.py:<br />\r\nLANGUAGE_CODE = \'en-us\' 修改为<br />\r\nLANGUAGE_CODE = \'zh-hans\'<br />\r\n11,模型接入admin<br />\r\n编辑polls/admin.py<br />\r\nfrom django.contrib import admin<br />\r\nfrom .models import Question<br />\r\nadmin.site.register(Question)<br />\r\n12,获取url的参数<br />\r\n编辑polls/views.py定义detail results 方法<br />\r\n编辑polls/urls.py添加正则：<br />\r\n&nbsp; &nbsp; # ex: /polls/5/<br />\r\n&nbsp; &nbsp; url(r\'^(?P&lt;question_id&gt;[0-9]+)/$\', views.detail, name=\'detail\'),<br />\r\n&nbsp; &nbsp; # ex: /polls/5/results/<br />\r\n&nbsp; &nbsp; url(r\'^(?P&lt;question_id&gt;[0-9]+)/results/$\', views.results, name=\'results\')<br />\r\n注意 ?P&lt;question_id&gt;定义参数名称，这样在方法里用question_id接收参数<br />\r\n13，创建模板template<br />\r\n对Django来说归根结底要返回一个HttpResponse&nbsp; Http响应！或者异常<br />\r\n创建模板： polls/templates/polls/index.html<br />\r\n为什么要多创建一个polls文件夹？ 因为按照惯例，DjangoTemplates在每个INSTALLED_APPS中查找“templates”子目录。举个例子：如果a在b前面，都有index.html那么找到a之后就不会再找b了。<br />\r\n渲染的时候，注意要这样：render(request,\'polls/index.html\') 这样就不会搞错了！<br />\r\n详解：<br />\r\nDjango 模板查找机制： Django 查找模板的过程是在每个 app 的 templates 文件夹中找（而不只是当前 app 中的代码只在当前的 app 的 templates 文件夹中找）。<br />\r\n各个 app 的 templates 形成一个文件夹列表，Django 遍历这个列表，一个个文件夹进行查找，当在某一个文件夹找到的时候就停止，所有的都遍历完了还找不到指定的模板的时候就是 Template Not Found （过程类似于Python找包）。<br />\r\n14，渲染模板<br />\r\n编辑polls/views<br />\r\nfrom django.shortcuts import render<br />\r\ndef index(request):<br />\r\n&nbsp; &nbsp; latest_question_list = Question.objects.order_by(\'-pub_date\')[:5]<br />\r\n&nbsp; &nbsp; return render(request,\'polls/index.html\',{\'latest_question_list\':latest_question_list})<br />\r\n注意render方法最终还是返回:return HttpResponse(content, content_type, status)<br />\r\n15,处理异常，调用404<br />\r\n编辑polls/views.py<br />\r\nfrom django.http import&nbsp; Http404<br />\r\ndef detail(request, question_id):<br />\r\n&nbsp; &nbsp; try:<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; question = Question.objects.get(pk = question_id)<br />\r\n&nbsp; &nbsp; except Exception:<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; raise Http404(\'Question does not exits\')<br />\r\n&nbsp; &nbsp; return render(request,\'polls/detail.html\',{\'question\':question})<br />\r\n16,优化模板里的链接(感觉用处不大啊！收回这句)<br />\r\n编辑polls/templates/polls/index.html<br />\r\n原来的链接：&lt;li&gt;&lt;a href=\"/polls/{{ question.id }}/\"&gt;{{ question.question_text }}&lt;/a&gt;&lt;/li&gt;<br />\r\n修正为：&lt;li&gt;&lt;a href=\"{% url \'detail\' question.id %}\"&gt;{{ question.question_text }}&lt;/a&gt;&lt;/li&gt;<br />\r\ndetail为 urls.py中的 url(r\'^(?P&lt;question_id&gt;[0-9]+)/$\', views.detail, name=\'detail\')定义的name的值<br />\r\n好处是，如果你打算把polls/1改成polls/specifics/1那么更改polls/urls.py就可以了：<br />\r\nurl(r\'^specifics/(?P&lt;question_id&gt;[0-9]+)/$\', views.detail, name=\'detail\'),<br />\r\n多个应用下url无法区分app，加入url命名空间，继续优化：<br />\r\n编辑polls/urls.py添加：app_name = \'polls\'<br />\r\n编辑polls/templates/polls/index.html:<br />\r\n&lt;li&gt;&lt;a href=\"{% url \'polls:detail\' question.id %}\"&gt;{{ question.question_text }}&lt;/a&gt;&lt;/li&gt;<br />\r\n17，表单form的操作<br />\r\n注意：form的action要以/结尾 譬如说/polls/2/vote/ 最后的/符号不能省略&nbsp; 建议使用 {% url \'name\' %} 生成<br />\r\n注意：如果form的method设置为post那么必form下面必须添加：{% csrf_token %}<br />\r\n18,自动化测试（很重要，但是看不太懂啊）<br />\r\n19，静态文件<br />\r\n新建文件夹类似template：polls/static/polls/style.css<br />\r\ntemplate里引入的静态文件：{% load static \'polls/style.css\' %}<br />\r\n插入图片：图片放入polls/static/polls/images/background.gif<br />\r\ntemplate里：路径总是使用相对路径！<br />\r\nbody {<br />\r\n&nbsp; &nbsp; background: white url(\"images/background.gif\") no-repeat right bottom;<br />\r\n}<br />\r\n20,定制admin<br />\r\n编辑polls/admin.py:<br />\r\nfrom django.contrib import admin<br />\r\nfrom .models import Question,Choice<br />\r\n<br />\r\nclass ChoiceInline(admin.StackInline): //可以优化为 admin.TabularInline<br />\r\n<span> </span>model = Choice<br />\r\n<span> </span>extra = 3<br />\r\n<br />\r\nclass QuestionAdmin(admin.ModelAdmin):&nbsp; //继承ModelAdmin类<br />\r\n<span> </span>fields = [\'question_text\',\'pub_date\']&nbsp; //定义字段显示的顺序<br />\r\n<span> </span>list_display = (\'question_text\',\'pub_date\') //定义列表显示的字段<br />\r\n<span> </span>list_filter = [\'pub_date\'] //定义过滤器<br />\r\n<span> </span>search_fields = [\'question_text\'] //定义搜索字段<br />\r\n<span> </span>inlines = [ChoiceInline]&nbsp; //对于外键的处理方式<br />\r\n<span> </span>list_per_page = 5 //定义每页的条数<br />\r\n<br />\r\nadmin.site.register(Question,QuestionAdmin) //最后一定要告诉admin你定义的类<br />\r\n21，djangoa的模板系统template system<br />\r\n定制项目的templates:(去掉模板中的django字样！)<br />\r\n编辑mysite/settings：在TEMPLATES下添加DIRS选项：<br />\r\n\'DIRS\': [os.path.join(BASE_DIR, \'templates\')],<br />\r\nmysite下创建templates文件夹做为模板的公共目录&nbsp; 注意各个应用下的template在各个应用下即可<br />\r\nmysite/templates下常见admin文件夹做为admin的模板目录：拷贝 django/contrib/admin/templates/admin/base_site.html到该文件夹，编辑base_site.html的内容：{{ site_header|default:_(\'Django administration\') }}修改为 我的站点<br />\r\n提醒：查看django路径的方法 进入shell import django print django.__path__<br />\r\n22，可重用的app<br />\r\npip install setuptools 安装打包工具<br />\r\n<br />\r\n23，最后说一点公用模板的2个方案<br />\r\n{% include \'nav.html\' %} {% include \'includes/nav.html\' %} 包含模板<br />\r\n更好的方案：模板继承：<br />\r\n{% block haha %} {% endblock %} 定义基础模板base.html<br />\r\n继承模板： {% extends \'base.html\' %}<br />\r\n重新定义：{% block haha %} 新的内容 {% endblock %}\r\n</p>', 'django.jpg', '2018-02-28 16:01:00', '2', '1', '100');
INSERT INTO `article_article` VALUES ('2', 'SQL连接详解', '内连接 外连接', '<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span>SQL连接是数据库查询最重要的部分。之前早就接触过，最近又重新复习的时候，查阅了一下书籍和资料发现有些事情并没有说清楚。先总结如下：</span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span>一、分类</span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span>1、连接可分文两大类：内连接，外连接。（还有交叉连接，使用价值不大）</span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span><span>2、内连接与外连接的差别。内连接：<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span>列出与连接条件匹配的数据行。外连接：<span style=\"line-height:21px;color:#393939;\">返回到查询结果集合中的不仅包含符合连接条件的行，而且还包括左表(左外连接时)、右表(右外连接时)或两个边接表(全外连接)中的所有数据行。</span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span>二、内连接</span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span>1、内连接的分类：等值连接、自然连接、不等连接。</span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span>2、三种分类的用法：join..on a=b,&nbsp;join..using(a)，natural join,join..on a&gt;b</span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span>3、三种分类的区别：</span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;等值连接：<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span>使用等于号(=)运算符比较被连接列的列值，其查询结果包括重复列。</span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自然连接：<span style=\"line-height:21px;font-family:verdana, &quot;color:#393939;\">使用等于号(=)运算符比较被连接列的列值，并删除连接表中的重复列。</span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;不等连接：<span style=\"line-height:21px;font-family:verdana, &quot;color:#393939;\">在连接条件使用除等于运算符以外的其它比较运算符比较被连接的列的列值。这些运算符包括&gt;、&gt;=、&lt;=、&lt;、!&gt;、!&lt;和&lt;&gt;。<span style=\"line-height:21px;\">&nbsp;</span></span></span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span>解释：比如A表B表中A的ID=B的ID，等值连接保留这两个ID表标示为:A.ID,B.ID，自然连接则只保留ID。</span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span>4、注意事项：</span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;join默认是inner join，所以这两者是等价的。</span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;natural join<span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\">自动对两个表按照同名的列进行内连接。同名的列可以有多个，网上同名列不能超过1个的说法不实。</span></span></span></span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;join...using 在有多个同名列的时候，可以用using指定某一个做等值连接。</span></span></span></span></span></span><span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\"><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;join...on 最为灵活，可以指明连接的条件。</span></span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\"><span>&nbsp;&nbsp;&nbsp;&nbsp;注意natural join不能使用using，也不能使用on。natural的意思是自然，既然是自然的就不要加限定了。如果要加限定的话请用 join using,join on。natural存在的必要时取出重复行，建议不太确定使用方法的情况下，用select+指定行配合join on语法来代替。</span></span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\"><span>三、外连接</span></span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\"><span>1，分类：左外连接 Left outer join，右连接Right outer join,全连接Full outer join</span></span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\"><span>2,缩写left join,right join,full join</span></span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\"><span>3，三种分类的区别：</span></span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\"><span>&nbsp;&nbsp;左外连接：即使右边没有匹配，也从左表返回所有行。</span></span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\"><span>&nbsp;&nbsp;右外连接：即使左边没有匹配，也从右表返回所有行。</span></span></span></span></span></span> \r\n</p>\r\n<p style=\"color:#323E32;font-family:&quot;font-size:14px;background-color:#E1E1E1;text-indent:2em;\">\r\n	<span style=\"line-height:21px;background-color:#FAF7EF;font-family:verdana, &quot;color:#393939;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:21px;\"><span style=\"line-height:26px;background-color:#FFFFFF;font-family:Arial;color:#333333;\"><span>&nbsp;&nbsp;全外连接：只要其中一个表中存在匹配，就返回行。</span></span></span></span></span></span> \r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n	<br />\r\n</p>', 'mysql.jpg', '2018-03-01 15:02:00', '1', '1', '100');
INSERT INTO `article_article` VALUES ('3', 'ThinkPHP5开发要点', 'ThinkPHP5入门操作', '<p style=\"text-indent:2em;\">\r\n	1，使用控制台命令自动生成新模块<br />\r\n进入到应用根目录下并执行命令：php think build --module demo<br />\r\n<br />\r\n2,URL访问<br />\r\n标准的url访问格式：<br />\r\nhttp://serverName/index.php/模块/控制器/操作<br />\r\n默认情况下，URL地址中的控制器和操作名是不区分大小写的<br />\r\n如果希望严格区分大小写访问（或者要支持驼峰法进行控制器访问），可以在应用配置文件中设置：\'url_convert\' =&gt; false,<br />\r\n<br />\r\n3，隐藏index.php<br />\r\napache的配置方法：在入口文件的同级添加.htacess文件<br />\r\n&lt;IfModule mod_rewrite.c&gt;<br />\r\nOptions +FollowSymlinks -Multiviews<br />\r\nRewriteEngine on<br />\r\nRewriteCond %{REQUEST_FILENAME} !-d<br />\r\nRewriteCond %{REQUEST_FILENAME} !-f<br />\r\nRewriteRule ^(.*)$ index.php/$1 [QSA,PT,L]<br />\r\n&lt;/IfModule&gt;<br />\r\n如果用的 phpstudy ，规则如下：<br />\r\n&lt;IfModule mod_rewrite.c&gt;<br />\r\nOptions +FollowSymlinks -Multiviews<br />\r\nRewriteEngine on<br />\r\nRewriteCond %{REQUEST_FILENAME} !-d<br />\r\nRewriteCond %{REQUEST_FILENAME} !-f<br />\r\nRewriteRule ^(.*)$ index.php [L,E=PATH_INFO:$1]<br />\r\n&lt;/IfModule&gt;<br />\r\n<br />\r\n4，生成url地址<br />\r\nUrl::build(\'blog/read\', \'name=thinkphp\');<br />\r\nurl(\'blog/read\', \'name=thinkphp\');<br />\r\n如果你配置了 url_html_suffix 参数的话，生成的URL地址会带上后缀，例如：<br />\r\n\'url_html_suffix\' =&gt; \'html\'<br />\r\n<br />\r\n5，请求和响应<br />\r\nThinkPHP5 的架构设计和之前版本的主要区别之一就在于增加了 Request 请求对象和 Response 响应对象的概念，了解了这两个对象的作用和用法对你的应用开发非常关键。<br />\r\nRequest 对象的一个主要职责是统一和更安全地获取当前的请求信息，你需要避免直接操作 $_GET 、$_POST 、 $_REQUEST 、 $_SESSION 、 $_COOKIE ，甚至 $_FILES 等全局变量，而是统一使用Request 对象提供的方法来获取请求变量。<br />\r\n系统推荐使用 param 方法统一获取当前请求变量，该方法最大的优势是让你不需要区分当前请求类型而使用不同的全局变量或者方法，并且可以满足大部分的参数需求<br />\r\n助手函数 input()=$this-&gt;request-&gt;param();\r\n</p>', 'thinkphp.jpg', '2018-03-01 15:06:00', '1', '1', '100');
INSERT INTO `article_article` VALUES ('4', '从dota看精通之道', '我们都在从事不同的工作，做着各种各样的事情，也擅长不同的技艺。但其中能够精通的寥寥无几。即便是做自己很喜欢的事情。拿我来说，我很喜欢打dota，它给我带来无穷的乐趣。可是打了好几年dota，依然是个菜鸟，远远称不上是高手。于是，我想从dota的角度谈谈如何精通一件事，不管是在工作还是生活中。', '<p style=\"text-indent:2em;\">\r\n	我们都在从事不同的工作，做着各种各样的事情，也擅长不同的技艺。但其中能够精通的寥寥无几。即便是做自己很喜欢的事情。拿我来说，我很喜欢打dota，它给我带来无穷的乐趣。可是打了好几年dota，依然是个菜鸟，远远称不上是高手。于是，我想从dota的角度谈谈如何精通一件事，不管是在工作还是生活中。<br />\r\n<br />\r\n首先，要有兴趣。做自己喜欢的事情，肯定更有动力，更愿意钻研。因为享受到击杀敌人带来的快感，体验通过自己努力赢得胜利的喜悦，所以你想变得更强，所以你愿意连续好几年坚持不断的去练习补刀，一局一局的去打每一盘。如果没有兴趣，很难坚持下来。<br />\r\n<br />\r\n其次，要努力实践。在兴趣做动力下，接下来是不停的练习。去熟悉所有的英雄，所有的技能，所有的物品，所有的技巧。在实践中，慢慢的掌握了补刀插眼推线gank出装团战技能施放等等很多经验和技巧。这些慢慢的让自己脱离门外汉，开始入门。你的操作已经越来越熟练，你熟悉你的对手有什么技能，更了解自己有什么能力，知彼知己。这就是我所处的阶段，用一个词概括就是“熟练”，通过实践可以掌握很多技巧和知识，可是这还远远达不到精通，所有的普通人经过一段时间的历练都可以达到熟练的阶段。一定是缺少了一些东西。而这些东西，是通往高手之路必不可少的。<br />\r\n<br />\r\n再次，要勤于思考。在经历熟练阶段后，往往进入一个瓶颈期，在这个时期，水平往往原地踏步，无法提高。原因，在我看来是缺少思考。在dota过程中，赢了当然很高兴，败了就会迫不及待的进行下一局好一舒惨败的恶气。于是，就这样一局接一局的进行，周而复始，就像我们日常的工作，一成不变。缺少思考，没有反思。我们总是坚信下一局，不会再被压制，下一局我要拯救世界，我们相信我们会变得越来越好，可是却从不关心，我们的弱点到底是什么，我们该做什么才能进步。就这样沉迷于下一局的幻想中，原地踏步。实践遇到瓶颈，是缺少思考。去深入的理解dota中每个英雄技能的意义，每个装备的作用，充分的利用这些信息包含的原则，进行思考，进而合理的出装恰当的切入战场，才更有可能取得胜利。我正在向这个阶段迈进，通过思考，慢慢的形成意识，深刻的理解事物属性中包含的原则，才能产生质的飞跃。反思才能进步。这个阶段达到的境界叫做“掌握”，明白自己要做什么，需要做什么。要达到精通还缺少一样东西。<br />\r\n<br />\r\n再再次，要能够自控。熟悉周遭的环境，反思自己的不足，可是我明白这些之后，却还是老样子。缺少的是知行合一。dota就像生活，面对的诱惑很多，压力也不少。当敌方英雄只有一丝血时，有多少次你经受不住诱惑不管不顾的就冲过去强杀，当被队友骂你菜的时候，有没有心浮气躁，当被连续击杀好几次是不是依然我行我素或者自暴自弃。情绪上的东西很难掌握，高手不光是操作犀利，更有极好的心里素质，而重要的一环就是自控。能控制的住自己，才有可能控制比赛。有自控力，才能去实践思考后的行动。能控制住自己的情绪，经历这个阶段才能算得上精通，才能称得上是高手。在这个过程中，磨砺自己的意志，慢慢的积淀成过硬的心理素质，从而达到心智的成熟，成为一名高手。<br />\r\n<br />\r\n最后，要加入团队。dota跟社会一样不是一个人的战斗，一个人的个人能力再强，没有好的团队配合你，往往也是有心无力，仰天长叹。只有融入团队，才能取得更大的成绩。当然，一个好的团队往往是可望不可求的。那就努力先让自己成为高手，寻找合适的团队，去发挥更大的价值。当然有种人能够把一个团队带成一流的，这种人就叫大神了！<br />\r\n<br />\r\n兴趣 实践 思考 自控 团队 从菜鸟向高手迈进！\r\n</p>', 'dota.jpg', '2018-03-01 15:12:00', '4', '1', '100');
INSERT INTO `article_article` VALUES ('5', '《牧羊少年奇幻之旅》读书笔记', '我是以我希望的方式，而不是以事情实际发生的方式来看待世界的。  任何人都不必担心未知的事情，因为谁都有能力获得他所渴望和所需要的一切。', '<p style=\"text-indent:2em;\">\r\n	在我们人生的某一时刻，我们失去了对生命的控制，人生便转由命运来主宰，这就是世界上最大的谎言！<br />\r\n<br />\r\n如果你把还没有到手的东西许诺出去，你就会失去为得到它而努力的愿望。<br />\r\n<br />\r\n幸福的秘密在于欣赏世界上所有的奇观异景，同时永远不要忘记汤匙里的两滴油。<br />\r\n<br />\r\n我是以我希望的方式，而不是以事情实际发生的方式来看待世界的。<br />\r\n<br />\r\n任何人都不必担心未知的事情，因为谁都有能力获得他所渴望和所需要的一切。<br />\r\n<br />\r\n邪恶不是进入嘴里的东西，而是由嘴里出来的东西。<br />\r\n<br />\r\n她知道，男人应该走出去，目的是为了能够回来。她已经找到了她的财宝，那就是你。如今她期盼着你能找到你所寻求的东西。<br />\r\n<br />\r\n你永远不会明白，爱情从不阻止一个男人去追随他的天命。万一发生了这种情况，那是因为它不是真正的爱情，不是宇宙语言所讲的那种爱情。<br />\r\n<br />\r\n只有一种学到的方式，那就是通过行动。你所需要学到的一切，旅行都已教会了你，现在就只差行动。<br />\r\n<br />\r\n当我们努力使自己变得比现在更好的时候，我们周围一切也会变得更好。<br />\r\n<br />\r\n我得到的报酬超过了我的慷慨。你永远不要重复这句话，生活可能会听到，下一次就会少给你\r\n</p>', 'muyang.jpg', '2018-03-01 15:15:00', '3', '1', '100');
INSERT INTO `article_article` VALUES ('6', '真正的喜欢', '想象中的喜欢，带来的只是自我安慰。真正的喜欢才能带来真正的快乐。真正的喜欢是喜欢编程就去敲代码，即便很复杂，错误不断，依然坚持去修正去练习，在这个过程中既享受成功的乐趣，又能背负失败的苦闷，不抛弃，不放弃。心里踏实、愉悦。', '<p>\r\n	有很多喜欢的东西。喜欢音乐，喜欢读书，喜欢旅游。。。可是在想当然的喜欢了这么久之后突然发现，很多事情并不能算是真正的喜欢。<br />\r\n<br />\r\n譬如说我喜欢读书。可是我很少时间看书，即便拿起书来，也是看几页就放。这只是想象中的喜欢。一件事情，在凭空想象而未行动之前，都是想当然的喜欢。<br />\r\n<br />\r\n想象总是比实际行动来的简单。之所以喜欢某件事情，很可能是因为那件事情容易做或者有意义。而真正的去做脑海中喜欢的事情时，却往往没有那么简单。一个喜欢编程的人，却很少写代码，真正去写代码会发现，代码很复杂，要记住的东西太多，动不动就报错；一个喜欢游泳的人，却很少下水，置身在海水中，灌了几口苦涩的海水，想象中的曼妙姿势也使不出来；一个喜欢跑步的人，却很少跑出去，出门是件很困难的事，尽管外面空气不错，微风习习，却宁愿窝在家里看电视。<br />\r\n<br />\r\n想象中的喜欢，带来的只是自我安慰。真正的喜欢才能带来真正的快乐。真正的喜欢是喜欢编程就去敲代码，即便很复杂，错误不断，依然坚持去修正去练习，在这个过程中既享受成功的乐趣，又能背负失败的苦闷，不抛弃，不放弃。心里踏实、愉悦。<br />\r\n<br />\r\n真正的喜欢一个人，也是如此。唯有行动，才能证明爱是什么，唯有行动，才能拥有真爱。不活在想象之中，付出行动，收获真正的喜欢。\r\n</p>', 'xihuan.jpg', '2018-03-01 15:18:00', '4', '1', '100');
INSERT INTO `article_article` VALUES ('7', '《明朝那些事儿》读书笔记', '社会也许很黑暗，贪污横行，受贿成风。但明朝让我知道，不论这个世道有多不公，多黑暗，总有些人，有些事，像天空中的星辰，熠熠生辉，光耀千古。因为他们都有自己的“道”。也许渺小却一直存在，也许微弱却不会熄灭。我们祖先的所作所为，正是道的真实注脚。我们民族五千年的风风雨雨正是道的代代相承。人之所以伟大，正在于对“道”的不懈追求。', '《明朝那些事儿》一本被很多人褒扬的书，一直到2013年才初读此书，相见恨晚。此书通俗易懂，语言幽默，引人入胜而又不偏离历史。有些见解观点鞭辟入里，有一些确实也主观臆断，不够客观。但以上这些在茫茫书海中也算不上出类拔萃，对我来说真正让这本书成为经典甚至“不朽”的是它所传播的“道”。<br />\r\n<br />\r\n在严嵩专权，贪污受贿，不管民生，只谋私利时，杨继盛站了出来，以死相谏，浩气还太虚，丹心照万古；生前未了事，留与后人补！在阉党横行，魏忠贤肆意妄为时，杨涟、左光斗、顾大章却不同流合污，受尽酷刑，不改其志。每每读到杨涟写血书，左光斗怒斥探望他的学生，顾大章公布真相后坦然自缢，5个普普通通老百姓慨然赴死。总是情不自已，眼眶湿透。<br />\r\n<br />\r\n社会也许很黑暗，贪污横行，受贿成风。但明朝让我知道，不论这个世道有多不公，多黑暗，总有些人，有些事，像天空中的星辰，熠熠生辉，光耀千古。因为他们都有自己的“道”。也许渺小却一直存在，也许微弱却不会熄灭。我们祖先的所作所为，正是道的真实注脚。我们民族五千年的风风雨雨正是道的代代相承。人之所以伟大，正在于对“道”的不懈追求。<br />\r\n<br />\r\n道也许很难实现，但是必须追求，因为追求的过程，让人生有了意义。<br />\r\n<br />\r\n明朝让我知道，道——一直存在。<br />', 'mingchao.jpg', '2018-03-01 15:23:00', '3', '1', '100');

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(50) NOT NULL,
  `paixu` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_category
-- ----------------------------
INSERT INTO `article_category` VALUES ('1', 'PHP', '1');
INSERT INTO `article_category` VALUES ('2', 'Python', '1');
INSERT INTO `article_category` VALUES ('3', '读书', '1');
INSERT INTO `article_category` VALUES ('4', '感悟', '1');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add permission', '3', 'add_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can change permission', '3', 'change_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete permission', '3', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add article', '7', 'add_article');
INSERT INTO `auth_permission` VALUES ('20', 'Can change article', '7', 'change_article');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete article', '7', 'delete_article');
INSERT INTO `auth_permission` VALUES ('22', 'Can add category', '8', 'add_category');
INSERT INTO `auth_permission` VALUES ('23', 'Can change category', '8', 'change_category');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete category', '8', 'delete_category');
INSERT INTO `auth_permission` VALUES ('25', 'Can add tag', '9', 'add_tag');
INSERT INTO `auth_permission` VALUES ('26', 'Can change tag', '9', 'change_tag');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete tag', '9', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('28', 'Can add works', '10', 'add_works');
INSERT INTO `auth_permission` VALUES ('29', 'Can change works', '10', 'change_works');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete works', '10', 'delete_works');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 作品', '11', 'add_work');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 作品', '11', 'change_work');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 作品', '11', 'delete_work');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 标签', '12', 'add_tag');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 标签', '12', 'change_tag');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 标签', '12', 'delete_tag');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$36000$jWLN6Jm02c6c$wwFOJE/2dE1QlPu+5GjQonHua/5jpGdC5rCRFVHTBsI=', '2018-03-02 14:32:58', '1', 'admin', '', '', 'chuandong@starmerx.com', '1', '1', '2018-02-27 15:05:12');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-02-28 15:37:17', '1', 'Category object', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-02-28 15:37:35', '2', 'Category object', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-02-28 15:38:02', '3', 'Category object', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-02-28 15:38:16', '4', 'Category object', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2018-02-28 16:01:42', '1', 'Django开发项目流程', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2018-03-01 15:02:05', '2', 'SQL连接详解', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2018-03-01 15:06:31', '3', 'ThinkPHP5开发要点', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2018-03-01 15:12:39', '4', '从dota看精通之道', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2018-03-01 15:15:41', '5', '《牧羊少年奇幻之旅》读书笔记', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2018-03-01 15:18:21', '6', '真正的喜欢', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2018-03-01 15:23:38', '7', '《明朝那些事儿》读书笔记', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2018-03-02 15:00:08', '1', 'Python', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2018-03-02 15:00:17', '2', 'PHP', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2018-03-02 15:00:25', '3', 'Django', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2018-03-02 15:00:34', '4', 'ThinPHP5', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2018-03-02 15:50:05', '1', '知行合一博客', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2018-03-16 13:27:55', '7', '《明朝那些事儿》读书笔记', '2', '[{\"changed\": {\"fields\": [\"desc\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2018-03-16 13:28:12', '6', '真正的喜欢', '2', '[{\"changed\": {\"fields\": [\"desc\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2018-03-16 13:28:34', '5', '《牧羊少年奇幻之旅》读书笔记', '2', '[{\"changed\": {\"fields\": [\"desc\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2018-03-16 13:28:59', '4', '从dota看精通之道', '2', '[{\"changed\": {\"fields\": [\"desc\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2018-03-16 13:29:32', '3', 'ThinkPHP5开发要点', '2', '[{\"changed\": {\"fields\": [\"desc\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2018-03-16 13:30:24', '2', 'SQL连接详解', '2', '[{\"changed\": {\"fields\": [\"desc\", \"content\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2018-03-16 13:30:59', '1', 'Django开发项目流程', '2', '[{\"changed\": {\"fields\": [\"desc\", \"content\"]}}]', '7', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'article', 'article');
INSERT INTO `django_content_type` VALUES ('8', 'article', 'category');
INSERT INTO `django_content_type` VALUES ('9', 'article', 'tag');
INSERT INTO `django_content_type` VALUES ('10', 'article', 'works');
INSERT INTO `django_content_type` VALUES ('11', 'work', 'work');
INSERT INTO `django_content_type` VALUES ('12', 'work', 'tag');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-02-26 14:14:18');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-02-26 14:14:20');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-02-26 14:14:20');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-02-26 14:14:20');
INSERT INTO `django_migrations` VALUES ('5', 'article', '0001_initial', '2018-02-26 14:14:21');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2018-02-26 14:14:21');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2018-02-26 14:14:21');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2018-02-26 14:14:21');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2018-02-26 14:14:21');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2018-02-26 14:14:21');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2018-02-26 14:14:21');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2018-02-26 14:14:21');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2018-02-26 14:14:22');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-02-26 14:14:22');
INSERT INTO `django_migrations` VALUES ('15', 'article', '0002_auto_20180302_2256', '2018-03-02 14:56:23');
INSERT INTO `django_migrations` VALUES ('16', 'article', '0003_auto_20180302_2259', '2018-03-02 14:59:42');
INSERT INTO `django_migrations` VALUES ('17', 'article', '0004_auto_20180316_2104', '2018-03-16 13:04:43');
INSERT INTO `django_migrations` VALUES ('18', 'work', '0001_initial', '2018-03-16 13:04:43');
INSERT INTO `django_migrations` VALUES ('19', 'work', '0002_auto_20180310_0341', '2018-03-16 13:04:44');
INSERT INTO `django_migrations` VALUES ('20', 'work', '0003_auto_20180310_0350', '2018-03-16 13:04:44');
INSERT INTO `django_migrations` VALUES ('21', 'work', '0004_auto_20180316_2104', '2018-03-16 13:04:44');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('7ehdlnoayh9n7pyviox9vybdzgetk6eh', 'NWJlMzQ4YzlhNDRiNzAzYzZiZGFlYzdkYjI4ZmMyZmYzY2NhZWI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImE2Y2UyZDIzMmRjN2Y2NTkyMWI0YjU3NDcyNWFlNzJjNDQ2ZjdjZjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-03-16 14:32:58');

-- ----------------------------
-- Table structure for work_tag
-- ----------------------------
DROP TABLE IF EXISTS `work_tag`;
CREATE TABLE `work_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `paixu` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_tag
-- ----------------------------

-- ----------------------------
-- Table structure for work_work
-- ----------------------------
DROP TABLE IF EXISTS `work_work`;
CREATE TABLE `work_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `thumb` varchar(200) NOT NULL,
  `spend_time` varchar(100) NOT NULL,
  `add_date` datetime NOT NULL,
  `paixu` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `linkurl` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_work
-- ----------------------------

-- ----------------------------
-- Table structure for work_work_tag
-- ----------------------------
DROP TABLE IF EXISTS `work_work_tag`;
CREATE TABLE `work_work_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_work_tag_work_id_tag_id_ec4045a9_uniq` (`work_id`,`tag_id`),
  KEY `work_work_tag_work_id_dbdb22d7` (`work_id`),
  KEY `work_work_tag_tag_id_d93e978d` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_work_tag
-- ----------------------------
