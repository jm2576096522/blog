$("#userList")
		.datagrid(
				{
					url : "blog/list",
					pagination : true,
					rownumbers:true,
					fit : true,
					border : false,
					fitColumns : true,
					singleSelect : true,
					remoteSort:false,
					multiSort:true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					columns : [ [
							{
								field : 'usid',
								title : '编号',
								width : 80,
								align : 'center',
								sortable : true
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
								align : 'center',
								sortable : true
							},
							{
								field : 'usex',
								title : '性别',
								width : 50,
								align : 'center',
								sortable : true
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
								align : 'center',
								sortable : true
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
											+ ')">详情</a>'
											+ '<script>$(".detailBtn").linkbutton({iconCls: "icon-search"})</script>';
									return oprStr;
								}
							} ] ]
				});


$(".closeBtn").linkbutton({
	iconCls : "icon-cancel",
	onClick : function() {
		$("#modifyUser").dialog("close");
		$("#detailsUser").dialog("close");
	}
});

$(".updateBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#modifyForm").submit();
	}
});


$("#detailsUser").dialog({
	title : "用户详情",
	closed : true,
	modal : true,
});

function openDatail(index) {
	$("#detailsUser").dialog("open");
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
		$("#dpic").attr("src", row.upic);
	} else {
		$("#dpic").attr("src", "images/not_pic.jpg");
	}
}

function chgPic(obj) {
	$("#upic").attr("src", window.URL.createObjectURL(obj.files[0]));
}