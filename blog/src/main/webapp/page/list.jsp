<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="../easyui/jquery.min.js" type="text/javascript"></script>
</head>
<body>
	<div class="login" id="login">

		<form name="myform" id="myform">
			<input type="hidden" name="op" id="op" value="login">
			<table>
				<tr id="pp">
					<td class="labname"><label for="username">用户名:</label></td>
					<td colspan="2"><input name="username" type="text"
						placeholder="请输入用户名" id="username" value="a" /></td>
				</tr>
				<tr id="pp2">
					<td class="labname"><label for="pwd">密码:</label></td>
					<td colspan="2"><input type="password" id="pwd"
						placeholder="请输入密码" name="pwd" value="a" /></td>
				</tr>
				<tr id="pp3">
					<td class="labname"><label for="">验证码:</label></td>
					<td><input type="text" class="yzm" name="code" id="yzm"
						placeholder="请输入验证码" /></td>
					<td><img alt="图片" id="yzm_img"></td>
				</tr>
			</table>
		</form>
		<input type="button" value="login" class="btn" id="btn">
	</div>

</body>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"../user/valicode.do",
			type:"GET",
			success:function(data){
				//alert("123");
		
				//$("yzm_img").src = XMLHttpRequest.responseText(data);
				alert(data);
			}
			
		}); 
		
		 /* $("#yzm_img").attr("src","../user/valicode.do?"+new Data());  */
	});
</script>
</html>