<!-- 
    파일명 : Organization_chart.jsp
    설명 : 조직도 페이지
    작성일 : 2020-12-28
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

    <title>Organization_chart</title>

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
                    <h1 class="h3 mb-2 text-gray-800">Charts</h1>
                    

                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-12 col-lg-12">

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                            
                                <div class="card-header py-3">
                                	<div class="form-group col-md-2 mb-0">
	                                    <select id="inputState" class="form-control">
										  <option value="">본부</option>
										  <optgroup label="경영지원">
										    <option value="인사">인사</option>
										    <option value="회계">회계</option>
										  
										  </optgroup>
										  <optgroup label="전략">
										    <option value="사업">사업</option>
										    <option value="운영">운영</option>
										   
										  </optgroup>
										  <optgroup label="R&D">
										    <option value="마케팅">마케팅</option>
										    <option value="개발">개발</option>
										    
										  </optgroup>
										</select>
									</div>
                                    
                                </div>
                                <div class="row justify-content-end mx-5">
								
							
							</div>
                                <div class="card-body">

                                    <div id="chart_div"></div>

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
    
    <!-- 추가 script -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
	    //ajax
	    $('#inputState').change(function(){
	        var select = $(this).val();
	        console.log(select);

	        $.ajax(
					{
						type : "post",
						url	 : "showOrgbyDept.do",
						data : {param:select},
						success : function(responseData)	{
							console.log(responseData);
							console.log(responseData.length);
							console.log(responseData[0].deptName); //부서
							console.log(responseData[0].ename); //이름
							console.log(responseData[0].headName); //본부이름
							console.log(responseData[0].positionName); //포지션이름
							google.charts.load('current', {packages:["orgchart"]});
						    google.charts.setOnLoadCallback(drawChart);

						      function drawChart() {
						        var data = new google.visualization.DataTable();
						        data.addColumn('string', 'Name'); //자신
						        data.addColumn('string', 'Manager'); //상위노드
						        data.addColumn('string', 'ToolTip'); //마우스 오버 시 나오는 이름

						        /* var aaa = '<c:out value="${requestScope.head}"/>';  
						        console.log(aaa);
								var deptcode = aaa[0].deptCode; */
					
						        //['현재노드', '상위노드', '툴팁값']
						        // For each orgchart box, provide the name, manager, and tooltip to show.
						        

								for(var i=0; i<responseData.length;i++){
									var role = responseData[i].positionName;
									var name = responseData[i].ename;
									var dept = responseData[i].deptName;
									var reportsTo = null;
									if (role=='팀원'){
										reportsTo = '팀장';
									}  
									
									data.addRows([
										[{v:role, f: name + '<div>(<span>' + role + '</span>)</div><img src = "Pictures/' + name + '.jpg" />'}, reportsTo, dept]
									]);
									//console.log(responseData[i].ename);
									//console.log(role);
									//console.log(name);
									//console.log(responseData[i]);
									//console.log(reportsTo);
								}  

						       	 
									
								

								// Create the chart.
						        var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
						        // Draw the chart, setting the allowHtml option to true for the tooltips.
						        chart.draw(data, {'allowHtml':true, nodeClass:'organ'}); //
						      }
													

						},
						error : function(error){
							console.log(error);
						}
					} 
				); 
	    });


    
      


      
   </script>

</body>

</html>