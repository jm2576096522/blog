$("#loginDiv").dialog({
	title : "",
	border : false,
	modal : true,
	width : 300,
	top : 80
});

$('#btnLogin').linkbutton({
	iconCls : 'icon-man',
	onClick : function() {
		$("#loginForm").submit();// 表单提交
	}
});

$('#resetbtn').linkbutton({
	iconCls : "icon-mini-refresh",
	onClick : function() {
		$("#loginForm").clear;// 表单提交
	}
});
