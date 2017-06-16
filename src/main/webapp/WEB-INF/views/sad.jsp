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
              sectionsColor: ['#FFEFAB', '#4BBFC3', '#7BAABE', 'whitesmoke', '#ccddff', '#ccddff', '#ccddff'],
              anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', '5thpage', '6thpage'],
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

<!-- for input text ui -->
		<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/InputEffects/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/InputEffects/fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/InputEffects/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/InputEffects/css/set1.css" />
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
<!-- for blog category ui -->
		<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/Transitions/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/Transitions/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/Transitions/css/icons.css" />
		<link rel="stylesheet" type="text/css" href="<%=cp%>/resources/Transitions/css/component.css" />
		<script src="<%=cp%>/resources/Transitions/js/modernizr.custom.js"></script>
		
<!-- for fontawesome -->
	<link href="<%=cp%>/resources/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet">	

<!-- for metroUI -->
    <link href="<%=cp%>/resources/metroUI/css/metro.css" rel="stylesheet">
    <link href="<%=cp%>/resources/metroUI/css/metro-icons.css" rel="stylesheet">
    <link href="<%=cp%>/resources/metroUI/css/metro-responsive.css" rel="stylesheet">

     <script src="<%=cp%>/resources/metroUI/js/jquery-2.1.3.min.js"></script> 
    <script src="<%=cp%>/resources/metroUI/js/metro.js"></script>

<!-- 내 css -->	
	<link href="<%=cp%>/resources/css/custom.css" rel="stylesheet">

