function check_login(){
	$.get("login_check",function(data){
		alert("你尚未登陆，请先登陆");
	});
}