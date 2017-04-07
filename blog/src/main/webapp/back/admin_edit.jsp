<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员列表</title>
</head>
<body>
	<table id="adminList"></table>
	<div id="tb">
		<a class="addBtn" href="javascript:void(0)">添加</a>
		<a class="updBtn" href="javascript:void(0)">刷新</a>
	</div>

	<div id="modifyAdmin" style="width: 300px; direction: center;">
		<form id="modifyForm" method="post" enctype="multipart/form-data"
			style="margin-left: 20px;">
			<p>
				<span>编号：</span> <input id="aid" name="adid" readonly="readonly"
					class="inputclass" />
			</p>
			<p>
				<span>用户名：</span> <input id="aname" name="adname" class="inputclass" />
			</p>
			<p>
				<span>密码：</span> <input id="apassword" name="adpassword"
					class="inputclass" />
			</p>
			<p>
				<span>邮箱：</span> <input id="amail" name="admail" class="inputclass" />
			</p>
			<p>
				<a class="closeBtn" href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a
					class="updateBtn" href="javascript:void(0)">修改</a>
			</p>
		</form>
	</div>

	<div id="addAdmin" style="width: 300px; direction: center;">
		<form id="addForm" method="post" enctype="multipart/form-data"
			style="margin-left: 20px;">
			<p>
				<span>用户名：</span> <input id="aname" name="adname" class="inputclass" />
			</p>
			<p>
				<span>密码：</span> <input id="apassword" name="adpassword"
					class="inputclass" />
			</p>
			<p>
				<span>邮箱：</span> <input id="amail" name="admail" type="email"
					class="inputclass" />
			</p>
			<p>
				<a class="closeBtn" href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a
					class="submitBtn" href="javascript:void(0)">确定</a>
			</p>
		</form>
	</div>

	<script type="text/javascript" src="js/admin_edit.js"></script>
</body>
</html>