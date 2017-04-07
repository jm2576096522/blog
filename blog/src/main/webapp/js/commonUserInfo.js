/**
 * 在页面上显示个人信息
 */
$.get("blog/showUserInfo",function(data){
	var userInfoStr = "";
	if(data.upic == null){
		userInfoStr +='<img src="images/not_pic.jpg" class="blog-entry-img">';
	}else{
		userInfoStr +='<img src="'+data.upic+'" alt="about me" class="blog-entry-img">';
	}
	userInfoStr +='<p>昵称 ：'+data.uname+'</p>';
	userInfoStr +='<p>个人职业 ：'+data.uprofession+'</p>';
	userInfoStr +='<p>个性签名 ：'+data.upersondesc+'</p>';
	
	$("#userPersonInfo").html(userInfoStr);
	
},'json');
