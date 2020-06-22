<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/ckeditor5-build-classic/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/uploadPreview.min.js"></script>
<script type="text/javascript">
var url;
var editor_shape;
var editor_yongtu;
function formatSmallTypeName(val,row){
	return row.smallType.name;
}

function formatBigTypeId(val,row){
	
}

function formatSlide(val,row){
	if (val==0) {
		return "否";
	} else if (val==1){
		return "是";
	}
}

function formatPrice(val,row){
	//return changeTwoDecimal_f(val);
	return val.toFixed(2);
}

function changeTwoDecimal_f(x) {
    var f_x = parseFloat(x);
    if (isNaN(f_x)) {
        alert('function:changeTwoDecimal->parameter error');
        return false;
    }
    var f_x = Math.round(x * 100) / 100;
    var s_x = f_x.toString();
    var pos_decimal = s_x.indexOf('.');
    if (pos_decimal < 0) {
        pos_decimal = s_x.length;
        s_x += '.';
    }
    while (s_x.length <= pos_decimal + 2) {
        s_x += '0';
    }
    return s_x;
}

function picFormat(val,row){
	return "<img width=100 height=100 src='${pageContext.request.contextPath}/"+val+"'></img>";
}

function openZycAddDialog(){
	$("#dlg").dialog("open").dialog("setTitle","添加中药材");
	 url="${pageContext.request.contextPath}/admin/zyc/save.do";
}

function openZycModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑中药材信息");
	 $("#publishTime").datebox("setValue",row.publishTime);
	 
	 $("#bigTypeId").combobox("setValue",row.smallType.bigType.id);
	 
	 $('#smallTypeId').combobox('reload', '${pageContext.request.contextPath}/admin/smallType/comboList.do?bigTypeId='+row.smallType.bigType.id);
	 $("#smallTypeId").combobox("setValue",row.smallType.id);
	 
	 editor_shape.setData(row.shape);
	 editor_yongtu.setData(row.yongtu);
	 
	 $("#ImgPr").attr("src","${pageContext.request.contextPath}/"+row.pic);
	 $("#fm").form("load",row);
	 
	 url="${pageContext.request.contextPath}/admin/zyc/save.do?id="+row.id;
}

function saveZyc(){
	$("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			var result=eval('('+result+')');
			if(result.success){
				$.messager.alert("系统提示","保存成功！");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("系统提示","保存失败！");
				return;
			}
		}
	 });
}

function deleteZyc(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length==0){
		 $.messager.alert("系统提示","请选择要删除的数据！");
		 return;
	 }
	 var strIds=[];
	 for(var i=0;i<selectedRows.length;i++){
		 strIds.push(selectedRows[i].id);
	 }
	 var ids=strIds.join(",");
	 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/admin/zyc/delete.do",{ids:ids},function(result){
				if(result.success){
					 $.messager.alert("系统提示","数据已成功删除！");
					 $("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","删除失败");
					$("#dg").datagrid("reload");
				}
			},"json");
		} 
	 });
}

function closeZycDialog(){
	$("#dlg").dialog("close");
	 resetValue();
}

function resetValue(){
	$("#name").val("");
	$("#bieming").val("");
	$("#press").val("");
	$("#xueming").val("");
	$("#keshu").val("");
	$("#bigTypeId").combobox("setValue","");
	$("#smallTypeId").combobox("setValue","");
	$("#publishTime").datebox("setValue","");
	$("#price").numberbox("setValue","");

	$("#stock").numberbox("setValue","");
	$("#slide").combobox("setValue","0");
	editor_yongtu.setData("");
	editor_shape.setData("");
	
	$("#pP").val("");
	$("#ImgPr").attr("src","");
}

function searchZyc(){
	$("#dg").datagrid("load",{
		"name":$("#s_zycName").val(),
		"bieming":$("#s_bieming").val(),
		"xueming":$("#s_xueming").val(),
		"press":$("#s_press").val(),
		"slide":$("#s_slide").combobox("getValue")
	})
}

$(function(){
	$("#pP").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
});

