<%-- 
    파일명: EmployeeAttendance.jsp
    설명: 직원 휴가 및 근태 관리 CRUD (인사팀 전용)
    작성일: 2021-01-12
    작성자: 박채연
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>인사관리 - 근태 및 휴가 관리</title>
<!-- 스타일시트, CDN 모듈화 -->
<jsp:include page="/WEB-INF/views/inc/HeadLink.jsp"></jsp:include>
<!-- datepicker 용 CDN -->
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	/* DatePicker */
	div.wrap > div{
	  font-size: 12px;
	  position: relative;
	  float: left;
	  margin-right: 5px;
	  height: 30px;
	  line-height: 30px;
	  vertical-align: middle;
	  input{
	    line-height: 30px;
	    margin: 0;
	    padding: 0;
	    padding-left: 5px;
	    padding-right: 5px;
	    width: 100px;
	  }  
	}
	button{
	  clear: both;
	  display: block;  
	  line-height: 40px;
	  margin-top: 80px;
	  background-color: #eee;  
	  color: #333;
	  border: 1px solid #666;
	  padding-left: 20px;
	  padding-right: 20px;
	  border-radius: 4px;
	}
	#ui-datepicker-div{
	 top:-999px; 
	 border: 0;
	 font-size: 14px;
	}
	.ui-datepicker-header{
	  font-size: 13px;
	}
	.ui-datepicker-calendar{
	  background-color: #fff;
	  border: 1px solid #ddd;
	  
	  tr{
	    font-size: 11px;
	  }
	}
