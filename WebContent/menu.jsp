<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div
		class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
		<img src="images/logo.png" width="64" height="64" class="mb-2">
		<h5 class="my-0 mr-md-auto font-weight-normal">宠物商店</h5>
		<div>
			<form action="index" class="form-inline" id="petForm" method="post">
				<div class="form-group">
					<select name="cid" class="form-control" id="cid"
						style="width: 80px">
						<option value="0">全部</option>
						<option value="1">猫</option>
						<option value="2">犬</option>
						<option value="3">鸟</option>
						<option value="4">鱼</option>
					</select>&nbsp;&nbsp; <input type="search" name="cname" placeholder="输入宠物名搜索..(支持模糊查询)"
						id="mySearch" style="width: 250px">&nbsp;&nbsp; <input
						type="submit" class="btn btn-primary btn-sm" value="查询" id="Search">&nbsp;&nbsp;
				</div>
			</form>
		</div>
		<nav class="my-2 my-md-0 mr-md-3">
			<a class="p-2 text-dark" href="index">首页</a> <a class="p-2 text-dark"
				href="#" id="Link_to"><span id="customer">${user.name }</span> </a>
			<a class="p-2 text-dark" href="cart">购物车(<span id="cartcount">${cart.totalCount}</span>)
			</a> <a class="p-2 text-dark" href="#">联系客服</a>
		</nav>
		<a class="btn btn-outline-primary" href="login.jsp">登录</a>
	</div>
	<script type="text/javascript">
		toastr.options = {
			"positionClass" : "toast-top-center"
		}
		$(function() { //当totalCount为空时，赋值为0
			var total = $("#cartcount").text();
			if (total.length == 0) {
				$("#cartcount").html("0");
			}
			var user = $("#customer").text();
			if (user.length == 0) {
				$("#customer").html("请登录");
			}
		})
		$("#Link_to").click(function() {
			var user = $("#customer").text();
			if (user == "请登录") {
				window.location.href = 'login.jsp';
			} else {
				window.location.href = 'customer.jsp';
			}
		})
	</script>
</html>