<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${deployName}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css">
<link href="css/main.css" rel="stylesheet" type="text/css">

<link href="css/manage.css" rel="stylesheet" type="text/css" />


<link href="fontAwesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<title>博客后台管理</title>
</head>

<body class="easyui-layout">
	<div data-options="region:'north' ,title:'欢迎 进入博客管理系统'"
		style="height: 110px;">
		<header>
		<div class="logo">
			<img align="middle" src="images/plot2.png">
		</div>
		</header>
	</div>
	<div data-options="region:'south'" style="height: 55px;">
		<div class="copyright textCenter">Copyright © baidu.com 版权所有 |
			京xxx备xxxxxxxxx号</div>
	</div>
	<div data-options="region:'east',title:'工具栏'" style="width: 182px;">
		<br> <input id="ss"></input>

		<div class="easyui-calendar"
			style="width: 180px; padding-top: 10px; height: 180px; border: 0px; border-bottom: 1px solid #94BAE7"></div>
	</div>

	<div
		data-options="region:'west',title:'管理中心',split:true,
		collapsible:false"
		style="width: 160px;">
		<div id="sideNav">
			<div title="信息管理" data-options="iconCls:'icon-mini-add'">
				<ul class="treeNav">
					<li><span>用户管理</span></li>
					<li><span>管理员设置</span></li>
				</ul>
			</div>
			<div title="博客管理" data-options="iconCls:'icon-mini-add'">
				<ul class="treeNav">
					<li><span>查询博客</span></li>
					<li><span>类别管理</span></li>
					<li><span>标签管理</span></li>
					<li><span>评论管理</span></li>
				</ul>
			</div>

		</div>
	</div>

	<div
		data-options="region:'center',tools: [{    
	    iconCls:'icon-full',    
	    handler:function(){full();}    
	  },{    
	    iconCls:'icon-unfull',    
	    handler:function(){unfull();}    
	  }]  ">
		<div id="main" style="width: 500px; height: 250px;">

			<div title="欢迎">
				<h1 style="width: 100%; text-align: center; margin-top: 80px">
					<label> 欢迎【<span>${loginAdmin.adname}</span>】使用博客系统
					</label>
				</h1>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/manage.js"></script>

</body>
</html>