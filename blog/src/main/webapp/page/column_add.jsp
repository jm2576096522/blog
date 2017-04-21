<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta charset="utf-8">
<title>专栏管理</title>
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>

<body id="blog-article-sidebar">
	<!-- header start -->
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
				<li><a href="page/blog_add.jsp">写新文章</a></li>
				<li><a href="page/blogManager.jsp">文章管理</a></li>
				<li><a href="page/blog_tag.jsp">类别管理</a></li>
				<li><a href="page/blogComment.jsp">评论管理</a></li>
				<li><a href="page/blogDrafets.jsp">草稿箱</a></li>
				<li><a href="page/personInfo.jsp">个人信息管理</a></li>
				<li><a href="page/blog_column.jsp" style="color: #10D07A;">专栏管理</a></li>
			</ul>
			<!-- 菜单栏右部分 -->
			<div id="top_right" class="show_loginUser" style="float: right;">
				<img src="${loginUser.getUpic()}" id="top_img"
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
		</div>
	</nav>
	<hr>
	<!-- nav end -->
	<hr>
	<!-- content srart -->

	<div class="am-g am-g-fixed blog-fixed">
		<div class="am-u-md-8 am-u-sm-12" style="width:100%;" >
			<!-- 新建博客 -->
				<hr>
				<span id="con_top"
					style="font-size: 18px; margin-left: 30px; letter-spacing: 3px; color: navy;">专栏添加</span>
				<hr>
			<form class="am-form am-g" id="add_form" method="post" style="width:80%;margin:auto;" enctype="multipart/form-data">
				

				<fieldset>
						<div class="am-form-group am-u-sm-4 blog-clear-left" style="width:100%;">
							<label>标题</label><input type="text" style="width:33%;" id="cotitle" name="cotitle"
								placeholder="标题">
						</div>
					
					<div class="am-form-group">
						<label style="float:left;">专栏描述 </label>
						<textarea name="cocontent" id="cocontent" rows="15"
							style="height: 150px;" placeholder="一字千金"></textarea>
					</div>
					<div id="show_img"></div>
					<p>
						<label> 上传图片 </label><input type="file" id="upicData"
							name="upicData" placeholder="选择文件" onchange="chgPic(this)">
					</p>
					<button type='submit' style='margin-right:20px;' class='am-btn am-btn-default' onclick='add_article()'>添加专栏</button>
					<button type='reset' class='am-btn am-btn-default' onclick="reset_img()">重置</button>
				</fieldset>
			</form>
		</div>
	</div>



	<!-- content end -->
	<footer class="blog-footer" style="margin-top: 200px;">

		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/moreOperation.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		var result = $("#top_img").attr("src");
		if (result == "") {
			$("#top_img").attr("src", "images/not_pic.jpg");
		}
		function column_add() {
			location.href = "page/column_add.jsp"
		}
		
		/* 图片更改 */
		function chgPic(obj) {
			var picStr = "<img src='"+ window.URL.createObjectURL(obj.files[0])+ "' style='width: 400px; height: 200px;'>";
			$("#show_img").html(picStr);
		}
		/* 添加文章的请求 */
		function add_article() {
			$("#add_form").form({
				url : "column/addColumn",
				success : function(data) {
					if (data.trim() == "true") {
						$.messager.alert("操作提示", "添加成功...", "info", function() {
								location.href = "page/blog_column.jsp";
						});
					}else {
						$.messager.alert("操作提示", "添加失败！！", "error");
					}
				}
			});
		}
		/* 清空图片 */
		function reset_img(){
			$("#show_img").html("");
		}
	</script>

</body>
</html>