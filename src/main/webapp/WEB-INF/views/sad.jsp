<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 추가됨 -->
<!-- ContextPath 선언 -->
<% String cp = request.getContextPath(); %>
<!-- Json 파싱 하는 곳 -->
<% 
	String temp = (String) request.getAttribute("tistoryJson");
	Object obj = JSONValue.parse(temp);
	JSONObject object = (JSONObject) obj;
	
	JSONObject tistory = (JSONObject) object.get("tistory"); //"tistory"
	JSONObject item = (JSONObject) tistory.get("item"); //"item"
	JSONArray posts = (JSONArray)item.get("posts"); //"posts" 

	/* 
	for(int i=0; i<posts.size();i++){
		JSONObject post = (JSONObject) posts.get(i);
	} 
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!-- for Fullpage -->
    <link rel="stylesheet" type="text/css" href="<%=cp%>/resources/fullpage/css/jquery.fullPage.css" />
    <link rel="stylesheet" type="text/css" href="<%=cp%>/resources/fullpage/css/examples.css" />
    <!-- customeCSS -->
	<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/fullpage/css/ikbencustome.css" />
    <!--[if IE]>
        <script type="text/javascript">
             var console = { log: function() {} };
        </script>
    <![endif]-->
	
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

    <script type="text/javascript" src="<%=cp%>/resources/fullpage/js/jquery.fullPage.js"></script>
    <script type="text/javascript" src="<%=cp%>/resources/fullpage/js/examples.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#fullpage').fullpage({
              sectionsColor: ['#1bbc9b', '#4BBFC3', '#7BAABE', 'whitesmoke', '#ccddff'],
              anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
              menu: '#menu',
            });
        });
        <%--  sectionsImage : ['<%=cp%>/resources/fullpage/js/examples.js', '#4BBFC3', '#7BAABE', 'whitesmoke', '#ccddff'], --%><%-- '<%=cp%>/resources/fullpage/js/examples.js' --%>
    </script>
    
<!-- for RotatingWord -->
	<link href='http://fonts.googleapis.com/css?family=Bree+Serif|Open+Sans+Condensed:700,300,300italic' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/RotatingWords/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/RotatingWords/css/style.css" />
	<script src="<%=cp%>/resources/RotatingWords/js/modernizr.custom.72111.js"></script>
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
	
<!-- 내 스크립트 -->

</head>
<body>
<div id="fullpage">
    <div class="section active" id="section0">
    			<h2 class="rw-sentence">
					<span><img src="<%=cp%>/resources/images/carouselFix/IMG_6049_fix2.png" alt="logo" style="width: 250px; height: auto;"/></span>
					<br />
					<div class="rw-words rw-words-1">
						<span>황인영</span>
						<span>취업준비생</span>
						<span>뉴비개발자</span>
						<span>게이머</span>
						<span>24살</span>
						<span>파랑색</span>
					</div>
				</h2>
    </div>
   
    <div class="section" id="section1">
        <div class="intro">
            <h1>개발자가 되고 싶어요</h1>
            <p>코딩 할 때가 제일 행복했어요.</p>
        </div>
    </div>
    
    <div class="section" id="section2">
        <div class="slide active" id="slide1">
            <div class="intro">
                <h1>게임</h1>
            </div>
        </div>
        <div class="slide" id="slide2">
            <h1>단어추가</h1>
            <input type="button" name="input" value="등록"><!-- 버튼 누르면 slide3이 생기고 해당 페이지로 이동  -->
        </div>
        <div class="slide" id="slide3"> <!-- 단어 추가 버튼을 눌러야만 나옴 -->
            <h1>단어추가 하기 전에 확인했나요</h1>
            <img src="<%=cp%>/resources/images/carouselFix/sleep.jpeg" alt="logo" style="width: 250px; height: auto;"/>
            <input type="button" name="input" value="등록">
            
        </div>
    </div>
    
    <div class="section" id="section3">
        <div class="intro">
            <h1>블로그도 있어요</h1>
            <p>
				<c:forEach items="<%=posts%>" var="i" varStatus="Status">
					<a href="${i.postUrl}" target="_blank">${i.title}</a> 
					<c:if test="${!Status.last}"> | </c:if>
				</c:forEach>
			</p>
        </div>
    </div>
    
    <div class="section" id="section4">
        <div class="slide active" id="slide1">
            <h1>프로젝트1</h1>
        </div>
        <div class="slide" id="slide2">
            <h1>프로젝트2</h1>
        </div>
        <div class="slide" id="slide3"> <!-- 단어 추가 버튼을 눌러야만 나옴 -->
            <h1>프로젝트3</h1>
        </div>
    </div>
</div>

</body>
</html>