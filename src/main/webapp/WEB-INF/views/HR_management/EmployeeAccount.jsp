<%-- 
    파일명: EmployeeAccount.jsp
    설명: 직원 계정 CRUD (인사팀 전용)
    작성일: 2020-12-29
    작성자: 정민찬
    
    수정일 : 2021-01-02
    수정자 : 백희승
    수정내역 : 사원 등록을 위한 Modal 추가 작성
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>인사관리 - 계정 관리</title>
<!-- 스타일시트, CDN 모듈화 -->
<jsp:include page="/WEB-INF/views/inc/HeadLink.jsp"></jsp:include>
<!-- datepicker 용 CDN -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<style>
/* 데이트 피커 */
.datepicker, .input-radius {
	border-radius: 20px;
}

/* 신규 등록 모달 */
.modal .modal-dialog {
	max-width: 70%;
	width: auto;
}

.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}

.modal .modal-content {
	border-radius: 3px;
}

.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}

.modal .modal-title {
	display: inline-block;
}

.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}

.modal form label {
	font-weight: normal;
}

p.each-label{
	margin-top: 0.5rem;
	margin-bottom:0;
	font-weight: bolder;
}

p.each-label ~ .form-control::placeholder, p.each-label + select option {
	font-size: 0.75rem;
	color: gray;
}

p.each-label span {
	font-weight: normal;
	font-size: 0.75rem;
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
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">사용자 관리</h1>
						<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
							<i class="fas fa-download fa-sm text-white-50"></i>&nbsp;어떤 버튼?
						</a>
					</div>
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
													<input type="button" class="btn btn-info" value="다운로드">
													&nbsp;&nbsp;&nbsp;&nbsp; <select class="select ">
														<option selected>사번</option>
														<option>이름</option>
														<option>본부</option>
														<option>부서</option>
													</select>
													<input type="text" class=inputState>
													<input type="button" class="btn btn-info" value="검색">
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
													<th>본부</th>
													<th>부서</th>
													<th>직책</th>
													<th>직급</th>
													<th>직책</th>
													<th>button</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td><a href=#>아</a> <a href=#>이</a> <a href=#>콘</a></td>
												</tr>
												<tr>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
												</tr>
												<tr>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
												</tr>
												<tr>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
												</tr>
												<tr>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
													<td>내용</td>
												</tr>
											</tbody>
										</table>
										
										
										<nav aria-label="Page navigation example">
											<ul class="pagination">
												<li class="page-item">
													<a class="page-link" href="#" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
														<span class="sr-only">Previous</span>
													</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">1</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">2</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">3</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">4</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">5</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
														<span class="sr-only">Next</span>
													</a>
												</li>
											</ul>
										</nav>
										
										
									</div>
									<div class="row mr-5 float-right">
										<a href="#employNewEmpModal" class="btn btn-info" data-toggle="modal">사원 신규 등록</a>
									</div>
								</div>
								<!-- //내가 올린 결재 card-body -->
							</div>
							<!-- 신입사원 신규 등록 모달 -->
							<div id="employNewEmpModal" class="modal fade">
								<div class="modal-dialog">
									<div class="modal-content">
										<form action="" method="POST" onsubmit="return empSubmit();">
											<div class="modal-header">
												<h3 class="modal-title">사원 등록</h3>
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											</div>
											<div class="modal-body">
												<div class="row justify-content-center">
													<div class="col-md-8 scroll">
														<div class="p-2">
														
															<div class="row">
																<div class="col-md-10"> 
																	<p class="each-label">사번<span id="checkEmpNo"></span></p>
																	<input type="text" class="form-control input-radius" placeholder="사번을 입력해주세요." name="empNo" id="empNo" required>
																</div>
															</div>
															
															<div class="row">
																<div class="col-md-10">
																	<p class="each-label">이름</p>
																	<input type="text" class="form-control input-radius" placeholder="이름을 입력해주세요." name="ename" required>
																</div>
															</div>
															
															<div class="row">
																<div class="col-md-10">
																	<p class="each-label">E-Mail</p>
																	<input type="text" class="form-control input-radius" placeholder="올바른 이메일 형식을 입력해주세요." name="email" required>
																</div>
															</div>
															
															<div class="row">
																<div class="col-md-10">
																	<p class="each-label">생년월일 (=password)</p>
																	<input type="text" class="form-control input-radius" placeholder="생년월일 6자리 = 최초비밀번호" name="pwd" required>
																</div>
															</div>
															
															<div class="row">
																<div class="col-md-10">
																	<p class="each-label">입사일자</p>
																	<input type="text" class="form-control datepicker" placeholder="입사일 입력" name="pwd" required>
																</div>
															</div>
															
															<div class="row">
																<div class="col-md-10">
																	<p class="each-label">본부 선택(Head)</p>
																	<select name="headCode" id="head" class="form-control input-radius">
																	
																	</select>
																</div>
															</div>
															
															<div class="row">
																<div class="col-md-10">
																	<p class="each-label">부서 선택(Dept)</p>
																	<select name="deptCode" id="dept" class="form-control input-radius">
																		<option selected value="null">먼저 본부를 선택해주세요.</option>
																	</select>
																</div>
															</div>
															 
															<div class="row">
																<div class="col-md-10">
																	<p class="each-label">포지션 코드(Position)</p>
																	<input type="text" class="form-control input-radius" placeholder="10:팀원|20:팀장|30:본부장" name="positionCode">
																</div>
															</div>
															
															<div class="row">
																<div class="col-md-10">
																	<p class="each-label">직급 코드 (Class)</p>
																	<input type="text" class="form-control input-radius" placeholder="10:사원|20:대리|30:부장|40:이사" name="classCode">
																</div>
															</div>
															
															<input type="hidden" name="statusCode" value="10"><!-- 사원 신규 등록 : statusCode = 10번 -->
														</div>
													</div>
													
													
													<div class="col-md-4">
														<div class="d-flex flex-column align-items-center text-center p-3 py-5">
															<img class="mt-5" src="/resources/img/undraw_profile.svg" width="90">
															<span class="font-weight-bold mt-3">사번:0000</span>
															<h3>이름:... (미완)</h3>
														</div>
													</div>
													
												</div>
												
											</div>
											<div class="modal-footer">
                                    			<button type="reset" class="btn btn-danger btn-icon-split">
                                    				<span class="icon text-white-50">
                                    				<i class="fas fa-redo"></i>
                                    				</span>
                                    				<span class="text">처음부터 작성</span>
                                    			</button>
												<button type="submit" class="btn btn-success btn-icon-split">
                                        			<span class="icon text-white-50">
                                            		<i class="fas fa-check"></i>
                                        			</span>
                                        			<span class="text">사원으로 등록</span>
                                    			</button>
											</div>
										</form>
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
	<script src="/resources/js/Hr_management/validationBeforeInsert.js"></script>
</body>
</html>