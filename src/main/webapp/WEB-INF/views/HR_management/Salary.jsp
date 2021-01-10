<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Salary</title>

<!-- 스타일시트, CDN 모듈화 -->
<jsp:include page="/WEB-INF/views/inc/HeadLink.jsp"></jsp:include>
<link href="/resources/css/chaeyeon.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
					<h1 class="h3 mb-4 text-gray-800 NanumGothicB">급여명세서</h1>

					<div class="row justify-content-end mx-5">
						<div class="input-group col-mb-3">
							<form id="uploadForm" method="post" enctype="multipart/form-data">
								<input type="file" class="" id="fileInput" name="fileInput">
								<button type="button" onclick="uploadProcess()">submit</button>
							</form>
						</div>

						<div class=" col-md-1">
								<input type="button" class="form-control btn btn-info" value="양식 다운">
						</div>

						<div class="form-group col-md-2">
							<select id="inputState" class="form-control">
								<option selected>연도</option>
								<option>2020</option>
								<option>2019</option>
								<option>2018</option>
								<option>2017</option>
								<option>2016</option>
							</select>
						</div>
					</div>

					<c:set var="criteria" value="${criteria}" />
						<input type="text" value="${criteria.searchType}" id="oldSearchType" hidden>
						<input type="text" value="${criteria.keyword}" id="oldKeyword" hidden>
						<input type="text" value="${criteria.page}" id="oldPage" hidden>
						<input type="text" value="${criteria.perPageNum}" id="oldPerPageNum" hidden>
					<!-- Table -->
					<div class="row justify-content-center mx-5">
						<table id="salary_table" class="styled-table text-center">
							<thead>
								<tr>
									<th>지급일자</th>
									<th>성 명</th>
									<th>사 번</th>
									<th>부 서</th>
									<th>지급 총액</th>
									<th>공제 총액</th>
									<th>실 수령액</th>
									<th>급여 상세</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}">
								<tr>
									<td>${list.SAL_DATE}</td>
									<td>${list.ename}</td>
									<td>${list.EMPNO}</td>
									<td>${list.deptname}</td>
									<td>${list.basic_pay+list.overtime_pay+list.position_pay+list.bonus+list.maintenance_of_vehicle+list.educational_supports+list.mess_allowance}</td>
									<td>${list.income_tax + list.local_income_tax + list.health_insurance + list.care_insurance + list.employment_insurance + list.national_pension}</td>
									<td>${list.basic_pay+list.overtime_pay+list.position_pay+list.bonus+list.maintenance_of_vehicle+list.educational_supports+list.mess_allowance
										- (list.income_tax + list.local_income_tax + list.health_insurance + list.care_insurance + list.employment_insurance + list.national_pension)}</td>
									<th><input type="text" value="급여이력번호" hidden>
										<button class="table-button salaryDetail">보기</button></th>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						
							
						<c:set var="page" value="${pagination}"></c:set>
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:if test="${page.prev}">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
								</c:if>
								<c:forEach var="paging" begin="${page.startPage}" end="${page.endPage}">
								<li class="page-item"><a class="page-link" href="#">${paging}</a></li>
								</c:forEach>
								<c:if test="${page.next}">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
								</c:if>
							</ul>
						</nav>


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
	$(document).on("click", ".salaryDetail", function(){
			var windowW = 690;  // 창의 가로 길이
	        var windowH = 800;  // 창의 세로 길이
	        var left = Math.ceil((window.screen.width - windowW)/2);
	        var top = Math.ceil((window.screen.height - windowH)/2);
			window.open("${pageContext.request.contextPath}/HR_management/SalaryDetail.do?date=2020-11-10&empno=1001","_blank","top="+top+", left="+left+", height="+windowH+", width="+windowW+"resizable=no");
		});
	</script>
	
	<script>
    function uploadProcess(){
        var file = new FormData(document.getElementById('uploadForm'));
        console.log(file);
         $.ajax({
            url: "/HR_management/uploadExcelFile.do",
			dataTpye:"json",
            data: file,
            processData: false,
            contentType: false,
            type: "POST",
            success: function(data){
            }
        })
    }	
	</script>
</body>

</html>