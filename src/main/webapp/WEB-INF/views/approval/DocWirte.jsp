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
						<div class="col-xl-2 h3 my-auto text-gray-800">기안하기</div>
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


					<div class="col-md-12 border border-left-primary py-2"
						style="background: white;">
						<div class="row">
							<div
								class="card mb-0 mt-2 py-0 border-left-primary mx-auto col-xl-3">
								<div class="card-body py-2 px-0">
									<div class="text-center text-primary">문서종류</div>
									<div class="mx-auto w-100">
										<select class="px-4 mx-auto w-100" id="selector">
											<option value="0">선택하세요</option>
											<option value="휴가">연차신청서</option>
											<option value="출장">출장신청서</option>
										</select>

									</div>
								</div>
							</div>
							<div
								class="card mb-0 mt-2 py-0 border-left-primary mx-auto col-xl-2">
								<div class="card-body py-2 px-0">
									<div class="text-center text-primary">사번</div>
									<sec:authentication property="name" var="LoginUser" />
									<sec:authorize access="isAuthenticated()">
										<div class="text-md mt-1 text-center">${LoginUser}</div>
									</sec:authorize>
								</div>
							</div>
							<div
								class="card mb-0 mt-2 py-0 border-left-primary mx-auto col-xl-3">
								<div class="card-body py-2 px-0">
									<div class="text-center text-primary">작성일자</div>
									<c:set var="time" value="${requestScope.time}" />
									<div class="text-md mt-1 text-center">${time}</div>

								</div>
							</div>
							<div class="card my-2 py-0 border-left-primary mx-auto col-xl-2">
								<div class="card-body py-2 px-0">
									<div class="text-center text-primary">생년월일</div>
									<div class="text-md mt-1 text-center">930306</div>

								</div>
							</div>




						</div>
						<div class="row">
							<div
								class="card mt-0 mb-2 py-0 border-left-primary mx-auto col-xl-3">
								<div class="card-body py-2 px-0">
									<div class="text-center text-primary">현주소</div>
									<div class="text-md mt-1 text-center">서울 특별시 봉천동 673-3</div>
								</div>
							</div>
							<div
								class="card mt-0 mb-2 py-0 border-left-primary mx-auto col-xl-2">
								<div class="card-body py-2 px-0">
									<div class="text-center text-primary">성명</div>
									<div class="text-md mt-1 text-center">박선우</div>

								</div>
							</div>
							<div
								class="card mt-0 mb-2 py-0 border-left-primary mx-auto col-xl-3">
								<div class="card-body py-2 px-0">
									<div class="text-center text-primary">전화번호</div>
									<div class="text-md mt-1 text-center">010-2994-3513</div>
								</div>
							</div>
							<div class="col-xl-2 my-auto mx-auto">

								<button href="#"
									class="btn btn-secondary btn-icon-split mx-auto my-auto w-100">
									<span class="text">결재선 추가하기</span>
								</button>
							</div>


						</div>

						<div class="row">
							<div
								class="card my-2 py-0 border-left-primary mr-auto mx-auto col-xl-11">
								<div class="card-body py-auto">
									<div class="row">
										<div class="table-responsive py-auto">
											<div id="dataTable_wrapper"
												class="dataTables_wrapper dt-bootstrap4">
												<table class="table table-bordered dataTable my-0"
													id="dataTable" cellspacing="0" role="grid"
													aria-describedby="dataTable_info">
													<tbody class="text-center">
														<tr style="height: 25px;">
															<td scope="col" rowspan="4" colspan="1"
																style="width: 20%; padding-top: 60px;">승인</td>
															<td scope="col" rowspan="1" colspan="1"
																style="width: 20%;">결재자 1</td>
															<td scope="col" rowspan="1" colspan="1"
																style="width: 20%;">결재자 2</td>
															<td scope="col" rowspan="1" colspan="1"
																style="width: 20%;">결재자 3</td>
															<td scope="col" rowspan="1" colspan="1"
																style="width: 20%;">결재자 4</td>
														</tr>
														<tr style="height: 35px;">
															<td rowspan="2"><input class="inputbox" id="app1"
																name="app1" type="text" readonly></td>
															<td rowspan="2"><input class="inputbox" id="app2"
																name="app1" type="text" readonly></td>
															<td rowspan="2"><input class="inputbox" id="app3"
																name="app1" type="text" readonly></td>
															<td rowspan="2"><input class="inputbox" id="app4"
																name="app1" type="text" readonly></td>
														</tr>
														<tr style="height: 35px;"></tr>
														<tr>
															<td rowspan="1"></td>
															<td rowspan="1"></td>
															<td rowspan="1"></td>
															<td rowspan="1"></td>
														</tr>


													</tbody>
												</table>

											</div>
										</div>





									</div>

								</div>
							</div>
						</div>

						<div class="row" id="duration"></div>
						<div class="row">

							<div
								class="card my-2 py-2 border-left-primary mr-auto mx-auto col-xl-11">
								<div style="width: 100%;">
									<span class="text-lg" style="width: 20%;">제목 :</span><input
										class="mx-4 inputbox" type="text" name="name" id="name"
										style="width: 80%;" />
								</div>

							</div>
						</div>
						<div class="row">

							<div
								class="card my-2 py-2 border-left-primary mr-auto mx-auto col-xl-11"
								id="drop">
								<div class="col-md-12 mx-auto mt-3" id="file_add">
									<p class="mt-4" style="text-align: center;">Drag file Or
										Click to add files</p>

								</div>

								<div id="thumbnails" class="col-md-12 row mr-0 ml-0 mb-3">

								</div>
							</div>
						</div>
						<div class="row">
							<div
								class="card my-2 py-2 border-left-primary mr-auto mx-auto col-xl-11">
								<textarea class="col-md-10" id="summernote" name="context"></textarea>
							</div>
						</div>
						<input type="file" id="fileProfile" name="fileProfile" value=""
							multiple hidden>

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

