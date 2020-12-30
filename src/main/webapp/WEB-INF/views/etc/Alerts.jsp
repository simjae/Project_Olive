<!-- 
    파일명 : Salary.jsp
    설명 : 인사정보 - 급여명세 페이지
    작성일 : 2020-12-28
    작성자 : 박채연
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Salary</title>

   <!-- 스타일시트, CDN 모듈화 -->
	<jsp:include page="/WEB-INF/views/inc/HeadLink.jsp"></jsp:include>

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
                    <h1 class="h3 mb-4 text-gray-800 NanumGothicB">알림</h1>
					
					<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- End of Main Content -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">알림목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<div class="list-group">
								  <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
								    <div class="d-flex w-100 justify-content-between">
								      <h5 class="mb-1">List group item heading</h5>
								      <small>3 days ago</small>
								    </div>
								    <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
								    <small>Donec id elit non mi porta.</small>
								  </a>
								  <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
								    <div class="d-flex w-100 justify-content-between">
								      <h5 class="mb-1">List group item heading</h5>
								      <small class="text-muted">3 days ago</small>
								    </div>
								    <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
								    <small class="text-muted">Donec id elit non mi porta.</small>
								  </a>
								  <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
								    <div class="d-flex w-100 justify-content-between">
								      <h5 class="mb-1">List group item heading</h5>
								      <small class="text-muted">3 days ago</small>
								    </div>
								    <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
								    <small class="text-muted">Donec id elit non mi porta.</small>
								  </a>
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

</body>

</html>