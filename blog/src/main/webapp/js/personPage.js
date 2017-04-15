
var currPage = 1;
var pageSize = 5;
var totalPage;

$(function(){
	listById();
	listNum();
});

function listById(){ 
	$.post("article/listById",{currPage:currPage,pageSize:pageSize},function(data){
		var articleStr = "";
		for (var i = 0; i < data.length; i++){
			articleStr +='<article class="am-g blog-entry-article">';
			articleStr +='<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">';
			articleStr +='<img src="'+data[i].apic+'" alt="" style="height:250px;" class="am-u-sm-12"></div>';
			articleStr +='<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">';
			articleStr +='<span><a href="" class="blog-color">author:&nbsp;</a></span>';
			articleStr +='<span>@'+data[i].uname+'&nbsp;</span>';
			articleStr +='<span style="float:right;">'+data[i].atime+'</span>';
			articleStr +='<h1><a onclick="articleDetail('+data[i].aid+')">'+data[i].atitle+'</a></h1>';
			articleStr +='<div class="con_text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+data[i].acontent+'</div>';
			articleStr +='<p><a href="" class="blog-continue">continue reading</a></p>';
			articleStr +='<span class="viewnum f_r"><a style="padding-left:20px;">浏览（'+data[i].aviewnum+'）</a></span>';
			articleStr +='<span class="pingl f_r"><a href="/" style="padding-left:20px;">评论（'+data[i].commentnum+'）</a></span></p>';
			articleStr +='</div></article>';
		}
		$("#personArticle").html(articleStr);
	},"json");
}

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

//切换用户
function switch_user(){
	location.href ="login.jsp";
}
//退出登录
function login_out(){
	$.get("blog/login_out",function(data){
		location.href = "firstPage.jsp";
	});
}

//文章详情
function articleDetail(index){
	location.href="article.jsp?aid="+index;
}
