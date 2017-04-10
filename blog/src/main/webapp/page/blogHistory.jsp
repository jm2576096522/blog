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
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<!-- <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="easyui/demo/demo.css"> -->
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
				<li><a href="article.jsp">我的文章</a></li>
				<li><a href="page/blog_add.jsp">写新文章</a></li>
				<li><a href="page/blogHistory.jsp" style="color: #10D07A;">文章管理</a></li>
				<li><a href="javaScript:void(0)">标签管理</a></li>
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
			<div id="history_content">
			
			</div>
		</div>
	</div>


	<!-- content end -->
	<footer class="blog-footer" style="margin-top: 400px;">

		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	
	<script type="text/javascript">
	/**
	 * 类别管理
	 */
	$(function(){
		$('#history_content').datagrid({
			pagination : true,
			fit : true,
			border : false,
			fitColumns : true,
			singleSelect : true,
			pageList : [ 5, 10, 15, 20, 25, 30 ],
			url:'article/findAllById',
			columns:[[
			          {field:'aid',title:'编号',hidden:false},
			          {field:'atitle',title:'标题',width:180,align : 'center'},
			          {field:'aviewnum',title:'阅读',width:180,align : 'center'},
			          {field:'commonnum',title:'评论',width:180,align : 'center'},
			          {field:'action',title:'操作',width:80,align:'center',
			        	  formatter:function(value,row,index){
			        		  '<a style="margin-right:10px; font-size:15px;" onclick="saverow('+index+')">编辑</a> ';
			        		   '<a style="font-size:15px;" onclick="cancelrow('+index+')">置顶</a>';
			        		 '<a style="margin-right:10px; font-size:15px;" onclick="editrow('+index+')">删除</a> ';
			        			'<a style="font-size:15px;" onclick="deleterow('+index+')">分类</a>';
			         	 }
			          }
			          ]],
			          onBeforeEdit:function(index,row){
			        	  row.editing = true;
			        	  $('#table_content').datagrid('updateRow',{index: index});
			          },
			          onAfterEdit:function(index,row){
			        	  row.editing = false;
			        	  $('#table_content').datagrid('updateRow',{index: index});
			        	  //save
			        	  var tagid = row.tagid;
			        	  var tagname = row.tagname;
			        	  $.get("tag/modify",{tagid:tagid,tagname:tagname},function(data){
			        		  $.messager.alert("操作提示","保存成功","info");
			        	  });
			          },
						onCancelEdit:function(index,row){
							row.editing = false;
							 $('#table_content').datagrid('updateRow',{index: index});
						}
		});
	});

	function editrow(editIndex){
		$('#table_content').datagrid('beginEdit', editIndex);
	}
	function saverow(editIndex){
		$('#table_content').datagrid('endEdit', editIndex);
	}
	function deleterow(editIndex){
				var rows = $('#table_content').datagrid('getRows');
				var row = rows[editIndex];
				var tagid = row.tagid;
				var articlenum = row.articlenum;
				if(articlenum == 0){
					$('#table_content').datagrid('deleteRow',editIndex);
					$.get("tag/delete",{tagid:tagid},function(data){
			      		  $.messager.alert("操作提示","保存成功","info");
						});
				}else{
					$.messager.alert("错误提示","文章数目不为空","error");
				}
	}
	function cancelrow(editIndex){
		$('#table_content').datagrid('cancelEdit',editIndex);
	}

	function tag_add(){
		var newTag = $("#add_tag").val();
		
		if(newTag == ""){
			$.messager.alert("失败提示","类别不能为空","error");
		}else{
			$.post("tag/add",{tagname:newTag},function(){
				$.messager.alert("操作提示","添加成功","info",function(){
					location.reload();
				});
			});
		}
	}
	</script>
	
</body>
</html>