$("#userList")
		.datagrid(
				{
					url : "blog/list",
					pagination : true,
					fit:true,
					border:false,
					fitColumns : true,
					singleSelect : true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					columns : [ [
							{
								field : 'usid',
								title : '编号',
								width : 80,
								align : 'center'
							},
							{
								field : 'uemail',
								title : '邮箱',
								width : 100,
								align : 'center'
							},
							{
								field : 'uname',
								title : '姓名',
								width : 100,
								align : 'center'
							},
							{
								field : 'usex',
								title : '性别',
								width : 50,
								align : 'center'
							},
							{
								field : 'ubirthday',
								title : '生日',
								width : 80,
								align : 'center'
							},
							{
								field : 'uaddress',
								title : '地址',
								width : 100,
								align : 'center'
							},
							{
								field : 'uphone',
								title : '电话',
								width : 100,
								align : 'center'
							},
							{
								field : 'uprofession',
								title : '职业背景',
								width : 80,
								align : 'center'
							},
							{
								field : 'upersondesc',
								title : '个人描述',
								width : 100,
								align : 'center'
							},
							{
								field : 'upic',
								title : '用户图像',
								width : 100,
								align : 'center',
								formatter : function(value, row, index) {
									if (value == null) {
										return "<img width='100' height='100' src='images/not_pic.jpg'/>"
									} else {
										return "<img width='100' src='" + value
												+ "'/>"
									}
								}
							},
							{
								field : 'opr',
								title : '操作',
								width : 100,
								align : 'center',
								formatter : function(value, row, index) {
									var oprStr = '<a class="detailBtn" href="javascript:void(0)" onclick="openDatail('
											+ index
											+ ')">详情</a>&nbsp;&nbsp;'
											+ '<a class="modifyBtn" href="javascript:void(0)" onclick="openUpdate('
											+ index
											+ ')">修改</a>'
											+ '<script>$(".detailBtn").linkbutton({iconCls: "icon-search"});'
											+ '$(".modifyBtn").linkbutton({iconCls: "icon-edit"});</script>';
									return oprStr;
								}
							} ] ]
				});

$("#modifyDiv").dialog({
	title : "用户修改",
	closable : false,
	modal : true,
});

$("#modifyDiv").dialog("close");

$("#modifyForm").form(
		{
			url : "blog/modify",
			success : function(data) {
				if (data == "") {
					$.messager.alert('用户修改主', '当前用户没有修改用户的权限 ！', 'warning');
					$("#modifyDiv").dialog("close"); // 关闭修改框
					return;
				}

				if (data.trim() == "true") {
					$("#modifyDiv").dialog("close"); // 关闭修改框
					$("#userList").datagrid("reload"); // 刷新修改数据
				} else {
					$.messager.show({
						title : '修改信息',
						msg : '修改失败！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				}
			}
		});

$(".closeBtn").linkbutton({
	iconCls : "icon-cancel",
	onClick : function() {
		$("#modifyDiv").dialog("close");
		$("#detailsDiv").dialog("close");
	}
});

$(".updateBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#modifyForm").submit();
	}
});

function openUpdate(index) {
	$("#modifyDiv").dialog("open");
	var row = $("#userList").datagrid("getRows")[index];
	$("#id").val(row.usid);
	$("#email").val(row.uemail);
	$("#name").val(row.uname);
	$("#password").val(row.upassword);
	$("#birthday").val(row.ubirthday);
	$("#sex").val(row.usex);
	$("#profession").val(row.uprofession);
	$("#persondesc").val(row.upersondesc);
	$("#address").val(row.uaddress);
	$("#phone").val(row.uphone);
	$("#pic").val("");
	if (row.upic) {
		$("#pic").attr("src", row.upic);
	} else {
		$("#pic").attr("src", "../images/not_pic.jpg");
	}
}

$("#detailsDiv").dialog({
	title : "用户详情",
	closable : false,
	modal : true,
});

$("#detailsDiv").dialog("close");

function openDatail(index) {
	$("#detailsDiv").dialog("open");
	var row = $("#userList").datagrid("getRows")[index];
	$("#dname").html(row.uname);
	$("#demail").html(row.uemail);
	$("#dbirthday").html(row.ubirthday);
	$("#dgender").html(row.usex);
	$("#dprofession").html(row.uprofession);
	$("#dpersondesc").html(row.upersondesc);
	$("#daddress").html(row.uaddress);
	$("#dmobile").html(row.uphone);
	if (row.upic) {
		$("#pic").attr("src", row.upic);
	} else {
		$("#pic").attr("src", "images/not_pic.jpg");
	}
}

function chgPic(obj) {
	$("#pic").attr("src", window.URL.createObjectURL(obj.files[0]));
}