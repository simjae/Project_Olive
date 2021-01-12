<!-- 
	파일명:M_Attendance.jsp
	설명: 근태현황(매니져) 홈페이지 
	작성일 : 2020-12-30
	수정일 : 2020-01-07
	작성자 : 심재형 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link href='../resources/fullcalendar-5.5.0/lib/main.css' rel='stylesheet' />
<script src='../resources/fullcalendar-5.5.0/lib/main.js'></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Project_HR</title>
<!-- 스타일시트, CDN 모듈화 -->
<jsp:include page="/WEB-INF/views/inc/HeadLink.jsp"></jsp:include>
<!-- CodePen 차용 vertical progress bar -->
<style type="text/css">
.progress-cus {
	background-color: #f5f5f5;
	border-radius: 3px;
	box-shadow: none;
	display: flex; 
}

.progress-cus.progress-xs {
	height: 5px;
	margin-top: 5px;
}

.progress-cus.progress-sm {
	height: 10px;
	margin-top: 5px;
}

.progress-cus.progress-lg {
	height: 25px;
}

.progress-cus.vertical {
	position: relative;
	width: 20px;
	height: 100px;
	display: inline-block;
	margin: 44px 14px 28px;
}

.progress-cus.vertical>.progress-bar-cus {
	border-radius: 4px;
	width: 100% !important;
	position: absolute;
	bottom: 0;
}

.progress-cus.vertical.progress-xs {
	width: 5px;
	margin-top: 5px;
}

.progress-cus.vertical.progress-sm {
	width: 10px;
	margin-top: 5px;
}

.progress-cus.vertical.progress-lg {
	width: 30px;
}

.progress-bar-cus {
	background-color: #2196f3;
	box-shadow: none;
}

.progress-bar-cus.text-left {
	text-align: left;
}

.progress-bar-cus.text-left span {
	margin-left: 10px;
}

.progress-bar-cus.text-right {
	text-align: right;
}

.progress-bar-cus.text-right span {
	margin-right: 10px;
}

@-webkit-keyframes progress-bar-stripes-cus {
	from{background-position: 40px 0;}
	to {background-position: 0 0;}
}

@keyframes progress-bar-stripes-cus {
	from {background-position: 40px 0;}
	to {background-position: 0 0;}
}
.progress-cus.active .progress-bar-cus, .progress-bar-cus.active {
	-webkit-animation: progress-bar-stripes-cus 2s linear infinite;
	-o-animation: progress-bar-stripes-cus 2s linear infinite;
	animation: progress-bar-stripes-cus 2s linear infinite;
}

.progress-striped-cus .progress-bar-cus, .progress-bar-striped-cus {
	background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15)
		25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%,
		rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15)
		25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%,
		rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%,
		transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%,
		rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	background-size: 40px 40px;
}

.progress-bar-secondary-cus {
	background-color: #323a45;
}

.progress-bar-default-cus {
	background-color: #b0bec5;
}

.progress-bar-success-cus {
	background-color: #64dd17;
}

.progress-bar-info-cus {
	background-color: #29b6f6;
}

.progress-bar-warning-cus {
	background-color: #ffd600;
}

.progress-bar-danger-cus {
	background-color: #ef1c1c;
}
.progress-bar-extention-cus {
	background-color: #8500CD;
}

.progress-bar-cus-sub{
	border-radius: 4px;
}
/* Progress Bar */

.pro-p {
	width: 65px;
	position: absolute;
	bottom: -36px;
	left: -20px;
	font-size: 0.7rem;
	color: #000000;
	text-align: center;
}
.pro-p > p{
	font-weight: 800;
	margin:0 auto;
}
.pro-p.sat {
	color: #4546FF;
}
.pro-p.sun {
	color: #ED322A;
}
.pro-p span {
	border-radius: 1px;
	background-color: #EAF9FE;
}
.hour-checkboard{
	font-size: 0.8rem;
}
.legeno {
    display: inline-block;
    width: 14px;
    height: 14px;
    position: relative;
    border-radius: 10px;
    overflow: hidden;
    vertical-align: middle;
    text-shadow: none;
}
.hour-checkboard .title1, .title2, .title3 {
	border-radius: 8px;
	padding: 5px 5px;
	font-weight: bold;
}