</script>
</head>
<body>
	<table id="dg" title="中药材管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/admin/zyc/list.do" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center">编号</th>
	 		<th field="pic" width="120" align="center" formatter="picFormat">中药材</th>
	 		<th field="name" width="100" align="center">药材名</th>
	 		<th field="bieming" width="100" align="center">别名</th>
	 		<th field="xueming" width="100" align="center">学名</th>
	 		<th field="price" width="50" align="center" formatter="formatPrice">价格</th>
	 		<th field="press" width="100" align="center">产地</th>
	 		<th field="publishTime" width="100" align="center">上架时间</th>
	 		<th field="keshu" width="100" align="center">备注</th>

	 		<th field="stock" width="100" align="center">库存</th>
	 		<th field="smallType.name" width="100" align="center" formatter="formatSmallTypeName">所属中药材小类名称</th>
	 		<th field="shape" width="100" align="center" formatter="formatBigTypeId" hidden="true">中药材形态</th>
	 		<th field="yongtu" width="100" align="center" hidden="true">中药材描述</th>
	 		<th field="smallType.id" width="100" align="center" hidden="true">所属中药材小类ID</th>
	 		<th field="slide" width="100" align="center" formatter="formatSlide">是否轮播</th>
	 	</tr>
	 </thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openZycAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openZycModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteZyc()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;药材名：&nbsp;<input type="text" id="s_zycName" size="20" onkeydown="if(event.keyCode==13) searchZyc()"/>
			&nbsp;别名：&nbsp;<input type="text" id="s_bieming" size="20" onkeydown="if(event.keyCode==13) searchZyc()"/>
			&nbsp;xueming：&nbsp;<input type="text" id="s_xueming" size="20" onkeydown="if(event.keyCode==13) searchZyc()"/>
			&nbsp;产地：&nbsp;<input type="text" id="s_press" size="20" onkeydown="if(event.keyCode==13) searchZyc()"/>
			&nbsp;轮播：&nbsp;<select id="s_slide" class="easyui-combobox" style="width:100px;">   
							    <option value="">请选择...</option>   
							    <option value="0">否</option>   
							    <option value="1">是</option>   
							</select>
			<a href="javascript:searchZyc()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 900px;height:500px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post" enctype="multipart/form-data">
	 		<table cellspacing="8px">
	 			<tr style="height: 40px;">
		  			<td>中药材图片 ：</td>
		  			<td colspan="2"><input type="file" id="pP" name="file"></input></td>
					<td>图片预览：</td>
					<td><div style=" width:100px; height:120px;"><img id="ImgPr" width="120" height="120"/></div></td>
		  		</tr>
	 			<tr>
	 				<td style="width: 80px;">药材名：</td>
	 				<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td style="width: 80px;">别名：</td>
	 				<td><input type="text" id="bieming" name="bieming" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>学名：</td>
	 				<td><input type="text" id="xueming" name="xueming" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>价格：</td>
	 				<td><input type="text" id="price" name="price" class="easyui-numberbox" data-options="min:0,precision:2" style="width: 305px"></input>  </td>
	 			</tr>
	 			<tr>
	 				<td>产地：</td>
					<td>
						<select id="press" class="easyui-combobox" name="press" style="width:305px;">
							<option value="安徽">安徽</option>
							<option value="澳门">澳门</option>
							<option value="北京">北京</option>
							<option value="重庆">重庆</option>
							<option value="福建">福建</option>
							<option value="甘肃">甘肃</option>
							<option value="广东">广东</option>
							<option value="广西">广西</option>
							<option value="贵州">贵州</option>
							<option value="海南">海南</option>
							<option value="河北">河北</option>
							<option value="河南">河南</option>
							<option value="黑龙江">黑龙江</option>
							<option value="湖北">湖北</option>
							<option value="湖南">湖南</option>
							<option value="吉林">吉林</option>
							<option value="江苏">江苏</option>
							<option value="江西">江西</option>
							<option value="辽宁">辽宁</option>
							<option value="内蒙古">内蒙古</option>
							<option value="宁夏">宁夏</option>
							<option value="青海">青海</option>
							<option value="山东">山东</option>
							<option value="山西">山西</option>
							<option value="陕西">陕西</option>
							<option value="上海">上海</option>
							<option value="四川">四川</option>
							<option value="台湾">台湾</option>
							<option value="天津">天津</option>
							<option value="西藏">西藏</option>
							<option value="香港">香港</option>
							<option value="新疆">新疆</option>
							<option value="云南">云南</option>
							<option value="浙江">浙江</option>
						</select>
					</td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>上架时间：</td>
	 				<td><input id="publishTime" name="publishTime" type= "text" class= "easyui-datebox" required ="required" style="width: 300px"> </input></td>
	 			</tr>
	 			<tr>
	 				<td>备注：</td>
	 				<td><input type="text" id="keshu" name="keshu" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>所属大类：</td>
	 				<td>
	 					<input id="bigTypeId" class="easyui-combobox" style="width: 305px" 
    						data-options="valueField:'id',
			    						textField:'name',
			    						editable:false,
			    						url:'${pageContext.request.contextPath}/admin/bigType/comboList.do',
			    						onSelect:function(rec){
						  					var url='${pageContext.request.contextPath}/admin/smallType/comboList.do?bigTypeId='+rec.id;
						  					$('#smallTypeId').combobox('reload', url);
						  					$('#smallTypeId').combobox('setValue','');
						  				}" required="true"/> 
			    	</td>
	 			</tr>
	 			<tr>
	 				<td>所属小类：</td>
	 				<td><input id="smallTypeId" class="easyui-combobox" name="smallType.id" style="width: 305px" 
    						data-options="valueField:'id',
			    						textField:'name',
			    						editable:false,
			    						" required="true"/>
			    	</td>
			    	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>是否轮播：</td>
	 				<td>
	 					<select id="slide" class="easyui-combobox" name="slide" style="width:305px;">   
						    <option value="0">否</option>   
						    <option value="1">是</option>   
						</select>  
					</td>
	 			</tr>

	 			<tr>
	 				<td>库存：</td>
	 				<td><input type="text" id="stock" name="stock" class="easyui-numberbox" data-options="min:0,precision:0" required="true" style="width: 300px"></input></td>
	 			</tr>
	 			<tr>
	 				<td valign="top">形态：</td>
	 				<td colspan="4">
	 					<textarea name="shape" id="editor_shape">
					        <p>请填写形态...</p>
					    </textarea>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td valign="top">功效：</td>
	 				<td colspan="4">
	 					<textarea name="yongtu" id="editor_yongtu" >
					        <p>请填写功效...</p>
					    </textarea>
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveZyc()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeZycDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
	<script>
	ClassicEditor
	.create( document.querySelector( '#editor_yongtu' ),{height : 200, width : 500 } )
	.then( 
		editor1 => {
			editor_yongtu=editor1
        //console.log( 'Editor was initialized', editor1 )
    });
	ClassicEditor
	.create( document.querySelector( '#editor_shape' ) )
	.then( 
		editor2 => {
			editor_shape=editor2
        //console.log( 'Editor was initialized', editor1 )
    });
    </script>
</body>
</html>