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
    <title>Emp</title>

 	<!-- 스타일시트, CDN 모듈화 -->
	<jsp:include page="/WEB-INF/views/inc/HeadLink.jsp"></jsp:include>
	<style>
		#saveBtn{
			display:none;
		}
		
		.scroll {
		    max-height: 70vh; 
		    overflow-y: auto;
		}
		
		
		
/* 		테이블 수정 필요 !  */
		table{
		  padding: 30px 30px;
		  margin-top: 30px;
		  margin-bottom: 20px;
		  width: 80%;
		}
		
		table td{
		  padding: 12px 15px;
		  vertical-align: middle;
		}
		
		table tr{
		  text-align: left;
		  font-size: 18px;
		}
		
		table tr td:first-child {
		  width: 30%;
		  color : #96a2af;
		}
		
		table tr td:last-child{
		  width: 100%;
		  border-bottom:1px solid #ddd;
		  color : #384a5e;
		  font-weight: bold;
		}

		.title{
			 text-decoration: underline;
			 font-weight: bold;
			 text-decoration-color: #ffe561;
			 text-decoration-thickness: 5px;
			 font-size: 22px;
			 color:#3e5165;
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
                    <h1 class="h3 mb-4 text-gray-800">정보 수정</h1>


                    
                    <div class="row justify-content-center">
    					<!-- <div class="container rounded bg-white mt-5"> -->
    					<div class="card shadow py-2 bg-white my-5" style="width: 80%;">
    					  <c:set var="emp" value="${emp}"/>
    					
						    <div class="row justify-content-center">
						        <div class="col-md-5 border-right my-auto">
						        
						            <div class="d-flex flex-column align-items-center text-center p-3">
							            	<img id="preview" class="mt-5 rounded-circle" src="/resources/upload/${emp.PIC}" width="120">

											
							            	<span class="font-weight-bold mt-3">${emp.EMPNO}</span>
							            	<span class="font-weight-bold mt-3">${emp.ENAME}</span>
							            	<h1></h1>
							           		<div class="mt-5 text-center">
							           			
							           		</div> 
							           		
							           		<button id="editBtn" class="btn btn-primary profile-button">Edit Profile</button>
							           		<button id="saveBtn" class="btn btn-primary profile-button">Save Profile</button>
						            </div>
						      
						        </div>
						        <div class="col-md-7 ">
						            <div class="p-5 scroll" >
										
										<p class="title">인사정보</p>
										<table id="hr_info" class="mb-5">
									      
									      <tbody>
									        <tr>
									          <td>본부</td><td>${emp.HEADNAME}팀</td>
									        </tr>
									        <tr>
									          <td>부서</td><td>${emp.DEPTNAME}</td>
									        </tr>
									        <tr>
									          <td>직위</td><td>${emp.CLASSNAME}</td>
									        </tr>
									        <tr>
									          <td>직책</td><td>${emp.POSITIONNAME}</td>
									        </tr>
									        <tr>
									          <td>입사일</td><td>${emp.HIREDATE}</td>
									        </tr>
									      </tbody>
									    </table>
									
									    <p class="title">개인정보</p>
									    <div id="personal">
										<table id="personal_info">
									      
									      <tbody>
									        <tr>
									          <td>사번</td><td>${emp.EMPNO}</td>
									        </tr>
									        <tr>
									          <td>이름</td><td>${emp.ENAME}</td>
									        </tr>
									        <tr>
									          <td>이메일</td><td>${emp.EMAIL}</td>
									        </tr>
									        <tr>
									          <td>휴대전화</td><td>${emp.PHONE}</td>
									        </tr>
									        <tr>
									          <td>집주소</td><td>${emp.ADDRESS}</td>
									        </tr>
									      </tbody>
									    </table>
									    <!-- input 수정 폼 -->
								     <form id="editform" name="editform" action="<%=request.getContextPath()%>/HRinfo/updateMyInfo.do" method="POST" enctype="multipart/form-data">
 						            	<div class="form-group row">
						                    <div class="col-md-10">
												<input type="file" id="pic" name="file" class="file" accept="image/*"> 
						                    </div>
						                </div>
						                <input name="empNo" id="empNo" type="text" class="form-control" placeholder="사번" value="${emp.EMPNO}" hidden>
						                <input name="ename" id="ename" type="text" class="form-control" placeholder="이름" value="${emp.ENAME}" hidden >
						                <div class="form-group row mt-4">
						                    <div class="col-md-10">
						                   		<p>비밀번호</p>
						                    	<input name="pwd" id="pwd" type="text" class="form-control" placeholder="새 비밀번호" value="" >
											</div>
						                 
						                </div>
						                <div class="form-group row mt-4">
						                    <div class="col-md-10">
						                    	<p>이메일</p>
						                    	<input name="email" id="email" type="text" class="form-control" placeholder="이메일" value="${emp.email}" >
						                    </div>
						                   
						                </div>
 						                
				 		                <div class="form-group row mt-4">
						                    <div class="col-md-10">
						                    	<p>휴대전화</p>
						                    	<input name="phone" id="phone" type="text" class="form-control" placeholder="휴대전화" value="${emp.phone}" >
						                    </div>
						                </div> 
						                
						                <div class="form-group row mt-4">
						                    <div class="col-md-10">
						                    	<p>주소</p>
						                    	<input name="address" id="address" type="text" class="form-control" placeholder="주소" value="${emp.address}" >
						                    </div>
						                </div>  		 
									</form>
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


	
	$(document).ready(function(){
		$('#editform').hide();
		//$('#pic').hide();
		var edit = false;
		$('#editBtn').click(function(){
			if(edit == false){
				$(this).hide();
				$('#personal_info').empty();
				//$('.form-control').attr('readonly', false);
				//$('#pic').show(); 
				$('#editform').show();
				$('#saveBtn').show();
				edit = true;
			}
		}); 

		$('#saveBtn').click(function(){
			$('#editform').submit();
			console.log("눌리긴 하니");
			
		}); 
	}); 
		








	</script>
</body>

</html>