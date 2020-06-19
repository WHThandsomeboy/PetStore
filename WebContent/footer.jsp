<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<footer class="footer mt-auto py-3">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md">
                    <img src="images/logo.png" width="24" height="24" class="mb-2"">
                    <small class="d-block mb-3 text-muted">© 2019-2012</small>
                </div>
                <div class="col-6 col-md">
                    <h5>备案信息</h5>
                    <ul class="list-unstyled text-small">
                    <li><a class="text-muted" href="#">备案号</a></li>
                    </ul>
                </div>
                <div class="col-6 col-md">
                    <h5>工商信息</h5>
                    <ul class="list-unstyled text-small">
                    <li><a class="text-muted" href="#">商业资质</a></li>
                    </ul>
                </div>
                <div class="col-6 col-md">
                    <h5>关于我们</h5>
                    <ul class="list-unstyled text-small">
                    <li><a class="text-muted" href="#">计科181 18145118 汪海涛</a></li>
                    </ul>
                </div>
            </div>
        </div>
   </footer>
   <script type="text/javascript">
	$(function(){
				$("#pagerArea").cypager({pg_size:3,pg_nav_count:7,pg_total_count:'${pageCount}',pg_cur_count:'${page}',pg_call_fun:function(count){	
  					  $("#petForm").attr("action", "index?page=" + count+'${path}').submit();
				}
				});
			});
	if ('${pid}'!=0) {
		$("#cid").val('${pid}');
	}	
// $(document).ready(function() {
// 		$("#Search").click(function() {
// 			$.ajax({
// 				type:"post",
// 				url:"./index",
// 				data:{
// 					cname:document.getElementById("mySearch").value,
// 				},
// 				success:function(data){
// 					if (data.isSuccess=="true") {						
// 						window.location.replace("index.jsp");						
// 					}
// 					else{
// 						toastr.error("您输入的宠物名有误或者不存在");
// 					}
// 				}
// 			})
// 		})
// 	})
</script>
</body>
</html>