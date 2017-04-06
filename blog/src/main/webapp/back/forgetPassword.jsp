<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css">
<link type="text/css" rel="stylesheet" href="css/admin_login.css">
</head>
<body>
	<div id="loginDiv">
		<form id="loginForm" action="admin/forgetPassword" method="post">
			<p>
				<label style="color: red;">${errorMsg}&nbsp;</label>
			</p>
			<!-- 问题反馈 -->

			<p>
				<input name="adname" id="adname" required="required"
					placeholder="请求管理员名称" class="inputclass" />
			</p>
			<p>
				<input type="email" name="admail" id="admail" required="required"
					placeholder="请求输入找出密码邮箱" class="inputclass" />
			</p>
			<p>
				<input type="text" id="yzm" name="yzm" class="yzm"
					style="float: left; width: 50%;" data-validation-message="请输入验证码"
					placeholder="验证码" required />
				<button type="button" id="yzmbutton" class="yzmbutton"
					onClick="getYZM()">点击获取验证码</button>
			</p>

			<p>

				<a id="btnLogin" onClick="forgetPassword()">找回密码</a>
			</p>
		</form>
	</div>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/admin_login.js"></script>
	<script type="text/javascript">
		var countdown = 0;
		function getYZM() {
			countdown = 60;
			var admail = $.trim($("#admail").val());
			var random;
			if (admail == null || admail == "") {
				alert("请输入邮箱号");
			} else {
				$.ajax({
					url : 'sendEmail/admin',
					type : 'GET',
					data : {
						admail : admail
					},
					contentType : 'application/json;charset=UTF-8',
					success : function(data) {
						random = data;
						settime();
					}
				});
			}

			$("#yzm").focusout(function() {
				var yzmvalue = $.trim($("#yzm").val());
				if (yzmvalue != null && yzmvalue != random) {
					alert("验证码错误,请重新输入");
					$("#yzm").val("");
				}
			});
		}
		/* 	$("#yzm").focusout(function(){
		 $("#yzmbutton").attr("disabled", "disabled"); 
		 }); */
		function settime() {
			if (countdown == 0) {
				$("#yzmbutton").removeAttr("disabled");
				$("#yzmbutton").text("点击获取验证码");
			} else {
				$("#yzmbutton").attr("disabled", "disabled");
				$("#yzmbutton").text("重新发送(" + countdown + ")s");
				countdown--;
			}
			setTimeout(function() {
				settime()
			}, 1000);
		}
	</script>

</body>
</html>