div.d1{
	color:#9EDAF9;
}
div.d2{
	color:#C5A8FB;
}
div.d3{
	color:#7D86CC;
}

span.title1{
	background-color: #EAF9FE;
}

span.title2{
	background-color: #F9F5FE;
}
span.title3{
	background-color: #F5F6FE;
}

.st1, .st2, .st3 {
	font-weight: bolder;
	font-size: 1.2rem;
}

span.st1{
	color:#67ACFD;
}
span.st2{
	color:#A57AFA;
}
span.st3{
	color:#4F5BB7;
}
/* Custom */
.tooltip.in {
  filter: alpha(opacity=90);
  opacity: 0.9;
}
.tooltip.top {
  padding: 5px 0;
  margin-top: -3px;
}
.tooltip.right {
  padding: 0 5px;
  margin-left: 3px;
}
.tooltip.bottom {
  padding: 5px 0;
  margin-top: 3px;
}
.tooltip.left {
  padding: 0 5px;
  margin-left: -3px;
}
.tooltip.top .tooltip-arrow {
  bottom: 0;
  left: 50%;
  margin-left: -5px;
  border-width: 5px 5px 0;
  border-top-color: #000;
}
.tooltip.top-left .tooltip-arrow {
  right: 5px;
  bottom: 0;
  margin-bottom: -5px;
  border-width: 5px 5px 0;
  border-top-color: #000;
}
.tooltip.top-right .tooltip-arrow {
  bottom: 0;
  left: 5px;
  margin-bottom: -5px;
  border-width: 5px 5px 0;
  border-top-color: #000;
}
.tooltip.right .tooltip-arrow {
  top: 50%;
  left: 0;
  margin-top: -5px;
  border-width: 5px 5px 5px 0;
  border-right-color: #000;
}
.tooltip.left .tooltip-arrow {
  top: 50%;
  right: 0;
  margin-top: -5px;
  border-width: 5px 0 5px 5px;
  border-left-color: #000;
}
.tooltip.bottom .tooltip-arrow {
  top: 0;
  left: 50%;
  margin-left: -5px;
  border-width: 0 5px 5px;
  border-bottom-color: #000;
}
.tooltip.bottom-left .tooltip-arrow {
  top: 0;
  right: 5px;
  margin-top: -5px;
  border-width: 0 5px 5px;
  border-bottom-color: #000;
}
.tooltip.bottom-right .tooltip-arrow {
  top: 0;
  left: 5px;
  margin-top: -5px;
  border-width: 0 5px 5px;
  border-bottom-color: #000;
}
.tooltip-inner {
  max-width: 200px;
  padding: 3px 8px;
  color: #fff;
  text-align: center;
  background-color: #000;
  border-radius: 4px;
}
.tooltip-arrow {
  position: absolute;
  width: 0;
  height: 0;
  border-color: transparent;
  border-style: solid;
}
p.inner-title{
	font-size:0.8rem;
	margin-bottom: 0;
}
/* tooltip */
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
				<c:set var="emp" value="${emp}"/>
					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">${emp.ENAME}</h1>
						<a href="#"	class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">${emp.ENAME}</a>
					</div>
					
					<div class="row">
						<div class="col-lg-12">
							<!-- Dropdown Card Example -->
							<div class="card shadow mb-4">
							<!--희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작희승시작-->
							
							
								<!-- 총 근무시간 헤더  -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">이번주 총 근무시간</h6>
								</div>
								<!-- 총 근무시간 카드 -->
								<c:set var="total" value="${workHours}"/>
								<c:set var="each" value="${hoursEachList}"/>
								
								<div class="card-body">
									<h5 class="text-center"><strong>${total.startOfWeek} ~ ${total.endOfWeek}</strong></h5>
									<div class="d-flex justify-content-around">
										<div class="col-lg-12 d-flex justify-content-around align-items-center">
										
											<!-- Vertical Progress Bar -->
											<c:forEach var="e" items="${each}" begin="0" end="6" step="1" varStatus="seq">
											
											<c:if test="${e.start eq null || e.start ne null }">
											
												<c:set var="superRate" value="${ (e.dayTotalHours + ((e.dayTotalMinutes*5/3)*(1/100)))*(100/8) }"/>
												<div class="progress-cus vertical progress-striped-cus active">
													<c:if test="${e.attCode eq 20}"><!-- 지각 -->
														<c:set var="barKind" value="progress-bar-warning-cus"/>
													</c:if>
													<c:if test="${e.attCode eq 30 ||e.attCode eq 40 }"><!-- 조퇴,결근 -->
														<c:set var="barKind" value="progress-bar-danger-cus"/>
													</c:if>
													<c:if test="${e.attCode eq 50}"><!-- 휴가 -->
														<c:set var="barKind" value="progress-bar-secondary-cus"/>
													</c:if>
													<c:if test="${e.attCode eq 10 || e.attCode eq 60 || e.attCode eq 70 || e.attCode eq 80}">
														<c:set var="barKind" value="progress-bar-success-cus"/> 
													</c:if>
													
													<div role="progressbar-cus" style="height: ${superRate}%;" data-html="true"
													class="progress-bar-cus progress-bar-striped-cus ${barKind}" data-toggle="tooltip" data-placement="right" 
													data-original-title=
														'<div class="p-1"> 
															<p class="inner-title mb-1"><fmt:formatDate value="${e.date}" pattern="MM.dd"/> ${e.weekDays}요일</p>
															<p class="inner-title">출근시간 : <b><fmt:formatDate value="${e.start}" pattern="HH:mm"/></b></p>
															<p class="inner-title">퇴근시간 : <b><fmt:formatDate value="${e.end}" pattern="HH:mm"/></b></p>
															<p class="inner-title">처리상태 : ${e.attCode}</p>
														</div>'
													><!-- Vertical Bar Hover : activate Tooltips -->
														
														
														
														<c:if test="${e.overHours ne 0 || e.overMinutes ne 0}">
															<div role="progressbar-cus" style="height:<c:out value="${superRate-100}"/>%;" class="progress-bar-cus progress-bar-striped-cus progress-bar-extention-cus progress-bar-cus-sub">
															</div>
														</c:if>
													</div>
													<div class="pro-p">
														<p><fmt:formatDate value="${e.date}" pattern="MM.dd"/>(${e.weekDays})</p>
														<span>${e.dayTotalHours}시간 ${e.dayTotalMinutes}분</span>
													</div>
												</div>
												
											</c:if>
												
											</c:forEach>
										</div>
										
									</div>
									<div class="mt-1 pt-1 text-center">
										<hr>
										<div class="d-flex flex-row align-items-center justify-content-around hour-checkboard">
											<div><span class="legeno progress-bar-success-cus mb-1"></span>&nbsp;근무시간</div>
											<div><span class="legeno progress-bar-extention-cus mb-1"></span>&nbsp;연장근무</div>
											<div><span class="legeno progress-bar-warning-cus mb-1"></span>&nbsp;지각</div>
											<div><span class="legeno progress-bar-danger-cus mb-1"></span>&nbsp;조퇴,결근</div>
											<div><span class="legeno progress-bar-secondary-cus mb-1"></span>&nbsp;휴가</div>
											<c:forEach var="e" items="${each}" begin="0" end="6" step="1" varStatus="seq">
												<c:set var="overH" value="${oh = oh + e.overHours}"/>
												<c:set var="overM" value="${om = om + e.overMinutes}"/>
												<c:set var="totalH" value="${th = th + e.dayTotalHours}"/>
												<c:set var="totalM" value="${tm = tm + e.dayTotalMinutes}"/>
											</c:forEach>
											<fmt:parseNumber var="overHour" value="${overH + (overM/60)}" integerOnly="true"/>
											<c:set var="overMinute" value="${overM%60}"/>
											<fmt:parseNumber var="totalHour" value="${totalH + (totalM/60)}" integerOnly="true"/>
											<c:set var="totalMinute" value="${totalM%60}"/>
											<div class="d1"><span class="title1">근무시간</span> <span class="st1">${totalHour-overHour}</span>시간 <span class="st1">${totalMinute-overMinute}</span>분</div>
											<div class="d2"><span class="title2">연장근무</span> <span class="st2">${overHour}</span>시간 <span class="st2">${overMinute}</span>분</div>
											<div class="d3"><span class="title3">총 근무시간</span> <span class="st3">${totalHour}</span>시간 <span class="st3">${totalMinute}</span>분</div>
											
										</div> 
									</div> 
								</div>
							</div>
						</div>
					</div>
					<!-- End of Main Content -->
					<!-- 희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료희승종료 -->
					
					<!-- 계정관리 컨텐츠 시작 -->
					<div class="row">
						<div class="col-xl-12 col-lg-12">
							<div class="card border-left-info shadow mb-4">
								<!-- Card Header -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-info">계정 관리</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="card-for-flex mb-1">
										<div class="card-body-tridiv search-tab row justify-content-end mr-5">
											<div class="mb-3">
												<!-- 비동기로 DB다녀오는 친구들 -->
												<form class="form-group">
													<select class="select" id="newSearchType">
														<option selected>사번</option>
														<option>이름</option>
														<option>본부</option>
														<option>부서</option>
													</select>
													<input type="text" class=inputState id="newKeyword">
													<input type="button" class="btn btn-info" id="searchBtn" value="검색">
													<!-- //비동기로 DB다녀오는 친구들 -->
												</form>
											</div>
										</div>
										<div class="card-body-tridiv"></div>
									</div>
									<div class="row justify-content-center mx-5">
										<table id="salary_table" class="table text-center">
											<thead>
												<tr>
													<th>사번</th>
													<th>이름</th>
													<th>부서</th>
													<th>출근시간</th>
													<th>퇴근시간</th>
												</tr>
											</thead>
											<tbody id="attListTable">
												<c:forEach var="rectable" items="${list}">
													<tr>
														<td><c:out value="${rectable.empno}" /></td>
														<td><c:out value="${rectable.ename}" /></td>
														<td><c:out value="${rectable.deptname}" /></td>
														<td><c:out value="${rectable.starttime}" /></td>
														<td><c:out value="${rectable.endtime}" /></td>
														<td><a href=# class="btn-sm btn-info shadow-sm">
																<i class="fas fa-check fa-sm text-white"></i>
															</a> <a href=# class="btn-sm btn-info shadow-sm">
																<i class="fas fa-edit fa-sm text-white"></i>
															</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<c:set var="criteria" value="${criteria}" />
										<input type="text" value="${criteria.searchType}" id="oldSearchType" hidden>
										<input type="text" value="${criteria.keyword}" id="oldKeyword" hidden>
										<input type="text" value="${criteria.page}" id="oldPage" hidden>
										<input type="text" value="${criteria.perPageNum}" id="oldPerPageNum" hidden>
										<c:set var="page" value="${pagination}"></c:set>
										<nav aria-label="Page navigation example">
											<ul class="pagination" id="pagination">
												<c:if test="${page.prev}">
													<li class="page-item">
														<a class="page-link page-btn-prev" href="#" aria-label="Previous">
															<span aria-hidden="true">&laquo;</span>
															<span class="sr-only">Previous</span>
														</a>
													</li>
												</c:if>
												<c:forEach var="paging" begin="${page.startPage}" end="${page.endPage}">
													<li class="page-item">
														<a class="page-link page-btn" href="#">${paging}</a>
													</li>
												</c:forEach>
												<c:if test="${page.next}">
													<li class="page-item">
														<a class="page-link page-btn-next" href="#" aria-label="Next">
															<span aria-hidden="true">&raquo;</span>
															<span class="sr-only">Next</span>
														</a>
													</li>
												</c:if>
											</ul>
										</nav>
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
													<label for="sname">시작일 :</label><br>
													<input type="text" id="sname" name="startdate">
													<br>
												</div>
												<div class="ename">
													<label for="ename">종료일 :</label><br>
													<input type="text" id="ename" name="enddate">
													<br>
												</div>
												<label for="lname">내용:</label><br>
												<input type="text" id="lname" name="context">
												<br> <br>
												<input type="submit" value="Submit">
												<input type="reset">
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
					<a class="scroll-to-top rounded" href="#page-top">
						<i class="fas fa-angle-up"></i>
					</a>
					<!-- Logout Modal-->
					<jsp:include page="/WEB-INF/views/inc/LogOutModal.jsp"></jsp:include>
					<!-- SearchAndPaging -->
					<script src="/resources/js/Attendance/attendance.js"></script>
					<!-- 캘린더 모듈화  -->
					<script src="/resources/js/Attendance/calendar.js"></script>
					<!-- 모든 스크립트 모듈화 -->
					<jsp:include page="/WEB-INF/views/inc/BottomLink.jsp"></jsp:include>
</body>
</html>