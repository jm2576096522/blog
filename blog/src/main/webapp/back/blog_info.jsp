<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="${deployName}">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="newsInfo"></table>

	<div id="newDetail">
		<form action="#" method="post">
			<p>
				<label> 主题 </label> <input id="intname" />
			</p>
			<p>
				<label> 标题 </label> <input id="intitle" />
			</p>
			<p>
				<label> 作者 </label> <input id="inauthor" />
			</p>
			<p>
				<label> 摘要 </label>
				<textarea id="insummary" cols="40" rows="3"></textarea>
			</p>
			<p>
				<label> 内容 </label>
				<div id="incontent" style="width:700px; height:200px; border :1px solid gray;overflow: scroll;"></div>
			</p>
			<p>
				<label> 新闻图片 </label><br>
				<img src="" style="width:100px;height:100px" id="ipic">
			</p>
		</form>
	</div>
	<script type="text/javascript" src="js/blog_info.js"></script>
</body>
</html>