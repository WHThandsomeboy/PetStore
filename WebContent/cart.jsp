<%@page import="com.petstore.dto.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="head.jsp" />
<link href="styles/cart.css" rel="stylesheet">
<jsp:include page="menu.jsp" />
<div class="container">
	<div class="card">
		<div class="card-header">购物车</div>
		<div class="card-body">
			<table class="table panel-body ">
				<thead>
					<tr>
						<td><input type="checkbox" name="" value="">全选</td>
						<td></td>
						<td>商品名称</td>
						<td>单价</td>
						<td>数量</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="item" items="${cart.cartItems.values() }">
						<tr id="remove${item.id }">
							<td><input type="checkbox" name="" value=""
								checked="checked"></td>
							<td><img src="petImg/${item.imgpath}" width="80"></td>
							<td>${item.name }</td>
							<td><span class="p-price">¥ ${item.price }</span></td>
							<td><input type="text" class="form-control" id="amount${item.id}"
								value="${item.quantity }">
								<button type="button" onclick="add('${item.id}','amount${item.id}','+','1')"
									style="width: 1px; height: 1px; background: none; border: none; outline: none; position: relative; top: -42px; right: -287px">
									<img src="images/icon1.jpg" height="10px">
								</button>
								<button type="button" onclick="remove('${item.id}','amount${item.id}','-','1')"
									style="width: 1px; height: 1px; background: none; border: none; outline: none; position: relative; top: -25px; right: -271px">
									<img src="images/icon2.jpg" height="10px">
								</button></td>
							<td><button type="button"
									onclick="RemoveFromCart('${item.id}')"
									style="border: none; background-color: white;">X</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="card-footer">
			总计:
			<div class="pull-right">
				¥<span id="TotalMoney">${cart.totalMoney }</span>
			</div>
			<a class="btn btn-warning  pull-right" href="order">立即结算</a>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp" />

<script type="text/javascript">
		//移除商品ajax
		function RemoveFromCart(ID) {		
			$.ajax({
				type:"post",
				url:"./cart",
				data:{
					type:"remove",
					id:ID					
				},				
				async: false,//设置为同步传输
				success:function(data){
					//当请求返回时，后续处理代码，一般修改页面的显示数据
					toastr.success(data.msg);
					$("#cartcount").html(data.count);
					$("#TotalMoney").html(data.totalMoney);
				    $("#remove"+ID).remove();
				}
				})
		}
		//商品数量加减js及ajax
 		function add(ID,txt_id, type, num) {
 			num = num || 1;
 			var txt = document.getElementById(txt_id);
 			var source_num = parseInt(txt.value);
 			var to_num = source_num;
 			if(type == '+')
 			{
 			to_num += parseInt(num);
 			}			 
 			txt.value = to_num;
 			$.ajax({
				type:"post",
				url:"./cart",
				data:{
					type:"addQuantity",
					id:ID,
					quantity:$("#amount"+ID).val(),
				},								
				success:function(date){
					//当请求返回时，后续处理代码，一般修改页面的显示数据
					toastr.success(date.msg);					
					$("#cartcount").html(date.count);
					$("#TotalMoney").html(date.totalMoney);
				}
			})
 		}
 		function remove(ID,txt_id, type, num) {
 			num = num || 1;
 			var txt = document.getElementById(txt_id);
 			var source_num = parseInt(txt.value);
 			if(source_num <= 1 && type == '-')
 			{
 			toastr.success("请至少选择一件商品");
 			return;
 			}
 			var to_num = source_num;
 			if(type == '-')
 			{
 			to_num -= num;
 			} 			 
 			txt.value = to_num;
 			$.ajax({
				type:"post",
				url:"./cart",
				data:{
					type:"removeQuantity",
					id:ID,
					quantity:$("#amount"+ID).val(),
				},
				success:function(dat){
					//当请求返回时，后续处理代码，一般修改页面的显示数据
					toastr.success(dat.msg);
					$("#cartcount").html(dat.count);
					$("#TotalMoney").html(dat.totalMoney);						
				}
			})
 		}
</script>
</body>
</html>