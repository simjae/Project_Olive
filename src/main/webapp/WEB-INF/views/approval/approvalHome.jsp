<%-- 
    파일명: approvalHome.jsp
    설명: 전자결재 홈 페이지
    작성일: 2020-12-28
    작성자: 백희승
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

<title>Project_HR</title>

<!-- 스타일시트, CDN 모듈화 -->
<jsp:include page="../inc/HeadLink.jsp"></jsp:include>
<style type="text/css">

/* 채연 */
.styled-table {
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 1em;
	min-width: 100%;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.styled-table thead tr {
	background-color: #86A8E7;
	color: #ffffff;
}

.styled-table th, .styled-table td {
	padding: 12px 15px;
}

.styled-table tbody tr {
	border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
	border-bottom: 2px solid #7F7FD5;
}

.button {
	width: 100px;
	background-color: #7F7FD5;
	border: none;
	color: #fff;
	padding: 10px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	border-radius: 10px;
}
/* //채연 */
h6.text-primary>i.fas {
	font-size: 1.15rem;
}

.text-goup {
	color: #00FF40;
}

.text-godown {
	color: #FF8000;
}

.border-none {
	border: none;
}

.text-sm {
	font-size: .9rem;
}

.list-bt {
	border-bottom: 1px solid rgba(0, 0, 0, .125);
}

.card-for-flex {
	display: flex;
}

.card-body-tridiv {
	flex: 1 1 auto;
}

.search-tab {
	max-width: 200px;
}
</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar 모듈화 -->
		<jsp:include page="../inc/Sidebar.jsp"></jsp:include>
		<!-- End Of Sidebar 모듈화 -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<jsp:include page="../inc/Topbar.jsp"></jsp:include>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Electronic Approval Home</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
							<i class="fas fa-download fa-sm text-white-50"></i>&nbsp;which
							Button
						</a>
					</div>

					<!-- 결재 정리된 UI -->
					<div class="row">
						<!-- 내가 올린 결재 : 부트스트랩 list-group 이용 -->
						<div class="col-xl-6 col-lg-6">
							<div class="card border-left-info shadow mb-4">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="font-weight-bold text-info text-uppercase mb-1">
												내가 올린 결재</div>
											<div class="mb-0 font-weight-bold text-sm">
												<ul class="list-group">
													<li
														class="list-group-item p-0 border-none d-flex justify-content-between align-items-center">
														기안함 <span class="badge mr-3">00</span>
													</li>
													<li
														class="list-group-item p-0 border-none d-flex justify-content-between align-items-center">
														결재중 <span class="badge mr-3">12</span>
													</li>
													<li
														class="list-group-item p-0 border-none d-flex justify-content-between align-items-center">
														결재완료됨 <span class="badge mr-3">20</span>
													</li>
													<li
														class="list-group-item p-0 border-none d-flex justify-content-between align-items-center">
														반려됨 <span class="badge mr-3">20</span>
													</li>
												</ul>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-level-up-alt fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 내가 받은 결재 -->
						<div class="col-xl-6 col-lg-6">
							<div class="card border-left-warning shadow mb-4">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="font-weight-bold text-warning text-uppercase mb-1">
												내가 받은 결재</div>
											<div class="mb-0 font-weight-bold text-sm">
												<ul class="list-group">
													<li
														class="list-group-item p-0 border-none d-flex justify-content-between align-items-center">
														처리요망 <span class="badge mr-3">00</span>
													</li>
													<li
														class="list-group-item p-0 border-none d-flex justify-content-between align-items-center">
														진행중 <span class="badge mr-3">12</span>
													</li>
													<li
														class="list-group-item p-0 border-none d-flex justify-content-between align-items-center">
														결재완료함 <span class="badge mr-3">20</span>
													</li>
													<li
														class="list-group-item p-0 border-none d-flex justify-content-between align-items-center">
														반려함 <span class="badge mr-3">20</span>
													</li>
												</ul>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-level-down-alt fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<!-- 내가 올린 결재 컨텐츠 시작 -->
					<div class="row">
						<div class="col-xl-12 col-lg-12">
							<div class="card border-left-info shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-info">내가 올린 결재</h6>
									<!-- 옵션 버튼 : -->
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>

								<!-- 내가 올린 결재 card-body -->
								<div class="card-body">

									<div class="card-for-flex mb-1">
										<div class="card-body-tridiv search-tab">
											<!-- 비동기로 DB다녀오는 친구들 -->
											<select id="inputState" class="form-control">
												<option selected>내가 올린 결재 : 전체</option>
												<option>내가 기안한 문서</option>
												<option>현재 결재중인 문서</option>
												<option>결재완료된 문서</option>
												<option>반려된 문서</option>
											</select>
											<!-- //비동기로 DB다녀오는 친구들 -->
										</div>
										<div class="card-body-tridiv">
											<!-- 3분할공간차지 -->
										</div>
										<div class="card-body-tridiv"></div>
									</div>

									<div class="row justify-content-center mx-5">
										<table id="salary_table" class="styled-table text-center">
											<thead>
												<tr>
													<th>문서번호</th>
													<th>분류</th>
													<th>문서 제목</th>
													<th>기안자</th>
													<th>기안일</th>
													<th>진행 상태</th>
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
												</tr>
												<tr>
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
												</tr>
												<tr>
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
												</tr>
												<tr>
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
												</tr>

											</tbody>
										</table>

										<nav aria-label="Page navigation example">
											<ul class="pagination">
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
														<span class="sr-only">Previous</span>
												</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">4</a></li>
												<li class="page-item"><a class="page-link" href="#">5</a></li>
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
														<span class="sr-only">Next</span>
												</a></li>
											</ul>
										</nav>
									</div>
								</div>
								<!-- //내가 올린 결재 card-body -->

							</div>
						</div>
					</div>

					<!-- 내가 받은 결재 컨텐츠 시작 -->
					<div class="row">
						<div class="col-xl-12 col-lg-12">
							<div class="card border-left-warning shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-warning">내가 받은 결재</h6>
									<!-- 옵션 버튼 : -->
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- 결재 홈 테이블 -->
								<div class="card-body">

									<div class="card-for-flex mb-1">
										<div class="card-body-tridiv search-tab">
											<!-- 비동기로 DB다녀오는 친구들 -->
											<select id="inputState" class="form-control">
												<option selected>내가 받은 결재 : 전체</option>
												<option>처리해야할 문서</option>
												<option>진행중인 문서</option>
												<option>결재완료된 문서</option>
												<option>반려한 문서</option>
											</select>
											<!-- //비동기로 DB다녀오는 친구들 -->
										</div>
										<div class="card-body-tridiv">
											<!-- 3분할공간차지 -->
										</div>
										<div class="card-body-tridiv">
											<!-- 3분할공간차지 -->
										</div>
									</div>

									<div class="row justify-content-center mx-5">
										<table id="salary_table" class="styled-table text-center">
											<thead>
												<tr>
													<th>문서번호</th>
													<th>분류</th>
													<th>문서 제목</th>
													<th>기안자</th>
													<th>기안일</th>
													<th>진행 상태</th>
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
												</tr>
												<tr>
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
												</tr>
												<tr>
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
												</tr>
												<tr>
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
												</tr>

											</tbody>
										</table>

										<nav aria-label="Page navigation example">
											<ul class="pagination">
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
														<span class="sr-only">Previous</span>
												</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">4</a></li>
												<li class="page-item"><a class="page-link" href="#">5</a></li>
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
														<span class="sr-only">Next</span>
												</a></li>
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

			<!-- Footer 모듈화 -->
			<jsp:include page="../inc/Footer.jsp"></jsp:include>
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
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 모든 스크립트 모듈화 -->
	<jsp:include page="../inc/BottomLink.jsp"></jsp:include>
	<script type="text/javascript">
		
	</script>
</body>

</html>