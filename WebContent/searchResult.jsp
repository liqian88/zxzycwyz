<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果</title>
</head>
<body>
<div class="row">
  <div class="col-md-12">
	<c:forEach items="${zycList }" var="zyc">
   		<div class="media">
		  <div class="media-left">
		    <a href="#">
		      <img class="media-object" src="${pageContext.request.contextPath}/${zyc.pic}" alt="${zyc.name}">
		    </a>
		  </div>
		  <div class="media-body">
		    <h4 class="media-heading"><a href="${pageContext.request.contextPath}/zyc/${zyc.id}.html">${zyc.name }</a></h4>
		    <h5>别名：${zyc.bieming}</h5>
		    <h5>产地：${zyc.press}</h5>
		    <h5>上架时间：<fmt:formatDate pattern="yyyy-MM" value="${zyc.publishTime }" /></h5>
		    <%-- ${fn:substring(zyc.yongtu, 0, 200) } --%>
		  </div>
		</div>
   	</c:forEach>
  </div>
</div>
</body>
</html>