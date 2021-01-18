<!-- 
    파일명 : Login.jsp
    설명 : 로그인 페이지
    작성일 : 2020-12-27
    작성자 : 박채연
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
    파일명 : login.html
    설명 : 로그인 페이지
    작성일 : 2020-12-27
    작성자 : 박채연
 -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

</head>


<script type="text/javascript">
	$("#login-button").click(function() {
		$('#login-button').fadeOut("slow", function() {
			$("#container").fadeIn();
			TweenMax.from("#container", .4, {
				scale : 0,
				ease : Sine.easeInOut
			});
			TweenMax.to("#container", .4, {
				scale : 1,
				ease : Sine.easeInOut
			});
		});
	});
</script>

<body>
	<div id=img_3>
		<img src="/resources/img/logo1.png"></img>

	</div>
	<div id="login-button">
		<img src="/resources/img/lo5.png"></img>
	</div>

	<div id="container">

		<h1>Log In</h1>
		<span class="close-btn"> <img
			src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
		</span>


		<c:url value="/login" var="loginURL" />
		<form name="frm" action="${loginURL}" class="user" method="POST">
			<div class="form-group">
				<input class="form-control" placeholder="empno"
					form-control-user" name="empno" placeholder="사번">
			</div>
			<div class="form-group">
				<input type="password" placeholder="password"
					class="form-control form-control-user" id="exampleInputPassword"
					name="pwd" placeholder="비밀번호">
			</div>
			<div class="form-group">
				<div class="custom-control custom-checkbox small">
					<c:if test="${requestScope.ERROR_MSG != null}">
						<p class="errorMsg">${requestScope.ERROR_MSG}</p>
					</c:if>
					<%-- <c:if test="${param.error != null}"> --%>
					<%-- <p class="errorMsg"><c:out value="${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}" /></p> --%>
					<%-- 이 값을 읽어오는 것은 스프링 시큐리티에서 던진 예외가 세션에 담겨 온다. >> 인증 예외 시 세션에 에러 메세지가 들어온다.
													세션에 에러메세지가 들어온다 ? >> 인증되지도 않은 사용자 인증행위 (의도적인 공격 등)가 많아지면? Full GC! >> 세션에
													에러 메세지를 가져와 읽는 것은 독이다. >>>>>>>....
													authentication-success-handler-ref 속성과 failure-ref 속성을 이용해 제어하고, 인증(authentication)과 권한(authorization)을
													커스터마이징할 수 있다.--%>
					<%-- </c:if> --%>
					<div id="remember-container">
						<input type="checkbox" id="checkbox-2-1" class="checkbox"
							checked="checked" /> <span id="remember">Remember me</span>
						<!-- Spring Security Remember-me option 아직 미구현, id&name 고정 -->
						<span id="forgotten" href="/findPassword.do">Forgotten
							password</span>
					</div>
				</div>
			</div>
			<button type="submit" class="orange-btn">Login</button>
			<a href="/findPassword.do" class="orange-btn">Get new password</a>
			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
		</form>
	</div>

	<div id="forgotten-container">

		<sec:authentication var="principal" property="principal" />

		<h1 class="h4 text-gray-900 mb-2">이메일 인증</h1>
		<div class="flex">
			<div class="text-center">
				<p class="mb-4">
					사번 : ${principal.username} 님. 환영합니다!<br> 본인의 이메일 계정을 통해 인증 시 <br>해당
					계정에 로그인할 수 있습니다.<br>이메일을 인증해주세요.
				</p>

			</div>
			<div class = "email-user">
				<form method="POST" class="user" id="emailForm">
					<div class="form-group">
						<input type="email" class="form-control form-control-user"
							id="email" name="email" aria-describedby="emailHelp"
							placeholder="Enter 이메일 주소..." required>
					</div>
					<button type="button" id="submitBtn"
						class="btn btn-primary btn-user btn-block"
						style="margin-bottom: 30px">인증번호 발송</button>
				</form>
				<form class="user">
					<div class="form-group" id="codeForm">
						<input type="number" class="form-control form-control-user"
							id="code" name="code" aria-describedby="emailHelp"
							placeholder="Enter 이메일 인증코드..." readonly>
					</div>
					<button type="button" id="finalCheck"
						class="btn btn-secondary btn-user btn-block" disabled>인증하기</button>
				</form>
			</div>

			<div class="form-group" id="goToMain"></div>
		</div>
	</div>


</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href='/resources/css/login.css' rel='stylesheet' />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/gsap.min.js"></script>
<script src="/resources/js/login.js"></script>
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Email validation JavaScript -->
<script src="/resources/js/email.js"></script>
</html>