
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>我的博客</title>
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">
<meta name="msapplication-TileImage"
	content="assets/i/app-icon72x72@2x.png">
<meta name="msapplication-TileColor" content="#0e90d2">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
</head>

<body id="blog-article-sidebar">
	<!-- header start -->
	<header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">
    <div class="am-u-sm-8 am-u-sm-centered">
        <img width="200" src="assets/i/plot2.png" alt="Amaze UI Logo"/>
        <h2 class="am-hide-sm-only"></h2>
    </div>
</header>
<hr>
<nav class="am-g am-g-fixed blog-fixed blog-nav">
<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only blog-button" data-am-collapse="{target: '#blog-collapse'}" ><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="blog-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav">
      <li><a href="homePage.jsp">首页</a></li>
      <li><a href="article.jsp">我的文章</a></li>
      <li><a href="page/blog_add.jsp">写新文章</a></li>
      <li><a href="page/blogHistory.jsp"  style="color:#10D07A;">博客历史</a></li>
      <li><a href="javaScript:void(0)">标签管理</a></li>	
      <li><a href="javaScript:void(0)">草稿箱</a></li>
      <li><a href="page/personInfo.jsp">个人信息管理</a></li>
    </ul>
	<div class="show_loginUser" style="float:right;">
        	<img src="${loginUser.getUpic()}" style="width:50px;height:50px;border-radius:50%;margin-right:10px;">
        	欢迎  : <input type="text" id="loginUname" style="border:none;width:120px;" value="${loginUser.getUname()}"/>
      </div> 
		</div>
	</nav>
	<hr>
	<!-- nav end -->
	<hr>
	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed blog-content">
		<div class="am-u-sm-12">
			<h1 class="blog-text-center">-- 历史纪录 --</h1>
			<div class="timeline-year">
				<h1>2015</h1>
				<hr>
				<ul>
					<h3>10月</h3>
					<hr>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">2015/10/18</span>
						<span class="am-u-sm-8 am-u-md-6"><a
							href="page/show_article.jsp">君埋泉下泥销骨，我寄人间雪满头</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">风又起</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">amazeui</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">2015/10/10</span>
						<span class="am-u-sm-8 am-u-md-6"><a
							href="page/show_article.jsp">不为无益之事，何以遣有涯之生。</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">灯火阑珊</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">LWXYFER</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">2015/10/5</span>
						<span class="am-u-sm-8 am-u-md-6"><a
							href="page/show_article.jsp">一想到你，我这张丑脸上就泛起微笑</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">凌晨四点钟</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">二师兄</span></li>
				</ul>
				<br>
				<ul>
					<br>
					<h3>9月</h3>
					<hr>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
				</ul>
				<br>
				<ul>
					<br>
					<h3>8月</h3>
					<hr>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
				</ul>
			</div>
			<div class="timeline-year">
				<h1>2014</h1>
				<hr>
				<ul>
					<h3>9月</h3>
					<hr>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">2015/10/18</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">君埋泉下泥销骨，我寄人间雪满头</a></span>
						<span class="am-u-sm-4 am-u-md-2 am-hide-sm-only">风又起</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">amazeui</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">2015/10/10</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">不为无益之事，何以遣有涯之生。</a></span>
						<span class="am-u-sm-4 am-u-md-2 am-hide-sm-only">灯火阑珊</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">LWXYFER</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">2015/10/5</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">一想到你，我这张丑脸上就泛起微笑</a></span>
						<span class="am-u-sm-4 am-u-md-2 am-hide-sm-only">凌晨四点钟</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">二师兄</span></li>
				</ul>
				<br>
				<ul>
					<br>
					<h3>8月</h3>
					<hr>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
				</ul>
				<br>
				<ul>
					<br>
					<h3>7月</h3>
					<hr>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
					<li><span class="am-u-sm-4 am-u-md-2 timeline-span">时间</span>
						<span class="am-u-sm-8 am-u-md-6"><a href="#">我的标题</a></span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">分类目录</span> <span
						class="am-u-sm-4 am-u-md-2 am-hide-sm-only">作者</span></li>
				</ul>
			</div>


			<hr>
		</div>


	</div>
<!-- content end -->
	<footer class="blog-footer">
		
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
	<!-- <script src="assets/js/app.js"></script> -->
</body>


</html>