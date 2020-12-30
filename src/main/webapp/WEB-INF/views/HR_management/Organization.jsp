<%-- 
    파일명: EmployeeAccount.jsp
    설명: 직원 계정 CRUD (인사팀 전용)
    작성일: 2020-12-29
    작성자: 정민찬
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리 - 조직관리</title>
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
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">조직관리</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i>&nbsp;어떤 버튼?</a>
					</div>

					<!-- xl3 md6 카드들 row -->
					<div class="row">

						<!-- 직원 수 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												<h6>headcount</h6>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">33명</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Annual) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												<h6>hired</h6>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">13명</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												<h6>retired</h6>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">5명</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- Tasks Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">
												<h6>Occupancy rate</h6>
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">87%</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 87%" aria-valuenow="87" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 차트 row -->
					<div class="row">
						<!-- Area Chart -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">부서별 평균 급여</h6>
									<!-- <div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div> -->
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="employees-chart"></canvas>
									</div>
								</div>
							</div>
						</div>

						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header -->
								<div
									class="card-header py-2 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">근태 현황</h6>
									<div class="dropdown no-arrow">
										<form
											class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-1 my-md-0 mw-50 navbar-search">
											<div class="input-group">
												<input type="text" class="form-control bg-light border-1"
													placeholder="Search for..." aria-label="Search"
													aria-describedby="basic-addon2">
												<div class="input-group-append">
													<button class="btn btn-primary" type="button">
														<i class="fas fa-search fa-sm"></i>
													</button>
												</div>
											</div>
										</form>

										<!-- 
										<a class="" role="button" data-toggle="modal"
											data-target="#myModal"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										 -->
										<!-- 										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div> -->
									</div>
								</div>

								<!-- <div class="modal fade modal-center" id="myModal" tabindex="-1"
									role="dialog" aria-labelledby="myCenterModalLabel">
									<div class="modal-dialog modal-center" role="document">
										<div class="modal-content">
											<div class="modal-body">
												Topbar Search
												<form
													class="mr-auto ml-md-3 my-2 my-md-0 mw-3 navbar-search">
													<div class="input-group">
														<input type="text"
															class="form-control bg-light border-0 small"
															placeholder="Search for..." aria-label="Search">
														<div class="input-group-append">
															<button class="btn btn-primary" type="button">
																<i class="fas fa-search fa-sm"></i>
															</button>
														</div>
													</div>
												</form>
												<div>
													<ul>
														<li><a href="#">정민찬</a></li>
														<li><a href="#">정민찬</a></li>
														<li><a href="#">정민찬</a></li>
														<li><a href="#">정민찬</a></li>
														<ul>
												</div>
											</div>
										</div>
									</div>
								</div> -->



								<!-- Card Body -->
								<div class="card-body">

									<div class="chart-pie pt-2 pb-2">
										<div class="text-right small">
											<i class="text-primary ">정민찬 사원/개발팀</i>
										</div>
										<canvas id="employees-chart2"></canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"> <i
											class="fas fa-circle text-primary"></i> 출근
										</span> <span class="mr-2"> <i
											class="fas fa-circle text-success"></i> 지각
										</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
											휴가
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 긴 카드 -->
					<div class="row">
						<!-- Content Column -->
						<div class="col-lg-12 mb-4">
							<!-- Project Card Example -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">조직 구성도</h6>
								</div>
								<div class="card-body" id="org-chart">
									<figure class="highcharts-figure">
										<div id="container"></div>
										<p class="highcharts-description">
								</div>
							</div>

						</div>


					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer 모듈화 -->
			<jsp:include page="/WEB-INF/views/inc/Footer.jsp"></jsp:include>
			<!-- End of Footer 모듈화 -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- 모든 스크립트 모듈화 -->
	<jsp:include page="/WEB-INF/views/inc/BottomLink.jsp"></jsp:include>
	<script type="text/javascript">
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 2000000)
		};
		var barChartData = {
			labels : [ "인사팀", "회계팀", "사업팀", "운영팀", "마케팅팀", "개발팀" ],
			datasets : [
					{
						label : '기본급',
						backgroundColor : "#4e73df",
						borderColor : "#4e73df",
						data : [ randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor() ]
					},
					{
						label : '상여금',
						backgroundColor : "#F6C23E",
						borderColor : "#F6C23E",
						data : [ randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor() ]
					},
					{
						label : '성과급',
						backgroundColor : "#1cc88a",
						data : [ randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor() ]
					} ]
		};

		var ctx = $("#employees-chart");
		$(function() {
			var stackedBar = new Chart(ctx, {
				type : 'bar',
				data : barChartData,
				options : {
					gridLines : {
						color : "rgb(234, 236, 244)",
						zeroLineColor : "rgb(234, 236, 244)",
						drawBorder : false,
						borderDash : [ 2 ],
						zeroLineBorderDash : [ 2 ]
					},
					maintainAspectRatio : false,
					layout : {
						padding : {
							left : 10,
							right : 25,
							top : 25,
							bottom : 0
						}
					},
					scales : {
						xAxes : [ {
							stacked : true,
						} ],
						yAxes : [ {
							stacked : true
						} ]
					}
				},
				tooltips : {
					titleMarginBottom : 10,
					titleFontColor : '#6e707e',
					titleFontSize : 14,
					backgroundColor : "rgb(255,255,255)",
					bodyFontColor : "#858796",
					borderColor : '#dddfeb',
					borderWidth : 1,
					xPadding : 15,
					yPadding : 15,
					displayColors : false,
					caretPadding : 10
				},
				legend : {
					display : false
				}
			})
		});
	</script>
	<script>
		//파이차트
		var ctx2 = $("#employees-chart2");
		var chart2 = new Chart(ctx2, {
			type : 'doughnut',
			data : {
				labels : [ "출근", "지각", "휴가" ],
				datasets : [ {
					data : [ 55, 30, 15 ],
					backgroundColor : [ '#4e73df', '#1cc88a', '#36b9cc' ],
					hoverBackgroundColor : [ '#2e59d9', '#17a673', '#2c9faf' ],
					hoverBorderColor : "rgba(234, 236, 244, 1)",
				} ],
			},
			options : {
				maintainAspectRatio : false,
				tooltips : {
					backgroundColor : "rgb(255,255,255)",
					bodyFontColor : "#858796",
					borderColor : '#dddfeb',
					borderWidth : 1,
					xPadding : 15,
					yPadding : 15,
					displayColors : false,
					caretPadding : 10,
				},
				legend : {
					display : false
				},
				cutoutPercentage : 80
			}
		})
	</script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/sankey.js"></script>
	<script src="https://code.highcharts.com/modules/organization.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
