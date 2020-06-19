<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="head.jsp" />
<jsp:include page="menu.jsp" />
<div class="container">
<c:forEach items="${orderList}" var="order">
    <br/>
<div class="card" style="height: auto">
    <div class="card-header">
        <strong style="position:relative;top: 8px">订单号:${order.id}&nbsp;&nbsp;&nbsp;客户id:${user.id }&nbsp;&nbsp;&nbsp;订单总金额:${order.money}&nbsp;&nbsp;&nbsp;订单状态:${order.status}&nbsp;&nbsp;&nbsp;订单创建日期:${order.date}</strong>
             <button type="button" class="btn btn-warning  pull-right " style="float: right" id="button${order.id}" onclick="Detail('${order.id}')" value="显示">查看订单详情</button>
    </div>
    <input type="hidden" value="-1" id="hidden${order.id}">
    <div class="card-body" style="height: auto;display: none" id="table${order.id}">
        <table class="table panel-body ">
            <thead>
            <tr>
            	<td>宠物图片</td>
                <td>宠物id</td>
                <td>宠物名称</td>
                <td>单价</td>
                <td>数量</td>              
            </tr>
            </thead>
            <tbody id="Table${order.id}">
			<!-- ajax返回tbody -->				  
            </tbody>
        </table>
    </div>
</div>
</c:forEach>
</div>
<script>
        function Detail(ID) {
        	$(".btn-show").click(function () {
                $(this).parent().parent().next().toggle(600);
            });
        	if($("#button"+ID).val()=="隐藏") {//隐藏或者显示table
        		$("#button"+ID).val("显示");
        		$("#table"+ID).hide();
        		}
        		else {
        		$("#button"+ID).val("隐藏");
        		$("#table"+ID).show();
        		}
        	if ($("#hidden"+ID).val()=="-1") {
        		$.ajax({
                    url:"orderdetail",
                   dateType:"json",
                    type:"post",
                    data:{
                        'oid':ID,
                    },
                    success:function(data){
                        if(data.isSuccess=="true"){
                        	//alert(data.msg);
                        	$("#Table"+ID).append($(data.msg));
                        	$("#hidden"+ID).val("1");
                        }
                    }
                });
			}
        }
</script>
<jsp:include page="footer.jsp"/>