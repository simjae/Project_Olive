<!-- 
    파일명 : emp.jsp
    설명 : 인사정보 - 사원조회 페이지
    작성일 : 2020-12-28
    작성자 : 박채연
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link href="/resources/css/chaeyeon.css" rel="stylesheet">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Emp</title>
<!-- 스타일시트, CDN 모듈화 -->
<jsp:include page="/WEB-INF/views/inc/HeadLink.jsp"></jsp:include>
<style>
.table-wrapper {
	min-width: 1000px;
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn-group {
	float: right;
}

.table-title .btn {
	color: #fff;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	color: #7F7FD5;
}

table.table td a.delete {
	color: #F44336;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}

/* Modal styles */
.modal .modal-dialog {
	max-width: 50%;
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

.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}

.modal textarea.form-control {
	resize: vertical;
}

.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}

.modal form label {
	font-weight: normal;
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
					<h1 class="h3 text-gray-800">사원조회</h1>
					<div class="card shadow py-4 bg-white my-5">
						<div class="row justify-content-end mx-5">
							<div class="form-group col-md-2">
								<select id="inputState" class="form-control">
									<option selected>검색조건</option>
									<option>사번</option>
									<option>이름</option>
									<option>소속</option>
								</select>
							</div>
							<form class="col-md-3 d-none d-sm-inline-block ">
								<div class="input-group">
									<input type="text" class="form-control border-0 small" placeholder="검색어를 입력해주세요" aria-label="Search"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
						<div class="table-responsive">
							<div class="table-wrapper">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th></th>
											<th>사번</th>
											<th>이름</th>
											<th>소속</th>
											<th>직급</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${requestScope.emplist}">
										<tr>

											<td>
												<img src="/resources/img/undraw_profile_1.svg" width="40">
											</td>
											<td>${list.empNo}</td>
											<td>${list.ename}</td>
											<td>${list.deptname}</td>
											<td>${list.positionname}</td>
											<td>
												<a href="#editEmployeeModal" class="edit" data-toggle="modal">보기</a>
											</td>
										</tr>
										</c:forEach> 

									</tbody>
								</table>
								<div class="clearfix">
									<div class="hint-text">
										Showing <b>5</b> out of <b>25</b> entries
									</div>
									<ul class="pagination">
										<li class="page-item disabled">
											<a href="#">Previous</a>
										</li>
										<li class="page-item">
											<a href="#" class="page-link">1</a>
										</li>
										<li class="page-item">
											<a href="#" class="page-link">2</a>
										</li>
										<li class="page-item active">
											<a href="#" class="page-link">3</a>
										</li>
										<li class="page-item">
											<a href="#" class="page-link">4</a>
										</li>
										<li class="page-item">
											<a href="#" class="page-link">5</a>
										</li>
										<li class="page-item">
											<a href="#" class="page-link">Next</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- Edit Modal HTML -->
					<div id="editEmployeeModal" class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<form>
									<div class="modal-header">
										<h4 class="modal-title">사원정보</h4>
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									</div>
									<div class="modal-body">
										<div class="row justify-content-center">
											<div class="col-md-5 border-right">
												<div class="d-flex flex-column align-items-center text-center p-3 py-5">
													<img class="mt-5" src="/resources/img/undraw_profile.svg" width="90">
													<span class="font-weight-bold mt-3">2001</span>
													<h3>박채연</h3>
												</div>
											</div>
											<div class="col-md-7 scroll">
												<div class="p-5">
													<div class="row mt-3">
														<div class="col-md-10">
															<p>사번</p>
															<input type="text" class="form-control" placeholder="사번" value="2001" readonly>
														</div>
													</div>
													<div class="row mt-4">
														<div class="col-md-10">
															<p>이름</p>
															<input type="text" class="form-control" placeholder="이름" value="Douglas Mcgee" readonly>
														</div>
													</div>
													<div class="row mt-4">
														<div class="col-md-10">
															<p>비밀번호</p>
															<input type="text" class="form-control" placeholder="비밀번호" value="*****">
														</div>
													</div>
													<div class="row mt-4">
														<div class="col-md-10">
															<p>이메일</p>
															<input type="text" class="form-control" placeholder="이메일" value="john@bbb.com">
														</div>
													</div>
													<div class="row mt-4">
														<div class="col-md-10">
															<p>휴대폰번호</p>
															<input type="text" class="form-control" placeholder="휴대폰번호" value="010-8888-7777">
														</div>
													</div>
													<div class="row mt-4">
														<div class="col-md-10">
															<p>주소</p>
															<input type="text" class="form-control" placeholder="주소" value="서울특별시 뫄뫄뫄">
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- <div class="form-group">
											<label>Name</label>
											<input type="text" class="form-control" required>
										</div>
										<div class="form-group">
											<label>Email</label>
											<input type="email" class="form-control" required>
										</div>
										<div class="form-group">
											<label>Address</label>
											<textarea class="form-control" required></textarea>
										</div>
										<div class="form-group">
											<label>Phone</label>
											<input type="text" class="form-control" required>
										</div>		 -->
									</div>
									<div class="modal-footer">
										<input type="button" class="btn btn-info" data-dismiss="modal" value="Edit">
										<input type="submit" class="btn btn-info" value="Save">
									</div>
								</form>
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
</body>
</html>