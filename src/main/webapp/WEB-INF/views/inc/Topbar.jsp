<%-- 
    파일명: Topbar.jsp
    설명: 사원 로그인 시 프로필사진, 알람 노출 모듈화 페이지
    작성일: 2020-12-26
    작성자: 백희승
--%>
<%-- 
    파일명: Topbar.jsp
    수정사항: 알람페이지 추가
    작성일: 2020-12-31
    작성자: 정민찬
--%>
<!-- 
/*
	파일명:Topbar.jsp
	설명: 출/퇴근 기능추가 
	수정일 : 2020-01-07
	작성자 : 심재형 
*/
 -->
<%-- 
    파일명: Topbar.jsp
    수정사항: 알람기능 추가
    작성일: 2020-01-09
    작성자: 박선우
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/inc/HeadLink.jsp"></jsp:include>

<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar topbar-cst mb-4 static-top shadow">
	<!--  Sidebar Toggle (Topbar)-->
	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>
	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">
		<!--  출퇴근 버튼  -->
		<!-- 	<li class="nav-item"><a
			class="nav-link waves-effect waves-dark" id="work"
			style="color: gray;" href="" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i
				class="fas fa-fingerprint" style="size: 9x"></i>
				<div class="dropdown-menu">
				<button class="dropdown-item" id="startWork">&nbsp;출근하기</button>
				<button class="dropdown-item" id="endWork">&nbsp;퇴근하기</button>
		</a> -->
		<li class="nav-item dropdown no-arrow "><a class="nav-link dropdown-toggle" href="#" id="work" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-fingerprint" style="size: 9x"></i>
			</a>
			<div class="dropdown-menu dropdown-menu-right  shadow animated--grow-in" aria-labelledby="sear=Dropdown">
				<div class="input-group">
					<div class="input-group-append">
						<button class="dropdown-item" id="startWork">&nbsp;출근하기</button>
						<button class="dropdown-item" id="endWork">&nbsp;퇴근하기</button>
						</button>
					</div>
				</div>
			</div></li>
		<!-- Nav Item - Search Dropdown (Visible Only XS) -->
		<li class="nav-item dropdown no-arrow d-sm-none"><a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-search fa-fw"></i>
			</a> <!-- Dropdown - Messages -->
			<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>
		</button>
		<!-- 알람 -->
		<li class="nav-item dropdown no-arrow mx-1">
		<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-bell fa-fw"></i>
				<!-- Counter - Alerts -->
				<span class="badge badge-danger badge-counter" id="counter"></span>
			</a> <!-- Dropdown - Alerts -->
			<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
				<h6 class="dropdown-header">Alerts Center</h6>
				<a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-primary">
							<i class="fas fa-check text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">December 12, 2019</div>
						<span class="font-weight-bold">A new monthly report is ready to download!</span>
					</div>
				</a>
				<a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-success">
							<i class="fas fa-donate text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">December 7, 2019</div>
						$290.29 has been deposited into your account!
					</div>
				</a>
				<a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-warning">
							<i class="fas fa-exclamation-triangle text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">December 2, 2019</div>
						Spending Alert: We've noticed unusually high spending for your account.
					</div>
				</a>
				<a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/Alrams.do">Show All Alerts</a>
			</div></li>
		<div class="topbar-divider d-none d-sm-block"></div>
		<sec:authentication property="name" var="LoginUser" />
		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small" id="empinfo"> </span>
				<img class="img-profile rounded-circle" src="/resources/img/undraw_profile.svg">
			</a> <!-- Dropdown - User Information -->
			<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
				<a class="dropdown-item" href="/HRinfo/EditMyinfo.do">
					<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
				</a>
				<a class="dropdown-item" href="#">
					<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
				</a>
				<a class="dropdown-item" href="#">
					<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity Log
				</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
					<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout
				</a>
			</div></li>
	</ul>
</nav>
<div class="alarm">
	
</div>
<style>
.cbody{
	padding-top:5px;
	padding-bottom:5px;
}
.alarm{
	position:absolute;
	width:300px;
	top:30px;
	right:2px;
}
</style>
<!-- End of Topbar -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 날짜 변환 관련 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script type="text/javascript">

function connect(){
	websocket = new WebSocket('ws://localhost:8090/alarm.do');
	websocket.onopen =(evt) =>{
		
	};

	websocket.onclose =(evt) =>{
	}; 
	
	websocket.onmessage=(evt)=>{
		
			writeMsg(evt)	
	}
	
}
let i=1;
function writeMsg(evt){
	let html = JSON.parse(evt.data);
	let alarmTime = moment(html.alarmTime).format('YYYY-MM-DD'+" "+'HH:mm');
	let content =
		'<div class="card border-left-'+html.color+' shadow">\
		<div class="cbody card-body">\
			<div class="row no-gutters align-items-center">\
				<div class="col-auto">\
					<img src="/resources/img/speech-bubble.png">\
				</div>\
				<div class="col ml-4">\
					<div class="text-xs font-weight-bold text-'+html.color+' text-uppercase mb-1">ALARM  &nbsp;'+alarmTime+'</div>\
					<div class="h6 mb-0 font-weight-bold text-gray-700">'+html.content+'</div>\
				</div>\
			</div>\
		</div>\
	</div>';

	jb('.alarm').append(content);
	setTimeout(()=>{
		$('.alarm').empty();
		},5000);
	
	let number = i;
	jb('#counter').empty();
	jb('#counter').append(number);
	i++
	console.log(html);
}

function disconnect(){
	websocket.close();
}

$.noConflict();
var jb= jQuery;
jb(document).ready(function() {
	var empno = ${LoginUser}+"";
	console.log(empno);
	jb.ajax({
		url:"/HRinfo/searchByEmpno.do",
		type:"POST",
		data:{empno:empno},
		success:function(data){
			console.log(data);
			html=data.ENAME+' ('+data.DEPTNAME+') '+data.POSITIONNAME;
			jb('#empinfo').append(html);
			
			}
		
	});

	connect();
	

	jb('#alertsDropdown').on("click",function(){
		jb(this > span).empty();


	}); 

	


	
})
	


</script>
