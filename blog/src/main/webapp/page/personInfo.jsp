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
<title>个人信息</title>
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
<link rel="stylesheet" href="css/personInfo.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">

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
				<li><a href="page/blog_add.jsp">写新文章</a></li>
				<li><a href="page/blogHistory.jsp">博客历史</a></li>
				<li><a href="#">标签管理</a></li>
				<li><a href="#">草稿箱</a></li>
				<li><a href="page/personInfo.jsp" style="color: #10D07A;">个人信息管理</a></li>
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
	<div class="am-g am-g-fixed blog-fixed" style="margin-top:1%;">
		<div class="easyui-layout" style="width: 100%; height:800px; margin: 0px auto">
			<div data-options="region:'west',collapsible:false, border:false"
				title="个人信息" style="width: 180px;">
				<div id="tag_userinfo" style="height: 100%; border-right: 20px solid #EAF2FF; padding-left: 20px;">
					<ul>
						<li>
							<a href="page/personInfo.jsp">基本信息</a>
						</li>
							
						<li>
							<a href="page/personInfo_pwd.jsp">密码修改</a>
						</li>
					</ul>
						
				</div>
			</div>
			
			<div data-options="region:'center', fit:true, border:false">
			 	<div id="contentBox">
					<form action="" method="" name="myform" onSubmit="return sub()">
						<ul>
							<li>
								<label>头 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：</label> 
								<img src="images/not_pic.jpg" id="pic" width="150" height="150"> 
								<input id="upic" type="file" name="picData" onchange="chgPic(this)"/>
							</li>
							<li>
								<label>昵 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</label> 
								<input id="uname" type="text" name="uname" placeholder="请输入你的个人昵称" />
							</li>
							<li>
								<label>性 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label> 
								<input type="radio" name="rad1" class="rad1" value="男" onClick="ck()"/>男 
								<input type="radio" name="rad2" class="rad2" value="女" onClick="ck2()" />女
							</li>
							<li>
								<label>出生日期：</label> 
								<input type="date" placeholder="请输入你的出生日期">
							</li>
							<li>
								<label>联系方式：</label> 
								<input type="text" name="uphone" />
							</li>
							<li>
								<label>所 &nbsp;在 &nbsp;地：</label> 
								<select id="selProvince">
									<option value="0">--请选择省份--</option>
								</select> 
								<select id="selCity">
									<option value="0">--请选择城市--</option>
								</select> 
								<select id="selDistrict">
									<option value="0">--请选择区/县--</option>
								</select>
							</li>
							<li>
								<label>擅长职业：</label> 
								<input id="uprefession" name="uprefession" class="class">
							</li>
							<li>
								<label>个性签名：</label> 
								<textarea rows="4" cols="40"></textarea>
							</li>
						</ul>
						<button class="button_reset" type="reset">取消</button>
						<button class="button_submit" type="submit">保存</button>
					</form>
				</div> 
			</div>
		</div>
	</div>


	<!-- content end -->
	<footer class="blog-footer">

		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="js/CityJson.js" type="text/javascript"></script>
	<script src="js/ProJson.js" type="text/javascript"></script>
	<script src="js/DistrictJson.js" type="text/javascript"></script>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/personInfo.js"></script>
</body>
</html>