$("#adminList")
		.datagrid(
				{
					url : "comment/list",
					pagination : true,
					fit : true,
					border : false,
					fitColumns : true,
					singleSelect : true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					columns : [ [
							{
								field : 'cid',
								title : '评论编号id',
								width : 100,
								align : 'center'
							},
							{
								field : 'caid',
								title : '评论文章id',
								width : 100,
								align : 'center'
							},
							{
								field : 'usid',
								title : '评论者id',
								width : 100,
								align : 'center'
							},
							{
								field : 'ctime',
								title : '评论时间',
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

$("#modifyComment").dialog({
	title : "用户修改",
	closed : true,
	modal : true,
});


$("#modifyForm").form(
		{
			url : "comment/modify",
			success : function(data) {
				if (data == "") {
					$.messager.alert('用户修改主', '当前用户没有修改用户的权限 ！', 'warning');
					$("#modifyComment").dialog("close"); // 关闭修改框
					return;
				}

				if (data.trim() == "true") {
					$("#modifyComment").dialog("close"); // 关闭修改框
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
		$("#modifyComment").dialog("close");
	}
});

$(".updateBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#modifyForm").submit();
	}
});

function openUpdate(index) {
	$("#modifyComment").dialog("open");
	var row = $("#adminList").datagrid("getRows")[index];
	$("#ocid").val(row.cid);
	$("#ocaid").val(row.caid);
	$("#ousid").val(row.usid);
	$("#occontent").val(row.ccontent);
	$("#octime").val(row.ctime);
}