<!-- 내 스크립트 -->
<script type="text/javascript">
 $(function() {
	 var stageOneEnd = false;
	 
		/* 	
		//크기 조정 친구들
		var windowWidth = $(window).width()*2/3; //document -350
		$("canvas").attr("width", windowWidth).attr("height", 500);
		//$("#startBtn").attr("width", canvas.getWidth()/2).attr("height", canvas.getHeigth()/2);
		 
		// 창 크기 바뀌면 할 것...
	    $( window ).resize(function() {
	    	 windowWidth = $(window).width()*2/3; //document -350
	    	 $("canvas").attr("width", windowWidth).attr("height", 500);
	    }); 
		*/
		
	 	// 캔버스 친구들
		var canvas = document.getElementById("canvas");
		var ctx = canvas.getContext("2d"); // 캔버스 객체 생성
		
		// 플레이 버튼 위치 설정
		//$("#startBtn").css('top',(canvas.width/2)+75+'px');
	/* 	$("#startBtn").css('left',(canvas.height/2)+75+'px');
		console.log((canvas.width/2)+150);
		console.log((canvas.height/2)+150); */
		
		// 배경화면 그려주는 친구들
 		var canvasTemp = document.createElement("canvas");
 		var tempContext = canvasTemp.getContext("2d");
 		var canvasBuffer;
 		var imgWidth = 0;
 		var imgHeight = 0;
 		var imageData = {};
 		var scrollVal = 0;
 		var speed = 1; // 스크롤 속도 // 빠른 거 2
 		
 		// 스크롤 이미지 크기
 		var canvasWidth = 2937;//canvas.width;
 		var canvasHeight = 532;//canvas.height;
 		
 		// 스크롤 이미지
 		var scrollImg= new Image();
 		
 		// 시작 이미지
 		var startImg = new Image();
 		
 		// 끝난 이미지 두개
 		var goodEndImg = new Image();
 		var sadEndImg = new Image();
 				
 		// 기본 객체
 		var backGroundMusic; // 배경음악 객체 생성
 		var canvasPen; // 캔버스에 그림을 그리는 펜
 		var keyPressOn = {}; //키 배열, pressed - true
 		var spacekey = false; // 스페이스 키
 		var oneSpacekey = false; // 스페이스 키 중복 처리 방지용
 		
 		// 플레이어 객체
 		var playerUnit={}; // 플레이어
 		var playerImgWalk1= new Image();
 		var playerImgWalk2= new Image();
 		var playerImgJump= new Image();
 		var playerWalkTime = 0;
 		var playerWalkTimeLimit =20; // 걷는 애니메이션 반복 속도
 		
 		// 스테이지 1 적 객체
 		var EnemyHangul; // 스테이지1 적객체 배열
 		var hangulViewCount=1; // 화면에 보이는 적객체 수 설정
 		var EnemyHangulMax = 10; // 미리 준비해두는 적객체 최대수
 		var hangulWord= new Array(); // 한글 저장용
 		var hangulSpeed = 4; // 한글 적 객체 스피드

 		var stageOneInterval; // 타이머 변수용
 		var scoreOne = 0; // 스코어 체크
 		var scoreMax = 3; // 끝나는 스코어
 		var checkScore = 0; // 맞는 문법 체크
 		
 		// 시동 걸기
 		function loadGame() {
 			// 기본 객체들 채워주기
 			canvasBuffer = document.createElement("canvas"); // 캔버스에 펜있다고 넣어주기
 			
 			// 백그라운드 이미지
 			scrollImg.src = "<%=cp%>/resources/images/city.png";
 			scrollImg.onload = loadImage; // 스크롤 이미지 불러오기 완료되야 loadimage를 호출한다
 			
 			// 배경음악 객체 채워주는 함수 호출
 			makeBackGroungMusic();
 			
 			// 엔딩 이미지 추가 
 			goodEndImg.src = "<%=cp%>/resources/images/End2.png";
 			sadEndImg.src = "<%=cp%>/resources/images/End1.png";

 			// 플레이어 객체들 채워주기
 			makePlayerUnit();
 			// 플레이어 이미지 추가
 			playerImgWalk1.src = "<%=cp%>/resources/images/charactor/female_walk1_re.png";
 			playerImgWalk2.src = "<%=cp%>/resources/images/charactor/female_walk2_re.png";
 			playerImgJump.src = "<%=cp%>/resources/images/charactor/female_jump_re.png";
 			
 			// 한글 적 객체 채우기
 			EnemyHangul= new Array();
 			createEnemyHangul(EnemyHangulMax); // 최대값 만큼 객체 생성 / 최대값은 DB에 있는 단어만큼 생성하는게 어떨까 / 그리고 서버가 터졌다 
 		
 			// 창 자체에 이벤트 리스너를 설정 //document O // 버블 일어남, canvas X , window O
 			document.addEventListener("keydown", getKeyDown, false); // true 여도 같음
 			document.addEventListener("keyup", getKeyUp, false);
 			
 			// 게임 스타트
 			startGame();
 		}
 		
 		// 게임 실행
 		function startGame(){
 			
 			// 캐릭터 짬프는 키보드 입력 받는 곳에서 해결됨
 			// 캐릭터 짬프 애니메이션 - 3씩 올라갔다가 3씩 내려옴
 			// 점프 애니메이션이 실행되는 동안에는 점프 키 입력을 받아도 모른척 해야함
 			// 라잌 쿠키런
 						
 			// 적이 지정된 시간마다 움직임
 			stageOneInterval = setInterval(() => {
 				// 배경화면 스크롤 함수
 				// 스크롤 한바퀴 다돌아 간경우 스크롤을 초기화한다
 				if (scrollVal <= speed) { //1 5 0 2가 0오류 안남
 					scrollVal = canvasWidth - speed;
 				}
 				
 				// 지정된 속도를 기준으로 스크롤의 값이 늘어난다(그리는 위치가 변경된다)
 				scrollVal -= speed;
 				
 				// 단어 움직임 로직
 				useEnemyHangul();
 				
 				// 적객체와 플레이어 충돌 처리 // 됨 범위 좁힌 버전
				for(var i=0;i<EnemyHangul.length;i++){ // 적객 체 돌려
 					
 					var oneHangul = EnemyHangul[i];
 				
 					//일단 쓰는 한글인지 조사
 				 	if(oneHangul.use){
 				 		//  Y 거리 확인 > X충돌값 확인  > 처리
 				 		var bamX = oneHangul.x - playerUnit.x;
 				 		
 				 		if(bamX<=playerUnit.width && (playerUnit.width-bamX<playerUnit.width || playerUnit.width-bamX<playerUnit.width+5)){
 				 			
 				 			if(oneHangul.y-playerUnit.y==70){//아래
	 				 			scoreOne++;	
 				 				// 적 객체 체크가 true면 +1 false면 -1
 	 				 			if(oneHangul.wordCheck == true || oneHangul.wordCheck == 'true'){
 	 				 				checkScore++;
 	 				 			}
 				 				EnemyHangul[i].use=false;
 				 			
 		 				 	}else if (oneHangul.y-playerUnit.y==92){ // 위
	 				 			scoreOne++;	
 		 				 		// 적 객체 체크가 true면 +1 false면 -1
 	 				 			if(oneHangul.wordCheck == true || oneHangul.wordCheck == 'true'){
 	 				 				checkScore++;
 	 				 			}
 		 				 		EnemyHangul[i].use=false;
 							}	
				 		}
 					}
 				}
 				// 그리기
 				renderGame();
 				
 				// 게임 끝나는 지 여부 확인 하고 엔딩 화면 그려줌..?
 				if(scoreOne>=scoreMax){
 					stageOneEnd=true;
 					clearInterval(stageOneInterval);
 					clearGame();
 				}
 			},  1000 / 60);  //60
 		}
 		
 		// 지우고 전체 다 다시 그려주는 곳
 		function renderGame(){
 			// 지우기
 			ctx.clearRect(0, 0, canvas.width, canvas.height);
 			
 			// 배경 그리기
 			imageData = tempContext.getImageData(canvasWidth - scrollVal,0, canvasWidth, canvasHeight);
 			ctx.putImageData(imageData, 0, 0, 0, 0, canvasWidth, imgHeight);

 			// 배경 스크롤을 그려주는 부분
 			imageData = tempContext.getImageData(0, 0, canvasWidth - scrollVal, canvasHeight);
 			ctx.putImageData(imageData, scrollVal,0 , 0, 0, imgWidth, canvasHeight);
 			
 			// ctx.fillText(scoreOne+"",playerUnit.x,playerUnit.y); // x, y 점수 체크용
 			
 			// 플레이어 그리기
 			if(!spacekey){ //playerUnit.jump
 				if(playerUnit.walk){
 					ctx.drawImage(playerImgWalk1,playerUnit.x,playerUnit.y);
 					
 					playerWalkTime++;
 					if(playerWalkTime>playerWalkTimeLimit){
 						playerUnit.walk=false;
 						playerWalkTime=0;
 					}
 				}
 				else{
 					ctx.drawImage(playerImgWalk2,playerUnit.x,playerUnit.y);
 					
 					playerWalkTime++;
 					if(playerWalkTime>playerWalkTimeLimit){
 						playerUnit.walk=true;
 						playerWalkTime=0;
 					}
 				}
 			}
 			else{
 				ctx.drawImage(playerImgJump,playerUnit.x,playerUnit.y);
 			}
 			
 			// 단어 그림
 			for(var i=0;i<EnemyHangul.length;i++){ // 적객 체 돌려
 				
 				var oneHangul = EnemyHangul[i];
 				
 			 	 if(oneHangul.use){
 					ctx.font="30px Noto Sans KR";
 					// 그냥 글씨
 					//ctx.fillStyle = 'white';
 					//ctx.fillText(oneHangul.word,oneHangul.x,oneHangul.y); // x, y
 					
 					// 두꺼운 글씨
 					ctx.lineWidth = 2;
 				    // stroke color
 				    ctx.strokeStyle = 'blue'; // grey black blue red 
 				   	ctx.strokeText(oneHangul.word,oneHangul.x,oneHangul.y);
 				   	
 					if(oneHangul.x<-10){ //0
 						oneHangul.use= false;
 					}
 				}
 			}		
 		}
 		// 게임 끝났을 때 화면
 		function clearGame(){
 			// 지우기
 			ctx.clearRect(0, 0, canvas.width, canvas.height);

	 		if(checkScore>Math.floor(scoreMax/2)){ //scoreMax/2 Math.Floor
	 			// 굿 엔딩
	 			ctx.drawImage(goodEndImg,0,0);
	 		}
	 		else {
				// 새드 엔딩
				ctx.drawImage(sadEndImg,0,0);
			}

 		}
 		
 		// 배경 이미지 로딩
 		function loadImage() {
 			/* 사용된 이미지의 폭과 너비를 저장하고 그림용 펜의 역할을 수행하는 캔버스 템프에도 담아둔다  */
 			imgWidth =  scrollImg.width || scrollImg.naturalWidth;//scrollImg.width;
 			imgHeight = scrollImg.height || scrollImg.naturalHeight;//scrollImg.height;
 			canvasTemp.width = imgWidth;
 			canvasTemp.height = imgHeight;

 			/* 그림을 그리고 현재 그림의 테이터를 담아둔다 */
 			tempContext.drawImage(scrollImg, 0, 0, imgWidth, imgHeight);
 			imageData = tempContext.getImageData(0, 0, imgWidth, imgHeight);

 			/* 캔버스 버퍼 객체에 펜을 담는다 */
 			canvasBuffer = document.createElement("canvas");
 		}
 		
 		// 플레이어 객체 만드는 곳
 		function makePlayerUnit(){
 			
 			var imgWalkWidth = 80;
 			var imgWalkHeight = 92;
 			
 			playerUnit = {
 					x : 150,
 					y : 350,
 					width : imgWalkWidth,
 					height : imgWalkHeight,
 					walk:true
 			};
 		}

 		// 한글 객체를 만드는 곳
 		function createEnemyHangul(wordcount){
 			for (var i = 0; i < wordcount; i++) {
 				var enemy = {
 					x : 1000,
 					y : 600,
 					width:0,
 					height:0,
 					word:"",//Math.floor(Math.random() * 10);// 랜덤수 // 그냥 123 할까
 					wordCheck:false, // 단어의 정답 여부
 					use :false //1 캔버스에 그려주는 지 스킵하는지 용도
 				};
 				EnemyHangul.push(enemy);
 			}
 		}
 		// 한글 객체를 쓰는 곳
 		function useEnemyHangul() {
 			
 			// DB에서 가져온 배열중 
 			// 한개를 뽑아서 밑에 집어넣는다
 			//hangulWord
 			
 			var useCount = 0;
 			// 화면에 보이는 단어 3개로 조정하기 위해서
 			for(var i=0; i<EnemyHangul.length;i++){
 				if(EnemyHangul[i].use){
 					useCount++;
 					// true인 친구들은 왼쪽으로 보냄
 					// 한글 객체 속도
 					EnemyHangul[i].x=EnemyHangul[i].x-hangulSpeed;
 				}
 			}
 			// 화면에 보이는 게 hangulViewCount이하면 한개 내보냄
 			if(useCount<hangulViewCount){
 				// 랜덤 Y값 준비
 				var startY=((Math.random() <= 0.5) ? 350 : 420);//)*150;
 				// X값 초기화, Y값이랑 word값, use 값을 고쳐야함
 				
 				var bool = true;
 				while(bool){
 					var randomNum = Math.floor((Math.random() * 10));
 					console.log();
 					
 					if(!EnemyHangul[randomNum].use){
 						bool=false; // 반복문 내보냄
 						
 						EnemyHangul[randomNum].x=1000; // x바꿈
 						EnemyHangul[randomNum].y=startY; // Y바꿈
 						EnemyHangul[randomNum].word = hangulWord[randomNum].word; 
 						EnemyHangul[randomNum].wordCheck = hangulWord[randomNum].check;
 						EnemyHangul[randomNum].use=true;
 					}
 				}
 				
 			}
 		}

 		// 키 누름 
 		function getKeyDown(event) { 

 			/* 버블 해결용 근데 안됨 */
 		/* 	event = event || window.event;
		    if (typeof event.stopPropagation != "undefined") {
		    	event.stopPropagation();
		    } else {
		    	event.cancelBubble = true;
		    }
		    if (event.keyCode == 32) { 
		        $(this).val($(this).val() + "-"); // append '-' to input
		        return false; // return false to prevent space from being added
		    } */
		    /* 버블 해결용 근데 안됨 */
		    
 	 		var keyValue;		
 			if (event == null) {
 				return;
 			} else {
 				keyValue = event.keyCode;
 				
 				if (keyValue == "123" || keyValue == "116"){
 					 // f12 ,f5 누르게 해주는 if문
 				}
 				else{
 					event.preventDefault(); //키값 들어오면 js에서만 해당 키를 이용함
 				}
 			}
 			if (keyValue == "87"){
 				keyValue = "287"; //up 38
 				}
 			else if (keyValue == "83"){
 				keyValue = "283"; //down 40
 			}
 			else if (keyValue == "65"){
 				keyValue = "265"; //left 37
 			}
 			else if (keyValue == "68"){
 				keyValue = "268"; //right 39
 			}
 			keyPressOn[keyValue] = true;
 				
 			// 점프
 			if (keyValue == "90") { /* z : 90 / alt :18 / ctrl : 17 / shift : 16 / space : 32 */
 				
 				spacekey = true;
 	 			calcKeyInnput(); // 방향키 입력 // 플레이어 위치값 
 			}
 			//calcKeyInnput(); // 방향키 입력 // 플레이어 위치값 // 여기 두니까 스페이스 말고도 처리함
 			
 		}
 		// 키 뗌 
 		function getKeyUp(event) {
 			var keyValue;
 			if (event == null) {
 				keyValue = window.event.keyCode;
 				window.event.preventDefault();
 			} else {
 				keyValue = event.keyCode;
 				
 				console.log(keyValue);
 				
 				if (keyValue == "123" || keyValue == "116"){} // f12 ,f5
 				else{
 					event.preventDefault(); //키값 들어오면 js에서만 해당 키를 이용함
 				}
 			}
 			if (keyValue == "87")
 				keyValue = "287"; //up 38
 			else if (keyValue == "83")
 				keyValue = "283"; //down 40
 			else if (keyValue == "65")
 				keyValue = "265"; //left 37
 			else if (keyValue == "68")
 				keyValue = "268"; //right 39
 			keyPressOn[keyValue] = false;

 			// 점프
 			if (keyValue == "90") { /* z : 90 / alt :18 / ctrl : 17 / shift : 16 / space : 32 */
 				// 점프 꾸욱 누른다고 연점 되는거 아니니까 그냥 up에서 점프 처리하게 바꾸기
 				spacekey = false;
 				calcKeyInnput(); // 방향키 입력 // 플레이어 위치값 
 			}
 			//calcKeyInnput(); // 방향키 입력 // 플레이어 위치값 // 여기 두니까 스페이스 말고도 처리함		
 		}
 		// 방향키 입력 처리
 		function calcKeyInnput() {
 
 			if(spacekey){
 				if(!oneSpacekey){
 				playerUnit.y-=92;
 				oneSpacekey=true;
 				}
 			}else{
 				playerUnit.y+=92;
 				oneSpacekey=false;
 			}
 			// 게임 상태가 아닐때만 그림 다시 그리기
 			if(!stageOneEnd){
 				renderGame();
 			}
 		}
 		
 		// 배경음악 객체 채워주기
 		function makeBackGroungMusic(){
 			backGroundMusic = document.createElement("audio");
 			backGroundMusic.volume = 1.0;
 			// BackGroundMusic.src = "<c:url value="../resources/sound/war.mp3"/>"; // 안됨
 			backGroundMusic.src = "<%=cp%>/resources/sound/war.mp3";
 			backGroundMusic.setAttribute('id', 'backGroundMusic');
 			document.body.appendChild(backGroundMusic);
 		}
 		
 		// 스타트 버튼 클릭 시 
 		$('#startBtn').click(function(){
             $("#startBtn").hide();
    
 			 $("#gameGuideBtn").show();
 		});
 		
 		// 게임 가이드 버튼 클릭 시
 		$('#gameGuideBtn').click(function(){
 			
             $("#gameGuideBtn").hide();
 			
 			 $.ajax({
	            url : "<c:url value="/WordBookJSON"/>", 
	            type : "post",
	            dataType : "json",
	            contentType : 'application/json',
	            success : function(json) {
	            	for(var i in json){
	            		hangulWord[i]=json[i];
	                }
	            	EnemyHangulMax=hangulWord.length; // 배열 크기만큼 최대값 설정
	            	loadGame(); // 시작버튼을 누르면 해당 함수가 실행되게 변경
	            },
	            error : function(xhr, status, error) {
	            	console.log("에러"+error);
	            }
        	 });
 			 $("#canvas").show();
 		});
 		
 		// 추가버튼 클릭
 	 	$('#wordInsertBtn').click(function(){
 	 		 $.ajax({
 		         url : "<c:url value="/InsertWordBook"/>", 
 		         type : "get", //post
 		         dataType : "json",
 		         data: $('form').eq(0).serialize(),
 		         contentType : 'application/json',
 		         success : function(json) {
 		        	 if(json.check){
  		        		$('#newWord').val("");
 		        		alert("잘 들어감");
 		        	 }else{
 		        		console.log("ㄴㄴ 큰일남");
 		        	 }
 		         },
 		         error : function(request,status,error) { //xhr, status, 
 		        	 console.log("code:"+request.status+"\n"+"error:"+error);
 		         }
 	        });
 	 	});
 		
 		// 스킬 바
  		jQuery('.skillbar').each(function(){
  		       jQuery(this).find('.skillbar-bar').animate({
  		        	width:jQuery(this).attr('data-percent')
  		       },6000);
  		});
 	});
