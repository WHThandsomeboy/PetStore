<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:include page="head.jsp" />
      <link href="styles/login.css" rel="stylesheet">
    <jsp:include page="menu.jsp" />
<div class="container">
      <div class="row">
          <div class="col-3 col-md">
            <form class="form-signin" >
              <div class="text-center">
                  <img width="72" height="72" class="mb-4" alt="" src="images/logo.png">
              </div>
  
              <!-- <h1 class="h3 mb-3 font-weight-normal">请登录</h1> -->
              <label class="sr-only" for="inputUserName">用户名</label>
              <input class="form-control"  id="inputUserName" autofocus="" required="" type="text" placeholder="用户名">
              <label class="sr-only" for="inputPassword">密码</label>
              <input class="form-control"  id="inputPassword" required="" type="password" placeholder="密码">
              <div class="checkbox mb-3">
                <label>
                  <input type="checkbox" value="remember-me"> 记住我
                </label>
              </div>
              <button class="btn btn-lg btn-success btn-block"  type="button" id="login">登录</button>
            </form>
          </div>
      </div>
  </div>
<script type="text/javascript">
$("#login").click(function(){
	$.ajax({
		type:"post",
		url:"./Login",
		data:{
			name:$("#inputUserName").val(),
			password:$("#inputPassword").val(),			
		},
		success:function(data){
			if (data.isSuccess=="true") {
				window.location.replace("index");
			}
			if (data.isSuccess=="false") {
				toastr.error("用户名或密码错误");
			}
		}
	})
})
</script>
  <jsp:include page="footer.jsp" />