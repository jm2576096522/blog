$("#adminList")
		.datagrid(
				{
					url : "admin/list",
					pagination : true,
					fit : true,
					border : false,
					fitColumns : true,
					singleSelect : true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					columns : [ [
							{
								field : 'adid',
								title : '编号',
								width : 100,
								align : 'center'
							},
							{
								field : 'adname',
								title : '用户名',
								width : 100,
								align : 'center'
							},
							{
								field : 'adpassword',
								title : '密码',
								width : 100,
								align : 'center'
							},
							{
								field : 'admail',
								title : '邮箱',
								width : 100,
								align : 'center'
							},
							{
								field : 'opr',
								title : '操作',
								width : 100,
								align : 'center',
								formatter : function(value, row, index) {
									var oprStr = '<a class="modifyBtn" href="javascript:void(0)" onclick="openUpdate('
											+ index
											+ ')">修改</a>'
											+ '<script>$(".detailBtn").linkbutton({iconCls: "icon-search"});'
											+ '$(".modifyBtn").linkbutton({iconCls: "icon-edit"});</script>';
									return oprStr;
								}
							} ] ]
				});

$("#modifyAdmin").dialog({
	title : "管理员修改",
	closed : true,
	modal : true,
});


$("#modifyForm").form(
		{
			url : "admin/modify",
			success : function(data) {
				if (data == "") {
					$.messager.alert('管理员修改', '当前用户没有修改管理员的权限 ！', 'warning');
					$("#modifyAdmin").dialog("close"); // 关闭修改框
					return;
				}

				if (data.trim() == "true") {
					$("#modifyAdmin").dialog("close"); // 关闭修改框
					$("#adminList").datagrid("reload"); // 刷新修改数据
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
		$("#modifyAdmin").dialog("close");
	}
});

$(".updateBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#modifyForm").submit();
	}
});

function openUpdate(index) {
	$("#modifyAdmin").dialog("open");
	var row = $("#adminList").datagrid("getRows")[index];
	$("#aid").val(row.adid);
	$("#aname").val(row.adname);
	$("#apassword").val(row.adpassword);
	$("#amail").val(row.admail);
}