</script>

</head>
<body>
<div id="fullpage">
	<!-- 메인 -->
    <div class="section active" id="section0">
     <div class="intro">
    			<h2 class="rw-sentence">
					<span><img src="<%=cp%>/resources/images/carouselFix/IMG_6049_fix2.png" alt="logo" style="width: 250px; height: auto;"/></span>
					<!-- <br /> -->
					<div class="rw-words rw-words-1"><!-- 추가 되면 span:nth-child(num)에도 추가 -->
						<span>황인영</span>
						<span>취업준비생</span>
						<span>뉴비개발자</span>
						<span>게이머</span>
						<span>사자</span>
						<span>파랑색</span>
					</div>
				</h2>
			</div>
    </div>
   
   <!-- 자기 소개 -->
    <div class="section" id="section1">
        <div class="intro">
            <h1>개발자가 되고 싶어요</h1>
            <p>코딩 할 때가 제일 행복했어요. 코딩 너무 즐겁다.. </p>
        </div>
    </div>
    
    <!-- 게임 -->
    <div class="section" id="section2">
        <div class="slide active" id="slide1">
            <div class="intro">
                <h1>게임</h1>
                <canvas id="canvas" width="1000" height="500" style="display: none;"></canvas>

				<div class="row">
					<div class="" id="playbutton">
						<img id="startBtn" src="<%=cp%>/resources/images/startImgInvi.png" alt="PlayButton">
						<img id="gameGuideBtn" src="<%=cp%>/resources/images/gameG.png" alt="gameguide" style="display: none;">

					</div>
				</div>
            </div>
        </div>
        
        <div class="slide" id="slide2">
            <h1>단어추가</h1>
            <div class="form">
            		<form>
