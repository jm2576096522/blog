/**
 * 类别管理
 */
var currPage = 1;
var pageSize = 5;
var totalPage;

$(function(){
	listById();
	listNum();
});

function listById(){ 
	$.post("article/listById",{currPage:currPage,pageSize:pageSize},function(data){
		var tableStr ;
		for(var i=0;i<data.length;i++){
			tableStr += "<tr><th class='specalt' style='display:none;'>"+data[i].aid+"</th>";
			tableStr += "<td class='alt'>"+data[i].atitle+"</td>";
			tableStr += "<td class='alt'>"+data[i].atime+"</td>";
			tableStr += "<td class='alt'>"+data[i].aviewnum+"</td>";
			tableStr += "<td class='alt'>"+data[i].commentnum+"</td>";
			tableStr += "<td class='alt'><a style='margin-right:10px; font-size:15px;' onclick='editrow("+data[i].aid+")'>编辑</a>";
			tableStr += "<a style='margin-right:10px; font-size:15px;' onclick='deleterow("+data[i].aid+")'>删除</a></th>";
		}
		$("#table_body").html(tableStr);
	});}

function listNum(){
	$.post("article/listNum",function(data){
		var ulStr = "";
		ulStr +="<li ><a onclick='prePage()'>&laquo; Prev</a></li>";
		ulStr +="<li ><a onclick='firstPage()'>首页</a></li>";
		ulStr +="<li><a>"+currPage+"/"+data.totalPage+"</a></li>";
		ulStr +="<li><a>共:"+data.total+"条</a></li>";
		ulStr +="<li ><a onclick='lastPage()'>尾页</a></li>";
		ulStr +="<li ><a onclick='nextPage()'>Next &raquo;</a></li>";
		totalPage = data.totalPage;
		$("#myUI").html(ulStr);
	});
}
/* 编辑 */
function editrow(index){
	window.location.href="page/blog_add.jsp?aid="+index;
}
/* 删除 */
function deleterow(index){
	$.post("article/delete",{aid:index},function(data){
		$.messager.alert("操作提示","删除成功!","info",function(){
			location.reload();
		});
	});
}

/* 下一页 */
function nextPage(){
	if(currPage == totalPage){
		currPage = currPage;
	}else{
		currPage += 1;
		listById();
		listNum();

	}
}
/* 上一页 */
function prePage(){
	if(currPage == 1){
		currPage = currPage;
	}else{
		currPage -= 1;
		listById();
		listNum();
	}
}
/* 首页 */
function firstPage(){
	currPage = 1;
	listById();
	listNum();
}
/* 尾页 */
function lastPage(){
	currPage = totalPage;
	listById();
	listNum();
}