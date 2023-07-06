<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<link rel="stylesheet" href="/websocket/resources/css/chat.css">
<style>

</style>
</head>
<body>
	<!-- chat.jsp -->
	
	<div id="main">
		<div id="header">
			<h2>WebSocket <small></small></h2>
		</div>
		<div id="list">
			
		</div>
		<input type="text" id="msg" placeholder="대화 내용을 입력하세요.">
	</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script src="
https://cdn.jsdelivr.net/npm/dayjs@1.11.8/dayjs.min.js"></script>

<script>


	//창 닫을 때
	$(window).on('beforeunload', function() {
		
		$(opener.document).find('.in').css('opacity', 1);
		$(opener.document).find('.in').prop('disabled', false);
		
		//저 나가요~라고 서버에게 메시지 보내기
		let chat = {
			
			code: '2',
			sender: window.name,
			receiver: '',
			content: '',
			regdate: dayjs().format('YYYY-MM-DD HH:mm:ss')
				
		};
		
		ws.send(JSON.stringify(chat));
		
	});
	
	window.onkeydown = function() {
		
		if (event.keyCode == 116) {
			event.preventDefault();
			return false;
		}
		
	};
	
	
	/*
	
	
		101#hong#lee#안녕하세요.#2023..
	
		서버 <- (대화) -> 클라이언트
		
		- code: 상태코드
			1: 새로운 유저가 들어옴
			2: 기존 유저가 나감
			3: 메시지 전달
			4: 이모티콘 전달
		- sender: 보내는 유저명
		- receiver: 받는 유저명
		- content: 메시지
		- regdate: 날짜/시간
			
	*/
	
	
	



	//채팅 준비
	const url = 'ws://localhost:8091/dndn/chatserver.do';

	let ws;
	
	var name; //
	
	function connect(name) {
		
		$('#header small').text(name);
		ws = new WebSocket(url);
		ws.onopen = function(evt) {
			log('서버 연결 성공');
			//내가 접속했다고 다른 사람들에게 알리기
			let chat = {
				code: '1',
				sender: window.name,
				receiver: '',
				content: '',
				regdate: dayjs().format('YYYY-MM-DD HH:mm:ss')
			};
			ws.send(JSON.stringify(chat));
			print('', '입장했습니다.', 'me', 'state', chat.regdate);
			$('#msg').focus();
		};
		
		ws.onmessage = function(evt) {
			
			log('메시지 수신');
			
			let chat = JSON.parse(evt.data);
			
			log(chat.code + ':' + chat.sender);
			
			if (chat.code == '1') {
				//다른 사람 입장
				print('', `[\${chat.sender}]님이 입장했습니다.`, 'other', 'state', chat.regdate);
			} else if (chat.code == '2') {
				//다른 사람 퇴장
				print('', `[\${chat.sender}]님이 퇴장했습니다.`, 'other', 'state', chat.regdate);				
			} else if (chat.code == '3') {
				//대화 수신
				print(chat.sender, chat.content, 'other', 'msg', chat.regdate);
				
			} else if (chat.code == '4') {
				//이모티콘 수신
				printEmoticon(chat.sender, chat.content, 'other', 'msg', chat.regdate);
				
			}
			
		};
		
		ws.onclose = function(evt) {
			
		};
		
		ws.onerror = function(evt) {
			
		};
		
		
	}
	
	
	function log(msg) {
		
		console.log(`[\${new Date().toLocaleTimeString()}]` +  msg);
		
	}
	
	
	function print(name, msg, side, state, time) {
	      let temp = `
	         <div class="item \${state} \${side}">
	            <div>
	               <div>\${name}</div>
	               <div>\${msg}</div>
	            </div>
	            <div>\${time}</div>
	         </div>
	      `;      
	      $('#list').append(temp);
	      scrollList();
	   }

	function printEmoticon(name, msg, side, state, time) {
	      let temp = `
	         <div class="item \${state} \${side}">
	            <div>
	               <div>\${name}</div>
	               <div styl="background-color: #FFF; border: 0;"><img src="/websocket/resources/emoticon\${msg}.png"></div>
	            </div>
	            <div>\${time}</div>
	         </div>
	      `;      
	      $('#list').append(temp);
	      
	      setTimeout(scrollList, 100);
	      
	   }
	
	
	$('#msg').keydown(function(evt){
		
		if (evt.keyCode == 13) {
			
			let chat = {
					
					code: '3',
					sender: window.name,
					receiver: '',
					content: $('#msg').val(),
					regdate: dayjs().format('YYYY-MM-DD HH:mm:ss')
						
			};
			
			
			//이모티콘 전송
			if ($('#msg').val().startsWith('/')) {
				
				chat.code = '4';
				chat.content = chat.content.split(' ')[0];
				
			}
			ws.send(JSON.stringify(chat));
		
			if (chat.code == '3') {
				print(window.name, chat.content, 'me', 'msg', chat.regdate);
			} else if (chat.code == '4') {
				printEmoticon(window.name, chat.content, 'me', 'msg', chat.regdate);
			}

			$('#msg').val('').focus();
			
		}
		
	});
	
	
	function scrollList() {
		
		$('#list').scrollTop($('#list')[0].scrollHeight + 500);
		
	}
	
	
</script>
</body>
</html>






