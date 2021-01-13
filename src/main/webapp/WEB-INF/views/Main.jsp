<%-- 
    파일명: index.jsp
    설명: 모든 사원 로그인 시 표시되는 대쉬보드 컨텐츠 페이지
    작성일: 2020-12-26
    작성자: 백희승
--%>
<%-- 
    파일명: Main.jsp
    설명: 모든 사원 로그인 시 표시되는 대쉬보드 컨텐츠 페이지 수정 
    작성일: 2020-01-14
    작성자: 박선우
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Project_HR</title>
<!-- 스타일시트, CDN 모듈화 -->
<!-- 날씨 css -->
<link href="/resources/css/weather.css" rel="stylesheet" type="text/css">
</head>
<body id="page-top">
	<input value='<spring:eval expression="@weather.getProperty('weatherkey')"></spring:eval>' hidden id="weatherkey">
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
				<c:set var="arrangedDocList" value="${requestScope.arrangedDocList }"/>
				<c:set var="arrangedAppList" value="${requestScope.arrangedAppList }"/>
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">대쉬보드</h1>
					</div>
					<!-- 날씨 API + 뉴스 API 파트 row -->
					<div class="row">
						<!-- 날씨 API -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">오늘의 날씨</h6>
									<!-- 옵션 버튼 : -->
									<!-- <div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a>
											<a class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div> -->
								</div>
								<!-- 날씨 컨텐츠 :  -->
								<div class="card-body weather-here div-min-height">
									<jsp:include page="/WEB-INF/views/inc/preloadingWeather.jsp" />
								</div>
							</div>
						</div>
						<!-- 뉴스 API -->
						<div class="col-xl-8 col-lg-7 ">
							<div class="card shadow mb-4 height-fix">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">데일리 뉴스</h6>
								</div>
								<!-- 데일리 뉴스 컨텐츠 -->
								<div class="card-body">
									<div id="myCarousel" class="carousel slide">
										<!-- The slideshow-->
										<div class="carousel-inner">
											<div id="news1" class="carousel-item active"></div>
											<div id="news2" class="carousel-item"></div>
											<div id="news3" class="carousel-item"></div>
											<div id="news4" class="carousel-item"></div>
											<div id="news5" class="carousel-item"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- xl3 md6 카드들 row -->
					<div class="row">
						<!-- Tasks Card Example -->
						<div class="col-xl-6 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar" style="width: 70%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="52"></div>
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
						<!-- Pending Requests Card Example -->
						<div class="col-xl-6 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Pending Requests</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<jsp:include page="/WEB-INF/views/inc/LogOutModal.jsp" />
	<!-- 모든 스크립트 모듈화 -->
	<jsp:include page="/WEB-INF/views/inc/BottomLink.jsp"></jsp:include>
	<script src="/resources/js/skycons.js"></script>
	<script src="/resources/js/openweatherAPIuse.js"></script>
	<script src="/resources/js/newsAPI.js"></script>
	<script src="/resources/js/startWork.js"></script>
</body>
</html>