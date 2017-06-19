<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 추가됨 -->
<!-- ContextPath 선언 -->
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- for metro -->
    <link href="<%=cp%>/resources/metro/css/metro.css" rel="stylesheet">
    <link href="<%=cp%>/resources/metro/css/metro-icons.css" rel="stylesheet">
    <link href="<%=cp%>/resources/metro/css/metro-responsive.css" rel="stylesheet">

    <script src="<%=cp%>/resources/metro/js/jquery-2.1.3.min.js"></script>
    <script src="<%=cp%>/resources/metro/js/metro.js"></script>
</head>
<body>

	<div class="grid">
		<div class="input-control text">
			<input type="text" placeholder="Input you text here...">
		</div>
		
		<br />
		
		<div class="input-control select">
			<select>
				<option>클릭</option>
				<option>올바른 맞춤법</option>
				<option>잘못된 맞춤법</option>
			</select>
		</div>
		
		<br />
		
		<button class="button">Caption</button>
	</div>

</body>
</html>