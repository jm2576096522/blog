<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>用户注册</title>
<link rel="stylesheet" href="../css/register.css" /> 
<script src="../easyui/jquery.min.js" type="text/javascript"></script>
<script src="../json/CityJson.js" type="text/javascript"></script>
<script src="../json/ProJson.js" type="text/javascript"></script>
<script src="../json/DistrictJson.js" type="text/javascript"></script>
<script src="../js/register.js" type="text/javascript"></script>

</head>
<body>
	<fieldset id="top">
    	<legend><span>用户注册</span> Sign Up</legend>
        <fieldset  id="header">
        	<legend>用户信息:</legend>
            	<form action="" method="get" name="myform">
                    <ul>
                        <li>
                            <label>注册邮箱：</label>
                            <input type="email" name="txt1"  placeholder="请输入你的邮箱号" onBlur="show1(this)" onFocus="show2(this)" onSelect="this.value"/>
                            <span id="span1"></span>
                        </li>
                        <li>
                        	<label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 码：</label>
                        	<input type="password" name="pwd1"  onBlur="show5(this)"/>
                            <span id="span3"></span>
                        </li>
                         <li>
                        	<label>重复密码：</label>
                        	<input type="password" name="pwd2" onBlur="show6(this)" onFocus="show7(this)"/>
                            <span id="span4"></span>
                        </li>
                        <li>
                        	<label>用户昵称：</label>
                            <input type="text" name="txt2"  onBlur="show3(this)" onFocus="show4(this)"/>
                            <span id="span2"></span>
                        </li>
                         <li>
                        	<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 别：</label>
                        	<input type="radio" name="rad1" class="rad1" value="男" onClick="ck()"/>男
                            
                            <input type="radio" name="rad2" value="女" class="rad2" onClick="ck2()"/>女
                            <span id="span5"></span>
                        </li>
                      
                          <li>
                        	<label>住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 址 ：</label>
                        	<select id="selProvince" style="width:110px;">
      							  <option value="0">--请选择省份--</option>
    						</select>
    						<select id="selCity" style="width:110px;">
      							  <option value="0">--请选择城市--</option>
    						</select>
   							 <select id="selDistrict" style="width:110px;">
      							  <option value="0">--请选择区/县--</option>
    						</select>
                        </li>
                         <li>
                        	<label>&nbsp;&nbsp;&nbsp;E-mail：</label>
                        	<input type="text"   name="txt5" onFocus="show10(this)" onBlur="lose1(this)"/>
                            <span id="span8"></span>
                        </li>
                        <li>
                        	<label>验&nbsp; 证&nbsp;码：</label>
                        	<input type="text" name="yzm" id="yzm"/>
                        	<input type="button" id="yzmqq" value="点击获取邮箱验证码" />
                        </li>
                    
                    </ul>
                </form>    
        </fieldset>
    	<input type="submit" value="注册" name="sub" id="sub"/>
    </fieldset>
</body>

<script>
/* 发送邮箱的验证码 */
$("#yzmqq").click(function(){
	$.ajax({
		url:"yzm",
		type:"GET",
		dataType:"json",
		success:function(data){
			alert(123);
			}
		});
		
	
	});

	function show1(obj){
		var reg=/[\w\u4e00-\u9fa5]{3,10}/ig;
		var info=document.getElementById("span1");
		if(reg.test(obj.value)){
			info.innerHTML="用户名格式验证成功";	
			info.className="correct";
			}else{
				info.innerHTML="用户名格式不正确...请重新输入";	
				info.className="error";
				}
	}
	function show2(obj){
		var info=document.getElementById("span1");
		info.innerHTML="用户名必须为3~10位的数字，字母，下划线或中文组成";
		info.className="focus";	
	}
   function show3(obj){
    	var reg=/[\u4e00-\u9fa5]{2,}/ig;
        var info=document.getElementById("span2");
        if(reg.test(obj.value)){
       		info.innerHTML="验证成功"; 
            info.className="correct";
        }else{
            info.innerHTML="姓名格式错误，请重新输入";
            info.className="error"; 
        }
    } 
    function show4(obj){
		var info=document.getElementById("span2");
		info.innerHTML="姓名需有2~多位字符组成";
		info.className="focus";	
	} 
	  function show5(obj){
    	var reg=/[\w]{6,16}/ig;
        var info=document.getElementById("span3");
        if(reg.test(obj.value)){
       		info.innerHTML="密码格式正确"; 
            info.className="correct";
        }else if(obj.value==""){
			 info.innerHTML="密码不能为空";
			 info.className="error";
           
        }else{
			 info.innerHTML="密码必须由6-16位的数字，字母，下划线组成";
            info.className="error"; 
				}
    }  
	function show6(obj){
		var sw5=document.myform.pwd1.value;
		  var info=document.getElementById("span4");
		if(sw5==obj.value&&sw5!=""){
		info.innerHTML="密码格式正确"; 
            info.className="correct";
        }else{
            info.innerHTML="两次密码不一致或为空，请查证在输";
            info.className="error"; 
		
		}
	}
	function show7(obj){
		var info=document.getElementById("span4");
		info.innerHTML="两次输入的密码必须一致";
		info.className="focus";	
	} 
 	
	function show10(obj){
		var info=document.getElementById("span8");
		info.innerHTML="请填写常用电子邮件";
		info.className="focus";
		
		}
	
	
	function lose1(obj){
		var txt=document.myform.txt5.value;
		var info=document.getElementById("span8");
		
		if(txt!=""){
				info.innerHTML="正确";
				info.className="correct";
			}	
		}

		function ck(){
			var clc=document.getElementsByClassName("rad1");
			console.info(clc.item(0).checked);
			clc[0].checked=true;
			
			var cl2=document.getElementsByClassName("rad2");
				if(cl2.item(0).checked==true){
						cl2[0].checked=false;	
				}
			}
		function ck2(){
				var cl2=document.getElementsByClassName("rad2");
				cl2.item(0).checked=true;
					var clc=document.getElementsByClassName("rad1");
						if(clc[0].checked==true){
						clc[0].checked=false;	
				}
			}
	
</script>
</html>