<style type="text/css">
#selector {
	border-radius: 20px;
}

.inputbox {
	border: 0px;
}

.datepicker {
	border-radius: 20px;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		var $drop=$('#drop');
		var uploadFiles=[];
		$(document).on("click",".datepicker",(e)=>{
			e.preventDefault();
		$('.datepicker').datepicker();
		});

		$('#selector').on("change",()=>{
			$('#summernote').summernote("code",'');
			$('#duration').empty();
			let html='';
			if($('#selector').val()!='0' ){
				
				html = '<div class="card my-2 py-0 border-left-primary mr-auto mx-auto col-xl-11"><div class="card-body py-2">'+
				'<div class="row no-gutters align-items-center"><div class="col mx-auto"><div class=" text-center font-weight-bold text-primary text-uppercase mb-1">'+
				$('#selector').val()+' 기간</div><div class="row px-auto"><div class="mx-auto mb-0 font-weight-bold text-gray-800">	<input type="text" class="datepicker text-center" id="starttime" name="starttime" width="276">'+
				'<span class="mx-2">~</span><input type="text" class="datepicker text-center" name="endtime" width="276"></div></div></div></div></div></div>';

				
				$('#duration').append(html);

				let table='<table class="table table-bordered dataTable my-0" id="dataTable" cellspacing="0" role="grid" aria-describedby="dataTable_info">\
					<tbody class="text-center">\
						<tr style="height: 400px;">\
					<td scope="col" rowspan="1" colspan="1" style="width: 20%; padding-top: 200px;">'+$('#selector').val()+' 사유</td>\
					<td>내용</td>\
					</tr>\
					</tbody>\
					</table>'
				
				$('#summernote').summernote("code",table);
				
			}
		});

		$('#summernote').summernote( {
			maxheight: 400,
			minHeight: 300,
			lang: "ko-KR",	
			placeholder: '최대 2048자까지 쓸 수 있습니다',
			codemirror: { // codemirror options
	    	theme: 'monokai'
    		
    		
	  		}
		
			
		});
		
		$drop.on("dragenter",function(e){
			$(this).addClass('drag-over');
		}).on("dragleave",function(e){
			$(this).removeClass('drag-over');
		}).on("dragover",function(e){
			e.stopPropagation();
			e.preventDefault();
		}).on("drop",function(e){
			var file= e.originalEvent.dataTransfer.files;
			e.preventDefault();
	   		$("input[type='file']")
	        .prop("files", file)  // put files into element
	        .closest("form")
	        .submit();  // autosubmit as well
			$(this).removeClass('drag-over');
			console.log(file);
			thumbnail(file);
		});
		
		function thumbnail(files){
	
			$('#thumbnails').empty();
			preview(files[0],files.length-1);
			console.log(files);
			
		}

		function preview(file,idx){
			let reader = new FileReader();
			reader.onload =(function(f,idx){
					return function(e){
						console.log(f);
						var div = 
							'<div class="row mx-2">\
								<div class="my-auto">'+f.name+'</div>\
								<button class="btn btn-circle btn-sm btn-danger mx-2 close" >\
								<i class="fas fa-trash"></i>\
								</button>\
							</div>';
							$('#thumbnails').append(div);
					};
			})(file,idx);
			reader.readAsDataURL(file);
		}
	
		$('#thumbnails').on("click",".close",function(e){
			e.preventDefault();
			var $target = $(e.target);
			var idx=$target.attr('data-idx');
			/* uploadFiles[idx].upload='disable'; */
			$target.parent().parent().remove();
			
		})

		$('#file_add').click(function() {
		    console.log('fileadd');
		    $("#fileProfile").click();
		});

		var input = document.querySelector('input[name="fileProfile"]');
	    input.addEventListener('change',(function(e){
	    	
	    	var file = input.files;
	        console.log($("#fileProfile").val());
	    	thumbnail(file);
	        $("#fileProfile").val();
	    	console.log(file);
			
			
		}));
	});
</script>
</html>