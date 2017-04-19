$("#typeList")
		.datagrid(
				{
					url : "type/list",
					pagination : true,
					fit : true,
					border : false,
					fitColumns : true,
					toolbar : '#type',
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
											+ '<a class="removeBtn" href="javascript:void(0)" onclick="deleteDate('
											+ index
											+ ')">删除</a>'
											+ '<script>$(".removeBtn").linkbutton({iconCls: "icon-remove"});'
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
$("#addType").dialog({
	title : "类型添加",
	closed : true,
	modal : true,
});
$("#modifyTypeForm").form(
		{
			url : "type/modify",
			success : function(data) {
				if (data.trim()) {
					$("#modifyType").dialog("close"); // 关闭修改框
					$("#typeList").datagrid("reload"); // 刷新修改数据
				} else {
					$.messager.show({
						title : '修改类型',
						msg : '修改类型失败！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				}
			}
		});
$("#addTypeForm").form(
		{
			url : "type/add",
			success : function(data) {
				if (data.trim() > 0) {
					$("#addType").dialog("close"); // 关闭添加框
					$("#typeList").datagrid("reload"); // 刷新添加数据
				} else {
					$.messager.show({
						title : '添加类型',
						msg : '添加类型失败！！！',
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
		$("#modifyTypeForm").submit();
	}
});
$(".addBtn").linkbutton({
	iconCls : "icon-add",
	onClick : function() {
		$("#addType").dialog("open");

	}
});
$(".updBtn").linkbutton({
	iconCls : "icon-reload",
	onClick : function() {
		$("#typeList").datagrid("reload");
	}
});

$(".submitBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#addTypeForm").submit();
	}
});

function openUpdate(index) {
	$("#modifyType").dialog("open");
	var row = $("#typeList").datagrid("getRows")[index];
	$("#id").val(row.tid);
	$("#name").val(row.tname);
}

function deleteDate(index) {
	// 删除时先获取选择行
	var row = $("#typeList").datagrid("getRows")[index];
	var tid = row.tid;
	// 选择要删除的行
	$.messager.confirm("提示", "你确定要删除吗?", function(r) {
		if (r) {
			$.post("type/delete", {
				tid : tid
			}, function(data) {
				if (data > 0) {
					$("#typeList").datagrid("reload"); // 刷新修改数据
				} else {
					alert("删除失败失败");
				}
			});
			// 将选择到的行存入数组并用,分隔转换成字符串，
			// 本例只是前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
		}
	});
}
