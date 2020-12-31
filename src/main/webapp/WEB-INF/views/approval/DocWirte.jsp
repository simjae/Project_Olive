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
									<button id="cancle" class="btn btn-danger btn-icon-split my-auto mr-0">
										<span class="icon text-white-50"> <i class="fas fa-trash"></i>
										</span> <span class="text">취소 하기</span>
									</button>
								</div>
								<div class="p-2">
									<button id="submit" class="btn btn-success btn-icon-split">
										<span class="icon text-white-50"> <i class="fas fa-check"></i>
										</span> <span class="text">기안 하기</span>
									</button>
								</div>
								<div class="p-2">
									<button id="preview" class="btn btn-primary btn-icon-split" data-toggle="modal" data-target="#previewModal">
										<span class="icon text-white-50"> <i class="fas fa-check"></i>
										</span> <span class="text">미리 보기</span>
									</button>
								</div>
							</div>
						</div>
					</div>
					<form>
						<div class="col-md-12 border border-primary  py-2" style="background: white;">
							<div class="row">
								<div class="card mb-0 mt-2 py-0 mx-auto col-xl-3">
									<div class="card-body py-2 px-0">
										<div class="text-center text-primary">문서종류</div>
										<div class="mx-auto w-100">
											<select class="px-4 mx-auto w-100" id="selector">
												<option value="일반 기안서">일반 기안서</option>
												<option value="휴가 기안서">연차 신청서</option>
												<option value="출장 기안서">출장 신청서</option>
											</select>
										</div>
									</div>
								</div>
								<div class="card mb-0 mt-2 py-0   mx-auto col-xl-2">
									<div class="card-body py-2 px-0">
										<div class="text-center text-primary">사번</div>
										<sec:authentication property="name" var="LoginUser" />
										<sec:authorize access="isAuthenticated()">
											<div class="text-md mt-1 text-center">
												<input type="text" class="inputbox text-center w-100" value="${LoginUser}" id="empno" readonly>
											</div>
										</sec:authorize>
									</div>
								</div>
								<div class="card mb-0 mt-2 py-0   mx-auto col-xl-3">
									<div class="card-body py-2 px-0">
										<div class="text-center text-primary">작성일자</div>
										<c:set var="time" value="${requestScope.time}" />
										<div class="text-md mt-1 text-center">
											<input type="text" class="inputbox text-center w-100" value="${time}" id="writedate" readonly>
										</div>
									</div>
								</div>
								<div class="card my-2 py-0   mx-auto col-xl-2">
									<div class="card-body py-2 px-0">
										<div class="text-center text-primary">생년월일</div>
										<div class="text-md mt-1 text-center">
											<input type="text" class="inputbox text-center w-100" value="930306" id="birth" readonly>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="card mt-0 mb-2 py-0   mx-auto col-xl-3">
									<div class="card-body py-2 px-0">
										<div class="text-center text-primary">현주소</div>
										<div class="text-md mt-1 text-center">
											<input type="text" class="inputbox text-center w-100" value="서울특별시 봉천동 673-3" id="addr" readonly>
										</div>
									</div>
								</div>
								<div class="card mt-0 mb-2 py-0   mx-auto col-xl-2">
									<div class="card-body py-2 px-0">
										<div class="text-center text-primary">성명</div>
										<div class="text-md mt-1 text-center">
											<input type="text" class="inputbox text-center w-100" value="박선우" id="ename" readonly>
										</div>
									</div>
								</div>
								<div class="card mt-0 mb-2 py-0   mx-auto col-xl-3">
									<div class="card-body py-2 px-0">
										<div class="text-center text-primary">전화번호</div>
										<div class="text-md mt-1 text-center">
											<input type="text" class="inputbox text-center w-100" value="010-2994-3513" id="emptel" readonly>
										</div>
									</div>
								</div>
								<div class="col-xl-2 my-auto mx-auto">
									<a data-toggle="modal" data-target="#approverModal" class="btn btn-secondary btn-icon-split mx-auto my-auto w-100">
										<span class="text">결재선 추가하기</span>
									</a>
								</div>
							</div>
							<div class="row">
								<div class="card my-2 py-0   mr-auto mx-auto col-xl-11">
									<div class="card-body py-auto">
										<div class="row">
											<div class="table-responsive py-auto">
												<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
													<table class="table table-bordered dataTable my-0" id="dataTable" cellspacing="0" role="grid" aria-describedby="dataTable_info">
														<tbody class="text-center">
															<tr style="height: 25px;">
																<td scope="col" rowspan="4" colspan="1" style="width: 20%; padding-top: 60px;">승인</td>
																<td scope="col" rowspan="1" colspan="1" style="width: 20%;">결재자 1</td>
																<td scope="col" rowspan="1" colspan="1" style="width: 20%;">결재자 2</td>
																<td scope="col" rowspan="1" colspan="1" style="width: 20%;">결재자 3</td>
																<td scope="col" rowspan="1" colspan="1" style="width: 20%;">결재자 4</td>
															</tr>
															<tr style="height: 35px;">
																<td rowspan="2">
																	<input class="inputbox" id="app1" name="app1" type="text" readonly>
																</td>
																<td rowspan="2">
																	<input class="inputbox" id="app2" name="app1" type="text" readonly>
																</td>
																<td rowspan="2">
																	<input class="inputbox" id="app3" name="app1" type="text" readonly>
																</td>
																<td rowspan="2">
																	<input class="inputbox" id="app4" name="app1" type="text" readonly>
																</td>
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
								<div class="card my-2 py-2   mr-auto mx-auto col-xl-11">
									<div style="width: 100%;">
										<span class="text-lg" style="width: 20%;">제목 :</span>
										<input class="mx-4 inputbox" type="text" name="title" id="title" style="width: 80%;" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="card my-2 py-2   mr-auto mx-auto col-xl-11" id="drop">
									<div class="col-md-12 mx-auto mt-3" id="file_add">
										<p class="mt-4" style="text-align: center;">Drag file Or Click to add files</p>
									</div>
									<div id="thumbnails" class="col-md-12 row mr-0 ml-0 mb-3"></div>
								</div>
							</div>
							<div class="row">
								<div class="card my-2 py-2   mr-auto mx-auto col-xl-11">
									<textarea class="col-md-10" id="summernote" name="content"></textarea>
								</div>
							</div>
							<input type="file" id="fileProfile" name="fileProfile" value="" multiple hidden>
						</div>
					</form>
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
	<!-- 미리보기 모달 -->
	<div class="modal fade" id="previewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl overflow-auto" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">미리보기</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body " id="preview-modal-body"></div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 결재선 지정 모달 -->
	<div class="modal fade" id="approverModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg overflow-auto" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ModalLabel">결재선 추가하기</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body" id="approver-modal-body">
					<div class="horizontalTree mb-4" style="height: 500px;">
						<div class="col-lg-6 border border-secondary h-50 h-100 ">
							<ul>
								<li><span class="headquters"><img src="https://img.icons8.com/office/16/000000/folder-invoices--v1.png">경영지원 본부</span>
									<ul class="grpTeam" style="display: block;">
										<li class="team">회계팀</li>
										<li class="team">경제</li>
									</ul></li>
								<li><span class="headquters"><img src="https://img.icons8.com/office/16/000000/folder-invoices--v1.png">개발 본부</span>
									<ul class="grpTeam" style="display: block">
										<li class="team">개발 1팀</li>
										<li class="team">개발 2팀</li>
									</ul></li>
								<li><span class="headquters"><img src="https://img.icons8.com/office/16/000000/folder-invoices--v1.png">전략 본부</span>
									<ul class="grpTeam" style="display: block">
										<li class="team">미래전략 1팀</li>
										<li class="team">미래전략 2팀</li>
									</ul></li>
							</ul>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 결재선 지정 모달 -->
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top">
			<i class="fas fa-angle-up"></i>
		</a>
	</div>
	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
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