<div class="input-control text">
    <input type="text">
</div>
<div class="input-control select">
    <select>
        <option>1</option>
        <option>2</option>
        <option>3</option>
    </select>
</div>
<button class="button primary">Primary</button>
				
					<div class="col-md-4 col-md-offset-1">
						<input type="text" class="form-control" id="newWord" name="wordbook_word" placeholder="단어 입력"/>
					</div>
					<div class="col-md-4">
						<select class="form-control" id="newWordCheck"
							name="wordbook_wordcheck">
							<option value="1">올바른 맞춤법</option>
							<option value="0">잘못된 맞춤법</option>
						</select>
					</div>
					<div class="col-md-2">
						<button type="button" name="submit" id="wordInsertBtn" class="btn btn-primary">추가</button>
					</div>
					
					</form>
        </div>
        <!-- 단어 추가 버튼을 눌러야만 나옴 -->
       <%--  
       <div class="slide" id="slide3"> 
            <h1>단어추가 하기 전에 확인했나요</h1>
            <img src="<%=cp%>/resources/images/carouselFix/sleep.jpeg" alt="logo" style="width: 250px; height: auto;"/>
            <input type="button" name="input" value="등록">
        </div> 
        --%>
        
    </div>
    
    <!-- 블로그 -->
    <div class="section" id="section3">
        <div class="intro">
            <h1>블로그도 있어요</h1>
			<div id="st-trigger-effects" >
				<c:forEach items="<%=posts%>" var="i" varStatus="Status">
					<a href="${i.postUrl}" target="_blank"><button data-effect="st-effect-\${Status}">${i.title}</button></a> 
				</c:forEach>
			</div>
        </div>
    </div>
    
    <!-- 프로젝트 사진 / 설명 -->
    <div class="section" id="section4">
        <div class="slide active" id="slide1">
            <h1>Shooting Game Project</h1>
            <div class="main clearfix">
							<div id="st-trigger-effects" class="column">
								<img src="<%=cp%>/resources/images/project/SGP01.png" width="300" height="auto">
							</div>
							<div class="column">
								<!-- <p>게임 화면</p> -->
								<p>좌측에는 내가 플레이 하는 화면이 보여지고 <br/>우측에는 상대방의 플레이 화면이 실시간으로 보여진다.</p>
							</div>
						
						</div><!-- /main -->
       		 </div>
        
        <div class="slide" id="slide2">
            <h1>프로젝트2</h1>
        </div>
        
        <div class="slide" id="slide3">
            <h1>프로젝트3</h1>
        </div>
    </div>
    
     <!-- 뇌구조 -->
    <div class="section" id="section5">
           <div class="intro">
            <h1>기술</h1>
            
				<div class="skillbar clearfix " data-percent="40%">
					<div class="skillbar-title" style="background: #d35400;"><span>HTML5</span></div>
					<div class="skillbar-bar" style="background: #e67e22;"></div>
					<div class="skill-bar-percent">40%</div>
				</div> <!-- End Skill Bar -->
				
				<div class="skillbar clearfix" data-percent="25%"> <!--  clearfix -->
					<div class="skillbar-title" style="background: #2980b9;"><span>CSS3</span></div>
					<div class="skillbar-bar" style="background: #3498db;"></div>
					<div class="skill-bar-percent">25%</div>
				</div> <!-- End Skill Bar -->
				
				<div class="skillbar clearfix " data-percent="60%">
					<div class="skillbar-title" style="background: #2c3e50;"><span>jQuery</span></div>
					<div class="skillbar-bar" style="background: #2c3e50;"></div>
					<div class="skill-bar-percent">60%</div>
				</div> <!-- End Skill Bar -->
				
				<div class="skillbar clearfix " data-percent="80%">
					<div class="skillbar-title" style="background: #46465e;"><span>JAVA</span></div>
					<div class="skillbar-bar" style="background: #5a68a5;"></div>
					<div class="skill-bar-percent">80%</div>
				</div> <!-- End Skill Bar -->
				
				<div class="skillbar clearfix " data-percent="75%">
					<div class="skillbar-title" style="background: #333333;"><span>Oracle</span></div>
					<div class="skillbar-bar" style="background: #525252;"></div>
					<div class="skill-bar-percent">75%</div>
				</div> <!-- End Skill Bar -->
			
    		</div>
    </div>
    
   <!-- special으로 능력치 -->
     <!-- 
     <div class="section" id="section6">
           <div class="intro">
            <h1>새로운 것이 들어올 공간</h1>
            
        	</div>
    </div> 
    -->
    
</div>

</body>
</html>