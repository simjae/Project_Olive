<%-- 
    파일명: ProgressDoc.jsp
    설명: 전자결재 - 결재진행함
    작성일: 2020-12-30
    작성자: 박채연
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}
table.table td {
	text-align:center;
}
table.table th {
	text-align:center;
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
					<h1 class="h3 text-gray-800">결재진행함</h1>
					<div class="card shadow py-4 bg-white my-5">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><button class="nav-link active doc" value="50" id="total" data-toggle="tab" role="tab" aria-controls="home" aria-selected="true">전체 문서</button></li>
							<li class="nav-item"><button class="nav-link doc" value="10" id="app_ready" data-toggle="tab" role="tab" aria-controls="profile" aria-selected="false">기안 문서</button></li>
							<li class="nav-item"><button class="nav-link doc" value="20" id="app_ing" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">결재 진행</button></li>
							<li class="nav-item"><button class="nav-link doc" value="30" id="app_cmp" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">결재 완료</button></li>
							<li class="nav-item"><button class="nav-link doc" value="40" id="app_rej" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">반려 문서</button></li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
								<c:set var="appdoc" value="${requestScope.appdoc}" />
								<div class="table-responsive">
									<div class="table-wrapper">
										<table class="table table-striped table-hover">
											<thead>
												<tr>
													<th>문서번호</th>
													<th>분류</th>
													<th>제목</th>
													<th>기안자</th>
													<th>결재 양식</th>
													<th>기안날짜</th>
													<th>결재날짜</th>
													<th>결재 상태</th>
												</tr>
											</thead>
											<tbody id="appBody">
											<c:forEach var="list" items="${appdoc}">
												<tr>
													<td>${list.docno}</td>
													<c:if test="${list.app_Check == '1'}">
														<td>완료</td>
													</c:if>
													<c:if test="${list.app_Check=='0'}">
														<td>대기</td>
													</c:if>
													<td>
														<a href="viewDocument.do?docno=${list.docno}&typeCode=${list.typeCode}" name="document">${list.title}</a>
													</td>
													<td>${list.ename }</td>
													<td>${list.typeName}</td>
													<td>
														<fmt:formatDate value="${list.writedate}" pattern="yyyy-MM-dd" />
													</td>
													<td>
													<fmt:formatDate value="${list.app_Date}" pattern="yyyy-MM-dd" />
													</td>
													<td>
														<div class="progress">
															<div class="progress-bar" role="progressbar" style="width:${(list.curr_Approval/list.total_Approval)*100}%;" aria-valuenow="${list.curr_Approval }" aria-valuemin="0" aria-valuemax=>${list.curr_Approval }/${list.total_Approval }</div>
														</div>
													</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
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
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 모든 스크립트 모듈화 -->
	<jsp:include page="../inc/BottomLink.jsp"></jsp:include>
	<script type="text/javascript">
	//결재할 문서 바뀌는 부분  
	$('.doc').on("change",function(){
		let html = '';
		$.ajax({
			url:"getArrangedAppList.do",
			dataType: "json",
			mehtod:"POST", 
			contentType: "application/json; charset=utf-8",
			data:{
				statusCode:$(this).val()
				},
			success:function(data){
				$('#appBody').empty();
				console.log(data);
				$.each(data,(index,item)=>{
					let time = new Date(item.writedate);
					let html='<tr><td>'+item.docNo+'</td>';
					
					
						if(item.app_Check == '1') {
							html+='<td>완료</td>';
						}else if(item.app_Check=='0'){
							html+='<td>대기</td>';
							}
					
					html+='<td>'+item.title+'</td>\
						<td>'+item.ename+'</td>\
						<td>'+time.getFullYear() + '-' +('0' + (time.getMonth()+1)).slice(-2)+ '-' +  ('0' + time.getDate()).slice(-2) +'</td>\
						<td>\
						<div class="progress">\
						<div class="progress-bar" role="progressbar" aria-valuenow="'+item.curr_Approval +'" aria-valuemin="0" aria-valuemax="'+item.total_Approval +'">'+item.curr_Approval/item.total_Approval+'</div>\
						</div>\
						</td>\
						</tr>';
					$('#appBody').append(html);
				});
				
			}
			

			});		
		
		console.log(html);
	});
	</script>
</body>
</html>