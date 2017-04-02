$("#userList").datagrid(
				{
					url : "blog/list",
					pagination : true,
					fitColumns : true,
					singleSelect : true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					columns : [ [
							{
								field : 'usid',
								title : '编号',
								width : 50,
								align : 'center'
							},
							{
								field : 'uemail',
								title : '姓名',
								width : 100,
								align : 'center'
							},
							{
								field : 'upassword',
								title : '密码',
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
								width : 100,
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
								width : 100,
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
										return "<img width='100' src='image/not_pic.jpg'/>"
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
	alert("打开更新窗口"+index);
	$("#modifyDiv").dialog("open");
	var row = $("#userList").datagrid("getRows")[index];
	$("#usid").val(row.usid);
	$("#uemail").val(row.uemail);
	$("#uname").val(row.uname);
	$("#upassword").val(row.upassword);
	$("#ubirthday").val(row.ubirthday);
	$("#usex").val(row.usex);
	$("#uprofession").val(row.uprofession);
	$("#upersondesc").val(row.upersondesc);
	$("#uaddress").val(row.uaddress);
	$("#uphone").val(row.uphone);
	$("#upic").val("");
	if (row.upic) {
		$("#upic").attr("src", row.pic);
	} else {
		$("#upic").attr("src", "image/not_pic.jpg");
	}
}

$("#detailsDiv").dialog({
	title : "用户详情",
	closable : false,
	modal : true,
});

$("#detailsDiv").dialog("close");

function openDatail(index) {
	alert("显示数据窗口"+index);
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
	if (row.picPath) {
		$("#pic").attr("src", row.picPath);
	} else {
		$("#pic").attr("src", "image/not_pic.jpg");
	}
}

function chgPic(obj) {
	$("#pic").attr("src", window.URL.createObjectURL(obj.files[0]));
}