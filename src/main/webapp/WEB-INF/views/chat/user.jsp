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

	#msgBox {
		border: 1px solid var(--border-color);
		width:200px;
		height: 150px;
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 0;
		background-color: #FFF;
		border-radius: 5px; 
		position:fixed;
		right: 10px;
		bottom: -200px;
		opacity: 0;
		transition: all 1s;
	}

</style>
</head>
<body>
	<!-- user.jsp -->
	
	<h1>알림 서비스 <small>유저</small></h1>

	<div id="msgBox"></div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	function showMsgBox(msg) {
		
		$('#msgBox').text(msg);
		
		$('#msgBox').css({
			bottom: '20px',
			opacity: 1
		});
		
		setTimeout(function() {
			$('#msgBox').css({
				bottom: '-200px',
				opacity: 0
			});
		}, 5000);
		
	}
	
	
	//showMsgBox();

	
	const uri = 'ws://localhost/websocket/noticeserver.do';
	
	let ws;
	
	$(document).ready(function() {
		
		ws = new WebSocket(uri);
		
		ws.onopen = function(evt) {
			
			console.log('연결 성공');
			
		};
		
		ws.onmessage = function(evt) {
			
			console.log(evt.data);
			
			showMsgBox(evt.data);
			
		};
		
		ws.onclose = function(evt) {
			
			console.log('연결 종료');
			
		};
		
		ws.onerror = function(evt) {};
		
	});
	
	
	
</script>
</body>
</html>






