<%-- 
    파일명: DocWrite.jsp
    설명: 전자결재 홈 페이지
    작성일: 2020-12-29
    작성자: 박선우
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin 2 - Write</title>
<jsp:include page="../inc/HeadLink.jsp"></jsp:include>
<style type="text/css">
.modal-flexbox {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-between;
	align-items: center;
}

.flexbox-items {
	max-width: 120px;
	min-height: 50px;
	padding: 1.1rem 1.1rem;
	padding-bottom: 0;
}

#nono {
	color: red;
}

.round {
	border-radius: 10px;
}

#typeName {
	height: 50px;
	font-size: 30px;
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
					<div class="row">
						<div class="col-xl-2 h3 my-auto text-gray-800">
							<span class="py-auto">양식 추가하기</span> <span>
								<button id="add" class="btn btn-success btn-icon-split">
									<span class="icon"> <i class="fas fa-plus"></i></span>
								</button>
							</span>
						</div>
						<div class="col-xl-10">
							<div class="d-flex flex-row-reverse mr-0">
								<div id="submitdiv" style="display: none">
									<button id="submit" class="btn btn-warning">
										<span class="icon"> <img src="/resources/img/formupload.png"></span>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div style="display: none;" id="addform">
						<form action="" method="post" enctype="multipart/form-data" id="form">
							<div class="col-md-12 border border-primary py-2 mt-2" style="background: white;">
								<div class="container-fluid">
									<div class="container-fluid">
										<div class="row">
											<div class="card mt-0 mb-2 mx-auto py-0 col-xl-11">
												<div class="card-body py-2 px-0">
													<div class="text-center text-primary">문서 이름</div>
													<div class="mx-auto w-100">
														<input class="inputbox col-xl-12 text-center" type="text" id="typeName" name="typeName">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class ="container col-md-11" id="check"></div>
								<div class="row">
									<div class="card my-2 py-2 mr-auto mx-auto col-xl-11">
										<textarea class="col-md-10" id="summernote" name="content"></textarea>
									</div>
								</div>
							</div>
						</form>
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
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	</div>
	<!-- Logout Modal-->
	<jsp:include page="/WEB-INF/views/inc/LogOutModal.jsp" />
	<!-- 모든 스크립트 모듈화 -->
	<jsp:include page="../inc/BottomLink.jsp"></jsp:include>
</body>
<style type="text/css">
.inputbox {
	border: 0px;
	outline: none;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">


$(function() {

	$('#submit').on("click",()=>{
		$('#form').submit();
		})
	 
	 
	 $('#add').on("click",()=>{
		 $('#submitdiv').show("blind","slow");
		 $('#add').toggle();
		 $('#addform').show("fade","slow");
	 })
	
		
		
		$('#summernote').summernote( {
			maxheight: 400,
			minHeight: 300,
			lang: "ko-KR",	
			placeholder: '양식을 등록해 주세요',
			codemirror: { // codemirror options
	    	theme: 'monokai'
    		
    		
	  		}
		});

	$('#typeName').on("keyup",function(){
		let typeName = $(this).val();
		$.ajax({
			url:"checkTypeName.do",
			type:"POST",
			data:{typeName:typeName},
			success:function(data){
				$('#check').empty();
				console.log(data);
				let check = (data>0) ? '<div style="color:red;">이미 존재하는 양식이름입니다.</div>' : '<div style="color:green;">등록 가능한 양식이름입니다.</div>';
				$('#check').append(check);
				}
		
			});
		})
		

		
	});
</script>
</html>