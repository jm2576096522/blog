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

	<div id="modifyDiv" style="width: 300px; direction: center;">
		<form id="modifyForm" method="post" enctype="multipart/form-data"
			style="margin-left: 20px;">
			<p>
				<span>编号：</span> <input id="id" name="tagid" class="inputclass" />
			</p>
			<p>
				<span>标签名：</span> <input id="name" name="tagname" class="inputclass" />
			</p>
			<p>
				<a class="closeBtn" href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a
					class="updateBtn" href="javascript:void(0)">修改</a>
			</p>
		</form>
	</div>

	<script type="text/javascript" src="js/tag_edit.js"></script>
</body>
</html>