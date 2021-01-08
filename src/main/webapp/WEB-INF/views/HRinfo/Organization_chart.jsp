<!-- 
    파일명 : Organization_chart.jsp
    설명 : 조직도 페이지
    작성일 : 2020-12-28
    작성자 : 박채연
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>
.highcharts-figure, .highcharts-data-table table {
	min-width: 360px;
	max-width: 800px;
	margin: 1em auto;
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
								<div class="row justify-content-end mx-5"></div>
								<div class="card-body" id="org-chart">
									<figure class="highcharts-figure">
										<div id="container"></div>
										<p class="highcharts-description"></p>
									</figure>
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
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/sankey.js"></script>
	<script src="https://code.highcharts.com/modules/organization.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<style>
.highcharts-figure, .highcharts-data-table table {
	min-width: 360px;
	max-width: 800px;
	margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}

#container h4 {
	text-transform: none;
	font-size: 14px;
	font-weight: normal;
}

#container p {
	font-size: 13px;
	line-height: 16px;
}

@media screen and (max-width: 600px) {
	#container h4 {
		font-size: 2.3vw;
		line-height: 3vw;
	}
	#container p {
		font-size: 2.3vw;
		line-height: 3vw;
	}
}
</style>
	<script type="text/javascript">
	    //ajax
	    $('#inputState').change(function(){
	        var select = $(this).val()+'팀';
	        console.log(select);

	        $.ajax(
					{
						type : "post",
						url	 : "showOrgbyDept.do",
						data : {param:select},
						success : function(responseData)	{
							/* console.log(responseData);
							console.log(responseData.length);
							console.log(responseData[0].deptName); //부서
							console.log(responseData[0].ename); //이름
							console.log(responseData[0].headName); //본부이름
							console.log(responseData[0].positionName); //포지션이름 */
							
							
							
							//id : role , title : name , column : node, 	
						    //{id : '올리브', title : '올리브',name : 'Grethe'}
	
							
							
							
							var emplist = [];
							var emprow = [];
							var emp = {};

							for(var i=0; i<responseData.length;i++){
								var role = responseData[i].positionName;
								var name = responseData[i].ename;
							/* 	console.log(role);
								console.log(name);
								console.log(responseData[i]);								
								 */
								//var dept = responseData[i].deptName;
								//var reportsTo = role == '팀원' ? '팀장' : null; 
								/* if(role=='팀원'){
									reportsTo = '팀장';
								}else if(role=='팀장'){
									reportsTo = '본부장';
								}else{
									reportsTo = null;
								}
								
								name : 박채연, id : 팀원
								name : 어피치, id : 팀원
								name : 프로도, id : 팀원
								name : 앙몬드, id : 팀장 >> 박채연, 어피치, 프로도
								
								
								
								id값 기준으로
								본부장 > 팀장
								팀장  > 팀원

								id가 팀장이면 id가 본부장인 사람 밑으로 
								id가 팀원이면 id가 팀장인 사람 밑으로 
								*/
								/* console.log(name); //name
								console.log(role); */ //id
								//console.log(reportsTo);
								


								let emp ={
										id:role+i,
										name:name,
										title:role
										};
								
								
								/* emp['id'] = role;
								emp['name'] = name; */
								console.log(emp);
								
								/* emprow.push(role);
								
								emprow.push(name);
								console.log(emprow); */
								
								emplist.push(emp);
								
								
								console.log("------------");
							}

					        console.log(emplist);


					      //Highchart 시작  ------------ 
							Highcharts.chart('container',{
							chart : {
								height : 600,
								inverted : true
							},
							title : {
								text : 'Olive'
							},
							accessibility : {
								point : {
									descriptionFormatter : function(point) {
										var nodeName = 
											point.toNode.name, 
											nodeId = point.toNode.id, 
											nodeDesc = nodeName === nodeId ? nodeName
												: nodeName + ', ' + nodeId, 
											parentDesc = point.fromNode.id;
										
										return point.index + '. ' + nodeDesc
												+ ', reports to ' + parentDesc
												+ '.';
									}
								}
							} ,
							series : [ {
								type : 'organization',
								name : 'Olive',
								keys : [ 'from', 'to' ],
								data : [ 
									['본부장','팀장'],['팀장','팀원0'],['팀장','팀원1']
								
								 	   ],
								levels : [  {
									level : 1,
									color : '#980104'
								}, {
									level : 2,
									color : '#359154'
								} ],
								nodes : emplist,
								colorByPoint : false,
								color : '#007ad0',
								dataLabels : {
									color : 'white'
								},
								borderColor : 'white',
								nodeWidth : 65
							} ],
							tooltip : {
								outside : true
							},
							exporting : {
								allowHTML : true,
								sourceWidth : 800,
								sourceHeight : 600
							}

						});
						        
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