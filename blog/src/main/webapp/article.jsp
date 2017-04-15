<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>文章详情</title>
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
			<img width="200" src="assets/i/plot2.png" alt="Amaze UI Logo" />
			<h2 class="am-hide-sm-only"></h2>
		</div>
	</header>
	<!-- header end -->
	<hr>

	<!-- nav start -->
	<nav class="am-g am-g-fixed blog-fixed blog-nav">
		<ul class="am-nav am-nav-pills am-topbar-nav">
			<li><a href="homePage.jsp">首页</a></li>
			<li><a href="article.jsp" style="color: #10D07A;">我的文章</a></li>
			<li><a href="page/blog_add.jsp">写新文章</a></li>
			<li><a href="page/blogManager.jsp">文章管理</a></li>
			<li><a href="page/blog_tag.jsp">标签管理</a></li>
			<li><a >草稿箱</a></li>
			<li><a href="page/personInfo.jsp">个人信息管理</a></li>
		</ul>
		<div class="show_loginUser" style="float:right;">
        	<img src="${loginUser.getUpic()}" style="width:50px;height:50px;border-radius:50%;margin-right:10px;">
        	欢迎  : <input type="text" id="loginUname" style="border:none;width:120px;" value="${loginUser.getUname()}"/>
     	 </div>
		
	</nav>
	<!-- nav end -->
	<hr>
	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed blog-content">
		<div class="am-u-sm-12">
		 	 <!-- 文章详情 -->
			<div  id="articleDetail"></div>

			<div class="am-g blog-article-widget blog-article-margin">
				<div
					class="am-u-lg-4 am-u-md-5 am-u-sm-7 am-u-sm-centered blog-text-center">
					<span class="am-icon-tags"> &nbsp;</span>标签：<a id="tag"></a>
					<hr>
					<a><span class="am-icon-qq am-icon-fw am-primary blog-icon"></span></a> 
					<a><span class="am-icon-wechat am-icon-fw blog-icon"></span></a>
					<a><span class="am-icon-weibo am-icon-fw blog-icon"></span></a>
				</div>
			</div>

			<hr>
			<div class="am-g blog-author blog-article-margin">
				<div class="am-u-sm-3 am-u-md-3 am-u-lg-2">
					<img src="assets/i/f15.jpg" alt=""
						class="blog-author-img am-circle">
				</div>
				<div class="am-u-sm-9 am-u-md-9 am-u-lg-10">
					<h3>
						<span>作者 &nbsp;: &nbsp;</span><span class="blog-color">amazeui</span>
					</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>
			</div>
			<hr>
			<ul class="am-pagination blog-article-margin">
				<li class="am-pagination-prev"><a href="#" class="">&laquo;
						一切的回顾</a></li>
				<li class="am-pagination-next"><a href="">不远的未来 &raquo;</a></li>
			</ul>

			<hr>

			<form class="am-form am-g">
				<h3 class="blog-comment">评论</h3>
				<fieldset>
					<div class="am-form-group am-u-sm-4 blog-clear-left">
						<input type="text" class="" placeholder="名字">
					</div>
					<div class="am-form-group am-u-sm-4">
						<input type="email" class="" placeholder="邮箱">
					</div>

					<div class="am-form-group am-u-sm-4 blog-clear-right">
						<input type="password" class="" placeholder="网站">
					</div>

					<div class="am-form-group">
						<textarea class="" rows="5" placeholder="一字千金"></textarea>
					</div>

					<p>
						<button type="submit" class="am-btn am-btn-default">发表评论</button>
					</p>
				</fieldset>
			</form>

			<hr>
		</div>
	</div>
	<!-- content end -->
	<footer class="blog-footer">

		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
		
		
	<script type="text/javascript">
		var aid = "<%=request.getParameter("aid")%>";
		if(aid != "null"){
			$.post("article/findArticleByAid",{aid:aid},function(data){
				var articleStr ='' ;
				articleStr +='<article class="am-article blog-article-p"><div class="am-article-hd">';
				articleStr +='<h1 class="am-article-title blog-text-center">'+data.atitle+'</h1>';
				articleStr +='<p class="am-article-meta blog-text-center">';
				articleStr +='<span><a href="#" class="blog-color">author &nbsp;</a></span>： <span><a href="#">@'+data.uname+'&nbsp;</a></span>';
				articleStr +='<span style="margin-left:10px;"><a>'+data.atime+'</a></span></p></div>';
				articleStr +='<div class="am-article-lead">';
				articleStr +=data.atitle+'／'+data.uname+'<br> <br>';
				articleStr +=data.acontent;
				articleStr +='</div></article>';
				$("#tag").html(data.tagname);
				$("#articleDetail").html(articleStr);
				
			});
		}
	</script>
</body>
</html>