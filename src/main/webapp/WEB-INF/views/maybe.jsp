<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ContextPath 선언 -->
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=cp%>/resources/css/parallax.css" rel="stylesheet">
<script type="text/javascript"
	src="<%=cp%>/resources/js/parallaxJS.js"></script>
	<script type="text/javascript"
	src="<%=cp%>/resources/bootstrap/js/jquery.js"></script>
</head>
<body>
<div class="container">
  <section>
    <div class="image" data-type="background" data-speed="2"></div>
    <div class="stuff" data-type="content"><h1>Simple Parallax scroll</h1><h2>Reoptimized</h2></div>
  </section>

  <section>
    <div class="image" data-type="background" data-speed="7"></div>
    <div class="stuff" data-type="content"><h2>Made to be fast</h2><p>Lorem Deserunt maiores minima ipsa. Adipisci, corrupti, voluptatibus! Similique quidem necessitatibus provident.</p></div>
  </section>

  <section>
    <div class="image" data-type="background" data-speed="6"></div>
    <div class="stuff" data-type="content">Accusamus at ex amet perferendis atque fuga, ad earum, ipsa perspiciatis, dolore neque, accusantium consectetur quis voluptatibus culpa architecto animi natus facere expedita sed. Voluptatem odit explicabo amet neque aut.</div>
  </section>

  <section>
    <div class="image" data-type="background" data-speed="5"></div>
    <div class="stuff" data-type="content">Accusamus at ex amet perferendis atque fuga, ad earum, ipsa perspiciatis, dolore neque, accusantium consectetur quis voluptatibus culpa architecto animi natus facere expedita sed. Voluptatem odit explicabo amet neque aut.</div>
  </section>

  <section>
    <div class="image" data-type="background" data-speed="3"></div>
    <div class="stuff" data-type="content">Accusamus at ex amet perferendis atque fuga, ad earum, ipsa perspiciatis, dolore neque, accusantium consectetur quis voluptatibus culpa architecto animi natus facere expedita sed. Voluptatem odit explicabo amet neque aut.</div>
  </section>

  <section>
    <div class="image" data-type="background" data-speed="3"></div>
    <div class="stuff" data-type="content">Accusamus at ex amet perferendis atque fuga, ad earum, ipsa perspiciatis, dolore neque, accusantium consectetur quis voluptatibus culpa architecto animi natus facere expedita sed. Voluptatem odit explicabo amet neque aut.</div>
  </section>
</div>

<div class="at-twitter"><a href="//twitter.com/hendrysadrak" target="_blank">@hendrysadrak</a></div>
</body>
</html>