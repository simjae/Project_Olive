<%-- 
    파일명: EmployeeAccount.jsp
    설명: 직원 계정 CRUD (인사팀 전용)
    작성일: 2020-12-29
    작성자: 정민찬
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리 - 조직관리</title>
<jsp:include page="/WEB-INF/views/inc/HeadLink.jsp"></jsp:include>
<style>
h1{
	text-decoration: underline;
	font-weight: bold;
	text-decoration-color: #ffe561;
	text-decoration-thickness: 5px;
}
</style>
</head>

<body id="page-top">
	
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar 모듈화 -->
		<jsp:include page="/WEB-INF/views/inc/Sidebar.jsp"></jsp:include>
		<!-- End Of Sidebar 모듈화 -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="/WEB-INF/views/inc/Topbar.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">인사관리</h1>
					</div>
					
					<!-- xl3 md6 카드들 row -->
					<div class="row">
						<!-- 직원 수 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												<h6>headcount</h6>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${dashboard.headCount}명</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Annual) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												<h6>hired</h6>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${dashboard.hired}명</div>
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
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												<h6>retired</h6>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${dashboard.retired}명</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- Tasks Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">
												<h6>Occupancy rate</h6>
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
													<fmt:formatNumber value="${dashboard.headCount/50*100}" pattern=".0"/>%</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: <fmt:formatNumber value="${dashboard.headCount/50*100}" pattern=".0"/>%" aria-valuenow="<fmt:formatNumber value="${dashboard.headCount/30*100}" pattern=".0"/>" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 차트 row -->
					<div class="row">
						<!-- Area Chart -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">연도별 사원 수</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="employees-chart" style="height:30vh; width:50vw"></canvas>
									</div>
								</div>
							</div>
						</div>

						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">부서별 사원 분포</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="groupedDept-chart"></canvas>
									</div>
								</div>
							</div>
						</div>
						<!-- /Pie Chart -->
					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer 모듈화 -->
			<jsp:include page="/WEB-INF/views/inc/Footer.jsp"></jsp:include>
			<!-- End of Footer 모듈화 -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
<!-- Logout Modal-->
	<jsp:include page="/WEB-INF/views/inc/LogOutModal.jsp" />
	<!-- 모든 스크립트 모듈화 -->
	<jsp:include page="/WEB-INF/views/inc/BottomLink.jsp"></jsp:include>
	
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script src="/resources/js/Hr_management/organization-dashboard.js"></script>
</html>