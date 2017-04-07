$("#articleList")
		.datagrid(
				{
					url : "article/list",
					pagination : true,
					fit : true,
					border : false,
					fitColumns : true,
					singleSelect : true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					toolbar : '#article',
					columns : [ [
							{
								field : 'aid',
								title : '编号',
								width : 80,
								align : 'center'
							},
							{
								field : 'atitle',
								title : '文章标题',
								width : 100,
								align : 'center'
							},
							{
								field : 'tid',
								title : '文章类型',
								width : 50,
								align : 'center'
							},
							{
								field : 'tagid',
								title : '标签',
								width : 100,
								align : 'center'
							},
							{
								field : 'usid',
								title : '文章作者',
								width : 80,
								align : 'center'
							},
							{
								field : 'atime',
								title : '创作时间',
								width : 80,
								align : 'center'
							},
							{
								field : 'aviewnum',
								title : '文章浏览量',
								width : 50,
								align : 'center'
							},
							{
								field : 'apic',
								title : '图片',
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
											+ '<a class="removeBtn" href="javascript:void(0)" onclick="deleteDate('
											+ index
											+ ')">删除</a>'
											+ '<script>$(".detailBtn").linkbutton({iconCls: "icon-search"});'
											+ '$(".removeBtn").linkbutton({iconCls: "icon-remove"});</script>';
									return oprStr;
								}
							} ] ]
				});

$(".closeBtn").linkbutton({
	iconCls : "icon-cancel",
	onClick : function() {
		$("#detailsArticle").dialog("close");
	}
});

function deleteDate(index) {
	// 删除时先获取选择行
	var row = $("#articleList").datagrid("getRows")[index];

	var aid = row.aid;
	// 选择要删除的行
	$.messager.confirm("提示", "你确定要删除吗?", function(r) {
		if (r) {
			$.post("article/delete", {
				aid : aid
			}, function(data) {
				if (data > 0) {
					$("#articleList").datagrid("reload"); // 刷新修改数据
				} else {
					alert("删除失败失败");
				}
			});
			// 将选择到的行存入数组并用,分隔转换成字符串，
			// 本例只是前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
		}
	});
}

$("#detailsArticle").dialog({
	title : "文章详情",
	closed : true,
	modal : true,
});

function openDatail(index) {
	$("#detailsArticle").dialog("open");
	var row = $("#articleList").datagrid("getRows")[index];
	$("#Aaid").html(row.aid);
	$("#Aatitle").html(row.atitle);
	$("#Atid").html(row.tid);
	$("#Atagid").html(row.tagid);
	$("#Ausid").html(row.usid);
	$("#Aatime").html(row.atime);
	$("#Aaviewnum").html(row.aviewnum);
	$("#Aacontent").html(row.acontent);
	if (row.apic) {
		$("#pic").attr("src", row.apic);
	} else {
		$("#pic").attr("src", "images/not_pic.jpg");
	}
}
