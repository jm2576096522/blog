<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>标签列表</title>
</head>
<body>
	<table id="tagList"></table>
	<div id="tag">
		<a class="addBtn" href="javascript:void(0)">添加</a> <a class="updBtn"
			href="javascript:void(0)">刷新</a>
	</div>
	<div id="modifyTag" style="width: 300px; direction: center;">
		<form id="modifyForm" method="post" enctype="multipart/form-data"
			style="margin-left: 20px;">
			<p>
				<span>编号：</span> <input id="Tid" name="tagid" class="inputclass" />
			</p>
			<p>
				<span>标签名：</span> <input id="Tname" name="tagname"
					class="inputclass" />
			</p>
			<p>
				<a class="closeBtn" href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a
					class="updateBtn" href="javascript:void(0)">修改</a>
			</p>
		</form>
	</div>
		<div id="addTag" style="width: 300px; direction: center;">
		<form id="addForm" method="post" enctype="multipart/form-data"
			style="margin-left: 20px;">
			<p>
				<span>标签名：</span> <input id="tagname" name="tagname" class="inputclass" />
			</p>
			<p>
				<a class="closeBtn" href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a
					class="submitBtn" href="javascript:void(0)">确定</a>
			</p>
		</form>
	</div>

	<script type="text/javascript" src="js/tag_edit.js"></script>
</body>
</html>