<!-- 
    파일명 : Organization_chart.jsp
    설명 : 조직도 페이지
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
                                    <h6 class="m-0 font-weight-bold text-primary">Area Chart</h6>
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
      google.charts.load('current', {packages:["orgchart"]});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Name'); //자신
        data.addColumn('string', 'Manager'); //상위노드
        data.addColumn('string', 'ToolTip'); //마우스 오버 시 나오는 이름

        //['현재노드', '상위노드', '툴팁값']
        // For each orgchart box, provide the name, manager, and tooltip to show.
        data.addRows([
/*           [{v:'이사장', f:'이사장<div style="color:blue; ">홍길동</div>'},
           '', '연락처 : 010-1111-1111'], */
          [{v:'Manager', f:'<img src="/resources/img/undraw_profile_1.svg"/><p>Manager</p>'}, '', '010-2222-0001'],
          [{v:'Executive1', f:'<img src="/resources/img/undraw_profile_2.svg"/><p>Executive1</p>'}, 'Manager', '010-3333-0001'],
          [{v:'Executive2', f:'<img src="/resources/img/undraw_profile_2.svg"/><p>Executive2</p>'}, 'Manager', '010-4444-0001'],
          [{v:'Executive3', f:'<img src="/resources/img/undraw_profile_2.svg"/><p>Executive3</p>'}, 'Manager', '010-5555-0001'],
          [{v:'Executive4', f:'<img src="/resources/img/undraw_profile_2.svg"/><p>Executive4</p>'}, 'Manager', '010-6666-0001'],
      
          [{v:'Position1', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position1</p>'}, 'Executive1', '010-2222-0001'],
          [{v:'Position2', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position2</p>'}, 'Executive1', '010-3333-0001'],
          [{v:'Position3', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position3</p>'}, 'Executive1', '010-4444-0001'],
         
          
          [{v:'Position6', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position1</p>'}, 'Executive2', '010-2222-0001'],
          [{v:'Position7', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position2</p>'}, 'Executive2', '010-3333-0001'],
          [{v:'Position8', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position3</p>'}, 'Executive2', '010-4444-0001'],
      

          [{v:'Position11', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position1</p>'}, 'Executive3', '010-2222-0001'],
          [{v:'Position12', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position2</p>'}, 'Executive3', '010-3333-0001'],
          [{v:'Position13', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position3</p>'}, 'Executive3', '010-4444-0001'],
      

          [{v:'Position16', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position1</p>'}, 'Executive4', '010-2222-0001'],
          [{v:'Position17', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position2</p>'}, 'Executive4', '010-3333-0001'],
          [{v:'Position18', f:'<img src="/resources/img/undraw_profile_3.svg"/><p>Position3</p>'}, 'Executive4', '010-4444-0001']
      
        ]);


        // Create the chart.
        var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
        // Draw the chart, setting the allowHtml option to true for the tooltips.
        chart.draw(data, {'allowHtml':true, nodeClass:'organ'});
      }
   </script>

</body>

</html>