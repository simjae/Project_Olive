<%-- 
    파일명: ProgressDoc.jsp
    설명: 전자결재 - 결재진행함
    작성일: 2020-12-30
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

<title>Project_HR</title>

<!-- 스타일시트, CDN 모듈화 -->
<jsp:include page="../inc/HeadLink.jsp"></jsp:include>

<style>


	.table-wrapper {
		min-width: 1000px;
        background: #fff;
        padding: 20px 25px;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
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
							  <li class="nav-item">
							    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">전체 문서</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">기안 문서</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">결재 진행</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">반려 문서</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">결재 완료</a>
							  </li>
						</ul>
						<div class="tab-content" id="myTabContent">
						  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
							  <div class="table-responsive">
								<div class="table-wrapper">
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th>기안 일자</th>
												<th>문서 번호</th>
												<th>결재 양식</th>
												<th>제목</th>
												<th>기안자</th>
												<th>결재자</th>
												<th>결재 상태</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>2020.02.02</td>
												<td>17</td>
												<td>연차품의서</td>
												<td>휴가</td>
												<td>백희승</td>
												<td>박채연</td>
												<td>기안</td>
											</tr>
											<tr>
												<td>2020.03.18</td>
												<td>10</td>
												<td>출장어쩌구</td>
												<td>미국 출장</td>
												<td>정민찬</td>
												<td>박채연</td>
												<td>승인</td>
											</tr>
											<tr>
												<td>2020.09.12</td>
												<td>30</td>
												<td>기본품의서</td>
												<td>2020_홍보기획</td>
												<td>박선우</td>
												<td>심재형</td>
												<td>기안</td>
											</tr>
											<tr>
												<td>2020.03.18</td>
												<td>10</td>
												<td>출장어쩌구</td>
												<td>영국 출장</td>
												<td>정민찬</td>
												<td>박채연</td>
												<td>승인</td>
											</tr>				
											<tr>
												<td>2020.02.02</td>
												<td>17</td>
												<td>연차품의서</td>
												<td>출산 휴가</td>
												<td>백희승</td>
												<td>박채연</td>
												<td>기안</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>  
						  </div>
						  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
						  	<div class="table-responsive">
								<div class="table-wrapper">
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th>기안 일자</th>
												<th>문서 번호</th>
												<th>결재 양식</th>
												<th>제목</th>
												<th>기안자</th>
												<th>결재자</th>
												<th>결재 상태</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>2020.02.02</td>
												<td>17</td>
												<td>연차품의서</td>
												<td>휴가</td>
												<td>백희승</td>
												<td>박채연</td>
												<td>기안</td>
											</tr>
											<tr>
												<td>2020.03.18</td>
												<td>10</td>
												<td>출장어쩌구</td>
												<td>미국 출장</td>
												<td>정민찬</td>
												<td>박채연</td>
												<td>승인</td>
											</tr>
											<tr>
												<td>2020.09.12</td>
												<td>30</td>
												<td>기본품의서</td>
												<td>2020_홍보기획</td>
												<td>박선우</td>
												<td>심재형</td>
												<td>기안</td>
											</tr>
											<tr>
												<td>2020.03.18</td>
												<td>10</td>
												<td>출장어쩌구</td>
												<td>영국 출장</td>
												<td>정민찬</td>
												<td>박채연</td>
												<td>승인</td>
											</tr>				
											<tr>
												<td>2020.02.02</td>
												<td>17</td>
												<td>연차품의서</td>
												<td>출산 휴가</td>
												<td>백희승</td>
												<td>박채연</td>
												<td>기안</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>  
						  </div>
						  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
						  	<div class="table-responsive">
								<div class="table-wrapper">
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th>기안 일자</th>
												<th>문서 번호</th>
												<th>결재 양식</th>
												<th>제목</th>
												<th>기안자</th>
												<th>결재자</th>
												<th>결재 상태</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>2020.02.02</td>
												<td>17</td>
												<td>연차품의서</td>
												<td>휴가</td>
												<td>백희승</td>
												<td>박채연</td>
												<td>기안</td>
											</tr>
											<tr>
												<td>2020.03.18</td>
												<td>10</td>
												<td>출장어쩌구</td>
												<td>미국 출장</td>
												<td>정민찬</td>
												<td>박채연</td>
												<td>승인</td>
											</tr>
											<tr>
												<td>2020.09.12</td>
												<td>30</td>
												<td>기본품의서</td>
												<td>2020_홍보기획</td>
												<td>박선우</td>
												<td>심재형</td>
												<td>기안</td>
											</tr>
											<tr>
												<td>2020.03.18</td>
												<td>10</td>
												<td>출장어쩌구</td>
												<td>영국 출장</td>
												<td>정민찬</td>
												<td>박채연</td>
												<td>승인</td>
											</tr>				
											<tr>
												<td>2020.02.02</td>
												<td>17</td>
												<td>연차품의서</td>
												<td>출산 휴가</td>
												<td>백희승</td>
												<td>박채연</td>
												<td>기안</td>
											</tr>
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