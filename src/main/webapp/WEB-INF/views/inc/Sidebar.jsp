<%-- 
    파일명: Sidebar.jsp
    설명: 사원에 따라 로그인 시 메뉴 노출내용이 달라지는 사이드바 모듈화한 페이지
    작성일: 2020-12-26
    작성자: 백희승
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/Login.do">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			A-Bridge <sup>^^</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Attendance</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseAtt"
		aria-expanded="true" aria-controls="collapseAtt"> <i
			class="fas fa-fw fa-user-clock"></i> <span>근태관리</span>
	</a>
		<div id="collapseAtt" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">모든 권한:</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/attendance/attendanceHome.do">근태 메인</a> 
				<a class="collapse-item" href="${pageContext.request.contextPath}/attendance/annual.do">휴가 현황</a>
				<div class="collapse-divider"></div>
				<h6 class="collapse-header">매니저 권한:</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/attendance/mattendance.do">근태 관리</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/attendance/mannual.do">휴가 관리</a>
			</div>
		</div></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">HRM</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseHRM"
		aria-expanded="true" aria-controls="collapseHRM"> <i
			class="fas fa-fw fa-users"></i> <span>인사관리</span>
	</a>
		<div id="collapseHRM" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">모두 인사관리자 권한:</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/HR_management/Organization.do">조직 관리</a> 
				<a class="collapse-item" href="${pageContext.request.contextPath}/HR_management/EmployeeAccount.do">계정 관리</a>
				<a class="collapse-item" href="#">직위/직무 관리</a>
				<a class="collapse-item" href="#">사용자 승인</a>
			</div>
		</div></li>
		
	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Electronic Approval</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseEA"
		aria-expanded="true" aria-controls="collapseEA"> <i
			class="fas fa-fw fa-folder-open"></i> <span>전자결재</span>
	</a>
		<div id="collapseEA" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">권한에 따라 나뉘는지 궁금:</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/approval/approvalHome.do">전자결재 홈</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/approval/DocWrite.do">기안하기</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/approval/PersonalDoc.do">개인 문서함</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/approval/ProgressDoc.do">결재 진행함</a>
				<div class="collapse-divider"></div>
				<h6 class="collapse-header">다른 권한 :</h6>
				<a class="collapse-item" href="#">양식관리</a>
			</div>
		</div></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Informations</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseInfo"
		aria-expanded="true" aria-controls="collapseInfo"> <i
			class="fas fa-fw fa-users"></i> <span>인사정보</span>
	</a>
		<div id="collapseInfo" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">모든 권한:</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/HRinfo/Salary.do">급여 정보</a> 
				<a class="collapse-item" href="${pageContext.request.contextPath}/HRinfo/Emp.do">직원 목록</a> 
				<a class="collapse-item" href="${pageContext.request.contextPath}/HRinfo/Organization_chart.do">회사 조직도</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/HRinfo/EditMyinfo.do">내 정보 수정하기</a>
			</div>
		</div></li>
		
	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">기타 페이지</div>
	
	<!-- Nav Item - Charts -->
	<li class="nav-item"><a class="nav-link" href="charts.html"> <i
			class="fas fa-fw fa-chart-area"></i> <span>필요 시 구현</span></a></li>

	<!-- Nav Item - Tables -->
	<li class="nav-item"><a class="nav-link" href="tables.html"> <i
			class="fas fa-fw fa-table"></i> <span>필요 시 구현</span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

	<!-- Sidebar Message -->
	<div class="sidebar-card">
		<img class="sidebar-card-illustration mb-2"
			src="/resources/img/undraw_rocket.svg" alt="">
		<p class="text-center mb-2">
			<strong>여기에</strong> 뭐 넣을지 고민 중
		</p>
		<a class="btn btn-success btn-sm"
			href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to
			Pro!</a>
	</div>

</ul>
<!-- End of Sidebar -->