<!-- 
    파일명 : EditMyinfo.jsp
    설명 : 인사정보 - 내정보 수정 페이지
    작성일 : 2020-12-29
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

    <title>Emp</title>

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
                    <h1 class="h3 mb-4 text-gray-800">정보 수정</h1>


                    
                    <div class="row justify-content-center">
    					<!-- <div class="container rounded bg-white mt-5"> -->
    					<div class="card shadow py-2 bg-white my-5" style="width: 80%;">
						    <div class="row justify-content-center">
						        <div class="col-md-5 border-right">
						            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
							            	<img class="mt-5" src="/resources/img/undraw_profile.svg" width="90">
							            	<span class="font-weight-bold mt-3">2001</span>
							            	<span class="font-weight-bold mt-3">Douglas Mcgee</span>
							            	<h1>aaaaaa </h1>
							           		<div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Edit Profile</button></div> 
						            </div>
						        </div>
						        <div class="col-md-7 scroll">
						            <div class="p-5">
						                <div class="row mt-3">
						                    <div class="col-md-10">
						                    	<p>사번</p>
						                    	<input type="text" class="form-control" placeholder="사번" value="2001" readonly>
						                    </div>
						                </div>
						                <div class="row mt-4">
						                    <div class="col-md-10">
						                    	<p>이름</p>
						                    	<input type="text" class="form-control" placeholder="이름" value="Douglas Mcgee" readonly>
						                    </div>
						       
						                </div>
						                <div class="row mt-4">
						                    <div class="col-md-10">
						                   		<p>비밀번호</p>
						                    	<input type="text" class="form-control" placeholder="비밀번호" value="*****">
											</div>
						                 
						                </div>
						                <div class="row mt-4">
						                    <div class="col-md-10">
						                    	<p>이메일</p>
						                    	<input type="text" class="form-control" placeholder="이메일" value="john@bbb.com">
						                    </div>
						                   
						                </div>
 						                
				 		                <div class="row mt-4">
						                    <div class="col-md-10">
						                    	<p>휴대폰번호</p>
						                    	<input type="text" class="form-control" placeholder="휴대폰번호" value="010-8888-7777">
						                    </div>
						                </div> 
						                
						                <div class="row mt-4">
						                    <div class="col-md-10">
						                    	<p>주소</p>
						                    	<input type="text" class="form-control" placeholder="주소" value="서울특별시 뫄뫄뫄">
						                    </div>
						                </div>  
						           
						                <div class="mt-5 text-right"><button class="btn btn-primary profile-button" type="button">Save Profile</button></div>
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