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
	<!-- index.jsp -->
	
	<h1>WebSocket <small>Chat</small></h1>
	
	<div>
		<div class="group">
			<label>대화명</label>
			<input type="text" name="name" id="name" class="short">
		</div>
	</div>
	<div>
		<button type="button" class="in">들어가기</button>

		<button type="button" class="in" data-name="강아지">강아지</button>		
		<button type="button" class="in" data-name="고양이">고양이</button>		
		<button type="button" class="in" data-name="사자">사자</button>		
	</div>
	
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$('.in').click(function() {
		
		let name = $(event.target).data('name');
		
		if (name == null || name == undefined) {
			
			name = $('#name').val();
			
		}
		
		let child = window.open('/dndn/chat/chat.do', 'chat', 'width=404 height=510');
		
		$('.in').css('opacity', .5);
		$('.in').prop('disabled', true);
		
		child.addEventListener('load', function() {
			//child.connect($('#name').val());
			child.connect(name);
		});
		
		
		child.connect($('#name').val());
		
		
		
		
	});

</script>
</body>
</html>






