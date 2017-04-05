<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>新建博客</title>
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
<meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
<meta name="msapplication-TileColor" content="#0e90d2">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
</head>

<body id="blog">

	<header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">
		<div class="am-u-sm-8 am-u-sm-centered">
			<img width="200" src="assets/i/plot2.png" alt="Amaze UI Logo" />
			<h2 class="am-hide-sm-only"></h2>
			<span style="float: right;"> 欢迎 【 迷梦】 </span>
		</div>
	</header>
	<hr>
	<nav class="am-g am-g-fixed blog-fixed blog-nav">
		<button
			class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only blog-button"
			data-am-collapse="{target: '#blog-collapse'}">
			<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
		</button>

		<div class="am-collapse am-topbar-collapse" id="blog-collapse">
			<ul class="am-nav am-nav-pills am-topbar-nav">
				<li><a href="homePage.jsp">首页</a></li>
     			<li><a href="personPage.jsp">我的文章</a></li>
      			<li><a href="page/blog_add.jsp" style="color:#10D07A;">写新文章</a></li>
      			<li><a href="page/blogHistory.jsp">博客历史</a></li>
     			<li><a href="#">标签管理</a></li>	
      			<li><a href="#">草稿箱</a></li>
      			<li><a href="#">个人信息管理</a></li>
			</ul>
			<form class="am-topbar-form am-topbar-right am-form-inline"
				role="search">
				<div class="am-form-group">
					<input type="text" class="am-form-field am-input-sm"
						placeholder="搜索">
				</div>
			</form>
		</div>
	</nav>
	<hr>
	<!-- nav end -->
	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed">
		<div class="am-u-md-8 am-u-sm-12">
			<!-- 新建博客 -->

			<form class="am-form am-g">
				<h2 class="blog-comment" align="center">新建博客</h2>
				<fieldset>
					<div class="am-form-group am-u-sm-4 blog-clear-left">
						<label>标题</label><input type="text" name="etitle" placeholder="标题">
					</div>
					<div class="am-form-group am-u-sm-4">
						<label>标签 </label> <select name="tid">
							<option value='1'>web前端</option>
							<option value='2'>架构设计</option>
							<option value='3'>数据库</option>
							<option value='4'>编程语言</option>
							<option value='5'>系统运维</option>
							<option value='6'>云计算</option>
							<option value='7'>综合</option>
							<option value="8">移动开发</option>
						</select>
					</div>

					<div class="am-form-group am-u-sm-4 blog-clear-right">
						<label>文章类型 </label> <select name="btid">
							<option value="1">原创</option>
							<option value='2'>转载</option>
							<option value='3'>翻译</option>
						</select>
					</div>

					<div class="am-form-group">
						<label>内容 </label>
						<textarea name="econtent" id="econtent" rows="5"
							placeholder="一字千金"></textarea>
					</div>
					<p>
						<label> 上传图片 </label><input type="file" name="epic"
							placeholder="选择文件">
					</p>
					<p>
						<button type="submit" class="am-btn am-btn-default">提交</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="reset" class="am-btn am-btn-default">重置</button>
					</p>
				</fieldset>
			</form>
		</div>

		<div class="am-u-md-4 am-u-sm-12 blog-sidebar">
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-text-center blog-title">
					<span>About ME</span>
				</h2>
				<div id="userPersonInfo"></div>
				
			</div>
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-text-center blog-title">
					<span>Contact ME</span>
				</h2>
				<p>
					<a href=""><span
						class="am-icon-qq am-icon-fw am-primary blog-icon"></span></a> <a
						href=""><span class="am-icon-github am-icon-fw blog-icon"></span></a>
					<a href=""><span class="am-icon-weibo am-icon-fw blog-icon"></span></a>
					<a href=""><span class="am-icon-reddit am-icon-fw blog-icon"></span></a>
					<a href=""><span class="am-icon-weixin am-icon-fw blog-icon"></span></a>
				</p>
			</div>
			<div class="blog-clear-margin blog-sidebar-widget blog-bor am-g ">
				<h2 class="blog-title">
					<span>TAG cloud</span>
				</h2>
				<div class="am-u-sm-12 blog-clear-padding">
					<a href="" class="blog-tag">amaze</a> <a href="" class="blog-tag">妹纸
						UI</a> <a href="" class="blog-tag">HTML5</a> <a href=""
						class="blog-tag">这是标签</a> <a href="" class="blog-tag">Impossible</a>
					<a href="" class="blog-tag">开源前端框架</a>
				</div>
			</div>
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-title">
					<span>么么哒</span>
				</h2>
				<ul class="am-list">
					<li><a href="#">每个人都有一个死角， 自己走不出来，别人也闯不进去。</a></li>
					<li><a href="#">我把最深沉的秘密放在那里。</a></li>
					<li><a href="#">你不懂我，我不怪你。</a></li>
					<li><a href="#">每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- content end -->
	<footer class="blog-footer">
		<div
			class="am-g am-g-fixed blog-fixed am-u-sm-centered blog-footer-padding">
			<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
				<h3>模板简介</h3>
				<p class="am-text-sm">
					这是一个使用amazeUI做的简单的前端模板。<br> 博客/ 资讯类 前端模板 <br>
					支持响应式，多种布局，包括主页、文章页、媒体页、分类页等<br>嗯嗯嗯，不知道说啥了。外面的世界真精彩<br> <br>
					Amaze UI 使用 MIT 许可证发布，用户可以自由使用、复制、修改、合并、出版发行、散布、再授权及贩售 Amaze UI
					及其副本。
				</p>
			</div>
			<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
				<h3>社交账号</h3>
				<p>
					<a href=""><span
						class="am-icon-qq am-icon-fw am-primary blog-icon blog-icon"></span></a>
					<a href=""><span
						class="am-icon-github am-icon-fw blog-icon blog-icon"></span></a> <a
						href=""><span
						class="am-icon-weibo am-icon-fw blog-icon blog-icon"></span></a> <a
						href=""><span
						class="am-icon-reddit am-icon-fw blog-icon blog-icon"></span></a> <a
						href=""><span
						class="am-icon-weixin am-icon-fw blog-icon blog-icon"></span></a>
				</p>
				<h3>Credits</h3>
				<p>我们追求卓越，然时间、经验、能力有限。Amaze UI
					有很多不足的地方，希望大家包容、不吝赐教，给我们提意见、建议。感谢你们！</p>
			</div>
			<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
				<h1>我们站在巨人的肩膀上</h1>
				<h3>Heroes</h3>
				<p>
				<ul>
					<li>jQuery</li>
					<li>Zepto.js</li>
					<li>Seajs</li>
					<li>LESS</li>
					<li>...</li>
				</ul>
				</p>
			</div>
		</div>
		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>



	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/jquery.min.js"></script>
	<!--<![endif]-->
	<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
	<script src="assets/js/amazeui.min.js"></script>

	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" src="js/commonUserInfo.js"></script>	
</body>
</html>