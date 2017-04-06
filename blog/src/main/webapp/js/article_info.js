
$("#articleList")
		.datagrid(
				{
					url : "article/list",
					pagination : true,
					fit:false,
					border:false,
					fitColumns : true,
					singleSelect : true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
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
											+ '<a class="modifyBtn" href="javascript:void(0)" onclick="openUpdate('
											+ index
											+ ')">删除</a>'
											+ '<script>$(".detailBtn").linkbutton({iconCls: "icon-search"});'
											+ '$(".modifyBtn").linkbutton({iconCls: "icon-remove"});</script>';
									return oprStr;
								}
							} ] ]
				});

$("#modifyArticle").dialog({
	title : "文章修改",
	closed : true,
	modal : true,
});


$("#modifyForm").form(
		{
			url : "article/modify",
			success : function(data) {
				if (data == "") {
					$.messager.alert('类型修改', '当前用户没有修改用户的权限 ！', 'warning');
					$("#modifyArticle").dialog("close"); // 关闭修改框
					return;
				}

				if (data.trim() == "true") {
					$("#modifyArticle").dialog("close"); // 关闭修改框
					$("#articleList").datagrid("reload"); // 刷新修改数据
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
		$("#detailsArticle").dialog("close");
	}
});

$(".updateBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#modifyForm").submit();
	}
});

function openUpdate(index) {
	$("#modifyArticle").dialog("open");
	var row = $("#articleList").datagrid("getRows")[index];
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
		$("#upic").attr("src", row.upic);
	} else {
		$("#upic").attr("src", "images/not_pic.jpg");
	}
}

$("#detailsArticle").dialog({
	title : "文章详情",
	closed :true,
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
