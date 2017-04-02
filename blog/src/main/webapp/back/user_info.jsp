<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<base href="${deployName}">
<meta  charset="UTF-8">
<title>用户列表</title>
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet" href="easyui/themes/default/easyui.css">
<link type="text/css" rel="stylesheet" href="css/admin_login.css">

</head>
<body>
	<table id="userList"></table>
	
	<div id="modifyDiv">
		<form id="modifyForm" method="post" enctype="multipart/form-data">
			<p><input id="usid" name="usid" readonly="readonly" class="inputclass"/></p>
			<p><input id="uemail" name="uemail"  class="inputclass" /></p>
			<p><input id="upassword" name="upassword"  class="inputclass"/></p>
			<p><input id="uname" name="uname" class="inputclass"/></p>
			<p><input id="usex" name="usex" class="inputclass"/></p>
			<p><input id="ubirthday" name="ubirthday" class="inputclass"/></p>
			<p><input id="uaddress" name="uaddress" class="inputclass"/></p>
			<p><input id="upic" type="file" name="upic" onchange="chgPic(this)"/><br>
				<img src="images/not_pic.jpg" id="pic" width="100" height="100">
			</p>
			<p><input id="uphone" name="uphone" class="inputclass"/></p>
			<p><input id="uprofession" name="uprofession" class="inputclass"/></p>
			<p><input id="upersondesc" name="upersondesc" class="inputclass"/></p>
			<p><a class="closeBtn" href="javascript:void(0)">关闭</a>&nbsp;&nbsp;
			<a class="updateBtn" href="javascript:void(0)">修改</a></p>
		</form>
	</div>
	
	<div id="detailsDiv">
			<p>姓名：<label id="dname" ></label></p>
			<p>邮件：<label id="demail" ></label></p>
			<p>性别：<label id="dgender" ></label></p>
			<p>生日：<label id="dbirthday" ></label></p>
			<p>地址：<label id="daddress" ></label></p>
			<p>电话：<label id="dmobile" ></label></p>
			<p>职业背景：<label id="dprofession" ></label></p>
			<p>个人描述：<textarea id="dpersondesc"  style="width: 300px;"placeholder="个人信息描述"></textarea></p>
			<p>图片：<img src="images/not_pic.jpg" id="pic" width="100" height="100" align="top"></p>
			<p><a class="closeBtn" href="javascript:void(0)">关闭</a></p>
	</div>
</body>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/user_info.js"></script>
</html>