</style>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar 모듈화 -->
		<jsp:include page="/WEB-INF/views/inc/Sidebar.jsp"></jsp:include>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="/WEB-INF/views/inc/Topbar.jsp"></jsp:include>
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">직원 근태 및 휴가 관리</h1>
					</div>
					<!-- 근태관리 컨텐츠 시작 -->
					<div class="row">
						<div class="col-xl-12 col-lg-12">
							<div class="card border-left-info shadow mb-4">
								<!-- Card Header -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-info">근태 관리</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="card-for-flex  mb-1">
										
										<div class="card-body-tridiv justify-content-end search-tab row mr-5">
											<div class="mb-3">
												
												<!-- select Box -->
												<form class="form-group">
													<select class="select" id="newSearchType">
														<option selected>사번</option>
														<option>이름</option>
														<option>본부</option>
														<option>부서</option>
													</select> <input type="text" class=inputState id="newKeyword">
													<input type="button" class="btn btn-info" id="searchBtn" value="검색">
												</form>
											</div>
										</div>
									</div>
									<div class="row justify-content-center mx-5">
										<table id="empAtt_table" class="table text-center">
											<thead>
												<tr>
													<th>사번</th>
													<th>이름</th>
													<th>부서</th>
													<th>출근시간</th>
													<th>퇴근시간</th>
													<th>상태</th>
													<th>수정</th>
												</tr>
											</thead>
											<tbody id="attListTable">
												<c:forEach var="attendance" items="${attendance}">
													<tr>
														<td>${attendance.empno}</td>
														<td>${attendance.ename}</td>
														<td>${attendance.deptname}</td>
														<td>${attendance.starttime}</td>
														<td>${attendance.endtime}</td>
														<td>${attendance.attname}</td>
														<td></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<c:set var="criteria" value="${criteria1}" />
										<input type="text" value="${criteria.searchType}" id="oldSearchType" hidden>
										<input type="text" value="${criteria.keyword}" id="oldKeyword" hidden>
										<input type="text" value="${criteria.page}" id="oldPage" hidden>
										<input type="text" value="${criteria.perPageNum}" id="oldPerPageNum" hidden>


										<c:set var="page" value="${pagination1}"></c:set>
										<nav aria-label="Page navigation example">
											
											<ul class="pagination" id="pagination">
												<c:if test="${page.prev}">
													<li class="page-item"><a class="page-link page-btn-prev" href="#"
														aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
															<span class="sr-only">Previous</span>
													</a></li>
												</c:if>

												<c:forEach var="paging" begin="${page.startPage}"
													end="${page.endPage}">
													<c:choose>
														<c:when test="${paging eq criteria.page}">
															<li class="page-item page-link"><b>${paging}</b></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link page-btn"
																href="#">${paging}</a></li>
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
							</div>

						</div>
					</div>
					
					<!-- 휴가 관리 컨텐츠 시작 -->
					<div class="row">
						<div class="col-xl-12 col-lg-12">
							<div class="card border-left-info shadow mb-4">
								<!-- Card Header -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-info">휴가 관리</h6>
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
														id="newSearchType2">
														<option selected>사번</option>
														<option>이름</option>
														<option>부서</option>
													</select> <input type="text" class=inputState id="newKeyword2">
													<input type="button" class="btn btn-info" id="searchBtn2"
														value="검색">
													<!-- //비동기로 DB다녀오는 친구들 -->
												</form>
											</div>
										</div>
										<div class="card-body-tridiv"></div>
									</div>
									<div class="row justify-content-center mx-5">
										<table id="annTable" class="table text-center">
											<thead>
												<tr>
													<th>사용일자</th>
													<th>사번</th>
													<th>이름</th>
													<th>부서</th>
													<th>발생연차</th>
													<th>사용연차</th>
													<th>잔여연차</th>
												</tr>
											</thead>
											<tbody id="annListTable">
												<c:forEach var="annual" items="${annual}">
													<tr>
														<td>${annual.startdate}</td>
														<td>${annual.empno}</td>
														<td>${annual.ename}</td>
														<td>${annual.deptname}</td>
														<td>${annual.annual}</td>
														<td>${annual.COUNT}</td>
														<td>${annual.DIFF}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<!-- 일단 페이징, 검색 문제 있음 -->
										<c:set var="criteria2" value="${criteria2}" />
										<input type="text" value="${criteria2.searchType}" id="oldSearchType2" hidden>
										<input type="text" value="${criteria2.keyword}" id="oldKeyword2" hidden>
										<input type="text" value="${criteria2.page}" id="oldPage2" hidden>
										<input type="text" value="${criteria2.perPageNum}" id="oldPerPageNum2" hidden>


										<c:set var="page2" value="${pagination2}"></c:set>
										<nav aria-label="Page navigation example">
											
											<ul class="pagination2" id="pagination2">
												<c:if test="${page2.prev}">
													<li class="page-item"><a class="page-link page-btn-prev2" href="#"
														aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
															<span class="sr-only">Previous</span>
													</a></li>
												</c:if>

												<c:forEach var="paging2" begin="${page2.startPage}"
													end="${page2.endPage}">
													<c:choose>
														<c:when test="${paging2 eq criteria2.page2}">
															<li class="page-item page-link"><b>${paging2}</b></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link page-btn2"
																href="#">${paging2}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>

												<c:if test="${page2.next}">
													<li class="page-item"><a class="page-link page-btn-next2" href="#"
														aria-label="Next"> <span aria-hidden="true">&raquo;</span>
															<span class="sr-only">Next</span>
													</a></li>
												</c:if>
											</ul>
											
										</nav> 



									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	<!-- Footer 모듈화 -->
	<jsp:include page="/WEB-INF/views/inc/Footer.jsp"></jsp:include>
	<!-- End of Footer 모듈화 -->
	<!-- 모든 스크립트 모듈화 -->
	<jsp:include page="/WEB-INF/views/inc/BottomLink.jsp"></jsp:include>
	<!-- datepicker 용 jquery ui script -->
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<!-- Validation -->
	<script src="/resources/js/Hr_management/validationBeforeInsert.js"></script>
	<!-- SearchAndPaging -->
	<script src="/resources/js/Hr_management/EmployeeAttendancejs.js"></script>
	<!-- SweetAlert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>