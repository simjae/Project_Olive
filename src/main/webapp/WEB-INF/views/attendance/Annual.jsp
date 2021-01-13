<!-- 
	파일명:M_Attendance.jsp
	설명: 근태현황(매니져) 홈페이지 
	작성일 : 2020-12-30
	수정일 : 2020-01-07
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
				<c:set var="emp" value="${emp}"/>
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">${emp.ENAME} </h1>
						 	
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">${emp.ENAME}</a>
					</div>


					<h1>${emp.EMPNO }</h1>

					<div class="row">
					<c:set var="annual" value="${list}"/>
					<c:forEach var="list" items="${annual }">
					<c:if test="${list.EMPNO == emp.EMPNO}">
					<!--  <h1>${list}</h1> -->
						<div class="col-xl col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xl font-weight-bold text-primary text-uppercase mb-1">
												이번달 총연차</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${list.annual}</div>

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
												class="text-xl font-weight-bold text-success text-uppercase mb-1">
												이번달 사용연차</div>
											<span class="h5 font-weight-bold text-gray-800">${list.COUNT}일</span>

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
												class="text-xl font-weight-bold text-info text-uppercase mb-1">
												이번달 남은연차</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${list.DIFF}</div>

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
				</c:if>
					</c:forEach>
					</div>
					
					


					<!-- End of Main Content -->
						<!-- 계정관리 컨텐츠 시작 -->
					<div class="row">
						<div class="col-xl-12 col-lg-12">
							<div class="card border-left-info shadow mb-4">
								<!-- Card Header -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-info">계정 관리</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="card-for-flex mb-1">
										<div
											class="card-body-tridiv search-tab row justify-content-end mr-5">
											<div class="mb-3">
												<!-- 비동기로 DB다녀오는 친구들 -->
												<form class="form-group">
													<select class="select"
														id="newSearchType">
														<option selected>사번</option>
														<option>이름</option>
														<option>본부</option>
														<option>부서</option>
													</select> <input type="text" class=inputState id="newKeyword">
													<input type="button" class="btn btn-info" id="searchBtn"
														value="검색">
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
												<h1>우리부서 </h1>
													<th>문서번호</th>
													<th>사번</th>
													<th>이름</th>
													<th>사용연차</th>
													<th>발생일</th>
													<th>종료일</th>
													<th>사용연차</th>
													<th>남은연차</th>
													<th>선택</th>
												</tr>
											</thead>
											<tbody id="annualTable">
												<c:forEach var="annual_diff" items="${list}">
													<tr class = "namecal">
														<td><c:out value="${annual_diff.DOCNO}" /></td>
														<td name="empno"><c:out value="${annual_diff.EMPNO}" /></td>
														<td><c:out value="${annual_diff.ENAME}" /></td>
														<td><c:out value="${annual_diff.TYPENAME}" /></td>
														<td><c:out value="${annual_diff.STARTDATE}" /></td>
														<td><c:out value="${annual_diff.ENDDATE}" /></td>
														<td><c:out value="${annual_diff.COUNT}일 " /></td>
														<td><c:out value="${annual_diff.DIFF}일 " /></td>
														<td>
														<label class="userCheck"><input class='filter' type="radio" name = "user" ></label>
														</td>	
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
													<li class="page-item"><a class="page-link page-btn-prev" href="#"
														aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
															<span class="sr-only">Previous</span>
													</a></li>
												</c:if>

												<c:forEach var="paging" begin="${page.startPage}" end="${page.endPage}">
												    <c:choose>
												        <c:when test="${paging eq criteria.page}">
												            <li class="page-item page-link">
												                <b>${paging}</b>
												            </li>
												        </c:when>
												        <c:otherwise>
												            <li class="page-item">
												                <a class="page-link page-btn" href="#">${paging}</a>
												            </li>
												        </c:otherwise>
												    </c:choose>
												</c:forEach>

												<c:if test="${page.next}">
													<li class="page-item"><a class="page-link page-btn-next" href="#"
														aria-label="Next"> <span aria-hidden="true">&raquo;</span>
															<span class="sr-only">Next</span>
													</a></li>
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
		<!-- SearchAndPaging -->
		<script src="/resources/js/Attendance/annual.js"></script>
		<!-- 캘린더 모듈화  -->
		<!-- <script src="/resources/js/Attendance/calendartest.js"></script> -->
		<script src="/resources/js/Attendance/annualCal.js"></script>
		<!-- 모든 스크립트 모듈화 -->
		<jsp:include page="/WEB-INF/views/inc/BottomLink.jsp"></jsp:include>
</body>

</html>