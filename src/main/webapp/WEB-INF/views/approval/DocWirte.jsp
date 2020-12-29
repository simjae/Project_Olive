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
					<h1 class="h3 mb-4 text-gray-800">기안하기</h1>

					<div class="col-md-12 mx-auto border">
						<div class="row">
							<div class="col-md-4 my-2 ml-4">
								<div class="col-md-12 border">
									<div class="row">
										<div class=" text-lg my-2 mx-auto">문서 종류</div>
										<div class="my-auto mx-auto">
											<select class="px-4" id="selector">
												<option selected>선택하세요</option>
												<option>연차신청서</option>
												<option>출장 신청서</option>
											</select>

										</div>
									</div>
								</div>
							</div>
							<%-- <div class="col-md-3 my-2 mx-auto border">
								<div class="row">
								<sec:authentication property="name" var="LoginUser" />
								<sec:authorize access="isAuthenticated()">
									<div class="text-lg my-2 mx-auto">
										작성자 : ${LoginUser}
									</div>
								</sec:authorize>
								</div>
							
							</div>
							<c:set var="time" value="${requestScope.time }"/>
							<div class="col-md-3 my-2 mx-auto border">
							
							<div class="text-lg my-2 mx-auto">
							기안 일자 : ${time} 
							</div>
							
							
							</div> --%>
							<div class="position-relative">
								<div class="position-absolute top-50 end-0">

									<button href="#"
										class="btn btn-success btn-icon-split">
										<span class="icon text-white-50"> <i
											class="fas fa-check"></i>
										</span> <span class="text">기안 하기</span>
									</button>

								</div>
								<div class="position-absolute top-50 end-0">

									<button href="#"
										class="btn btn-danger btn-icon-split my-auto mx-2">
										<span class="icon text-white-50"> <i
											class="fas fa-trash"></i>
										</span> <span class="text">취소 하기</span>
									</button>
								</div>
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

</html>