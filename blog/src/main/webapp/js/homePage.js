$.get("article/find",function(data){
		var articleStr = "";
		for (var i = 0; i < data.length; i++){
			articleStr +='<div class="blogs">';
			articleStr +='<figure><img src="'+data[i].apic+'"></figure>';
			articleStr +='<ul><h3><a href="/">'+data[i].atitle+'</a></h3>';
			articleStr +='<p id="con_text" class="con_text">'+data[i].acontent+'</p>';
			articleStr +='<p class="autor"><span class="lm f_l"><a href="/">'+data[i].uname+'</a></span>';
			articleStr +='<span class="dtime f_l">'+data[i].atime+'</span>';
			articleStr +='<span class="viewnum f_r"><a href="/">浏览（'+data[i].aviewnum+'）</a></span>';
			articleStr +='<span class="pingl f_r"><a href="/">评论（'+data[i].aviewnum+'）</a></span></p>';
			articleStr +='</ul></div>';
		}
		$("#content").html(articleStr);
},"json");


function check_login(){
	if($("#user_usid").val() == ""){
		alert("你尚未登陆，请先登录");
		location.href="login.jsp";
	}else{
		location.href="personPage.jsp";
	}
}