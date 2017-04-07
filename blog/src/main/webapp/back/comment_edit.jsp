<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>评论列表</title>
</head>
<body>
	<table id="commentList"></table>

	<div id="modifyComment" style="width: 300px; direction: center;">
		<form id="modifyForm" method="post" enctype="multipart/form-data"
			style="margin-left: 20px;">
			<p>
				<span>评论id：</span> <input id="ocid" name="cid" readonly="readonly"
					class="inputclass" />
			</p>
			<p>
				<span>文章id：</span> <input id="oaid" name="caid" class="inputclass" />
			</p>
			<p>
				<span>评论者：</span> <input id="ousid" name="usid" class="inputclass" />
			</p>
			<p>
				<span>评论时间：</span> <input id="octime" name="ctime" class="inputclass" />
			</p>
			<p>
				<span>评论内容：</span>
				<textarea id="ocontent" name="ccontent" class="inputclass"
					style="width: 300px"></textarea>
			</p>
			<p>
				<a class="closeBtn" href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a
					class="updateBtn" href="javascript:void(0)">修改</a>
			</p>
		</form>
	</div>

	<script type="text/javascript" src="js/comment_edit.js"></script>
</body>
</html>