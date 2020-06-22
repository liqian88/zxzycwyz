<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>zyc</title>
<!-- 在JSP页面文件里面动态引用项目的根目录 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
<!--  时间插件My97DatePickerBeta-->
<script src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript">
	function logout(){
		//$.post()是jquery一个简单的 POST 请求功能以取代复杂 $.ajax .
		//jQuery.post( url, [data], [callback], [type] ) ：
		//url (String) : 发送请求的URL地址.
        //data (Map) : (可选) 要发送给服务器的数据，以 Key/value 的键值对形式表示。
        //callback (Function) : (可选) 载入成功时回调函数(只有当Response的返回状态是success才是调用该方法)。
        //type (String) : (可选)官方的说明是：Type of data to be sent。其实应该为客户端请求的类型(JSON,XML,等等)
		$.post("${pageContext.request.contextPath}/user/logout.do",{},function(result){
			if (result.success) {
				alert("已退出登录");
				window.location.reload(true);
			} else {
				alert(result.errorInfo);
			}
		},"json");
	}
	
	function checkLogin(){
		if('${currentUser.userName}'==''){
			alert("请先登录！");
		}else{
			window.location.href="shopping_list.action";
		}
	}
	
	function checkSubmit(){
		var name=document.getElementById("s_name").value;
		if (name==""||name==null) {
			alert("请输入药材名");
			return false;
		} 
		return true;
	}
</script>
</head>
<body>
<div class="row">
<!-- 设置nav元素为导航条组件(navbar),指定导航条组件为默认主题(navbar-default) -->
	<nav class="navbar navbar-default">
		<div class="container">
		<!-- container-fluid:自适应屏幕宽度 -->
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <!-- 主要指定div元素为导航条组件包裹品牌图标及切换按钮 (navbar-header)-->
	    <div class="navbar-header">
	      <!-- 屏幕小于一定尺寸的时候，导航条会自动隐藏，变成三个“横线”的按钮显示在导航条上，点击这个导航条上的这个按钮，就可以显示出导航的菜单来。 -->
	      <!-- 设置button元素为导航条组件的切换钮 (navbar-toggle)-->
	      <!-- 折叠（Collapse） -->
	      <!-- aria-expanded=false不展开 -->
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <!-- 设置导航条组件内的品牌图标(navbar-brand) -->
	      <a class="navbar-brand" href="${pageContext.request.contextPath}/">
			<img alt="Brand" src="${pageContext.request.contextPath}/static/images/logo.jpg">
		  </a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <!-- id是bs-example-navbar-collapse-1，上面的collapsed按钮点击，会弹出这个id为bs-example-navbar-collapse-1的div，里面展示内容。 -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      	<c:forEach items="${bigTypeList }" var="bigType">
	      	<!-- 显示导航栏里的具体内容，并且可以根据相应的内容去跳转到相应的介绍页面 -->
	      		<li><a href="${pageContext.request.contextPath}/bigType/${bigType.id }.html">${bigType.name }</a></li>
	      	</c:forEach>
	      </ul>
	      <!-- 主要调整所有form都为行内元素(navbar-form),表单在左边显示 -->
	      <form class="navbar-form navbar-left" method="post" role="search" action="${pageContext.request.contextPath}/zyc/list.do">
			  <div class="form-group">
			    <input type="text" id="s_name" name="name" class="form-control" value="${s_zyc.name }" placeholder="请输入查找中药材">
			  </div>
			  <button type="submit" class="btn btn-default" onclick="return checkSubmit()">搜索</button>
		  </form>
		   <!-- 判断 currentUser不为空-->
	            <!-- 下拉菜单包括一个下拉开关按钮，需要添加类名dropdown-toggle，同时还得添加一个属性data-toggle="dropdown" -->
	      <ul class="nav navbar-nav navbar-right">
	        <c:choose>       
	        	<c:when test="${not empty currentUser }">
	        		<li class="dropdown">
	        		<!-- aria-haspopup :true表示点击的时候会出现菜单或是浮动元素； false表示没有pop-up效果 -->
	        		<!-- aria-expanded:表示展开状态。默认为undefined, 表示当前展开状态未知。其它可选值：true表示元素是展开的；false表示元素不是展开的。 -->
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">欢迎：${currentUser.userName } <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="${pageContext.request.contextPath}/shopping/buyPage.do"><i class="glyphicon glyphicon-shopping-cart"></i>&nbsp;购物车(${shoppingCart.shoppingCartItems==null?0:shoppingCart.shoppingCartItems.size() }件商品)</a></li>
			            <li><a href="${pageContext.request.contextPath}/user/userCenter.do"><i class="glyphicon glyphicon-user"></i>&nbsp;个人中心</a></li>
			            <li><a href="javascript:logout()">退出登录</a></li>
			          </ul>
			        </li>
	        	</c:when>
	        	<c:otherwise>
			        <li><a href="${pageContext.request.contextPath}/user/loginPage.do">登录</a></li>
			        <li><a href="${pageContext.request.contextPath}/user/registerPage.do">注册</a></li>
	        	</c:otherwise>
	        </c:choose>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
		</div>
	</nav>
</div>
</body>
</html>