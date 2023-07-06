<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>

</style>
</head>
<body>
	<!-- test.jsp -->
	
	<h1>WebSocket <small>연결 테스트</small></h1>
	
	
	<div>
		<button type="button" class="in" id="btnConnect">연결하기</button>
		<button type="button" class="out" id="btnDisconnect">종료하기</button>
	</div>
	
	
	<hr>
	
	<div>
		<input type="text" class="long" id="msg">
		<button type="button" class="add" id="btnEcho">에코 테스트</button>
	</div>
	
	
	<hr>
	
	<div class="message full"></div>
	
	
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	//1. 소켓 생성
	//2. 서버 접속(연결)
	//3. 통신
	//4. 서버 접속 종료
	
	const uri = 'ws://localhost/websocket/server.do';

	let ws;
	
	$('#btnConnect').click(function() {
		
		//1. 웹소켓 생성 > 자동으로 연결 요청
		ws = new WebSocket(uri);
		
		//웹소켓 서버에게 연결 요청이 성공하면 발생하는 이벤트 > 콜백 함수
		ws.onopen = function(evt) {
			log('서버와 연결되었습니다.')
		};
		
		ws.onclose = function(evt) {
			
			log('서버와의 연결이 종료되었습니다.');
			
		};
		
		ws.onmessage = function(evt) {
			
			log(evt.data); //서버가 보낸 메시지
			
		};
		
		ws.onerror = function(evt) {
			
			log('에러가 발생했습니다.');
			
		}
		
		
	});
	
	$('#btnDisconnect').click(function() {
		
		//연결된 소켓을 중단
		ws.close();
		log('연결을 종료합니다.');
		
	});
	
	
	$('#btnEcho').click(function() {
		
		//연결된 소켓으로 서버에게 데이터 전송하기
		
		//ws.CONNECTING : 연결중
		//ws.OPEN : 열림 > 통신 가능 상태
		//ws.CLOSING : 닫는 중
		//ws.CLOSED : 닫힘
		
		
		if (ws.readyState == ws.OPEN) {
			ws.send($('#msg').val());
			log('메시지를 전달했습니다.');
		}
		
	});
	
	
	
	function log(msg) {
		
		$('.message').prepend(`<div>[\${new Date().toLocaleTimeString()}] \${msg}</div>`);
		
	}
	

</script>
</body>
</html>






