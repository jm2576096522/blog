

$(function(){
	alert(1);
	$("#yzm_img").attr("src","verifyCode.action?"+new Date().getTime());
	//验证码刷新
	$("#yzm_img").click(function(){
		$(this).attr("src","verifyCode.action?"+new Date().getTime());

	});
	
});






