<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="head.jsp"/>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
	<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
	<link href="css/sb-admin-2.min.css" rel="stylesheet">
<jsp:include page="menu.jsp"/>
<body id="page-top">
	<div id="wrapper">
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<a class="sidebar-brand d-flex align-items-center justify-content-center"
				href="customer.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">用户中心</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">
			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="index"> <i
				></i> <span>Designed by WHT 2020</span></a></li>
			<!-- Divider -->
			<hr class="sidebar-divider">
			<!-- Heading -->
			<div class="sidebar-heading">Function</div>
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					></i> <span>充值或修改密码</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded" id="customer">
						<h6 class="collapse-header">Customer operations:</h6>
						<a class="collapse-item" href="recharge.jsp">余额充值</a> 
						<a class="collapse-item" href="change_password.jsp">修改密码</a>
					</div>
				</div></li>
			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					></i> <span>Utilities</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="#">Colors</a> <a
							class="collapse-item" href="#">Borders</a> <a
							class="collapse-item" href="#">Animations</a> <a
							class="collapse-item" href="#">Other</a>
					</div>
				</div></li>
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</ul>
		<!-- End of Sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				
				<div class="container-fluid">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
<!-- 						<h1 class="h3 mb-0 text-gray-800">用户信息</h1> -->
					</div>
					<!-- Content Row -->
					<div class="row">
						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">账户余额</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><span id="Balance">￥${user.balance }</span></div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2"> 
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">我的订单</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${orderList.size()==null?0:orderList.size()}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-body">
    <!-- 内容主体区域 -->
		<iframe id="index" src="welcome.jsp" style="width: 100%;height: 500px" frameborder=0></iframe>
  </div>
			<!-- Footer -->
			<jsp:include page="footer.jsp"/>
			<!-- End of Footer -->
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
	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>
	<script>
	$(document).ready(
	        function(){
	            $("#customer>a").click(function (e) {
	                e.preventDefault();
	                $("#index").attr("src",$(this).attr("href"));
	            });
	        }
	    );
	</script>
</body>
</html>
