/**
 * 个人用户信息显示页面
 */

$("#contentBox").panel({
	fit : true,
	title : " ",
	border : false,
});
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
function chgPic(obj){
	$("#pic").attr("src", window.URL.createObjectURL(obj.files[0]));
}