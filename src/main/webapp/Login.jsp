<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="<c:url value="/Login" />" method="POST">
		empno = <input type="text" name="empno" id="empno">
		password = <input type="password" name="pwd" id="pwd">
		<button type="submit">로그인하기</button>
	</form>
</body>
</html>