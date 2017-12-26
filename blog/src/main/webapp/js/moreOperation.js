/**
 * 切换用户和退出操作
 */


//切换用户
function switch_user(){
	window.location.href ="/blog/login.jsp";
}
//退出登录
function login_out(){
	$.get("blog/login_out",function(data){
		window.location.href = "/blog/homePage.jsp";
	});
}