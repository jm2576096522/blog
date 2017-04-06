$("#typeList")
		.datagrid(
				{
					url : "type/list",
					pagination : true,
					fit : true,
					border : false,
					fitColumns : true,
					singleSelect : true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					columns : [ [
							{
								field : 'tid',
								title : '编号',
								width : 100,
								align : 'center'
							},
							{
								field : 'tname',
								title : '类型名',
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
										+ ')">修改</a> &nbsp;&nbsp;' 
										+'<a class="detailBtn" href="javascript:void(0)" onclick="openDatail('
										+ index
										+ ')">删除</a>'
										+ '<script>$(".detailBtn").linkbutton({iconCls: "icon-remove"});'
										+ '$(".modifyBtn").linkbutton({iconCls: "icon-edit"});</script>';
								return oprStr;
								}
							} ] ]
				});

$("#modifyType").dialog({
	title : "类型修改",
	closed : true,
	modal : true,
});


$("#modifyForm").form(
		{
			url : "type/modify",
			success : function(data) {
				if (data == "") {
					$.messager.alert('类型修改', '当前用户没有修改用户的权限 ！', 'warning');
					$("#modifyType").dialog("close"); // 关闭修改框
					return;
				}

				if (data.trim() == "true") {
					$("#modifyType").dialog("close"); // 关闭修改框
					$("#typeList").datagrid("reload"); // 刷新修改数据
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
		$("#modifyType").dialog("close");
	}
});

$(".updateBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#modifyForm").submit();
	}
});

function openUpdate(index) {
	$("#modifyType").dialog("open");
	var row = $("#typeList").datagrid("getRows")[index];
	$("#id").val(row.tid);
	$("#name").val(row.tname);
}
