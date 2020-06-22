<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
if(session.getAttribute("currentUser")==null){
	response.sendRedirect("login.jsp");
	return;
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>万药斋后台管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.5.5.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var url;
// 打开一个标签(function openTab(text, url, iconCls)
function openTab(text, url, iconCls) {
	/**
	如果这个标题的标签存在，则选择该标签
	否则添加一个标签到标签组
	IconCls是一个样式(图标)
	*/
	if ($("#tabs").tabs("exists", text)) {
		$("#tabs").tabs("select", text);
	} else {
		/* 生成标签内容 */
		var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/admin/page/"
				+ url + "'></iframe>";
					//添加tab菜单
		$("#tabs").tabs("add", {
			title : text,
			iconCls : iconCls,
			closable : true,
			content : content
		});
	}
}
function openPasswordModifyDialog() {
	//jquery easyui 在dialog打开时给dialog中的文本框赋值(修改密码)
	$("#dlg").dialog("open").dialog("setTitle", "修改密码");
		url = "${pageContext.request.contextPath}/admin/user/modifyPassword.do?id=${currentUser.id}";
}
function modifyPassword() {
	$("#fm").form("submit", {
		//要提交的表单动作 URL
		url : url,
		//提交前触发，返回 false 来阻止提交动作。(onSubmit)
		onSubmit : function() {
			//$("#oldPassword").val();的意思是获取id为oldPassword的输入框里面的值。
			var oldPassword = $("#oldPassword").val();
			var newPassword = $("#newPassword").val();
			var newPassword2 = $("#newPassword2").val();
			//$(this).form("validate")表示成功提交表单的标志
			if (!$(this).form("validate")) {
				return false;
			}
			if (oldPassword != '${currentUser.password}') {
				$.messager.alert("系统提示", "用户原密码输入错误！");
				return false;
			}
			if (newPassword != newPassword2) {
				$.messager.alert("系统提示", "确认密码输入错误！");
				return false;
			}
			return true;
		},
		//success：提交成功之后的回调函数
		success : function(result) {
			//在JS中将JSON的字符串解析成JSON数据格式eval()
			var result = eval('(' + result + ')');
			if (result.success) {
				$.messager.alert("系统提示", "密码修改成功，下一次登录生效！");
				resetValue();
				$("#dlg").dialog("close");
			} else {
				$.messager.alert("系统提示", "密码修改失败！");
				return;
			}
		}
	});
}

function closePasswordModifyDialog() {
	//关闭弹出的修改窗口
	resetValue();
	$("#dlg").dialog("close");
}

function resetValue() {
	//设置输入域的值为“  ”
	$("#oldPassword").val("");
	$("#newPassword").val("");
	$("#newPassword2").val("");
}
function logout() {
	$.messager
			.confirm(
					"系统提示",
					"您确定要退出系统吗？",
					function(r) {
						if (r) {
							window.location.href = "${pageContext.request.contextPath}/admin/user/logout.do";
						}
					});
}
function refreshSystem(){
	/*$.post()是jquery一个简单的 POST 请求功能以取代复杂 $.ajax 
	jQuery.post( url, [data], [callback], [type] ) ：
	url (String) : 发送请求的URL地址.
	data (Map) : (可选) 要发送给服务器的数据，以 Key/value 的键值对形式表示。
	callback (Function) : (可选) 载入成功时回调函数(只有当Response的返回状态是success才是调用该方法)。
	type (String) : (可选)应该为客户端请求的类型(JSON,XML,等等)
	*/	
	$.post("${pageContext.request.contextPath}/admin/system/refreshSystem.do",{},function(result){
		if(result.success){
			$.messager.alert("系统提示","已成功刷新系统缓存！");
		}else{
			$.messager.alert("系统提示","刷新系统缓存失败！");
		}
	},"json");
}
</script>
</head>
<body class="easyui-layout">
<div region="north" style="height: 78px;">
	<table style="padding: 5px" width="100%">
		<tr>
			<td width="33%">
				<img alt="logo" src="${pageContext.request.contextPath}/static/images/logo.png">
			</td>
			<td valign="bottom" align="right">
				<table>
					<tr>
						<c:if test="${currentUser.status==2 }">
							<td><strong>管理员：</strong></td>
						</c:if>
						<c:if test="${currentUser.status==1 }">
							<td><strong>普通用户：</strong></td>
						</c:if>
						<td><font color="red"><strong>『${currentUser.userName }』</strong></font></td>

					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<div region="center">
	<div class="easyui-tabs" fit="true" border="false" id="tabs">
		<div title="首页" data-options="iconCls:'icon-home'">
			<div align="center" style="margin-top: 50px;">
				<font size="10" color="red">欢迎使用！</font>
				<!-- <img alt="" src="${pageContext.request.contextPath}/static/images/a.jpg" style="height: 100%;"> -->
			</div>
		</div>
	</div>
</div>
<div region="west" style="width: 200px" title="导航菜单" split="true">
     <!-- easyui-accordion动态生成菜单,EasyUI Accordion 折叠面板 -->
     <!-- data-options折叠面板的选项 ,必须结合JS代码才能产生效果，
              带有data-options（意思就是数据参数）属性的就取出来并解析-->
	<div class="easyui-accordion" data-options="fit:true,border:false">
		<div title="中药材管理"  data-options="selected:true,iconCls:'icon-jcsjgl'" style="padding:10px">
		   <!-- 给每一个菜单选项注册这个单击事件(openTab) -->
		   <!-- icon-star,icon-starZx图标不同 -->
			<a href="javascript:openTab('管理中药材','zycManage.jsp','icon-star')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-star'" style="width: 150px; text-align: left;">管理中药材</a>
			<a href="javascript:openTab('管理中药材大类','bigTypeManage.jsp','icon-starZx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-starZx'" style="width: 150px; text-align: left;">管理中药材大类</a>
			<a href="javascript:openTab('管理中药材小类','smallTypeManage.jsp','icon-starZx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-starZx'" style="width: 150px; text-align: left;">管理中药材小类</a>
		</div>
		<div title="用户管理" data-options="selected:true,iconCls:'icon-role'" style="padding: 10px;">
			<a href="javascript:openTab('管理用户','userManage.jsp','icon-man')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-man'" style="width: 150px; text-align: left;">管理用户</a>
		</div>
		<div title="订单管理" data-options="selected:true,iconCls:'icon-order'" style="padding: 10px;">
			<a href="javascript:openTab('管理订单','orderManage.jsp','icon-order')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px; text-align: left;">管理订单</a>
		</div>
		<div title="系统管理" data-options="selected:true,iconCls:'icon-exam'" style="padding: 10px">
			<a href="javascript:refreshSystem()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" style="width: 150px; text-align: left;">刷新系统缓存</a>
			<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px; text-align: left;">修改密码</a>
			<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px; text-align: left;">安全退出</a>
		</div>
	</div>
</div>
<div region="south" style="height: 25px;padding: 5px" align="center">
	版权所有： e-万药斋(LYJ)
</div>

<div id="dlg" class="easyui-dialog" style="width:400px;height:250px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>用户名：</td>
   			<td>
   				<input type="text" id="userName" name="userName" readonly="readonly" value="${currentUser.userName }" style="width: 200px"/>
   			</td>
   		</tr>
   		<tr>
   			<td>原密码：</td>
   			<td><input type="password" id="oldPassword" name="oldPassword" class="easyui-validatebox" required="true" style="width: 200px"/></td>
   		</tr>
   		<tr>
   			<td>新密码：</td>
   			<td><input type="password" id="newPassword" name="newPassword" class="easyui-validatebox" required="true" style="width: 200px"/></td>
   		</tr>
   		<tr>
   			<td>确认新密码：</td>
   			<td><input type="password" id="newPassword2" name="newPassword2" class="easyui-validatebox" required="true" style="width: 200px"/></td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
</body>
</html>