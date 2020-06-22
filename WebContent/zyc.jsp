<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function addShoppingCart(zycId){
	if('${currentUser.userName}'==''){
		alert("请先登录，然后购物！");
	}else{
		$.post("${pageContext.request.contextPath}/shopping/zycToCart.do",{zycId:zycId},
			function(result){
				var result=eval('('+result+')');
				if(result.success){
					alert("已成功加入购物车！");
					location.reload();
				}else{
					alert(result.errorInfo);
				}
			}
		);
	}
}

function goBuy(zycId){
	if('${currentUser.userName}'==''){
		alert("请先登录，然后购物！");
	}else{
		window.location.href="${pageContext.request.contextPath}/shopping/zycToCartAndGoBuy.do?zycId="+zycId;
	}
}
</script>
</head>
<body>
<div class="row">
	<div class="col-md-4">
		<img src="${pageContext.request.contextPath}/${zyc.pic}" alt="${zyc.pic}" class="img-thumbnail img-detail">
	</div>
	<div class="col-md-6">
		<div class="row">
			<h2>${zyc.name }</h2>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-6 message">别名：${zyc.bieming }</div>
			<div class="col-md-6 message">学名：${zyc.xueming }</div>
			<div class="col-md-6 message">产地：${zyc.press }</div>
			<div class="col-md-6 message">上架时间：<fmt:formatDate pattern="yyyy-MM" value="${zyc.publishTime }" /></div>
			<div class="col-md-6 message">备注：${zyc.keshu }</div>
			<div class="col-md-6 message">库存：${zyc.stock }</div>
			<div class="col-md-6 message">价格：<span class="price">￥${zyc.price }</span></div>
		</div>
		<hr>
		<div class="row">
			  <button type="button" class="btn btn-danger btn-lg glyphicon glyphicon-yen" onclick="goBuy(${zyc.id })">购买</button>
			  <button type="button" class="btn btn-warning btn-lg glyphicon glyphicon-shopping-cart" onclick="addShoppingCart(${zyc.id })">放入购物车</button>
		</div>
	</div>
	<div class="col-md-2">
	
	</div>
</div>
<div class="row">
	<div class="page-header">
	  <h2>功效</h2>
	</div>
	<div style="padding: 0 20px 0 20px;">
		${zyc.yongtu }
	</div>
	<div class="page-header">
	  <h2>形态</h2>
	</div>
	<div style="padding: 0 20px 0 20px;">
		${zyc.shape }
	</div>
</div>
</body>
</html>