<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="head.jsp" />
<link rel="stylesheet" href="src/css/layui.css">
<script src="src/layui.js"></script>
<div class="container">
	<div class="card">
		<div class="card-header">
			宠物信息 <a class="layui-btn" href="addpet.jsp"
				style="position: absolute; left: 750px; top: 1px">添加</a>
		</div>
		<div class="card-body">
			<table class="table panel-body ">
				<thead>
					<tr>
						<td>编号</td>
						<td>宠物名称</td>
						<td>特征</td>
						<td>价格</td>
						<td>库存</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pet" items="${Pet}">
						<tr id="remove${pet.id }">
							<td>${pet.id }</td>
							<td>${pet.name }</td>
							<td>${pet.tag}</td>
							<td>${pet.price }</td>
							<td>${pet.stock }</td>
							<td><a href="petedit?id=${pet.id }">编辑</a> |
								<button type="button" onclick="Delete('${pet.id}')"
									style="background: none; border: none; outline: none;">删除</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="demo1"></div>
			<form action="petlist" method="post" id="pagemit">
				<input type="hidden" value="1" id="Page">
			</form>
		</div>
	</div>
</div>
<script>
    layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
    //总页数大于页码总数
    laypage.render({
  elem: 'demo1',
  count: '${pageCount}', //数据总数，从服务端得到
  curr: '${page}',
  jump: function(obj, first){
    if(!first){
    	$("#pagemit").attr("action", "petlist?page="+ obj.curr).submit();
    }
  },
});
})
      function Delete(ID) {		
			$.ajax({
				type:"post",
				url:"./Detele",
				data:{					
					id:ID					
				},				
				success:function(data){
					if(data.isSuccess=="true"){
		                   toastr.success(data.msg);
		                }else{
		                    toastr.error(data.msg);
		                }
				    $("#remove"+ID).remove();
				}
				})
		}
</script>