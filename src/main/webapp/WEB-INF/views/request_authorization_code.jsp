<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tistory OAuth 2.0 JSP Sample - Example Authorization Code
</TITLE>
<style>
.form {
	text-align: center;
	padding: 100px
}

.btn {
	padding: 20px;
	font-size: 24px
}
</style>
</head>
<body>
	<form class="form" method="GET"
		action="https://www.tistory.com/oauth/authorize/">
		<input type="hidden" name="client_id" value="a5bffb32c3f38197aa7b8702e9eba13b" />
		
		<input type="hidden" name="redirect_uri" value="http://teqoo.tistory.com/" /> <!-- http://192.168.1.33:8500/www/  "<c:url value="/WordBookJSON"/>"-->
		
		<input type="hidden" name="response_type" value="code" />
		<!-- 이단계에서는 "code" 라고 반드시 입력 -->
		<button class="btn" type="submit">Request Athorization Code</button>
	</form>
</body>
</html>