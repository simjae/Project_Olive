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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Emp</title>
<!-- 스타일시트, CDN 모듈화 -->
<jsp:include page="/WEB-INF/views/inc/HeadLink.jsp"></jsp:include>
<style>
h1{
	text-decoration: underline;
	font-weight: bold;
	text-decoration-color: #ffe561;
	text-decoration-thickness: 5px;
}


/* 모달 테이블 */
#hr_info {
	padding: 30px 30px;
	margin:auto;
	width: 80%;
	
}
#hr_info td {
	padding: 12px 15px;
	vertical-align: middle;
}
#hr_info tr {
	text-align: left;
	font-size: 18px;
}
#hr_info tr td:first-child {
	width: 30%;
	color: #96a2af;
}
#hr_info tr td:last-child {
	width: 100%;
	border-bottom: 1px solid #ddd;
	color: #384a5e;
	font-weight: bold;
}
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

/
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
					<h1 class="h3 text-gray-800">인사정보</h1>
					<div class="card shadow bg-white my-5">
					<!-- Card Header -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-info">급여정보</h6>
								</div>
						<div class="row justify-content-end mx-5 mt-5">
							<div class="form-group col-md-2">
								<select id="inputState" class="form-control">
									<option value="">검색조건</option>
									<option value="empno">사번</option>
									<option value="ename">이름</option>
									<option value="head">본부</option>
									<option value="dept">부서</option>
								</select>
							</div>
							<form class="col-md-3 d-none d-sm-inline-block ">
								<div class="input-group">
									<input id="search_input" type="text"
										class="form-control border-0 small" placeholder="검색어를 입력해주세요"
										aria-label="Search" aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button id="search_button" class="btn btn-primary"
											type="button">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
						<div class="table-responsive text-center">
							<div class="table-wrapper">
								<table id="emptable" class="table table-striped table-hover">
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
										<c:forEach var="list" items="${emplist}">
											<tr>

												<td>
													<img src="/resources/upload/${list.PIC}" width="40" class="rounded-circle"
													onerror="this.src='/resources/img/undraw_profile_1.svg'">
												</td>
												<td>${list.EMPNO}</td>
												<td>${list.ENAME}</td>
												<td>${list.DEPTNAME}</td>
												<td>${list.POSITIONNAME}</td>
												<td></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="clearfix">

									<!-- Edit Modal HTML -->
									<div id="EmpModal" class="modal fade">
										<div class="modal-dialog">
											<div class="modal-content">
												<form>
													<div class="modal-header">
														<h4 class="modal-title">사원정보</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
													</div>
													<div class="modal-body">
														<div class="row justify-content-center">
															<div class="col-md-5 border-right">
																<div
																	class="d-flex flex-column align-items-center text-center p-3 py-5">
																	<img class="mt-5"
																		src="/resources/img/undraw_profile.svg" width="90">
																	<span class="font-weight-bold mt-3">${list.EMPNO}</span>
																	<span class="font-weight-bold mt-3">${list.ENAME}</span>
																</div>
															</div>
															<div class="col-md-7 scroll">
																<div class="p-5">
																	<div class="row mt-3">
																		<div class="col-md-10">
																			<p>사번</p>
																			<span class="font-weight-bold mt-3">${list.EMPNO}</span>
																		</div>
																	</div>
																	<div class="row mt-4">
																		<div class="col-md-10">
																			<p>이름</p>
																			<span class="font-weight-bold mt-3">${list.ENAME}</span>
																		</div>
																	</div>
																	<div class="row mt-4">
																		<div class="col-md-10">
																			<p>본부</p>
																			<span class="font-weight-bold mt-3">${list.HEADNAME}</span>
																		</div>
																	</div>
																	<div class="row mt-4">
																		<div class="col-md-10">
																			<p>부서</p>
																			<span class="font-weight-bold mt-3">${list.DEPTNAME}팀
																				: ${list.POSITIONNAME}</span>
																		</div>
																	</div>
																	<div class="row mt-4">
																		<div class="col-md-10">
																			<p>이메일</p>
																			<span class="font-weight-bold mt-3">${list.EMAIL}</span>
																		</div>
																	</div>
																	<div class="row mt-4">
																		<div class="col-md-10">
																			<p>휴대폰번호</p>
																			<span class="font-weight-bold mt-3">${list.PHONE}</span>
																		</div>
																	</div>
																</div>
															</div>
														</div>

													</div>
													<div class="modal-footer"></div>
												</form>
											</div>
										</div>
									</div>


									<c:set var="page" value="${pagination}"></c:set>
									<nav aria-label="Page navigation example">
										<ul class="pagination" id="pagination">
											<c:if test="${page.prev}">
												<!-- prev가 true라면 prev 버튼 보여주기 -->
												<li class="page-item"><a class="page-link" href="#"
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
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
														<span class="sr-only">Next</span>
												</a></li>
											</c:if>
										</ul>
									</nav>
									<c:set var="criteria" value="${criteria}" />
									<input type="text" value="${criteria.searchType}"
										id="oldSearchType" hidden> <input type="text"
										value="${criteria.keyword}" id="oldKeyword" hidden> <input
										type="text" value="${criteria.page}" id="oldPage" hidden>
									<input type="text" value="${criteria.perPageNum}"
										id="oldPerPageNum" hidden>


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
	<script>

	/* 모달 */
	$("#emptable").on("click", 'tr', function(){
		var tr = $(this);
		var td = tr.children();
		var empno = td.eq(1).text();
		console.log(empno);
		$('.modal-content .modal-body').empty();
		$.ajax(
				{
					type : "POST",
					url	 : "/HRinfo/searchByEmpno.do",
					data : {empno:empno},
					success: (data) => {
						console.log(data);
						console.log(data.EMPNO);
	                    var html="";
	                    html += "<table id='hr_info'><tbody>";
	                    html += "<tr><td>사번</td><td>"+data.EMPNO+"</td></tr>"+
	                  			"<tr><td>이름</td><td>"+data.ENAME+"</td></tr>"+
	                  			"<tr><td>본부</td><td>"+data.HEADNAME+"</td></tr>"+
	                    		"<tr><td>부서</td><td>"+data.DEPTNAME+"</td></tr>"+
	                    		"<tr><td>직위</td><td>"+data.CLASSNAME+"</td></tr>"+
	                    		"<tr><td>이메일</td><td>"+data.EMAIL+"</td></tr>"+
	                    		"<tr><td>휴대전화</td><td>"+data.PHONE+"</td></tr>"
	                    html += '</tbody></table>';      
						$('.modal-content .modal-body').append(html) 
	                    $('#EmpModal').modal('show');
					},
					error : function(error){
						console.log(error);
					}
				} 
			);  
	})
	
	

    $('#search_button').click(function() {

		console.log($('#search_input').val());
		console.log($('#inputState').val());

		var searchType = "";
		var keyword = $('#search_input').val();
		if ($('#inputState').val() == 'empno') {
			searchType = "EMPNO"
		} else if ($('#inputState').val() == 'head') {
			searchType = "HEADNAME"
		} else if ($('#inputState').val() == 'dept') {
			searchType = "DEPTNAME"
		} else if ($('#inputState').val() == 'ename') {
			searchType = "ENAME"
		}



		console.log(searchType);
		console.log(keyword);

		
		$.ajax({
			url: "/HRinfo/Emp.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType: searchType,
				keyword: keyword
			},
			success: (data) => {
				console.log(data);
				insertDatabyAjax(data);
			},error : function(error){
				console.log(error);
			}
		});
		$('#search_input').val("");
	}) 
	
	$(document).on("click", ".page-btn",function(){
		let searchType = $('#oldSearchType').val();
		let keyword = $('#oldKeyword').val();
		let perPageNum = $('#oldPerPageNum').val();
		let page = $(this)[0].text;
		console.log(page);
		$.ajax({
			url: "/HRinfo/Emp.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				console.log(data);
				insertDatabyAjax(data);
			},error : function(error){
				console.log(error);
			}
		})
	});
	
	$(document).on("click", ".page-btn-prev",function(){
		let searchType = $('#oldSearchType').val();
		let keyword = $('#oldKeyword').val();
		let perPageNum = $('#oldPerPageNum').val();
		let page = ($('#oldPage').val()-1);
		console.log(page);
		$.ajax({
			url: "/HRinfo/Emp.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				insertDatabyAjax(data);
			}
		})
	});
	
	$(document).on("click", ".page-btn-next",function(){
		let searchType = $('#oldSearchType').val();
		let keyword = $('#oldKeyword').val();
		let perPageNum = $('#oldPerPageNum').val();
		let page = (parseInt($("#oldPage").val())+1);
		console.log(page);
		$.ajax({
			url: "/HRinfo/Emp.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				insertDatabyAjax(data);
			},error : function(error){
				console.log(error);
			}
		})
	});
	
	
	
	
	function insertDatabyAjax(data){
			console.log(data.criteria);
			console.log(data.emplist);
			console.log(data.pagination);

			$('#emptable > tbody').empty();
			$.each(data.emplist, function(index, emp){
				
				$('#emptable').append(
						"<tr><td>"+
						"<img src='/resources/upload/"+emp.PIC+"' class='rounded-circle' width='40' onerror='this.src=\"/resources/img/undraw_profile_1.svg\"'>"+
						"</td><td>"+emp.EMPNO+
						"</td><td>"+emp.ENAME+
						"</td><td>"+emp.DEPTNAME+
						"</td><td>"+emp.POSITIONNAME+
						"</td><td>"+
						"</td></tr>"
					);
		
				
			});

			//수정
			$('#pagination').empty();
			let inputPaginationData = "";
			if(data.pagination.prev == true){
				inputPaginationData += "<li class='page-item'>"
									  +"<a class='page-link page-btn-prev' href='#' aria-label='Previous'>"
									  +"<span aria-hidden='true'>&laquo;</span>"
									  +"<span class='sr-only'>Previous</span>"
									  +"</a></li>"
			}
			for(let i=data.pagination.startPage; i<=data.pagination.endPage; i++){
				if(i == data.criteria.page){
				inputPaginationData += "<li class='page-item page-link'>"
				+ "<b>"
				+i +"</b></li>"
				}else{
				inputPaginationData += "<li class='page-item'>"
				+ "<a class='page-link page-btn' href='#'>" +i
				+"</a></li>"
				} 
			}
			if(data.pagination.next == true){
				inputPaginationData += "<li class='page-item'>"
									  +"<a class='page-link page-btn-next' href='#' aria-label='Next'>"
									  +"<span aria-hidden='true'>&raquo;</span>"
									  +"<span class='sr-only'>Next</span>"
									  +"</a></li>"
			}
			$('#pagination').html(inputPaginationData);
			
			
			$('#oldSearchType').val(data.criteria.searchType);
			$('#oldKeyword').val(data.criteria.keyword);
			$('#oldperPageNum').val(data.criteria.perPageNum);
			$('#oldPage').val(data.criteria.page);	  
	}


		
	</script>
</body>
</html>