<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="${deployName}">
<title>文章详情</title>
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
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
			<li class="am-active"><a href="homePage.jsp" >首页</a></li>
			<li><a href="blogColumn.jsp">博客专栏</a></li>
			<li><a href="blogProfessor.jsp" style="color: #10D07A;">博客专家</a></li>
			<li><a href="personPage.jsp">我的博客</a></li>
		</ul>
		<!-- 菜单栏右部分 -->
		<div id="top_right" class="show_loginUser" style="float: right;">
			<img src="${loginUser.getUpic()}"
				style="float: left; width: 50px; height: 50px; border-radius: 50%; margin-right: 10px;">
			<div style="float: left; height: 100%; line-height: 50px;">
				欢迎 : <input type="text" id="loginUname" readonly="readonly"
					value="${loginUser.getUname()}" /> <select id="user_select"
					style="border: none;">
					<option disabled="disabled" selected="selected">&nbsp;&nbsp;更多</option>
					<option onclick="switch_user()">切换用户</option>
					<option onclick="login_out()">退出</option>
				</select>
			</div>
		</div>

	</nav>
	<!-- nav end -->
	<hr>
	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed blog-content">
		<div class="am-u-sm-12">
			<!-- 文章详情 -->
			<div id="articleDetail">
				<article class="am-article blog-article-p">
					<div class="am-article-hd">
						<h1 class="am-article-title blog-text-center">博客专家规则</h1>
						<br>
						<p class="am-article-meta blog-text-center">
						<div class="am-article-lead">
							<h2>博客专家条件</h2>
							<ol type="1">
								<li>该博主所发文章数大于10</li>
								<li>文章的浏览量不小于20</li>
							</ol>
							<h3>注意事项：</h3>
							<ol type="1">
								<li>CSDN博客专家如有违反CSDN网站规则的行为，如大量发布广告或软文，对CSDN网站造成不良影响等，将永久取消其CSDN博客专家身份。</li>
								<li>CSDN博客专家在六个月内如果没有发布任何原创或翻译博文，其博客专家身份将自动取消，转为博客频道荣誉专家，进入博客频道荣誉专家列表，不能继续享有博客专家的福利。希望恢复博客专家身份可联系管理员重新申请。</li>
								<li>CSDN博客专家是CSDN给予质量较高的技术博客的一个荣誉称号，代表官方对其博客内容的肯定。但CSDN博客专家不是CSDN博客的全职或兼职管理人员，不具备CSDN博客的管理权力，其观点及行为仅代表个人，不代表CSDN官方立场。</li>
								<li>博客专家中的“行业名家”是与CSDN网站有合作关系的博客专家级用户。</li>
								<li>所有博客专家（包括荣誉专家）均为实名制。 </li>
							</ol>
							<h3>博客专家福利：</h3>	
							<ol type="1">
								<li>博客专家用户头像上显示“专家”勋章。</li>
								<li>博客专家发布博客时可以直接引用CSDN站外的图片。</li>
								<li>博客专家的个人博客提供量子恒道统计监测，可随时查看个人博客的数据统计详情。</li>
								<li>文章获得更多的推荐机会。博客专家所发的文章都会进入文章预选库，我们有专门的编辑负责从中筛选优质内容，并推荐到CSDN首页或其他内容频道；同时博客专家每日发布到博客首页的博文不受次数限制。</li>
							</ol>
						</div>
				</article>
				

			</div>
		</div>
	</div>
	<!-- content end -->
	<footer class="blog-footer">

		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/moreOperation.js"></script>

</body>
</html>