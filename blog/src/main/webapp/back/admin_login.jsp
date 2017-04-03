<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<base href="${deployName}">
<meta charset="UTF-8">
<title>管理员登录</title>
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css">
<link type="text/css" rel="stylesheet" href="css/admin_login.css">
</head>
<body>
	<div id="loginDiv">
		<form id="loginForm" method="post" action="admin/login">
			<p>
				<label style="color: red;">${errorMsg}&nbsp;</label>
			</p>
			<!-- 问题反馈 -->
			<p>
				<input name="adname" placeholder="输入管理员名称" required="required"
					value="admin" class="inputclass" />
			</p>
			<p>
				<input type="password" name="adpassword" placeholder="输入密码"
					required="required" value="admin" class="inputclass" />
			</p>
			<p>
				<img src="vcode.jpg" title="看不清，换一张" /><input name="vcode"
					placeholder="请输入验证码" id="vcode" required="required" />
			</p>
			<p>
				<a id="btnLogin" href="javascript:void(0)">登录</a>
			</p>
		</form>
	</div>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/admin_login.js"></script>
</body>
</html>