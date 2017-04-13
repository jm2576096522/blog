<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css">
</head>
<body>

	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">User Information</div>
		<form id="fm" method="post">
			<div class="fitem">
				<label>First Name:</label> <input name="firstname"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>Last Name:</label> <input name="lastname"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>Phone:</label> <input name="phone">
			</div>
			<div class="fitem">
				<label>Email:</label> <input name="email" class="easyui-validatebox"
					validType="email">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveUser()">Save</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
	</div>


	两个依赖关系的下拉框
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="javascript:$('#dlg').dialog('open')">Cancel</a>
	<input id="cc1" class="easyui-combobox"
		data-options="    
        valueField: 'id',    
        textField: 'text',    
        url: 'get_data1.php',    
        onSelect: function(rec){    
            var url = 'get_data2.php?id='+rec.id;    
            $('#cc2').combobox('reload', url);    
        }" />
	<input id="cc2" class="easyui-combobox"
		data-options="valueField:'id',textField:'text'" />


	<form id="fm" method="post" novalidate>
		<fieldset style="border: solid 1px #aaa; padding: 5px;">
			<legend>基本信息</legend>
			<div style="padding: 3px;">
				<table align="left" border="0" cellpadding="0" cellspacing="0"
					style="width: 480px;">
					<tr>
						<td class="td-right1-color">年 份：</td>
						<td style="width: 160px"><select class="easyui-combobox"
							name="rq" style="width: 166px;">
								<option value="2012">2012</option>
								<option value="2013">2013</option>
								<option value="2014">2014</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
						</select></td>
						<td class="td-right2-color">单位名称：</td>
						<td style="width: 160px"><input class="easyui-combobox"
							name="dwid" style="width: 166px"
							url='../Source/Public/json.ashx?action=dwmch'
							data-options="valueField:'dwid', textField:'dwmch', panelHeight:'auto'">
						</td>
					</tr>
					<tr>
						<td class="td-right1-color">模块名称：</td>
						<td style="width: 160px"><input class="easyui-combobox"
							id="mkid" style="width: 166px"
							data-options="valueField:'mkid', textField:'mkmch', panelHeight:'auto'">
						</td>
						<td class="td-right2-color">指标名称：</td>
						<td style="width: 160px"><input class="easyui-combobox"
							id="zhbid" style="width: 166px"
							data-options="valueField:'zhbid', textField:'zhbmch', panelHeight:'auto'">
						</td>
					</tr>
					<tr>
						<td class="td-right1">本年指标：</td>
						<td style="width: 160px"><input name="zhbvalue"
							style="width: 160px"></td>
						<td class="td-right2"></td>
						<td style="width: 160px"></td>
					</tr>
				</table>
			</div>
		</fieldset>

	</form>

	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>

	<script type="text/javascript">
		$(function() {
			var _mkid = $('#mkid')
					.combobox(
							{
								url : '../Source/Public/json.ashx?action=mkmch',
								editable : false,
								valueField : 'mkid',
								textField : 'mkmch',
								onSelect : function(record) {
									_zhbid
											.combobox(
													{
														disabled : false,
														url : '../Source/Public/json.ashx?action=zhbmch&&mkid='
																+ record.mkid,
														valueField : 'zhbid',
														textField : 'zhbmch'
													}).combobox('clear');
								}
							});
			var _zhbid = $('#zhbid').combobox({
				disabled : true,
				valueField : 'zhbid',
				textField : 'zhbmch'
			});
		});
	</script>
</body>
</html>