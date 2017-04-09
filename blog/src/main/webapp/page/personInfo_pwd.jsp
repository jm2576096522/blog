<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>个人信息</title>
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">
<meta name="msapplication-TileImage"
	content="assets/i/app-icon72x72@2x.png">
<meta name="msapplication-TileColor" content="#0e90d2">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" href="css/personInfo.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">

<style type="text/css">
	.correct{
		color:green;
		padding-left:20px;
		background:url(images/onCorrect.gif) no-repeat left center;	
		}
	.error{
		color:red;
		padding-left:20px;
		background:url(images/onError.gif) no-repeat left center;
			
		}
	.focus{
		color:blue;
		padding-left:20px;
		background:url(images/onFocus.gif) no-repeat left center;	
		}				
</style>
</head>

<body id="blog">

	<header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">
		<div class="am-u-sm-8 am-u-sm-centered">
			<img width="200" src="assets/i/plot2.png" alt="Amaze UI Logo" />
			<h2 class="am-hide-sm-only"></h2>
			
		</div>
	</header>
	<hr>
	<nav class="am-g am-g-fixed blog-fixed blog-nav">
		<div class="am-collapse am-topbar-collapse" id="blog-collapse">
			<ul class="am-nav am-nav-pills am-topbar-nav">
				<li><a href="homePage.jsp">首页</a></li>
				<li><a href="personPage.jsp">我的文章</a></li>
				<li><a href="page/blog_add.jsp">写新文章</a></li>
				<li><a href="page/blogHistory.jsp">博客历史</a></li>
				<li><a href="#">标签管理</a></li>
				<li><a href="#">草稿箱</a></li>
				<li><a href="page/personInfo.jsp" style="color: #10D07A;">个人信息管理</a></li>
			</ul>
		<div class="show_loginUser" style="float:right;">
        	<img src="${loginUser.getUpic()}" style="width:50px;height:50px;border-radius:50%;margin-right:10px;">
        	欢迎  : <input type="text" id="loginUname" style="border:none;width:120px;" value="${loginUser.getUname()}"/>
      </div>
		</div>
	</nav>
	<hr>
	<div class="am-g am-g-fixed blog-fixed" style="margin-top:1%;">
		<div class="easyui-layout" style="width: 100%; height:500px; margin: 0px auto">
			<div data-options="region:'west',collapsible:false, border:false"
				title="个人信息" style="width: 180px;">
				<div id="tag_userinfo" style="height: 100%; border-right: 20px solid #EAF2FF; padding-left: 20px;">
					<ul>
						<li>
							<a href="page/personInfo.jsp">基本信息</a>
						</li>
							
						<li>
							<a href="page/personInfo_pwd.jsp">密码修改</a>
						</li>
					</ul>
						
				</div>
			</div>
			
			<div data-options="region:'center', fit:true, border:false">
			 	<div id="contentBox">
					<form action="" method="" name="myform" onsubmit="return false">
						<ul>
							<li>
                        		<label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 码：</label>
                        		<input type="password" id="pwd1" name="pwd1" placeholder="请输入原密码"  onBlur="show1(this)"/>
                        		<span id="span1"></span>
                       		 </li>
							<li>
                        		<label>新&nbsp;&nbsp;密&nbsp;&nbsp;码：</label>
                        		<input type="password" id="pwd2" name="pwd2" placeholder="请输入新密码"  onBlur="show2(this)"/>
                        		<span id="span2"></span>
                       		 </li>
                        	 <li>
	                        	<label>重复密码：</label>
	                        	<input type="password" name="pwd3"  placeholder="请重复新密码"  onBlur="show3(this)" onFocus="show4(this)"/>
	                        	<span id="span3"></span>
                        	</li>
						</ul>
						<button class="button_reset" type="reset" onClick="cancel()">重置</button>
						<button class="button_submit" type="button" onClick="update_pwd()">保存</button>
					</form>
				</div> 
			</div>
		</div>
	</div>


	<!-- content end -->
	<footer class="blog-footer">
		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="js/CityJson.js" type="text/javascript"></script>
	<script src="js/ProJson.js" type="text/javascript"></script>
	<script src="js/DistrictJson.js" type="text/javascript"></script>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/personInfo.js"></script>
	
	<script type="text/javascript">
	
	 var info=document.getElementById("span1");
	 var info2=document.getElementById("span2");
	 var info3=document.getElementById("span3");
	 var info4=document.getElementById("span4");
	 function show1(obj){
	        if(obj.value == ""){
	        	 info.innerHTML="密码不能为空";
				 info.className="error";
	        }else{
	        	info.innerHTML="密码格式正确"; 
	            info.className="correct";
	        }
	    } 
	 function show2(obj){
	    	var reg=/[\w]{1,}/ig;
	        if(reg.test(obj.value)){
	       		info2.innerHTML="密码格式正确"; 
	            info2.className="correct";
	        }else if(obj.value==""){
				 info2.innerHTML="密码不能为空";
				 info2.className="error";
	        }else{
				 info2.innerHTML="密码必须由1位或其以上的数字，字母组成";
	            info2.className="error"; 
				}
	    } 
	 function show3(obj){
			var pwd=document.myform.pwd2.value;
			if(pwd==obj.value && pwd!=""){
				info3.innerHTML="密码格式正确"; 
		        info3.className="correct";
	        }else{
	            info3.innerHTML="两次密码不一致或为空，请查证后再输入";
	            info3.className="error"; 
			}
		}
	function show4(obj){
			info4.innerHTML="两次输入的密码必须一致";
			info4.className="focus";	
		}
	function cancel(){
		$("#span1").html("");
		$("#span2").html("");
		$("#span3").html("");
		$("#span4").html("");
		$("#span1").attr("class","");
		$("#span2").attr("class","");
		$("#span3").attr("class","");
		$("#span4").attr("class","");
		
	}
	function update_pwd(){
		var old_pwd	= $("#pwd1").val();
		var new_pwd = $("#pwd2").val();
		
		if($("#span1").attr("class")== "error" ||$("#span2").attr("class")== "error"|| 
				$("#span3").attr("class")== "error"||$("#span4").attr("class") == "focus"){
			return false;
		}else{
			$.post("blog/update_pwd",{upassword:new_pwd,old_pwd:old_pwd},function(data){
				if(data == false){
					$.messager.alert("操作提示", "修改失败！","error",function(){
						  location.reload();
					  });
				}else{
					$.messager.alert("操作提示", "修改成功！","info");
				}
			
			},"json");
		}
	}
	</script>
</body>
</html>