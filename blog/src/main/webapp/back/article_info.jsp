<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>
</head>
<body>
	<span style=" margin:10px;">按文章类型查询:</span><select id="cc" class="easyui-combobox" name="dept"
		style="width: 100px;">
		<option value="1">原创</option>
		<option value="2">转载</option>
		<option value="2">翻译</option>
	</select>
	
	<span style=" margin:10px; padding-left: 30px;">按文章标签查询:</span><select id="cc1" class="easyui-combobox" name="dept"
		style="width: 100px;">
		<option value="1">java</option>
		<option value="2">oracle</option>
		<option value="3">oop</option>
	</select>
	<table id="articleList"></table>

	<div id="modifyDiv" style="width: 300px; direction: center;">
		<!-- 删除操作 -->
	</div>

	<div id="detailsDiv" style="width: 300px; padding: 10px">

		<p>
			编号：<label id="daid"></label>
		</p>
		<p>
			标题：<label id="datitle"></label>
		</p>
		<p>
			类型：<label id="dtid"></label>
		</p>
		<p>
			标签：<label id="dtagid"></label>
		</p>
		<p>
			作者：<label id="dusid"></label>
		</p>
		<p>
			创作时间：<label id="datime"></label>
		</p>
		<p>
			浏览量：<label id="daviewnum"></label>
		</p>
		<p>
			内容：
			<textarea id="dacontent" style="width: 200px;"></textarea>
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