$("#main").tabs({
	fit : true,
	border : false,
});
$("#sideNav").accordion({
	fit : true,
	border : false,
});

$(".treeNav").tree({
	onClick : function(node) { // node是指树节点， node.text是节点文本内容
		var nodeContent = node.text;
		if ($("#main").tabs('exists', nodeContent)) {
			$("#main").tabs('close', nodeContent)
		}
<<<<<<< HEAD
		if (nodeContent == "用户管理") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/user_info.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "查询博客") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/article_info.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "类别管理") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/type_edit.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "标签管理") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/tag_edit.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "评论管理") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/comment_edit.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "管理员设置") {
			alert("进入查询管理员");
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/news_edit.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else {
			$("#main").tabs('add', {
				title : nodeContent,
				content : nodeContent,
				iconCls : "icon-mini-add",
				closable : true,
			});
		}

	}
});

$.extend($.fn.layout.methods, {
	full : function(jq) {
		return jq.each(function() {
			var layout = $(this);
			var center = layout.layout("panel", "center");
			center.panel("maximize");
			center.parent().css("z-index", 10);

			$(window).on("resize.full", function() {
				layout.layout("unFull").layout("resize");
			})
		});
	},
	unfull : function(jq) {
		return jq.each(function() {
			var layout = $(this);
			var center = layout.layout("panel", "center");
			center.parent().css("z-index", "inherit");
			center.panel("restore");
			$(window).off("resize.full");
		});
	}
});

function full() {
	$("body").layout("full");
	$("#center_content").addClass("panel-fit");
}

function unfull() {
	$("body").layout("unfull");
}

$('#ss').searchbox({
	searcher : function(value, name) {
		alert(value + "," + name)
	},
	prompt : '请输入要查找的内容'
});
=======

		if (nodeContent == "查询博客") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/news_info.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "新建博客") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/news_edit.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else {
			$("#main").tabs('add', {
				title : nodeContent,
				content : nodeContent,
				iconCls : "icon-mini-add",
				closable : true,
			});
		}

	}
});

$.extend($.fn.layout.methods, {
	full : function(jq) {
		return jq.each(function() {
			var layout = $(this);
			var center = layout.layout("panel", "center");
			center.panel("maximize");
			center.parent().css("z-index", 10);

			$(window).on("resize.full", function() {
				layout.layout("unFull").layout("resize");
			})
		});
	},
	unfull : function(jq) {
		return jq.each(function() {
			var layout = $(this);
			var center = layout.layout("panel", "center");
			center.parent().css("z-index", "inherit");
			center.panel("restore");
			$(window).off("resize.full");
		});
	}
});

function full() {
	$("body").layout("full");
	$("#center_content").addClass("panel-fit");
}

function unfull() {
	$("body").layout("unfull");
}

$('#ss').searchbox({ 
	searcher:function(value,name){ 
	alert(value + "," + name) 
	}, 
	prompt:'请输入要查找的内容' 
	}); 

>>>>>>> branch 'master' of ssh://git@github.com/jm2576096522/blog