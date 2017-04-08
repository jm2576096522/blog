/**
 * 类别管理
 */
$(function() {  
	$("#table_content").datagrid(
			{
				url :"tag/findAll",
				fit : true,
				border : false,
				fitColumns : true,
				singleSelect : true,
				toolbar : '#tag',
				idField : 'tagid',
				columns : [ [
				             {
				            	 title : '编号',
				            	 field : 'tagid',
				            	 width : 100,
				            	 align : 'left',
				            	 hidden:true
				             },
				             {
				            	 title : '类别',
				            	 field : 'tagname',
				            	 width : 100,
				            	 align : 'center',

				             },
				             {
				            	 title : '文章',
				            	 field : 'articlenum',
				            	 width : 100,
				            	 align : 'center',

				             },
				             {
				            	 field : 'opr',
				            	 title : '操作',
				            	 width : 100,
				            	 align : 'center',
				            	 formatter : function(value, row, index) {
				            		 var oprStr = '<a style="margin-right:10px; font-size:14px;" href="javascript:void(0)" onclick="openUpdate('
				            			 + index
				            			 + ')">修改</a>'
				            			 + "|" +'<a style="margin-left:10px; font-size:14px;" href="javascript:void(0)"onclick="deleteDate('
				            			 + index
				            			 + ')">删除</a>'
				            			 + '<script>$(".removeBtn").linkbutton({iconCls: "icon-remove"});'
				            			 + '$(".modifyBtn").linkbutton({iconCls: "icon-edit"});</script>';
				            		 return oprStr;
				            	 }
				             } ] ],

			});
}); 
function openUpdate(index){
	alert(index);
}
function deleteDate(index){

}

function tag_add(){
	var newTag = $("#add_tag").val();

	if(newTag == ""){
		$.messager.alert("失败提示", "类别不能为空！","error");
	}else{
		$.post("tag/add",{tagname:newTag},function(){
			$.messager.alert("操作提示", "添加成功！","info",function(){
				  location.reload();
			  });
		
	});
}

}