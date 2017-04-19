<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="${deployName}">
<title>博客专家</title>
<link rel="shortcut icon" href="assets/i/favicon.png" />
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
</head>
<body>
	<header class="blog-header">
		<div class="centered">
			<img width="200" src="images/plot2.png" alt="Amaze UI Logo" />
		</div>
	</header>
	<hr>
	<nav class="blog-nav">
		<ul class="nav_left">
			<li><a href="homePage.jsp">首页</a></li>
			<li><a>博客专栏</a></li>
			<li class="am-active"><a style="color: #10D07A;">博客专家</a></li>
			<li><a>热度话题</a></li>
			<li><a onclick="check_login()">我的博客</a></li>
		</ul>
		<!-- 菜单栏右部分 -->
		<div id="top_right"></div>
	</nav>
	<hr>

	<div class="am-g am-g-fixed blog-fixed blog-content">
		<figure data-am-widget="figure"
			class="am am-figure am-figure-default "
			data-am-figure="{  pureview: 'true' }">
			<div id="container">
				<div>
					<img src="images/01.jpg">
					<h3>Agfa</h3>
				</div>
				<div>
					<img src="images/02.jpg">
					<h3>Auto</h3>
				</div>
				<div>
					<img src="images/03.jpg">
					<h3>Bald eagle</h3>
				</div>
				<div>
					<img src="images/04.jpg">
					<h3>Black swan</h3>
				</div>
				<div>
					<img src="images/05.jpg">
					<h3>Book shelf</h3>
				</div>
				<div>
					<img src="images/06.jpg">
					<h3>Camera</h3>
				</div>
			</div>
		</figure>
	</div>

	<footer>
	
		<p class="ft-copyright">© 2015 AllMobilize, Inc. Licensed under
			MIT license. Made with love By LWXYFER1</p>
		<div id="tbox">
			<a id="togbook"></a> <a id="gotop" href="javascript:void(0)"></a>
		</div>
	</footer>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/homePage.js"></script>
	<script type="text/javascript" src="js/moreOperation.js"></script>
	<script type="text/javascript" src="js/sliders.js"></script>
</body>

</html>
