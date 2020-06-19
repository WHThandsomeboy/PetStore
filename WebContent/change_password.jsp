<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <link href="scripts/toastr.css" rel="stylesheet">
 <script src="scripts/jquery-3.3.1.js"></script>
	<script src="scripts/toastr.min.js"></script>

</head>

<body >

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0  ">
            <div class="row">
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">修改密码</h1>
                  </div>
                  <form class="user">
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="oldpwd" aria-describedby="emailHelp" placeholder="请输入旧密码">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="newpwd1" placeholder="请输入新密码">
                    </div>
                    <div class="form-group">
                    <input type="password" class="form-control form-control-user" id="newpwd2" placeholder="请确认新密码">
                    </div>
                    <button  type="button" class="btn btn-primary btn-user btn-block" style="color: white;" id="submit">
                      确认修改
                    </button>
                    <hr>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
<script>
toastr.options = {
		"positionClass" : "toast-top-center"
	}
	$("#submit").click(function() {
		var oldpwd = $("#oldpwd").val();
		var newpwd1 = $("#newpwd1").val();
		var newpwd2 = $("#newpwd2").val();
		if (oldpwd=='${user.pwd}') {
			if (newpwd1==newpwd2) {
				$.ajax({
					type:"post",
					url:"./change_password",
					data:{
						'cid':'${user.id}',
						'newpwd':newpwd1,
					},
				success:function(data){
	                if(data.isSuccess=="true"){
	                   toastr.success(data.msg);
	                }else{
	                    toastr.error(data.msg);
	                }
				}
				})
			}else{
				toastr.error("俩次密码不相同");
			}
		}else {
			toastr.error("旧密码错误");
		}
		
	})
</script>
</body>

</html>
