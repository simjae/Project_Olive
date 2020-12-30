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
<link href="/resources/css/chaeyeon.css" rel="stylesheet">
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
                    <!-- Table -->
                    <div class="row justify-content-center mx-5">
                        <table id="salary_table" class="styled-table text-center">
                            <thead>
                                <tr>
                                    <th>지급일</th>
                                    <th>성명</th>
                                    <th>사번</th>
                                    <th>부서</th>
                                    <th>지급 총액</th>
                                    <th>공제 총액</th>
                                    <th>실수령액</th>
                                    <th>급여 상세</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>박채연</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <th><button class="table-button" id="salary">보기</button></th>
                                </tr>
                                <tr>
                                    <td>Melissa</td>
                                    <td>5150</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <th><button class="table-button" id="salary">보기</button></th>
                                </tr>
                                <tr>
                                    <td>Dom</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <th><button class="table-button" id="salary">보기</button></th>
                                </tr>
                                <tr>
                                    <td>Dom</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <th><button class="table-button" id="salary">보기</button></th>
                                </tr>
                                <tr>
                                    <td>Dom</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <th><button class="table-button" id="salary">보기</button></th>
                                </tr>
                                <tr>
                                    <td>Dom</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <th><button class="table-button" id="salary">보기</button></th>
                                </tr>
                                <tr>
                                    <td>Dom</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <td>6000</td>
                                    <th><button class="table-button" id="salary">보기</button></th>
                                </tr>
                               
                            </tbody>
                        </table>

                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                              <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                  <span aria-hidden="true">&laquo;</span>
                                  <span class="sr-only">Previous</span>
                                </a>
                              </li>
                              <li class="page-item"><a class="page-link" href="#">1</a></li>
                              <li class="page-item"><a class="page-link" href="#">2</a></li>
                              <li class="page-item"><a class="page-link" href="#">3</a></li>
                              <li class="page-item"><a class="page-link" href="#">4</a></li>
                              <li class="page-item"><a class="page-link" href="#">5</a></li>
                              <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                  <span aria-hidden="true">&raquo;</span>
                                  <span class="sr-only">Next</span>
                                </a>
                              </li>
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

</body>

</html>