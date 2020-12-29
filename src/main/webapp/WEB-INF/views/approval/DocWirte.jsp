<%-- 
    파일명: DocWrite.jsp
    설명: 전자결재 홈 페이지
    작성일: 2020-12-29
    작성자: 박선우
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Write</title>
<jsp:include page="../inc/HeadLink.jsp"></jsp:include>

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
					<div class="row">
						<div class="col-md-2 h3 my-auto text-gray-800">기안하기</div>
						<div class="col-md-10">
							<div class="d-flex flex-row-reverse mr-0">
								<div class="p-2">
									<button href="#"
										class="btn btn-danger btn-icon-split my-auto mr-0">
										<span class="icon text-white-50"> <i
											class="fas fa-trash"></i>
										</span> <span class="text">취소 하기</span>
									</button>
								</div>
								<div class="p-2">
									<button href="#" class="btn btn-success btn-icon-split">
										<span class="icon text-white-50"> <i
											class="fas fa-check"></i>
										</span> <span class="text">기안 하기</span>
									</button>
								</div>
								<div class="p-2">
									<button href="#" class="btn btn-primary btn-icon-split">
										<span class="icon text-white-50"> <i
											class="fas fa-check"></i>
										</span> <span class="text">미리 보기</span>
									</button>
								</div>
							</div>
						</div>

					</div>


					<div class="col-md-12 border py-2" style="background: white;">
						<div class="row">
							<div class="card mb-4 py-0 border-left-primary mx-auto col-lg-2">
								<div class="card-body py-2">
									<div class="text-center text-primary">문서종류</div>
									<div class="mx-auto w-100">
										<select class="px-3 mx-auto w-100" id="selector">
											<option value="0">선택하세요</option>
											<option value="1">연차신청서</option>
											<option value="2">출장신청서</option>
										</select>

									</div>
								</div>
							</div>
							<div class="card mb-4 py-0 border-left-primary mx-auto col-lg-2">
								<div class="card-body py-2">
									<div class="text-center text-primary">사번</div>
									<sec:authentication property="name" var="LoginUser" />
									<sec:authorize access="isAuthenticated()">
										<div class="text-md mt-1 text-center">${LoginUser}</div>
									</sec:authorize>
								</div>
							</div>
							<div class="card mb-4 py-0 border-left-primary mx-auto col-lg-3">
								<div class="card-body py-2">
									<div class="text-center text-primary">작성일자</div>
									<c:set var="time" value="${requestScope.time}" />
									<div class="text-md mt-1 text-center">${time}</div>

								</div>
							</div>
							<div class="col-12 col-xl-4 mx-auto px-0">
								<div class="border">
									<div class="d-flex flex-row-reverse mr-0">
										<div class="mx-0 my-0">
											<table class="table-bordered">
												<thead>
													<tr>
														<th>결재자1</th>
														<th>결재자2</th>
														<th>결재자3</th>
														<th>결재자4</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>asdfasdf</td>
														<td>asdfasdf</td>
														<td>asdfasdf</td>
														<td>asdfasdf</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

							<%-- <div class="col-md-7 my-auto">

								<div class="row">
									<div
										class="card border-left-primary shadow py-0 my-auto px-4 mx-auto col-md-3">
										<div class="card-body my-0 ">
											<div class="row no-gutters align-items-center">
												<div class="col mx-auto">
													<div
														class=" text-center font-weight-bold text-primary text-uppercase mb-1">
														문서종류</div>
													<div class="mx-auto mb-0 font-weight-bold text-gray-800">
														<select class="px-4 mx-auto" id="selector">
															<option value="0">선택하세요</option>
															<option value="1">연차신청서</option>
															<option value="2">출장 신청서</option>
														</select>

													</div>
												</div>

											</div>
										</div>
									</div>
									<div
										class="card border-left-primary shadow py-0 my-auto px-4 mx-auto col-md-2">
										<div class="card-body my-0">
											<div class="row no-gutters align-items-center">
												<div class="col mx-auto">
													<div
														class=" text-center font-weight-bold text-primary text-uppercase mb-1">
														사번</div>
													<div class="mx-auto mb-0 font-weight-bold text-gray-800">
														<sec:authentication property="name" var="LoginUser" />
														<sec:authorize access="isAuthenticated()">
															<div class="text-md mt-1 text-center">${LoginUser}</div>
														</sec:authorize>

													</div>
												</div>

											</div>
										</div>
									</div>
									<div
										class="card border-left-primary shadow py-0 my-auto px-4 mx-auto col-md-4">
										<div class="card-body my-0">
											<div class="row no-gutters align-items-center">
												<div class="col mx-auto">
													<div
														class=" text-center font-weight-bold text-primary text-uppercase mb-1">
														작성 일자</div>
													<div class="mx-auto mb-0 font-weight-bold text-gray-800">
														<c:set var="time" value="${requestScope.time }" />
														<div class="text-md mt-1 text-center">${time}</div>

													</div>
												</div>

											</div>
										</div>
									</div>
									
									
								</div>

							</div> --%>

							<!-- <div class="col-md-3 px-auto mx-auto">
								<div class="card shadow ">
									<div class="card-header px-0 py-0">
										<div class="text-md-center mx-auto my-auto">결재자</div>
									</div>
									<div class="card-body px-1 py-1">
										<table class="table table-bordered dataTable my-0"
											id="dataTable" width="100%" cellspacing="0" role="grid"
											aria-describedby="dataTable_info" style="width: 100%;">
											<thead>
												<tr role="row">
													<th class="sorting_asc text-center" tabindex="0"
														aria-controls="dataTable" rowspan="1" colspan="1"
														aria-sort="ascending"
														aria-label="Name: activate to sort column descending"
														style="width: 25%;">결재자 1</th>
													<th class="sorting text-center" tabindex="0"
														aria-controls="dataTable" rowspan="1" colspan="1"
														aria-label="Position: activate to sort column ascending"
														style="width: 25%;">결재자 2</th>
													<th class="sorting text-center" tabindex="0"
														aria-controls="dataTable" rowspan="1" colspan="1"
														aria-label="Office: activate to sort column ascending"
														style="width: 25%;">결재자 3</th>
													<th class="sorting text-center" tabindex="0"
														aria-controls="dataTable" rowspan="1" colspan="1"
														aria-label="Age: activate to sort column ascending"
														style="width: 25%;">결재자 4</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="border text-center">hwijoefa</td>
													<td class="border text-center">siojfi</td>
													<td class="border text-center">asdfsa</td>
													<td class="border text-center">asfasd</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div> -->

						</div>
						<div class="col-md-12" id="duration"></div>

						<div class="col-md-12">
							<div class="" style="width: 100%">
								<span style="width: 20%">제목 :</span><input class="mx-4"
									type="text" name="name" id="name" style="width: 80%">
							</div>

						</div>


					</div>


				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/inc/Footer.jsp"></jsp:include>
			<!-- End of Footer -->

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
						<span aria-hidden="true">Ã</span>
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
</body>

<style>
#selector {
	border-radius: 20px;
}


</style>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>
	$(function() {
		$('.datepicker').datepicker();

		$('#selector').on("change",()=>{
			$('#duration').empty();
			if($('#selector').val()=='2'|| $('#selector').val()=='1'){
				let html = '<div class="card border-left-primary shadow h-100 py-0 my-2 px-4 mx-auto"><div class="card-body my-0">'+
				'<div class="row no-gutters align-items-center"><div class="col mx-auto"><div class=" text-center font-weight-bold text-primary text-uppercase mb-1">'+
				'기간</div><div class="row px-auto"><div class="mx-auto mb-0 font-weight-bold text-gray-800">	<input type="text" class="datepicker" id="starttime" name="starttime" width="276">'+
				'<span class="mx-2">~</span><input type="text" class="datepicker" name="endtime" width="276"></div></div></div></div></div></div>';
				$('#duration').append(html);
				console.log($('#selector').val());
			}
		});
	});
</script>
</html>