.modal-body ul {
	list-style-type: none;
}

.modal-body ul img {
	padding-bottom: 7px;
	padding-right: 7px;
}

.team {
	list-style-image: none;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		var $drop=$('#drop');
		var uploadFiles=[];
		
		 $('.headquters').on("click",()=>{
			 console.log('qwer');
			 
			 $(this).siblings('.grpTeam').toggle()
 				
			 }); 
		 
		 

		$('#preview').on("click",()=>{
			$('#preview-modal-body').empty();
			let type = $('#selector').val().split(' ');
			let html='<div id="hw_dext_default_style"\
				style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
			<div\
				style="margin: 0px; padding: 0px; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8;">\
				<h1\
					style="text-align: center; padding: 30px 0px; font-size: 26px; font-family: &amp; quot; 맑은 고딕&amp;quot;; line-height: 1.8;">'+$('#selector').val()+'</h1>\
				<p>\
					\
				</p>\
				<div class="list"\
					style="margin: 0px; padding: 0px; float: left; font-size: 8pt; width: 272px; color: rgb(103, 103, 103); font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.4px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">\
					<dl style="margin: 0px; padding: 0px; list-style: none;">\
						<dt\
							style="margin: 0px; padding: 0px 0px 0.32cm; float: left; clear: both; width: 106px; font-weight: bold; color: rgb(18, 18, 18);">문서\
							번호</dt>\
						<dd\
							style="margin: 0px; padding: 0px 0px 0.32cm; float: left; width: 151px; color: rgb(18, 18, 18);"></dd>\
						<dt\
							style="margin: 0px; padding: 0px 0px 0.32cm; float: left; clear: both; width: 106px; font-weight: bold; color: rgb(18, 18, 18);">기안\
							부서</dt>\
						<dd\
							style="margin: 0px; padding: 0px 0px 0.32cm; float: left; width: 151px; color: rgb(18, 18, 18);">'+'부서명'+'</dd>\
						<dt\
							style="margin: 0px; padding: 0px 0px 0.32cm; float: left; clear: both; width: 106px; font-weight: bold; color: rgb(18, 18, 18);">기안자</dt>\
						<dd\
							style="margin: 0px; padding: 0px 0px 0.32cm; float: left; width: 151px; color: rgb(18, 18, 18);">'+$('#ename').val()+'</dd>\
						<dt\
							style="margin: 0px; padding: 0px 0px 0.32cm; float: left; clear: both; width: 106px; font-weight: bold; color: rgb(18, 18, 18);">기안\
							일자</dt>\
						<dd\
							style="margin: 0px; padding: 0px 0px 0.32cm; float: left; width: 151px; color: rgb(18, 18, 18);">'+$('#writedate').val()+'</dd>\
					</dl>\
				</div>\
				<div class="approval"\
					style="margin: 0px; padding: 0px; float: right; width: 365px; color: rgb(103, 103, 103); font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.4px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">\
					<h2\
						style="margin: 0px; padding: 0px 0px 0.2cm; font-size: 8pt; color: rgb(18, 18, 18);">결재선</h2>\
					<table\
						style="border-collapse: collapse; width: 364px; table-layout: fixed; border-width: 1px; border-style: solid; border-color: rgb(89, 89, 89) rgb(102, 102, 102);">\
						<colgroup>\
							<col>\
							<col>\
							<col>\
							<col>\
							<col>\
						</colgroup>\
						<tbody>\
							<tr>\
								<th scope="col"\
									style="margin: 0px; padding: 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 25px; font-weight: normal; border-left: 0px; word-break: break-all;">결재자 1</th>\
								<th scope="col"\
									style="margin: 0px; padding: 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 25px; font-weight: normal; border-left: 1px solid rgb(102, 102, 102); word-break: break-all;"> 결재자 2\
									</th>\
								<th scope="col"\
									style="margin: 0px; padding: 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 25px; font-weight: normal; border-left: 1px solid rgb(102, 102, 102); word-break: break-all;">결재자 3\
									</th>\
								<th scope="col"\
									style="margin: 0px; padding: 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 25px; font-weight: normal; border-left: 1px solid rgb(102, 102, 102);  border-right:1px solid rgb(102,102,102); word-break: break-all;">결재자 4\
									</th>\
							</tr>\
							<tr>\
								<td class="stamp"\
									style="margin: 0px; padding: 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 49px; text-align: center; border-top: 1px solid rgb(102, 102, 102); border-left: 0px; border-bottom: 1px solid rgb(102, 102, 102); line-height: 10pt; word-break: break-all; vertical-align: middle;"><p>\
										<br>\
									</p></td>\
								<td class="stamp"\
									style="margin: 0px; padding: 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 49px; text-align: center; border-top: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-bottom: 1px solid rgb(102, 102, 102); line-height: 10pt; word-break: break-all; vertical-align: middle;"><p>\
										<br>\
									</p></td>\
								<td class="stamp"\
									style="margin: 0px; padding: 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 49px; text-align: center; border-top: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-bottom: 1px solid rgb(102, 102, 102); line-height: 10pt; word-break: break-all; vertical-align: middle;"><p>\
										<br>\
									</p></td>\
								<td class="stamp"\
									style="margin: 0px; padding: 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 49px; text-align: center; border-top: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-bottom: 1px solid rgb(102, 102, 102); border-right:1px solid rgb(102,102,102); line-height: 10pt; word-break: break-all; vertical-align: middle;"><p>\
										<br>\
									</p></td>\
							</tr>\
							<tr>\
								<td\
									style="margin: 0px; padding: 0.08cm 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 22px; text-align: center; border-top: 1px solid rgb(102, 102, 102); border-left: 0px; border-bottom: 1px solid rgb(89, 89, 89); line-height: 10pt; word-break: break-all;">'+$('#app1').val()+'</td>\
								<td\
									style="margin: 0px; padding: 0.08cm 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 22px; text-align: center; border-top: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-bottom: 1px solid rgb(89, 89, 89); line-height: 10pt; word-break: break-all;">'+$('#app2').val()+'\
										<br>\
									</td>\
								<td\
									style="margin: 0px; padding: 0.08cm 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 22px; text-align: center; border-top: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-bottom: 1px solid rgb(89, 89, 89); line-height: 10pt; word-break: break-all;">'+$('#app3').val()+'</td>\
								<td\
									style="margin: 0px; padding: 0.08cm 0px; font-size: 8pt; font-family: &amp; quot; 맑은 고딕&amp;quot; , &amp; quot; Malgun Gothic&amp;quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 22px; text-align: center; border-top: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-bottom: 1px solid rgb(89, 89, 89); border-right:1px solid rgb(102,102,102);  line-height: 10pt; word-break: break-all;">'+$('#app4').val()+'</td>\
							</tr>\
						</tbody>\
					</table>\
				</div>\
				<p\
					style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
					<meta charset="utf-8">\
					&nbsp;\
				</p>\
				<div class="list"\
					style="margin: 0px; padding: 0px; float: left; font-size: 8pt; width: 272px; font-family: &amp; quot; 맑은 고딕&amp;quot;; line-height: 1.8;">\
					<dl style="margin: 0px; padding: 0px; list-style: none;">\
						<br>\
					</dl>\
				</div>\
				<p\
					style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
					<br>\
				</p>\
				<br>\
				<br>\
				<br>\
				<br>\
				<table\
					style="width: 100%; border-collapse: collapse; border: 1px solid #cdcdcd; margin: 20px 0 0; padding: 0">\
					<tbody>\
						<tr>\
							<td\
								style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 136px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">소속</p>\
							</td>\
							<td colspan="2"\
								style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 312px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
									'+'부서'+'\
								</p></td>\
							<td\
								style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 143px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">직위</p>\
							</td>\
							<td colspan="2"\
								style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 378px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
									'+'직위'+'\
								</p></td>\
						</tr>\
						<tr>\
							<td\
								style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 136px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">성명</p>\
							</td>\
							<td\
								style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 133px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
									'+$('#ename').val()+'\
								</p></td>\
							<td\
								style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 156px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">생년월일</p>\
							</td>\
							<td\
								style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 143px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
									<br>\
								</p></td>\
							<td\
								style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 154px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">전화번호</p>\
							</td>\
							<td\
								style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 219px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
									'+$('#tel').val()+'\
								</p></td>\
						</tr>\
						<tr>\
							<td\
								style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 136px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">현주소</p>\
							</td>\
							<td colspan="5"\
								style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 852px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
									'+$("#addr").val()+'</p></td></tr>';
						if($('#selector').val()=='휴가 기안서' || $('#selector').val()=='출장 기안서'){

							
							
						html+='<tr>\
							<td\
								style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 136px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">'+type[0]+'기간</p>\
							</td>\
							<td colspan="5"\
								style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 852px;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">'+$('#starttime').val()+'\
									 ~ '+$('#endtime').val()+'</p></td>\
						</tr>';
						};
					
						html +=	'<tr>\
							<td colspan="6"\
								style="padding: 10px 0; border: 1px solid #cdcdcd; text-align: center; font-weight: bold;"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
									<br>\
								</p></td>\
						</tr>\
						<tr>\
							<td colspan="6"\
								style="padding: 10px; border: 1px solid #cdcdcd; height: 300px; vertical-align: top"><p\
									style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
									'+$('#summernote').summernote("code")+'\
								</p></td>\
						</tr>\
						<tr>\
							<td colspan="6" style="padding: 10px 0; border: 0;"><table\
									style="width: 100%; border-collapse: collapse; margin: 0; padding: 0">\
									<tbody>\
										<tr>\
											<td colspan="3"\
												style="padding: 10px; text-align: center; border: 0;"><p\
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">상기\
													명 본인은 위와 같은 사유로 제출합니다.</p></td>\
										</tr>\
										<tr>\
											<td colspan="3"\
												style="padding: 80px 0 40px; text-align: center; border: 0;"><p\
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">'+$('#writedate').val()+'\
													</p></td>\
										</tr>\
										<tr>\
											<td\
												style="padding: 10px; border: 0px; text-align: right; width: 632px;"><p\
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">신청인:</p>\
											</td>\
											<td style="padding: 10px; border: 0px; width: 78px;"><p\
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">\
													'+$('#ename').val()+'\
												</p></td>\
											<td style="padding: 10px; border: 0px; width: 67px;"><p\
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">(인)</p>\
											</td>\
										</tr>\
										<tr>\
											<td colspan="3"\
												style="padding: 80px 0 10px; border: 0; font-weight: bold; font-size: 20px; text-align: center"><p\
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 20px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">OLIVE</p>\
											</td>\
										</tr>\
									</tbody>\
								</table></td>\
						</tr>\
					</tbody>\
				</table>\
			</div>\
		</div>';
					$('#preview-modal-body').append(html);
			});


		
		$(document).on("click",".datepicker",(e)=>{
			e.preventDefault();
		$('.datepicker').datepicker();
		});

		$('#selector').on("change",()=>{
			$('#summernote').summernote("code",'');
			$('#duration').empty();
			let html='';
			if($('#selector').val()!='0' ){
				
				html = '<div class="card my-2 py-0   mr-auto mx-auto col-xl-11"><div class="card-body py-2">'+
				'<div class="row no-gutters align-items-center"><div class="col mx-auto"><div class=" text-center font-weight-bold text-primary text-uppercase mb-1">'+
				$('#selector').val()+' 기간</div><div class="row px-auto"><div class="mx-auto mb-0 font-weight-bold text-gray-800">	<input type="text" class="datepicker text-center" id="starttime" name="starttime" width="276">'+
				'<span class="mx-2">~</span><input type="text" class="datepicker text-center" name="endtime" id="endtime" width="276"></div></div></div></div></div></div>';

				
				$('#duration').append(html);

				let table='<table class="table table-bordered dataTable my-0" id="dataTable" cellspacing="0" role="grid" aria-describedby="dataTable_info">\
					<tbody class="text-center">\
						<tr style="height: 400px;">\
					<td scope="col" rowspan="1" colspan="1" style="width: 20%; padding-top: 200px;">'+$('#selector').val().split(' ')[0]+' 사유</td>\
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