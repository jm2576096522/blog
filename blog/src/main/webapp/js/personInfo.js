/**
 * 个人用户信息显示页面
 */

$("#contentBox").panel({
	fit : true,
	title : " ",
	border : false,
});

function myformatter(date) {
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	return y + '-' + (m < 10 ? ('0' + m) : m) + '-'
	+ (d < 10 ? ('0' + d) : d);
}
function myparser(s) {
	if (!s)
		return new Date();
	var ss = (s.split('-'));
	var y = parseInt(ss[0], 10);
	var m = parseInt(ss[1], 10);
	var d = parseInt(ss[2], 10);
	if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
		return new Date(y, m - 1, d);
	} else {
		return new Date();
	}
}
//从数据库中获取值
$.get("blog/showUserInfo",function(data){
	if(data.upic){
		$("#upic").attr("src",data.upic);
		$("#loginPic").attr("src",data.upic);
	}else{
		$("#upic").attr("scr","images/not_pic.jpg");
	}
	if(data.usex == '男'){
		$("#usex1")[0].checked = true;
	}else{
		$("#usex2")[0].checked = true;
	}
	$("#uname").val(data.uname);
	$("#loginUname").val(data.uname);
	$("#ubirthday").datebox('setValue',data.ubirthday);

	$("#uphone").val(data.uphone);
	$("#uprofession").val(data.uprofession);
	$("#upersondesc").val(data.upersondesc);
	var strs = new Array();
	strs = data.uaddress.split("-");
	$("#selProvince_op").html(strs[0]);
	$("#selCity_op").html(strs[1])
	$("#selDistrict_op").html(strs[2]);
	
});
//焦点事件
$("#selProvince").focus(function(){
	$("#selProvince_op").html("--请选择省份--");
	$("#selCity_op").html("--请选择城市--");
	$("#selDistrict_op").html("--请选择区/县--");
});
$("#selCity").focus(function(){
	$("#selProvince_op").html("--请选择省份--");
	$("#selCity_op").html("--请选择城市--");
	$("#selDistrict_op").html("--请选择区/县--");
});
$("#selDistrict").focus(function(){
	$("#selProvince_op").html("--请选择省份--");
	$("#selCity_op").html("--请选择城市--");
	$("#selDistrict_op").html("--请选择区/县--");
});


//更改操作
function updata_userInfo(){
	var uname = $("#uname").val();
	var ubirthday = $('#ubirthday').datebox('getValue');
	var uphone = $("#uphone").val();
	var uprofession = $("#uprofession").val();
	var upersondesc = $("#upersondesc").val();
	getUddress();
	$.post("blog/update_userInfo",{uname:uname,ubirthday:ubirthday,uphone:uphone,uprofession:uprofession,upersondesc:upersondesc,usex:usex,uaddress:uaddress},
			function(data){
		  $.messager.alert("操作提示", "操作成功！","info",function(){
			  location.reload();
		  });
		/*jQuery.messager.show({   
			title:'温馨提示:',   
			msg:'保存成功！',   
			timeout:3000,   
			showType:'slide',
			width:300,
			height:200,
			});*/
		/*location.reload();*/
	},"json");

}

var uaddress ;	//获得地址 变量
var usex;		//获得性别 变量
$(function () {
	$.each(province, function (k, p) { 
		var option = "<option value='" + p.ProID + "'>" + p.ProName + "</option>";
		$("#selProvince").append(option);
	});
	$("#selProvince").change(function () {
		var selValue = $(this).val(); 
		$("#selCity option:gt(0)").remove();
		$.each(city, function (k, p) { 
			if (p.ProID == selValue) {
				var option = "<option value='" + p.CityID + "'>" + p.CityName + "</option>";
				$("#selCity").append(option);
			}
		});
	});
	$("#selCity").change(function () {
		var selValue = $(this).val();
		$("#selDistrict option:gt(0)").remove(); 

		$.each(District, function (k, p) {
			if (p.CityID == selValue) {
				var option = "<option value='" + p.Id + "'>" + p.DisName + "</option>";
				$("#selDistrict").append(option);
			}
		}); 
	}); 
});
function ck(){
	var clc=document.getElementsByClassName("rad1");
	console.info(clc.item(0).checked);
	clc[0].checked=true;
	usex = $("#usex1").val();
	var cl2=document.getElementsByClassName("rad2");
	if(cl2.item(0).checked==true){
		cl2[0].checked=false;	
	}
}
function ck2(){
	var cl2=document.getElementsByClassName("rad2");
	console.info(cl2.item(0).checked);
	cl2[0].checked=true;
	usex = $("#usex2").val();
	var clc=document.getElementsByClassName("rad1");
	if(clc.item(0).checked==true){
		clc[0].checked=false;	
	}
}
function chgPic(obj){
	$("#upic").attr("src", window.URL.createObjectURL(obj.files[0]));
}

function getUddress(){
	var myselect  = document.getElementById("selProvince");
	var index = myselect.selectedIndex;
	var pro;
	var city;
	var district;
	if(index == 0){
		pro = "";
	}else{
		pro = myselect.options[index].text
	}
	var myselect2  = document.getElementById("selCity");
	var index2 = myselect2.selectedIndex;
	if(index2 == 0){
		city = "";
	}else{
		city = myselect2.options[index2].text
	}
	var myselect3  = document.getElementById("selDistrict");
	var index3 = myselect3.selectedIndex;
	if(index3 == 0){
		district = "";
	}else{
		district = myselect3.options[index3].text
	}
	if(pro == "" && city =="" && district ==""){
		uddress = "";
	}else{
		uaddress = pro+'-'+city+'-'+district; 
	}

}
