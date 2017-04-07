<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>
</head>
<body>
	<table id="userList"></table>

	<div id="modifyUser" style="width: 300px; direction: center;">
		<form id="modifyForm" method="post" enctype="multipart/form-data"
			style="margin-left: 20px;">
			<p>
				<span>编号：</span> <input id="id" name="usid" readonly="readonly"
					readonly="true" class="inputclass" />
			</p>
			<p>
				<span>邮箱：</span> <input id="email" name="uemail" class="inputclass" />
			</p>
			<p>
				<span>密码：</span> <input id="password" name="upassword"
					readonly="true" class="inputclass" />
			</p>
			<p>
				<span>昵称：</span> <input id="name" name="uname" class="inputclass" />
			</p>
			<p>
				<span>性别：</span> <input id="sex" name="usex" class="inputclass" />
			</p>
			<p>
				<span>生日：</span> <input id="birthday" name="ubirthday"
					class="inputclass" />
			</p>
			<p>
				<span>地址：</span> <input id="address" name="uaddress"
					class="inputclass" />
			</p>
			<p>
				<span>电话：</span> <input id="phone" name="uphone" class="inputclass" />
			</p>
			<p>
				<span>职业：</span> <input id="profession" name="uprofession"
					class="inputclass" />
			</p>
			<p>
				<span>签名：</span>
				<textarea id="persondesc" name="upersondesc" class="inputclass"  placeholder="个人信息描述"></textarea>
			</p>
			<p>
				<span>图片：</span> <input id="pic" type="file" name="picData"
					onchange="chgPic(this)" /><br> <img src="images/not_pic.jpg"
					id="upic" width="100" height="100">
			</p>
			<p>
				<a class="closeBtn" href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a
					class="updateBtn" href="javascript:void(0)">修改</a>
			</p>
		</form>
	</div>

	<div id="detailsUser" style="width: 300px;padding: 10px ">
	
		<p>
			姓名：<label id="dname"></label>
		</p>
		<p>
			邮件：<label id="demail"></label>
		</p>
		<p>
			性别：<label id="dgender"></label>
		</p>
		<p>
			生日：<label id="dbirthday"></label>
		</p>
		<p>
			地址：<label id="daddress"></label>
		</p>
		<p>
			电话：<label id="dmobile"></label>
		</p>
		<p>
			职业：<label id="dprofession"></label>
		</p>
		<p>
			签名：
			<textarea id="dpersondesc" style="width: 200px;"></textarea>
		</p>
		<p>
			图片：<img src="images/not_pic.jpg" id="dpic" width="100" height="100"
				align="top">
		</p>
		<p>
			<a class="closeBtn" href="javascript:void(0)">关闭</a>
		</p>
	</div>
	<script type="text/javascript" src="js/user_info.js"></script>
</body>
</html>