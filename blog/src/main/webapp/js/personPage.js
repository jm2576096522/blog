$.get("article/findPerson",function(data){
	var articleStr = "";
	for (var i = 0; i < data.length; i++){
		articleStr +='<article class="am-g blog-entry-article">';
		articleStr +='<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">';
		articleStr +='<img src="'+data[i].apic+'" alt="" class="am-u-sm-12"></div>';
		articleStr +='<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">';
		articleStr +='<span><a href="" class="blog-color">article &nbsp;</a></span>';
		articleStr +='<span> @'+data[i].uname+'&nbsp;</span>';
		articleStr +='<span>'+data[i].atime+'</span>';
		articleStr +='<h1><a href="">'+data[i].atitle+'</a></h1>';
		articleStr +='<p>'+data[i].acontent+'</p>';
		articleStr +='<p><a href="" class="blog-continue">continue reading</a></p>';
		articleStr +='</div></article>';
	}
	$("#personArticle").html(articleStr);
},"json");


function switch_user(){
	location.href ="login.jsp";
}
function login_out(){
	$.get("blog/login_out",function(data){
		
		location.href = "firstPage.jsp";
	});
}
   