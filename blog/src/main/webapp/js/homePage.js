var currPage = 1;
var pageSize = 6;
var totalPage;

pageHotArticle();  //页面初始化

function pageHotArticle(){
	$.get("article/findByHot",{currPage:currPage,pageSize:pageSize},function(data){
		var articleStr = "";
		for (var i = 0; i < data.length; i++){
			articleStr +='<div class="blogs">';
			articleStr +='<figure><img src="'+data[i].apic+'"></figure>';
			articleStr +='<ul><h3><a onclick="articleDetail('+data[i].aid+')">'+data[i].atitle+'</a></h3>';
			articleStr +='<div id="con_text" class="con_text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+data[i].acontent+'</div>';
			articleStr +='<p class="autor"><span class="lm f_l"><a onclick="userDetail('+data[i].usid+')">'+data[i].uname+'</a></span>';
			articleStr +='<span class="dtime f_l">'+data[i].atime+'</span>';
			articleStr +='<span class="viewnum f_r"><a onclick="articleDetail('+data[i].aid+')">浏览（'+data[i].aviewnum+'）</a></span>';
			articleStr +='<span class="pingl f_r"><a onclick="articleDetail('+data[i].aid+')">评论（'+data[i].commentnum+'）</a></span></p>';
			articleStr +='</ul></div>';
		}
		$("#content").html(articleStr);
	},"json");
}
function loadMoreArticle(){
	pageSize = 10;
	pageHotArticle();
	$("#loadMore").css("display","none");
	
	$.post("article/articleTotal",function(data){
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
		loadMoreArticle();
		
	}
}
/* 上一页 */
function prePage(){
	if(currPage == 1){
		currPage = currPage;
	}else{
		currPage -= 1;
		loadMoreArticle();
	}
}
/* 首页 */
function firstPage(){
	currPage = 1;
	loadMoreArticle();
}
/* 尾页 */
function lastPage(){
	currPage = totalPage;
	loadMoreArticle();
}

//文章详情
function articleDetail(index){
	$.post("article/updateAviewNum",{aid:index},function(data){
		location.href="article.jsp?aid="+index;
	});
}
//用户详情
function userDetail(index){
	if(index != null){
		location.href="userDetail.jsp?usid="+index;
	}
	
}
