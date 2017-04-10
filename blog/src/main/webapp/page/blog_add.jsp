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
<title>新建博客</title>
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<script type="text/javascript" charset="utf-8"
	src="ueditor/lang/zh-cn/zh-cn.js"></script>
</head>

<body id="blog">
	<header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">
		<div class="am-u-sm-8 am-u-sm-centered">
			<img width="200" src="assets/i/plot2.png" alt="Amaze UI Logo" />
			<h2 class="am-hide-sm-only"></h2>
		</div>
	</header>
	<hr>
	<nav class="am-g am-g-fixed blog-fixed blog-nav">
		<div class="am-collapse am-topbar-collapse" id="blog-collapse">
			<ul class="am-nav am-nav-pills am-topbar-nav">
				<li><a href="homePage.jsp">首页</a></li>
				<li><a href="personPage.jsp">我的文章</a></li>
				<li><a href="page/blog_add.jsp" style="color: #10D07A;">写新文章</a></li>
				<li><a href="page/blogHistory.jsp">博客历史</a></li>
				<li><a href="page/blog_tag.jsp">标签管理</a></li>
				<li><a>草稿箱</a></li>
				<li><a href="page/personInfo.jsp">个人信息管理</a></li>
			</ul>
			<div class="show_loginUser" style="float: right;">
				<img src="${loginUser.getUpic()}"
					style="width: 50px; height: 50px; border-radius: 50%; margin-right: 10px;">
				欢迎 : <input type="text" id="loginUname"
					style="border: none; width: 90px;" value="${loginUser.getUname()}" />
				<select id="user_select" style="border: none; width: 20px;">
					<option value="personPage.jsp"></option>
					<option onclick="switch_user()">切换用户</option>
					<option onclick="login_out()">退出</option>
				</select>
			</div>
		</div>
	</nav>
	<hr>
	<!-- nav end -->
	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed">
		<div class="am-u-md-8 am-u-sm-12">
			<!-- 新建博客 -->

			<form class="am-form am-g" id="add_form" method="post"
				enctype="multipart/form-data">
				<h2 class="blog-comment" align="center">新建博客</h2>
				<fieldset>
					<div class="am-form-group am-u-sm-4 blog-clear-left">
						<label>标题</label><input type="text" name="atitle" placeholder="标题">
					</div>
					<div class="am-form-group am-u-sm-4">
						<label>标签 </label> <select name="tagid" id="tag">
							<option disabled="disabled" selected="selected">--请选择类别--</option>
						</select>
					</div>

					<div class="am-form-group am-u-sm-4 blog-clear-right">
						<label>文章类型 </label> <select name="tid" id="type">
							<option disabled="disabled" selected="selected">--请选择文章类型--</option>
						</select>
					</div>

					<div class="am-form-group">
						<label>内容 </label>
						<textarea name="acontent" id="acontent" rows="15"
							style="height: 150px;" placeholder="一字千金"></textarea>
					</div>
					<div id="show_img"></div>
					<p>
						<label> 上传图片 </label><input type="file" id="upicDate"
							name="upicDate" placeholder="选择文件" onchange="chgPic(this)">
					</p>
					<p>
						<button type="submit" class="am-btn am-btn-default"
							onclick="add_article()">提交</button>
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

		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="assets/js/amazeui.min.js"></script>

	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" src="js/commonUserInfo.js"></script>

	<script type="text/javascript">
		UE.getEditor('econtent');// 使用副文本编辑工具

		$.get("tag/findAllTags", function(data) {
			for (var i = 0; i < data.length; i++) {
				var option = "<option value='" + data[i].tagid + "'>" + data[i].tagname + "</option>";
				$("#tag").append(option);
			}
		});
		$.get("type/findAll", function(data) {
			for (var i = 0; i < data.length; i++) {
				var option = "<option value='" + data[i].tid + "'>"
						+ data[i].tname + "</option>";
				$("#type").append(option);
			}
		});
		function chgPic(obj){
			var picStr = "<img src='"+window.URL.createObjectURL(obj.files[0])+"' style='width: 400px; height: 200px;'>";
			$("#show_img").html(picStr);
		}
		
		function add_article(){
			$("#add_form").form({
				url:"article/addArticle",
				success:function(data){
			    	if(data.trim() == "true"){
			    		 $.messager.alert("操作提示", "添加成功...","info");
			    	}else{
			    		 $.messager.alert("操作提示", "添加失败！！","error");
			    	}
				}
			});
		}
	</script>
</body>

</html>