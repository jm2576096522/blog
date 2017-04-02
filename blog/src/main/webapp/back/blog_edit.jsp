<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="${deployName}">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table id="newsEdit"></table>
	<div id="newsModify">
		<form method="post" enctype="multipart/form-data" id="modifyForm">
			<input type="hidden" id="enid" name="nid"/>
			<p>
				<label> 主题 </label>  <select name="ntid" id="ntid"></select>
			</p>
			<p>
				<label> 标题 </label> <input id="entitle" name="ntitle"/>
			</p>
			<p>
				<label> 作者 </label> <input id="enauthor" name="nauthor"/>
			</p>
			<p>
				<label> 摘要 </label>
				<textarea id="ensummary" cols="40" rows="3" name="nsummary"></textarea>
			</p>
			<p>
				<label> 内容 </label>
				<textarea id="encontent" style="width:700px; height:100px;"></textarea>
				<input type="hidden" id="ncontent"  name="ncontent"/>
			</p>
			<p>
				<label> 上传图片 </label> <input name="file" type="file" onchange="chgPic(this)"/><br>
				<img src="images/not_pic.jpg" style="width:100px;height:100px" id="epic">
			</p>
			<input type="button" value="修改" id="modifyBtn"/>
		</form>
	</div>
	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" src="js/blog_edit.js"></script>
</body>
</html>