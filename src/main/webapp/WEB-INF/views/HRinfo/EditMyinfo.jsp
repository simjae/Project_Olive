<!-- 
    파일명 : EditMyinfo.jsp
    설명 : 인사정보 - 내정보 수정 페이지
    작성일 : 2020-12-29
    작성자 : 박채연
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<style>
		#saveBtn {
		  display: none;
		}
	</style>
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
    					  <c:set var="emp" value="${requestScope.emp}"/>
    					
						    <div class="row justify-content-center">
						        <div class="col-md-5 border-right my-auto">
						        
						            <div class="d-flex flex-column align-items-center text-center p-3">
							            	<img class="mt-5" src="/resources/img/undraw_profile.svg" width="90">
							            	<span class="font-weight-bold mt-3">${emp.empNo}</span>
							            	<span class="font-weight-bold mt-3">${emp.ename}</span>
							            	<h1></h1>
							           		<div class="mt-5 text-center">
							           			<button id="editBtn" class="btn btn-primary profile-button">Edit Profile</button>
							           			<button id="saveBtn" class="btn btn-primary profile-button" type="submit">Save Profile</button>
							           		</div> 
						            </div>
						      
						        </div>
						        <div class="col-md-7 scroll">
						            <div class="p-5">
						                <div class="row mt-3">
						                    <div class="col-md-10">
						                    	<p>사번</p>
						                    	<input id="empno" type="text" class="form-control" placeholder="사번" value="${emp.empNo}" readonly>
						                    </div>
						                </div>
						                <div class="row mt-4">
						                    <div class="col-md-10">
						                    	<p>이름</p>
						                    	<input id="ename" type="text" class="form-control" placeholder="이름" value="${emp.ename}" readonly >
						                    </div>
						       
						                </div>
						                <div class="row mt-4">
						                    <div class="col-md-10">
						                   		<p>비밀번호</p>
						                    	<input id="pwd" type="text" class="form-control" placeholder="비밀번호" value="${emp.pwd}" readonly>
											</div>
						                 
						                </div>
						                <div class="row mt-4">
						                    <div class="col-md-10">
						                    	<p>이메일</p>
						                    	<input id="email" type="text" class="form-control" placeholder="이메일" value="${emp.email}" readonly>
						                    </div>
						                   
						                </div>
 						                
				 		                <div class="row mt-4">
						                    <div class="col-md-10">
						                    	<p>휴대폰번호</p>
						                    	<input id="phone" type="text" class="form-control" placeholder="휴대폰번호" value="${emp.phone}" readonly>
						                    </div>
						                </div> 
						                
						                <div class="row mt-4">
						                    <div class="col-md-10">
						                    	<p>주소</p>
						                    	<input id="address" type="text" class="form-control" placeholder="주소" value="${emp.address}" readonly>
						                    </div>
						                </div>  
						           
						               
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
		var edit = false;
		$('#editBtn').click(function(){
			if(edit == false){
				$(this).hide();
				$('.form-control').attr('readonly', false);
				$('#saveBtn').show();
				edit = true;
			}
		});

		$('#saveBtn').click(function(){
			///////////////////////////
			var empno = ${emp.empNo};
			var pwd = $('#pwd').val();
			var email = $('#email').val();
			var phone = $('#phone').val();
			var address = $('#address').val();
			//console.log(pwd);
			//console.log(empno);
			$.ajax(
				{
					type : "post",
					url : "updateMyInfo.do",
					data : {param1:empno, param2:pwd, param3:email, param4:phone, param5:address},
					success : function(data){
							console.log(data);
							if(edit==true){
								$('#saveBtn').hide();
								$('.form-control').attr('readonly', true);
								$('#editBtn').show();
								edit = false;
							}
					},
					error : function(error){
						console.log(error);
					}
				}
			)
		});

	</script>

</body>

</html>