</body>
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

<script>
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
						},
						series : [ {
							type : 'organization',
							name : 'Olive',
							keys : [ 'from', 'to' ],
							data : [ [ '올리브', '경영지원본부' ], [ '올리브', '전략본부' ],[ '올리브', '개발본부' ], 
									 [ '경영지원본부', '인사팀' ], [ '경영지원본부', '회계팀' ],
									 [ '전략본부', '사업팀' ], [ '전략본부', '운영팀' ],
									 [ '개발본부', '개발팀' ], [ '개발본부', '마케팅팀' ],
							 	   ],
							levels : [  {
								level : 1,
								color : '#980104'
							}, {
								level : 2,
								color : '#359154'
							} ],
							nodes : [
									{
										id : '올리브',
										title : '올리브',
										name : 'Grethe',
										image : 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/12132317/Grethe.jpg'
									},
									{
										id : '경영지원본부',
										title : '경영지원본부',
										name : '',
										column : 1,
										image : 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/12140620/Christer.jpg',
										layout : 'hanging'
									},
									{
										id : '전략본부',
										title : '전략본부',
										name : '',
										column : 1,
										image : 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/12132313/Anita.jpg',
										layout : 'hanging'
									},
									{
										id : '개발본부',
										title : '개발본부',
										name : 'Vidar Brekke',
										column : 1,
										image : 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/13105551/Vidar.jpg',
										layout : 'hanging'
									},{
										id : '인사팀',
										title : '인사팀',
										name : 'Vidar Brekke',
										column : 2,
										image : 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/13105551/Vidar.jpg',
										layout : 'hanging'
									},{
										id : '회계팀',
										title : '인사팀',
										name : 'Vidar Brekke',
										column : 2,
										image : 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/13105551/Vidar.jpg',
										layout : 'hanging'
									},{
										id : '운영팀',
										title : '인사팀',
										name : 'Vidar Brekke',
										column : 2,
										image : 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/13105551/Vidar.jpg',
										layout : 'hanging'
									},{
										id : '사업팀',
										title : '인사팀',
										name : 'Vidar Brekke',
										column : 2,
										image : 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/13105551/Vidar.jpg',
										layout : 'hanging'
									},{
										id : '개발팀',
										title : '인사팀',
										name : 'Vidar Brekke',
										column : 2,
										image : 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/13105551/Vidar.jpg',
										layout : 'hanging'
									},{
										id : '마케팅팀',
										title : '인사팀',
										name : 'Vidar Brekke',
										column : 2,
										image : 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/13105551/Vidar.jpg',
										layout : 'hanging'
									}, {
										id : 'Product',
										name : 'Product developers'
									}, {
										id : 'Web',
										name : 'Web devs, sys admin'
									}, {
										id : 'Sales',
										name : 'Sales team'
									}, {
										id : 'Market',
										name : 'Marketing team'
									} ],
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
</script>

<!-- <style>
@media screen and (min-width: 768px) {
	.modal.modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog.modal-center {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.modal.modal-center {
	text-align: center;
}
</style> -->
</html>