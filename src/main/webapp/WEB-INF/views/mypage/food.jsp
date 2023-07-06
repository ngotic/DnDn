<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dndn</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
#contentbox {
	margin-top: 20px;
	width: 1000px;
	height: 600px;
}

#caldetail {
	width: 500px;
	padding: 30px;
	background-color: #fdfde0c5;
	height: 600px;
}

#cal::after{
	clear: right;
}

#morning, #lunch, #dinner {
	height: 30%;
}

#cal {
	width: 500px;
	height: 100%;
	margin-right: 0px;
	float: left;
}

#calendar {
	position: sticky;
	width: 500px;
	height: 100%;
	z-index: 3;
	background-color: white;
}

#caldetail {
	position: sticky;
	transform: translate(-500px, 0px);
	transition: 2s all;
	display: inline-block;
}
#caldetail>div{
display: inline-block;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div id="box">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp"%>
		<section class="container">
			<h1>식단 관리</h1>
			<div id="contentbox">
				<div id="cal">
					<div id='calendar'></div>
				</div>
				<div id="caldetail">
					<div id="morning">아침</div>
					<hr>
					<div id="lunch">점심</div>
					<hr>
					<div id="dinner">
						저녁
						<p>아직 배달예정인 내역이 없습니다.</p>
						<p onclick="location.href='/dndn/mypage/order.do';"
							style="cursor: pointer;">주문하러 가보실까요?</p>
					</div>
				</div>
			</div>
		</section>
	</div>

	<script>
		/*  document.addEventListener('click', function(event) {
		   console.log('screenX:', event.screenX);
		   console.log('screenY:', event.screenY);
		 }); 
		 document.addEventListener('click', function(event) {
			  $('#caldetail').css('display', 'inline-block');
			});*/
	</script>


	<script>
		document.addEventListener('click', function(event) {
			$('#caldetail').css({

				'transform' : 'translate(0px, 0px)'
			});
		});
		
		
		

		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				events : [ {
					title : '♣',
					start : '2023-07-01',
					end : '2023-07-01',
					backgroundColor : 'white',
					borderColor : 'white'
				} ],

			});
			calendar.render();

		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
		
	</script>
</body>
</html>














