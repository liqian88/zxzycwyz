<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        $(function(){

            $(".add").click(function(){
                var t=$(this).parent().find('input[class=text_box]');
                t.val(parseInt(t.val())+1);
                var zyc_id=$(this).parent().find('input[id=zyc_id]').val();
                var price=$("#price_"+zyc_id).html();
                $("#zycItem_total_"+zyc_id).html(price*t.val());

                refreshSession(zyc_id,t.val());
                setTotal();
            });

            $(".min").click(function(){
                var t=$(this).parent().find('input[class=text_box]');
                t.val(parseInt(t.val())-1);
                if(parseInt(t.val())<0){
                    t.val(0);
                }
                var zyc_id=$(this).parent().find('input[id=zyc_id]').val();
                var price=$("#price_"+zyc_id).html();
                $("#zycItem_total_"+zyc_id).html(price*t.val());

                refreshSession(zyc_id,t.val());
                setTotal();
            });

            $(".text_box").blur(function(){
                var t=$(this).parent().find('input[class=text_box]');
                if(parseInt(t.val())<0){
                    t.val(0);
                }
                var zyc_id=$(this).parent().find('input[id=zyc_id]').val();
                var price=$("#price_"+zyc_id).html();
                $("#zycItem_total_"+zyc_id).html(price*t.val());

                refreshSession(zyc_id,t.val());
                setTotal();
            });

            function setTotal(){
                var s=0;
                $(".zycTr").each(function(){
                    var n=$(this).find('input[class=text_box]').val();
                    var price=$(this).find('label[class=price_]').html();
                    s+=n*price;
                });
                $("#zyc_total").html(s);
            }

            function refreshSession(zycId,count){
                $.post("${pageContext.request.contextPath}/shopping/updateShoppingCartItem.do",{zycId:zycId,count:count},
                    function(result){
                        var result=eval('('+result+')');
                        if(result.success){

                        }else{
                            alert("刷新Session失败");
                        }
                    }
                );
            }

            setTotal();

        });

        function removeShopping(zycId){
            if(confirm("您确定要删除这个商品吗？")){
                window.location.href="${pageContext.request.contextPath}/shopping/removeShoppingCartItem.do?zycId="+zycId;
            }
        }
    </script>
</head>
<body>
<div class="row">
    <div class="panel panel-default">
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/">首页</a></li>
            <li><a>购物车</a></li>
        </ol>
        <div class="panel-body">
            <form action="${pageContext.request.contextPath}/order/save.do" method="post">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>商品名称</th>
                        <th>商品单价</th>
                        <th>金额</th>
                        <th>购买数量</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${shoppingCart.shoppingCartItems }" var="shoppingCartItem">
                        <tr class="zycTr">
                            <td class="thumb">
                                <img class="imgs" src="${pageContext.request.contextPath}/${shoppingCartItem.zyc.pic }" /><a href="zyc_showProduct.action?zycId=${shoppingCartItem.zyc.id }" target="_blank">${shoppingCartItem.zyc.name}</a>
                            </td>
                            <td class="price" width="120" style="text-align: center;vertical-align: middle;">
                                <span>￥<label class="price_" id="price_${shoppingCartItem.zyc.id }">${shoppingCartItem.zyc.price }</label></span>
                            </td>
                            <td class="price" width="120" style="text-align: center;vertical-align: middle;">
                                <span>￥<label id="zycItem_total_${shoppingCartItem.zyc.id }">${shoppingCartItem.zyc.price*shoppingCartItem.count }</label></span>
                            </td>
                            <td class="number" width="120" style="text-align: center;vertical-align: middle;">
                                <input type="hidden" id="zyc_id" value="${shoppingCartItem.zyc.id }"/>
                                <input class="min" name="" type="button" value=" - "  />
                                <input class="text_box"  style="width: 30px;text-align: center" name="" type="text" value="${shoppingCartItem.count }" />
                                <input class="add" name="" type="button" value=" + " />
                            </td>
                            <td class="delete" style="text-align: center;vertical-align: middle;"><a
                                    href="javascript:removeShopping(${shoppingCartItem.zyc.id })">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <button type="submit" class="btn btn-danger btn-lg pull-right"><i class="glyphicon glyphicon-play"></i>&nbsp;&nbsp;结&nbsp;&nbsp;算</button>
            </form>
        </div>
        <div class="shopping_list_end">

            <ul>
                <li class="shopping_list_end_2">￥<label id="zyc_total"></label>
                </li>
                <li class="shopping_list_end_3">商品金额总计：</li>
            </ul>
        </div>

        <div style="background-color: #cddbb8;margin-top: 10px;font-size: 20px;height: 40px;text-align: center">
            <div style="padding: 5px;">
                <b>个人信息</b>&nbsp;&nbsp;&nbsp;&nbsp;<b>收件人：</b>${currentUser.trueName }&nbsp;&nbsp;<b>收获地址：</b>${currentUser.address }&nbsp;&nbsp;<b>联系电话：</b>${currentUser.mobile }
            </div>
        </div>
    </div>

</div>
</body>
</html>