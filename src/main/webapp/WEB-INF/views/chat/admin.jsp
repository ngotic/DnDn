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
	<!-- admin.jsp -->
	
	<h1>알림 서비스 <small>관리자</small></h1>
	
	<div>
		<textarea id="msg"></textarea>
		<button type="button" id="btnSend" class="add">보내기</button>
	</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	const uri = 'ws://localhost/websocket/noticeserver.do';
	
	let ws;
	
	$(document).ready(function() { //페이지 초기화
		
		ws = new WebSocket(uri);
		
		ws.onopen = function(evt) {
			console.log('서버와 연결됨');
		};
		
		ws.onmessage = function(evt) {};
		
		ws.onclose = function(evt) {};
		
		ws.onerror = function(evt) {};
		
		
	});
	
	
	$('#btnSend').click(function() {
		
		ws.send($('#msg').val());
		
	});

</script>
</body>
</html>






