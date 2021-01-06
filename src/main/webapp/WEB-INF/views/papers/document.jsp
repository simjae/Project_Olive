<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../inc/HeadLink.jsp"></jsp:include>
<body>
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar 모듈화 -->
		<jsp:include page="../inc/Sidebar.jsp"></jsp:include>
		<!-- End Of Sidebar 모듈화 -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<jsp:include page="../inc/Topbar.jsp"></jsp:include>
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<c:set var="doc" value="${requestScope.document }" />
					<c:set var="emp" value="${requestScope.emp }" />
					<c:set var="apps" value="${requestScope.apps }" />
					<div id="hw_dext_default_style"
						style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;"
					>
						<div style="margin: 0px; padding: 0px; font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8;">
							<h1 style="text-align: center; padding: 30px 0px; font-size: 26px; font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; line-height: 1.8;">${doc.typeName }</h1>
							<p></p>
							<div class="list"
								style="margin: 0px; padding: 0px; float: left; font-size: 11pt; width: 272px; color: rgb(103, 103, 103); font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; amp; amp; amp; quot; , dotum , sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.4px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"
							>
								<dl style="margin: 0px; padding: 0px; list-style: none;">
									<dt style="margin: 0px; padding: 0px 0px 0.32cm; float: left; clear: both; width: 106px; font-weight: bold;">문서 번호</dt>
									<dd style="margin: 0px; padding: 0px 0px 0.32cm; float: left; width: 151px; color: rgb(18, 18, 18);">${doc.docno}</dd>
									<dt style="margin: 0px; padding: 0px 0px 0.32cm; float: left; clear: both; width: 106px; font-weight: bold;">기안자</dt>
									<dd style="margin: 0px; padding: 0px 0px 0.32cm; float: left; width: 151px; color: rgb(18, 18, 18);">${doc.ename }</dd>
									<dt style="margin: 0px; padding: 0px 0px 0.32cm; float: left; clear: both; width: 106px; font-weight: bold;">기안 일자</dt>
									<dd style="margin: 0px; padding: 0px 0px 0.32cm; float: left; width: 151px; color: rgb(18, 18, 18);">
										<fmt:formatDate value="${doc.writedate}" pattern="yyyy-MM-dd" />
									</dd>
								</dl>
							</div>
							<div class="approval"
								style="margin: 0px; margin-right: 0px; padding: 0px; padding-left: 70px; float: right; width: 365px; color: rgb(103, 103, 103); font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; amp; amp; amp; quot; , dotum , sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.4px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"
							>
								<table style="border-collapse: collapse; width: 364px; table-layout: fixed; border-width: 1px; border-style: solid; border-color: rgb(89, 89, 89) rgb(102, 102, 102);">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<tbody>
										<tr>
											<c:forEach var="list" items="${apps }">
												<th scope="col"
													style="margin: 0px; padding: 0px; font-size: 11pt; font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; amp; amp; amp; quot; , dotum , sans-serif; height: 25px; font-weight: normal; border-left: 0px; border-right: 1px solid rgb(102, 102, 102); word-break: break-all;"
												>${list.ename }</th>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="list" items="${apps }">
												<td class="stamp"
													style="margin: 0px; padding: 0px; font-size: 8pt; font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; amp; amp; amp; quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 49px; text-align: center; border-top: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-bottom: 1px solid rgb(102, 102, 102); border-right: 1px solid rgb(102, 102, 102); line-height: 10pt; word-break: break-all; vertical-align: middle;"
												>
													<p>
														<br>
													</p>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="list" items="${apps }">
												<td
													style="margin: 0px; padding: 0.08cm 0px; font-size: 8pt; font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot; , &amp; amp; amp; amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; amp; amp; amp; quot; , dotum , sans-serif; color: rgb(0, 0, 0); height: 22px; text-align: center; border-top: 1px solid rgb(102, 102, 102); border-left: 1px solid rgb(102, 102, 102); border-bottom: 1px solid rgb(89, 89, 89); border-right: 1px solid rgb(102, 102, 102); line-height: 10pt; word-break: break-all;"
												>${list.deptname }</td>
											</c:forEach>
										</tr>
									</tbody>
								</table>
							</div>
							<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;"></p>
							<div class="list"
								style="margin: 0px; padding: 0px; float: left; font-size: 8pt; width: 272px; font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; line-height: 1.8;"
							>
								<dl style="margin: 0px; padding: 0px; list-style: none;">
									<br>
								</dl>
							</div>
							<p style="font-family: &amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
								<br>
							</p>
							<br> <br> <br> <br>
							<table style="width: 100%; border-collapse: collapse; border: 1px solid #cdcdcd; margin: 20px 0 0; padding: 0">
								<tbody>
									<tr>
										<td style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 136px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">소속</p>
										</td>
										<td colspan="2" style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 312px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">${emp.deptname}</p>
										</td>
										<td style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 143px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">직위</p>
										</td>
										<td colspan="2" style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 378px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">${emp.positionname}</p>
										</td>
									</tr>
									<tr>
										<%-- <td style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 136px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">성명</p>
										</td>
										<td style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 133px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">${emp.ename}</p>
										</td>
										<td style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 156px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">생년월일</p>
										</td>
										<td style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 143px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
												<br>
											</p>
										</td>
										<td style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 154px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">전화번호</p>
										</td>
										<td style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 219px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">'+$('#tel').val()+'</p>
										</td>
									</tr>
									<tr>
										<td style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 136px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">현주소</p>
										</td>
										<td colspan="5" style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 852px;">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">'+$("#addr").val()+'</p>
										</td>
									</tr> --%>
										<c:if test="${typeCode!=10 }">
											<tr>
												<td style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 136px;">
													<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">기간</p>
												</td>
												<td colspan="5" style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 852px;">
													<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
														<fmt:formatDate value="${doc.startdate}" pattern="yyyy-MM-dd" />
														<c:if test="${typeCode eq 20 }">
												~<fmt:formatDate value="${doc.startdate}" pattern="yyyy-MM-dd" />
												</c:if>
														<c:if test="${typeCode != 20 }">
												~<fmt:formatDate value="${doc.enddate}" pattern="yyyy-MM-dd" />
												</c:if>
													</p>
												</td>
											</tr>
										</c:if>
									<tr>
									
												<td style="padding: 10px 0px; border: 1px solid rgb(205, 205, 205); text-align: center; font-weight: bold; width: 136px;">
													<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">제목</p>
												</td>
												<td colspan="5" style="padding: 10px; border: 1px solid rgb(205, 205, 205); width: 852px;">
													<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
														${doc.title }
													</p>
												</td>
											</tr>
									
									<tr>
										<td colspan="6" style="padding:0; border: 1px solid #cdcdcd; height: 100%; vertical-align: top">
											<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">${doc.content }</p>
										</td>
									</tr>
									<tr>
										<td colspan="6" style="padding: 10px 0; border: 0;">
											<table style="width: 100%; border-collapse: collapse; margin: 0; padding: 0">
												<tbody>
													<tr>
														<td colspan="3" style="padding: 10px; text-align: center; border: 0;">
															<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">상기
																명 본인은 위와 같은 사유로 제출합니다.</p>
														</td>
													</tr>
													<tr>
														<td colspan="3" style="padding: 80px 0 40px; text-align: center; border: 0;">
															<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">'+$('#writedate').val()+'</p>
														</td>
													</tr>
													<tr>
														<td style="padding: 10px; border: 0px; text-align: right; width: 632px;">
															<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">신청인:</p>
														</td>
														<td style="padding: 10px; border: 0px; width: 78px;">
															<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">'+$('#ename').val()+'</p>
														</td>
														<td style="padding: 10px; border: 0px; width: 67px;">
															<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">(인)</p>
														</td>
													</tr>
													<tr>
														<td colspan="3" style="padding: 80px 0 10px; border: 0; font-weight: bold; font-size: 20px; text-align: center">
															<p style="font-family: &amp; amp; amp; amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; amp; amp; amp; quot;; font-size: 20px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">OLIVE</p>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="../inc/Footer.jsp"></jsp:include>
			<!-- End of Footer 모듈화 -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
</body>
<!-- 모든 스크립트 모듈화 -->
<jsp:include page="../inc/BottomLink.jsp"></jsp:include>
</html>