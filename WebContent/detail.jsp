<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>
<jsp:include page="menu.jsp"/>
    <link href="styles/detail.css" rel="stylesheet">
	<div class="container">
        <div class="row">
            <div class="col-md-12">
              <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                <div class="col-auto d-none d-lg-block">
                    <img src="petImg/${pet.img }" width="300" height="400" class="mb-2">
                </div>
                <div class="col p-4 d-flex flex-column position-static">
                    <h3 class="d-inline-block mb-2 text-dark">${pet.name}</h3>
                    
                    <div class="mb-2 text-muted"><span class="pet-tag">${pet.tag}</span></div>
                    
                    <p class="card-text">${pet.description }</p>
                    <p>￥<span id="pet-price">${pet.price}</span></p>
                    <p>库存 (<span id="pet-stock">${pet.stock}</span>)</p>   
                    	<input type="hidden" id="petId" value="${pet.id }"/>
                    	<div>
                               <input type="text" id="amount" value="1" size="5" />
							
								<button type="button" style="border:none;outline:none;background-color: white;" onclick="cart_number('amount','+','1');">
									<img src="images/jia.png" height="25px">
								</button>
								<button type="button" style="border:none;outline:none;background-color: white;" onclick="cart_number('amount','-','1');">
									<img src="images/jian.png" height="25px">
								</button>							
						</div>  
						<br>                   
                        <nav>               
                        <button id="btn-addtocart" class="btn btn-warning" type="button">加入购物车</button>
                        <button class="btn btn-warning" type="button">返回列表</button>               
                    </nav>                   
                </div>
              </div>
            </div>
          </div>
    </div>
    <jsp:include page="footer.jsp"/>
<script type="text/javascript">
toastr.options = {"positionClass": "toast-top-center"}
	//detail.jsp页面，ajax实现加入购物车同时更新购物车数量以及出现提示信息
	$(document).ready(function() {
		$("#btn-addtocart").click(function() { //给按钮绑定点击事件
			//Jquery的Ajax请求
			$.ajax({
				type:"post",
				url:"./cart",
				data:{
					type:"add",
					id:$("#petId").val(),
					quantity:$("#amount").val()},
					dataType: "text",
					async: false,//设置为同步传输
				success:function(data){
					//当请求返回时，后续处理代码，一般修改页面的显示数据
					var s=JSON.parse(data);
					toastr.success(s.msg);
					$("#cartcount").html(s.count);
				}				
			});
		});
	});
function cart_number(txt_id, type, num)
{
num = num || 1;
var txt = document.getElementById(txt_id);
var source_num = parseInt(txt.value);
if(source_num <= 1 && type == '-')
{
toastr.success("请至少选择一件商品");
return;
}
var to_num = source_num;
if(type == '+')
{
to_num += parseInt(num);
}
else if(type == '-')
{
to_num -= num;
}
 
txt.value = to_num;
}
</script>
</body>
</html>