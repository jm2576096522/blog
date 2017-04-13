<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta charset="utf-8">
<title>我的博客</title>
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="css/blogManager.css">
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
				<li><a href="page/blogManager.jsp" style="color: #10D07A;">文章管理</a></li>
				<li><a href="page/blog_tag.jsp">标签管理</a></li>
				<li><a href="javaScript:void(0)">草稿箱</a></li>
				<li><a href="page/personInfo.jsp">个人信息管理</a></li>
			</ul>
			<div class="show_loginUser" style="float: right;">
				<img src="${loginUser.getUpic()}"
					style="width: 50px; height: 50px; border-radius: 50%; margin-right: 10px;">
				欢迎 : <input type="text" id="loginUname"
					style="border: none; width: 120px;" value="${loginUser.getUname()}" />
			</div>
		</div>
	</nav>
	<hr>
	<!-- nav end -->
	<hr>
	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed blog-content">
		
		<hr>
		</div>
		<div class="am-g am-g-fixed blog-fixed" style="margin-top:2%;">
		<div class="easyui-layout" style="width: 100%; height: 300px; margin: 0px auto">
			<table id="mytable">
			<thead>
				 <tr>
				 	<th scope='col' abbr='编号' class='nobg' style="display:none;">编号</th>
				 	<th scope='col' abbr='标题'>文章标题</th>
				 	<th scope='col' abbr='时间'>创作时间</th>
				 	<th scope='col' abbr='浏览量'>浏览量</th>
				 	<th scope='col' abbr='评论数'>评论数</th>
				 	<th scope='col' abbr='操作'>操作</th>
				 </tr>
			 </thead>
			 <tbody id="table_body">
			 	
			 </tbody>
			</table>
			 <ul class="am-pagination" style="width:100%;text-align: center;margin-top:30px;" id="myUI">
			</ul>
		</div>
	</div>


	<!-- content end -->
	<footer class="blog-footer" style="margin-top: 200px;">

		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script> 

	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript">
	/**
	 * 类别管理
	 */
	 var currPage = 1;
	 var pageSize = 5;
	 var totalPage;
	 
	 $(function(){
		 listById();
		 listNum();
	 });
	 
	 function listById(){ 
		 $.post("article/listById",{currPage:currPage,pageSize:pageSize},function(data){
		 var tableStr ;
		 for(var i=0;i<data.length;i++){
			 tableStr += "<tr><th class='specalt' style='display:none;'>"+data[i].aid+"</th>";
			 tableStr += "<td class='alt'>"+data[i].atitle+"</td>";
			 tableStr += "<td class='alt'>"+data[i].atime+"</td>";
			 tableStr += "<td class='alt'>"+data[i].aviewnum+"</td>";
			 tableStr += "<td class='alt'>"+data[i].commentnum+"</td>";
			 tableStr += "<td class='alt'><a style='margin-right:10px; font-size:15px;' onclick='editrow("+data[i].aid+")'>编辑</a>";
			 tableStr += "<a style='margin-right:10px; font-size:15px;' onclick='deleterow("+data[i].aid+")'>删除</a></th>";
		 }
		 $("#table_body").html(tableStr);
	 });}
	
	 function listNum(){
		 $.post("article/listNum",function(data){
			 var ulStr = "";
			 ulStr +="<li ><a onclick='prePage()'>&laquo; Prev</a></li>";
			 ulStr +="<li ><a onclick='firstPage()'>首页</a></li>";
			 ulStr +="<li><a>"+currPage+"/"+data.totalPage+"</a></li>";
			 ulStr +="<li><a>共:"+data.total+"条</a></li>";
			 ulStr +="<li ><a onclick='lastPage()'>尾页</a></li>";
			 ulStr +="<li ><a onclick='nextPage()'>Next &raquo;</a></li>";
			 totalPage = data.totalPage;
			 $("#myUI").html(ulStr);
		 });
	 }
	 /* 编辑 */
	function editrow(index){
		 window.location.href="page/blog_add.jsp?aid="+index;
	}
	 /* 删除 */
	 function deleterow(index){
		 $.post("article/delete",{aid:index},function(data){
			$.messager.alert("操作提示","删除成功!","info",function(){
				location.reload();
			});
		 });
	 }
	
	/* 下一页 */
	function nextPage(){
		if(currPage == totalPage){
			currPage = currPage;
		}else{
			currPage += 1;
			listById();
			listNum();
			
		}
	}
	/* 上一页 */
	function prePage(){
		if(currPage == 1){
			currPage = currPage;
		}else{
			currPage -= 1;
			listById();
			listNum();
		}
	}
	/* 首页 */
	function firstPage(){
		currPage = 1;
		listById();
		listNum();
	}
	/* 尾页 */
	function lastPage(){
		currPage = totalPage;
		listById();
		listNum();
	}
	</script>
	
</body>
</html>