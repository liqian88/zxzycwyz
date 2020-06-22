<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<!-- 轮播、热门中药材 ，图片轮播组件的名称为carousel-->
<!-- bootstrap的珊格，row就是一行 -->
<div class="row">
<!-- col-md-8是这行中一个块占8份 -->
  <div class="col-md-8 my-col-left">
  <!--触发轮播图片，声明式（data-ride 属性：取值 carousel，并且将其定义在 carousel上）  -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	 <!--第一步：设计轮播图片的容器(carousel-indicators)-->
	  <ol class="carousel-indicators">
	  <!-- 循环轮播图片 -->
	  <!-- varStatus是jstl循环标签的一个属性，varStatus属性。varStatus=“status”,
	  事实上定义了一个status名的对象作为varStatus的绑定值。
	  该绑定值也就是status封装了当前遍历的状态，
	  可以从该对象上查看是遍历到了第几个元素：${status.count} -->
		  <c:forEach items="${slideZycList}" var="zyc" varStatus="status">
		  <!--设计轮播图片计数,如果status.index==0，从这个位置开始进行图片轮播，因此需要触发标志class="active"-->
		  <!-- 如果非status.index==0，继续从当前位置轮播  -->
		  	<c:choose>	  	
	  			<c:when test="${status.index==0}"> 	
	  			<!-- data-target指事件的目标 -->		
	  				<li data-target="#carousel-example-generic" data-slide-to="${status.index}" class="active"></li>
	  			</c:when>
	  			
	  			<c:otherwise>
	  				<li data-target="#carousel-example-generic" data-slide-to="${status.index}"></li>
	  			</c:otherwise>
	  		</c:choose>
		  </c:forEach>
	  </ol>
	  
	  
	  
	  <!-- Wrapper for slides -->
	 <!--设计轮播图片播放区,使用 carousel-inner 样式来控制--> 
	  <div class="carousel-inner" role="listbox">
	  <!-- 以下是各张的图片的详细编辑，首张图片的class值必须为item active，余下的皆为item-->
	  	<c:forEach items="${slideZycList}" var="zyc" varStatus="status">
	  		<c:choose>
	  			<c:when test="${status.index==0}">
	  				<div class="item active">
	  				  <a href="${pageContext.request.contextPath}/zyc/${zyc.id}.html">
	  				  	<img src="${pageContext.request.contextPath}/${zyc.pic}" alt="${zyc.name }">
	  				  </a>
	  				  <!-- div class="carousel-caption"在div class="item"可以给图片添加标题和说明文字-->
				      <div class="carousel-caption">
				        	<a href="${pageContext.request.contextPath}/zyc/${zyc.id}.html">${zyc.name }</a>
				      </div>
				    </div>
	  			</c:when>
	  			<c:otherwise>
	  				<div class="item">
				      <a href="${pageContext.request.contextPath}/zyc/${zyc.id}.html">
	  				  	<img src="${pageContext.request.contextPath}/${zyc.pic}" alt="${zyc.name}">
	  				  </a>
				      <div class="carousel-caption">
				        	<a href="${pageContext.request.contextPath}/zyc/${zyc.id}.html">${zyc.name}</a>
				      </div>
				    </div>
	  			</c:otherwise>
	  		</c:choose>
	  	</c:forEach>
	  </div>
	  
	  
	  	
	  <!-- Controls -->
	  <!-- data-slide属性中，"prev"或"next"相对于其当前位置改变幻灯片位置。 -->
	  <!--"span class="glyphicon glyphicon-chevron-left"为左箭头  -->
	  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <!-- sr-only 代表元素只在屏幕阅读器中显示 -->
	    <span class="sr-only">Previous</span>
	  </a>
	  <!-- span class="glyphicon glyphicon-chevron-right"为右箭头 -->
	  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
  </div>
  
  
  
  <!-- 整个图像轮播在页面左边显示 ，热门中药材排行榜在左边显示，而且一块占4份-->
  <div class="col-md-4 my-col-right">
   <!--面板（Panels） -->
  	<div class="panel panel-default">
	  <div class="panel-heading">
	  <!--  带有 title 的面板标题 -->
	    <h3 class="panel-title">畅销中药材</h3>
	  </div>
	  <!-- <div class="panel-body"> -->
	    <ul class="list-group">
			<c:forEach items="${hotZycList}" var="zyc">
				<li class="list-group-item">
				<!-- badge 出现在按钮、图标旁的数字或状态标记 -->
					<span class="badge">${zyc.click}</span>
					<a href="${pageContext.request.contextPath}/zyc/${zyc.id}.html">${zyc.name }</a>
				</li>
			</c:forEach>
		</ul>
	  <!-- </div> -->
	</div>
  </div>
</div>



<!-- 循环大类，显示最新中药材 -->
<div class="row">
	<div class="panel panel-default">
		<c:forEach items="${bigTypeList}" var="bigType">
			<div class="panel-heading">
			    <h3 class="panel-title">
			    <a href="${pageContext.request.contextPath}/bigType/${bigType.id }.html">${bigType.name }</a>
			    <c:forEach items="${bigType.smallTypeList }" var="smallType">
			    	<a href="${pageContext.request.contextPath}/smallType/${smallType.id }.html"><span class="label label-default pull-right">${smallType.name }</span></a>
			    </c:forEach>
			    </h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${bigType.zycList }" var="zyc">
					<div class="col-md-2">
						<%-- <a href="#" class="thumbnail">
					      <img src="${pageContext.request.contextPath}/${zyc.pic }" alt="${zyc.name }">
					    </a> --%>
					    <!-- thumbnail在美工用来具体表现布局方式表达,大致相当亦为效果图及缩略图 -->
					    <div class="thumbnail">
					      <a href="${pageContext.request.contextPath}/zyc/${zyc.id}.html"><img src="${pageContext.request.contextPath}/${zyc.pic }" alt="${zyc.name }"></a>
					      <!-- 指定caption位置 -->
					      <div class="caption">
					        <h5>${zyc.name }</h5>
					        <p>别名：${zyc.bieming }</p>
					      </div>
					    </div>
					</div>
				</c:forEach>
		    </div>
		</c:forEach>	  
	</div>	
</div>
</body>
</html>