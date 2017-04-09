<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="${deployName}">
<title>博客主页面</title>

<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/sliders.js"></script>


</head>
<body>
	<header class="blog-header">
		<div class="centered">
			<img width="200" src="images/plot2.png" alt="Amaze UI Logo" />
		</div>
	</header>
	<hr>
	<nav class="blog-nav">
		<ul class="nav_left">
			<li class="am-active"><a href="homePage.jsp" style="color: #10D07A;">首页</a></li>
			<li><a href="">博客专栏</a></li>
			<li><a href="#">博客专家</a></li>
			<li><a href="#">热度话题</a></li>
			<li><a onclick="check_login()">我的博客</a></li>
		</ul>
		<ul class="nav_right">
			<li><a href="register.jsp"> 注册 </li>
			<li>|</li>
			<li><a href="login.jsp"> 登录 </li>
			
		</ul>
	</nav>
	<hr>
	<article>
		<div class="l_box f_l">
			<div class="banner">
				<div id="slide-holder">
					<div id="slide-runner">
						<a href="/" target="_blank"><img id="slide-img-1" src="images/a1.jpg" alt="" /></a> 
						<a href="/" target="_blank"><img id="slide-img-2" src="images/a2.jpg" alt="" /></a> 
						<a href="/" target="_blank"><img id="slide-img-3" src="images/a3.jpg" alt="" /></a> 
						<a href="/" target="_blank"><img id="slide-img-4" src="images/a4.jpg" alt="" /></a>
						<div id="slide-controls">
							<p id="slide-client" class="text">
								<strong></strong><span></span>
							</p>
							<p id="slide-desc" class="text"></p>
							<p id="slide-nav"></p>
						</div>
					</div>
				</div>
				<script>
					if (!window.slider) {
						var slider = {};
					}
					slider.data = [ {
						"id" : "slide-img-1", // 与slide-runner中的img标签id对应
						"client" : "标题1",
						"desc" : "这里修改描述 这里修改描述 这里修改描述" //这里修改描述
					}, {
						"id" : "slide-img-2",
						"client" : "标题2",
						"desc" : "add your description here"
					}, {
						"id" : "slide-img-3",
						"client" : "标题3",
						"desc" : "add your description here"
					}, {
						"id" : "slide-img-4",
						"client" : "标题4",
						"desc" : "add your description here"
					} ];
				</script>
			</div>
			<!-- banner代码 结束 -->
			<div class="topnews" >
				<h2>
					<span><a href="/" target="_blank">栏目标题</a><a href="/"
						target="_blank">栏目标题</a><a href="/" target="_blank">栏目标题</a></span><b>文章</b>推荐
				</h2>
				<div id = "content" class="content">
			
				 </div>
			</div>
		</div>
		<div class="r_box f_r">
			<div class="tit01">
				<h3>关注我 :
					<input type="text" id="user_usid" style="border:none;">
				</h3>
				
				<div class="gzwm">
					<ul>
						<li><a class="xlwb" href="#" target="_blank">新浪微博</a></li>
						<li><a class="txwb" href="#" target="_blank">腾讯微博</a></li>
						<li><a class="rss" href="portal.php?mod=rss" target="_blank">RSS</a></li>
						<li><a class="wx" href="mailto:admin@admin.com">邮箱</a></li>
					</ul>
				</div>
			</div>
			<!--tit01 end-->
			<div class="ad300x100">
				<img src="images/ad300x100.jpg">
			</div>
			<div class="moreSelect" id="lp_right_select">
				<script>
					window.onload = function() {
						var oLi = document.getElementById("tab").getElementsByTagName("li");
						var oUl = document.getElementById("ms-main").getElementsByTagName("div");
						for (var i = 0; i < oLi.length; i++) {
							oLi[i].index = i;
							oLi[i].onmouseover = function() {
								for (var n = 0; n < oLi.length; n++)
									oLi[n].className = "";
								this.className = "cur";
								for (var n = 0; n < oUl.length; n++)
									oUl[n].style.display = "none";
								oUl[this.index].style.display = "block"
							}
						}
					}
				</script>
				<div class="ms-top">
					<ul class="hd" id="tab">
						<li class="cur"><a href="/">点击排行</a></li>
						<li><a href="/">最新文章</a></li>
						<li><a href="/">站长推荐</a></li>
					</ul>
				</div>
				<div class="ms-main" id="ms-main">
					<div style="display: block;" class="bd bd-news">
						<ul>
							<li><a href="/" target="_blank">住在手机里的朋友</a></li>
							<li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></li>
							<li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a></li>
							<li><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></li>
							<li><a href="/" target="_blank">你面对的是生活而不是手机</a></li>
							<li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
						</ul>
					</div>
					<div class="bd bd-news">
						<ul>
							<li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a></li>
							<li><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></li>
							<li><a href="/" target="_blank">住在手机里的朋友</a></li>
							<li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></li>
							<li><a href="/" target="_blank">你面对的是生活而不是手机</a></li>
							<li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
						</ul>
					</div>
					<div class="bd bd-news">
						<ul>
							<li><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></li>
							<li><a href="/" target="_blank">你面对的是生活而不是手机</a></li>
							<li><a href="/" target="_blank">住在手机里的朋友</a></li>
							<li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
							<li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></li>
							<li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a></li>
						</ul>
					</div>
				</div>
				<!--ms-main end -->
			</div>
			<!--切换卡 moreSelect end -->

			<div class="cloud">
				<h3>标签云</h3>
				<ul>
					<li><a href="/">个人博客</a></li>
					<li><a href="/">web开发</a></li>
					<li><a href="/">前端设计</a></li>
					<li><a href="/">Html</a></li>
					<li><a href="/">CSS3</a></li>
					<li><a href="/">Html5+css3</a></li>
					<li><a href="/">百度</a></li>
					<li><a href="/">Javasript</a></li>
					<li><a href="/">web开发</a></li>
					<li><a href="/">前端设计</a></li>
					<li><a href="/">Html</a></li>
					<li><a href="/">CSS3</a></li>
					<li><a href="/">Html5+css3</a></li>
					<li><a href="/">百度</a></li>
				</ul>
			</div>
			<div class="tuwen">
				<h3>图文推荐</h3>
				<ul>
					<li><a href="/"><img src="images/01.jpg"><b>住在手机里的朋友</b></a>
						<p>
							<span class="tulanmu"><a href="/">手机配件</a></span><span
								class="tutime">2015-02-15</span>
						</p></li>
					<li><a href="/"><img src="images/02.jpg"><b>教你怎样用欠费手机拨打电话</b></a>
						<p>
							<span class="tulanmu"><a href="/">手机配件</a></span><span
								class="tutime">2015-02-15</span>
						</p></li>
					<li><a href="/" title="手机的16个惊人小秘密，据说99.999%的人都不知"><img
							src="images/03.jpg"><b>手机的16个惊人小秘密，据说...</b></a>
						<p>
							<span class="tulanmu"><a href="/">手机配件</a></span><span
								class="tutime">2015-02-15</span>
						</p></li>
					<li><a href="/"><img src="images/06.jpg"><b>住在手机里的朋友</b></a>
						<p>
							<span class="tulanmu"><a href="/">手机配件</a></span><span
								class="tutime">2015-02-15</span>
						</p></li>
					<li><a href="/"><img src="images/04.jpg"><b>教你怎样用欠费手机拨打电话</b></a>
						<p>
							<span class="tulanmu"><a href="/">手机配件</a></span><span
								class="tutime">2015-02-15</span>
						</p></li>
				</ul>
			</div>
			<div class="ad">
				<img src="images/03.jpg">
			</div>
			<div class="links">
				<h3>
					<span>[<a href="/">申请友情链接</a>]
					</span>友情链接
				</h3>
				<ul>
					<li><a href="/">杨青个人博客</a></li>
					<li><a href="/">web开发</a></li>
					<li><a href="/">前端设计</a></li>
					<li><a href="/">Html</a></li>
					<li><a href="/">CSS3</a></li>
					<li><a href="/">Html5+css3</a></li>
					<li><a href="/">百度</a></li>
				</ul>
			</div>
		</div>
		<!--r_box end -->
	</article>
	<footer>
		<p class="ft-copyright">© 2015 AllMobilize, Inc. Licensed under MIT license. Made with love By LWXYFER1</p>
		<div id="tbox">
			<a id="togbook" href="/"></a> <a id="gotop" href="javascript:void(0)"></a>
		</div>
	</footer>
	
	<script type="text/javascript">
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
			location.href="homePage.jsp";
		}
	}
</script>
</body>

</html>