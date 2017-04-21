$("#columnList")
		.datagrid(
				{
					url : "column/list",
					pagination : true,
					rownumbers : true,
					fit : true,
					border : false,
					fitColumns : true,
					singleSelect : true,
					remoteSort : false,
					multiSort : true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					toolbar : '#column',
					columns : [ [
							{
								field : 'cotitle',
								title : '板块标题',
								width : 110,
								align : 'center',
							},
							{
								field : 'uemail',
								title : '板主邮箱',
								width : 110,
								align : 'center'
							},
							{
								field : 'uname',
								title : '板主昵称',
								width : 80,
								align : 'center',
								sortable : true
							},
							{
								field : 'cotime',
								title : '板块创建时间',
								width : 100,
								align : 'center',
								sortable : true
							},
							{
								field : 'articlenum',
								title : '板块文章数',
								width : 50,
								align : 'center',
								sortable : true
							},
							{
								field : 'coviewnum',
								title : '板块浏览量',
								width : 50,
								align : 'center',
								sortable : true
							},
							{
								field : 'copic',
								title : '板块图像',
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
								width : 80,
								align : 'center',
								formatter : function(value, row, index) {
									var oprStr = '<a class="datailBtn" href="javascript:void(0)" onclick="openDatail('
											+ index
											+ ')">详情</a>'
											+ '<a class="removeBtn" href="javascript:void(0)"onclick="deleteDate('
											+ index
											+ ')">删除</a>'
											+ '<script>$(".removeBtn").linkbutton({iconCls: "icon-remove"});'
											+ '$(".datailBtn").linkbutton({iconCls: "icon-search"});</script>';
									return oprStr;
								}
							} ] ]
				});

// 板块文章添加
$.post("article/list", function(data) {
	$('#caid').combobox('clear'); 
	$("#caid").combobox({
		data : data.rows,
		valueField : 'aid',
		textField : 'atitle',
		required : true,
		multiple : true,
		panelHeight : 'auto'
	});
	$('#caid').combobox('getValue');
}, "json");

// 板主邮箱
$.post("blog/list", function(data) {
	$('#cuemail').combobox('clear');
	$("#cuemail").combobox({
		data : data.rows,
		valueField : 'uemail',
		textField : 'uemail',
		required : true,
		panelHeight : 'auto'
	});
	$('#cuemail').combobox('getValue');
}, "json");


$("#detailsColumn").dialog({
	title : "板块详情",
	closed : true,
	modal : true
});

$("#addColumn").dialog({
	title : "板块添加",
	closed : true,
	modal : true
});
$("#addColumnForm").form(
		{
			url : "column/add",
			success : function(data) {
				if (data.trim() > 0) {
					$("#addColumn").dialog("close"); // 关闭添加框
					$("#columnList").datagrid("reload"); // 刷新添加数据
				} else {
					$.messager.show({
						title : '添加信息',
						msg : '添加信息失败！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				}
			}
		});

$(".addBtn").linkbutton({
	iconCls : "icon-add",
	onClick : function() {
		//$("#addColumnForm").form("reset");
		$("#addColumn").dialog("open");
	}
});
$(".updBtn").linkbutton({
	iconCls : "icon-reload",
	onClick : function() {
		$("#columnList").datagrid("reload");
	}
});
$(".closeBtn").linkbutton({
	iconCls : "icon-cancel",
	onClick : function() {
		$("#detailsColumn").dialog("close");
		$("#addColumn").dialog("close");
	}
});

$(".addColumBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#addColumnForm").submit();
	}
});
function deleteDate(index) {
	// 删除时先获取选择行
	var row = $("#columnList").datagrid("getRows")[index];
	var coid = row.coid;
	// 选择要删除的行
	$.messager.confirm("提示", "你确定要删除吗?", function(r) {
		if (r) {
			$.post("column/delete", {
				coid : coid
			}, function(data) {
				if (data > 0) {
					$("#columnList").datagrid("reload"); // 刷新修改数据
				} else {
					$.messager.show({
						msg : '删除失败！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				}
			});
			// 将选择到的行存入数组并用,分隔转换成字符串，
			// 本例只是前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
		}
	});
}

function openDatail(index) {
	$("#detailsColumn").dialog("open");
	var row = $("#columnList").datagrid("getRows")[index];
	$("#dcoid").html(row.coid);
	$("#dcotitle").html(row.cotitle);
	$("#daid").html(row.coaid);
	$("#duname").html(row.uname);
	$("#duemail").html(row.uemail);
	$("#dcotime").html(row.cotime);
	$("#darticlenum").html(row.articlenum);
	$("#dcoviewnum").html(row.coviewnum);
	$("#dcocontent").html(row.cocontent);
	if (row.copic) {
		$("#dcopic").attr("src", row.copic);
	} else {
		$("#dcopic").attr("src", "images/not_pic.jpg");
	}
}

function chgPic(obj) {
	$("#pic").attr("src", window.URL.createObjectURL(obj.files[0]));
}