<!-- 
	파일명:M_Attendance.jsp
	설명: 근태현황(매니져) 홈페이지 
	작성일 : 2020-12-30
	작성자 : 심재형 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
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
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {

						var calendarEl = document.getElementById('calendar');
						//db일정 받아오기 
						var eventFeed = function(info, successCallback,
								failureCallback) {
							$.ajax({
								type : "GET",
								url : "attList.do",
								dataType : "json",
								success : function(data) {

									successCallback(data);
									console.log(data);

								}
							});
						}

						var calendar = new FullCalendar.Calendar(
								calendarEl,
								{
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
										right : 'custom,dayGridMonth,timeGridWeek,timeGridDay,listWeek'
									},
									//출석 버튼 생생
									customButton : {
										custom : {
											text : '출석',
											id : 'startwork',
											click : function() {
												$.ajax({
															url : '/users/attendances',
															type : 'GET',
															dataType : "JSON",
															success : function(
																	data) {
															},
															error : function() {
																alert('there was an error while fetching events!');
															}
														});

											}
										}

									},
									buttonText : {
										today : '오늘',
										month : '월',
										week : '주',
										day : '일',
										list : '주간 일정표'
									},

									//버튼 
									select : function(selectionInfo) {
										alert('selected ');
										$('#startwork').click(function() {

											console.log("dasd");
										})

									},

									initialDate : '2020-09-12',
									navLinks : true, // can click day/week names to navigate views
									nowIndicator : true,
									weekNumbers : true,
									weekNumberCalculation : 'ISO',
									editable : true,
									selectable : true,
									dayMaxEvents : true, // allow "more" link when too many events
									/* events:[
										{
											
									          title: '휴가',
									          start: '2020-09-07',
									          end: '2020-09-10'
									        } 

										] */

									events : eventFeed

								});
						calendar.render();

					});
	/* 	 $( document ).ready(function() {
	 $('#startwork').click(function(){

	 console.log("dasd");
	 })
	 });
	 */

	// 출근시간
$(document).ready(function(){

  $('#startwork').click(function(){
	  var d = new Date();
	  var time =d.getHours() + "시"+ d.getMinutes() + "분" + d.getSeconds()+"초";
		$.ajax({
			type : "GET",
			url : "attList.do",
			dataType : "json",
			success : function(data) {

				successCallback(data);
				console.log(data);

			}
		});
	  console.log(time);
     alert(time)

  });

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
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">근태현황</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i>&nbsp;어떤 버튼?</a>
					</div>





					<div class="row">
						<div class="col-xl col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												입사일로부터 지금까지</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">000시</div>

										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Annual) Card Example -->
						<div class="col-xl col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												이번달</div>
											<span class="h5 font-weight-bold text-gray-800">출근: 8일</span>
											<span class="h5 font-weight-bold text-gray-800">지각: 8일</span>

										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Tasks Card Example -->
						<div class="col-xl col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">
												오늘</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">yyyy년mm월dd일
														근무중</div>

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


					<!-- End of Main Content -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">근태이력</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered " id="dataTable" width="100%"
									cellspacing="0">
									<thead align="center" style="background-color: #808000">
										<tr>
											<th>이름</th>
											<th>사번</th>
											<th>부서</th>
											<th>출근시간</th>
											<th>퇴근시간</th>
											<th>출근</th>
											<th>퇴근</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>심재형</td>
											<td>1004</td>
											<td>마케팅</td>
											<td>2020-07-16 09:00</td>
											<td>2020-07-16 16:00</td>
											<td align="center">
												<button type="button" id="startwork"
													class="btn btn-outline-primary btn-sm">출근</button>
											</td>
											<td align="center">
												<button type="button" class="btn btn-outline-primary btn-sm">퇴근</button>
											</td>
										</tr>
										<tr>
											<td>심재형</td>
											<td>1004</td>
											<td>마케팅</td>
											<td>2020-07-16 09:00</td>
											<td>2020-07-16 16:00</td>
											<td align="center">
												<button type="button" id="startwork" class="btn btn-outline-primary btn-sm">출근</button>
											</td>
											<td align="center">
												<button type="button" class="btn btn-outline-primary btn-sm">퇴근</button>
											</td>
										</tr>
										<tr>
											<td>심재형</td>
											<td>1004</td>
											<td>마케팅</td>
											<td>2020-07-16 09:00</td>
											<td>2020-07-16 16:00</td>
											<td align="center">
												<button id="startwork"
													class="btn btn-outline-primary btn-sm">출근</button>
											</td>
											<td align="center">
												<button type="button" class="btn btn-outline-primary btn-sm">퇴근</button>
											</td>
										</tr>
									</tbody>


								</table>
							</div>
						</div>
					</div>
					<div id='calendar'></div>
				</div>
			</div>
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