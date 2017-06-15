<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ContextPath 선언 -->
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='http://fonts.googleapis.com/css?family=Bree+Serif|Open+Sans+Condensed:700,300,300italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/css/RotatingWords/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/css/RotatingWords/style.css" />
<script src="<%=cp%>/resources/js/RotatingWords/modernizr.custom.72111.js"></script>
<style>
.no-cssanimations .rw-wrapper .rw-sentence span:first-child {
	opacity: 1;
}
</style>
<!--[if lt IE 9]> 
			<style>
				.rw-wrapper{ display: none; } 
				.rw-sentence-IE{ display: block;  }
			</style>
		<![endif]-->
</head>
<body>
        <div class="container">
			<section class="rw-wrapper">
				<h2 class="rw-sentence">
					<span>Ik ben</span>
					<br />
					<div class="rw-words rw-words-1">
						<span>spice</span>
						<span>colors</span>
						<span>happiness</span>
						<span>wonder</span>
						<span>sugar</span>
						<span>happiness</span>
					</div>
				</h2>
			</section>
			
			<h2 class="rw-sentence-IE">Real poetry is like creating beautiful butterflies with a silent touch of spice</h2>
        </div>
    </body>
</html>