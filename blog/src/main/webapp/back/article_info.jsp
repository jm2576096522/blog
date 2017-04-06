<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章列表</title>
</head>
<body>
	<span style=" text-align:center;">按文章类型查询:</span><select id="cc" class="easyui-combobox" name="dept"
		style="width: 100px;">
		<option value="1">原创</option>
		<option value="2">转载</option>
		<option value="2">翻译</option>
	</select>
	
	<span style="text-align:center; padding-left: 30px;">按文章标签查询:</span><select id="cc1" class="easyui-combobox" name="dept"
		style="width: 100px;">
		<option value="1">java</option>
		<option value="2">oracle</option>
		<option value="3">oop</option>
	</select>
	<table id="articleList"></table>

	<div id="modifyArticle" style="width: 300px; direction: center;">
		<!-- 删除操作 -->
	</div>

	<div id="detailsArticle" style="width: 300px; padding: 10px">

		<p>
			编号：<label id="Aaid"></label>
		</p>
		<p>
			标题：<label id="Atitle"></label>
		</p>
		<p>
			类型：<label id="Atid"></label>
		</p>
		<p>
			标签：<label id="Atagid"></label>
		</p>
		<p>
			作者：<label id="Ausid"></label>
		</p>
		<p>
			创作时间：<label id="Aatime"></label>
		</p>
		<p>
			浏览量：<label id="Aaviewnum"></label>
		</p>
		<p>
			内容：
			<textarea id="Aacontent" style="width: 200px;"></textarea>
		</p>
		<p>
			图片：<img src="images/not_pic.jpg" id="pic" width="100" height="100"
				align="top">
		</p>
		<p>
			<a class="closeBtn" href="javascript:void(0)">关闭</a>
		</p>
	</div>
	<script type="text/javascript" src="js/article_info.js"></script>
</body>
</html>