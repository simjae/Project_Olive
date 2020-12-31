<!-- 
	파일명:M_annual.jsp 
	설명: 연차관리(매니저) 
	작성일 : 2020-12-28
	작성자 : 심재형 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href='../resources/fullcalendar-5.5.0/lib/main.css'
	rel='stylesheet' />
<script src='../resources/fullcalendar-5.5.0/lib/main.js'></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Project_HR</title>

<!-- 스타일시트, CDN 모듈화 -->
<jsp:include page="/WEB-INF/views/inc/HeadLink.jsp"></jsp:include>
</head>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			dateClick : function(info) {
				/* alert('Date: ' + info.dateStr);
				alert('Resource ID: ' + info.resource.id); */
				$("#myModal").modal();
				$("#sname").val(info.dateStr);
				$("#ename").val(info.dateStr);
				$("#modal-body").html("");
			},
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			buttonText : {
				today : '오늘',
				month : '월',
				week : '주',
				day : '일',
				list : '주간 일정표'
			},
			initialDate : '2020-09-12',
			navLinks : true, // can click day/week names to navigate views
			nowIndicator : true,
			weekNumbers : true,
			weekNumberCalculation : 'ISO',
			editable : true,
			selectable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			dateCilck : function(info) {
				alert(info.dateStr)
			},

		});
		calendar.render();
	});
</script>
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
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">연차관리</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i>&nbsp;어떤 버튼?</a>
					</div>	
						

						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">전체 문서</a></li>
								
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#profile" role="tab"
								aria-controls="profile" aria-selected="false">휴가현황 </a></li>

						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="home" role="tabpanel"
								aria-labelledby="home-tab">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead align="center" style="background-color: #808000">
												<tr>
													<th>이름</th>
													<th>사번</th>
													<th>부서</th>
													<th>사용연차</th>
													<th>남은연차</th>
												</tr>
											<tbody>
												<tr>
													<td>심재형</td>
													<td>1004</td>
													<td>마케팅</td>
													<td>4일</td>
													<td>13일</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						
							<div class="tab-pane fade show " id="profile" role="tabpanel"
								aria-labelledby="profile-tab">
								<!--  캘린더  -->
								<div id='calendar'></div>



							</div>
						</div>
						
					
				</div>

				
				<!-- Button trigger modal -->
				<div class="container">
				
					<!-- Modal -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->

							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">일정추가</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									<div class="row">
										<form action="/calendar.do">
											<div class="sname">
												<label for="sname">시작일 :</label><br> <input type="text"
													id="sname" name="startdate"><br>
											</div>
											<div class="ename">
												<label for="ename">종료일 :</label><br> <input type="text"
													id="ename" name="enddate"><br>
											</div>
											<label for="lname">내용:</label><br> <input type="text"
												id="lname" name="context"><br> <br> <input
												type="submit" value="Submit"> <input type="reset">
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</div>

							</div>
						</div>

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
			<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Ready to
								Leave?</h5>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">Select "Logout" below if you are
							ready to end your current session.</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button"
								data-dismiss="modal">Cancel</button>
							<a class="btn btn-primary" href="login.html">Logout</a>
						</div>
					</div>
				</div>
			</div>

			<!-- 모든 스크립트 모듈화 -->
			<jsp:include page="/WEB-INF/views/inc/BottomLink.jsp"></jsp:include>
</body>

</html>