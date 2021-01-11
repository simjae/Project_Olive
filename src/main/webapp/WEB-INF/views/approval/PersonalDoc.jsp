<%-- 
    파일명: PersonalDoc.jsp
    설명: 전자결재 - 개인문서함
    작성일: 2020-12-30
    작성자: 박채연
--%>
<%-- 
    파일명: PersonalDoc.jsp
    설명: 전자결재 - 개인문서함
    작성일: 2021-01-05
    작성자: 박선우
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Project_HR</title>
<!-- 스타일시트, CDN 모듈화 -->
<jsp:include page="../inc/HeadLink.jsp"></jsp:include>
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
	width: 100px;
}

table.table tr th:last-child {
	width: 150px;
}

table.table td {
	text-align: center;
}

table.table th {
	text-align: center;
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

.nav-link :active {
	border: 2px;
}

.card {
	height: 500px;
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
					<h1 class="h3 text-gray-800">개인문서함</h1>
					<div class="card shadow py-4 bg-white my-5 ">
						<c:set var="document" value="${requestScope.document }" />
						<c:set var="arrangedDoc" value="${requestScope.arrangedDoc }" />
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><button class="nav-link active doc" value="50" id="total" data-toggle="tab" role="tab" aria-controls="home" aria-selected="true">전체 문서</button></li>
							<li class="nav-item"><button class="nav-link doc" value="10" id="doc_ready" data-toggle="tab" role="tab" aria-controls="profile" aria-selected="false">기안 문서</button></li>
							<li class="nav-item"><button class="nav-link doc" value="20" id="doc_ing" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">결재 진행</button></li>
							<li class="nav-item"><button class="nav-link doc" value="40" id="doc_cmp" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">반려 문서</button></li>
							<li class="nav-item"><button class="nav-link doc" value="30" id="doc_rej" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">결재 완료</button></li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="total" role="tabpanel" aria-labelledby="home-tab">
								<div class="table-responsive">
									<div class="table-wrapper">
										<!-- 전체 문서 -->
										<table class="table table-striped table-hover paginated">
											<thead>
												<tr>
													<th>문서 번호</th>
													<th>기안 일자</th>
													<th>제목</th>
													<th>기안자</th>
													<th>결재 양식</th>
													<th>결재 상태</th>
												</tr>
											</thead>
											<tbody id="docBody">
												<c:forEach var="list" items="${pagingList}">
													<tr>
														<td>${list.docno }</td>
														<td>
															<fmt:formatDate value="${list.writedate}" pattern="yyyy-MM-dd" />
														</td>
														<td>
															<a href="viewDocument.do?docno=${list.docno}&typeCode=${list.typeCode}" name="document">${list.title}</a>
														</td>
														<td>${list.ename}</td>
														<td>${list.typename}</td>
														<td>
														<div class="row">
															<div class="col-md-7 px-0 mx-0">
																<div class="progress">
																	<div class="progress-bar" role="progressbar" style="width:${(list.curr_Approval/list.total_Approval)*100}%;" aria-valuenow="${list.curr_Approval }" aria-valuemin="0">${list.curr_Approval }/${list.total_Approval }</div>
																</div>
															</div>
															<div class="col-md-5 px-0 mx-0">${list.statusname}</div>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<c:set var="page" value="${pagination}"></c:set>
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
													<li class="page-item">
													<a class="page-link page-btn" href="#">${paging}</a>
													</li>
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
				</div>
				<c:set var="criteria" value="${criteria}" />
				<input type="text" value="${criteria.searchType}" id="oldSearchType" hidden>
				<input type="text" value="${criteria.keyword}" id="oldKeyword" hidden>
				<input type="text" value="${criteria.searchType2}" id="oldSearchType2" hidden>
				<input type="text" value="${criteria.keyword2}" id="oldKeyword2" hidden>
				<input type="text" value="${criteria.page}" id="oldPage" hidden>
				<input type="text" value="${criteria.perPageNum}" id="oldPerPageNum" hidden>
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
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<jsp:include page="/WEB-INF/views/inc/LogOutModal.jsp"/>
	<!-- 모든 스크립트 모듈화 -->
	<jsp:include page="../inc/BottomLink.jsp"></jsp:include>
	<script src="/resources/js/Approval/personalDoc.js"></script>

<script>

</script>
</body>
</html>