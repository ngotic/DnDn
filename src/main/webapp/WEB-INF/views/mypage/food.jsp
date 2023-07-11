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

#side-content > table > tbody > tr:nth-child(3) {
	background-color: #F1F1F1 !important;
}

#contentbox {
	width: 900px;
	height: 600px;
	margin: 20px;
	padding: 10px;
}

#calendar > table {
	background-color: white;
}
 #caldetail {
	width: 880px;
	padding: 30px;
	background-color: #fdfde0c5;
	margin-bottom: 30px;
	border-radius: 20px;
	margin-top: 120px;
	margin-left: 28px;
}

#morning, #lunch{
	margin: 20px 0;
}

#caldetail>div {
	display: inline-block;
}

.fc-event-title {
	width: 100%;
	padding: 0 5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	color: black;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 1, 'wght' 300, 'GRAD' 200, 'opsz' 20
}

.material-symbols-outlined {
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}

.fc-event-title-container {
	text-align: left !important;
	width: 5px !important;
}

.fimg {
	width: 120px;
	margin: 10px;
}
.inner{
	width: 100%;
	padding: 20px;
	display: grid;
	grid-template-columns: 200px 400px 200px;
	grid-template-rows: 1fr;
	color: black !important;
	font-size: 1.5rem;
	align-items: center;
}
.inner :not(:first-child){
	margin-top: 15px;
}
.btn{
	border: 0px;
	float: right;
}
.name{
	margin: 0;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<section class="container">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp"%>
			<div id="pageTitle">식단 관리</div>
			<div id="contentbox">
				<div id="cal">
					<div id='calendar'></div>
				</div>
			</div>
		<div id="caldetail">
					<div id="morning"></div>
					<hr>
					<div id="lunch"></div>
				</div>
		</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<script>
		/* document.addEventListener('click', function(event) {
			
			$('#caldetail').css({

				//'transform' : 'translate(800px, 0px)'
				
		   });
			
		});
 */		
 
 
 function detailfood(check){
	$('#morning').text('새벽배송');
	$('#lunch').text('오전배송');
	 
 var currentDate = new Date().toLocaleString('en-US', { timeZone: 'Asia/Seoul' });
 var dateObject = new Date(currentDate);
 var year = dateObject.getFullYear();
 var month = ('0' + (dateObject.getMonth() + 1)).slice(-2);
 var day = ('0' + dateObject.getDate()).slice(-2);
 var today = year + '-' + month + '-' + day;

if(check == null){	 

 <c:forEach items="${Flist}" var="dto">
   <c:forEach items="${dto.resultShip}" var="ship">
     var shipDate = "${ship}";

     shipDate = shipDate.toString();

     console.log("정기배송 날짜: " + shipDate);
     console.log("현재날짜: " + today);

     if (today === shipDate) {
       var shiptime = "${dto.shiptime}";

	       if (shiptime === "0") {
	        
	         $('#morning').append('<div class="inner" style="height:180px;"><div class="images"><img class="fimg" src="${dto.lunchpic }"></div><div class="name">${dto.lunchname}</div><button class="btn">[상세보기]</button></div>');
	         
	       } else if (shiptime === "1") {
	         $('#lunch').append('<div class="inner" style="height:180px;"><div class="images"><img class="fimg" src="${dto.lunchpic }"></div><div class="name">${dto.lunchname}</div><button class="btn">[상세보기]</button></div>');
	    	}
     }/* else if(shipDate == null){
    	 $('#morning').append('아직 주문내역이 없네요. 주문하시러 가볼까요??');
     } */
   </c:forEach>
 </c:forEach>
}else{
	<c:forEach items="${Flist}" var="dto">
   <c:forEach items="${dto.resultShip}" var="ship">
     var shipDate = "${ship}";

     shipDate = shipDate.toString();

     console.log("정기배송 날짜: " + shipDate);
     console.log("Current date: " + today);

     if (check === shipDate) {
       var shiptime = "${dto.shiptime}";

	       if (shiptime === "0") {
	         $('#morning').append('<div class="inner" style="height:180px;"><div class="images"><img class="fimg" src="${dto.lunchpic }"></div><div class="name">${dto.lunchname}</div><button class="btn">[상세보기]</button></div>');
	         
	       } else if (shiptime === "1") {
	         $('#lunch').append('<div class="inner" style="height:180px;"><div class="images"><img class="fimg" src="${dto.lunchpic }"></div><div class="name">${dto.lunchname}</div><button class="btn">[상세보기]</button></div>');
	    	}
	       
	       
	       /* else if (shiptime != "1" && shiptime === "0"){
	    		 $('#morning').append('아직 주문내역이 없네요. 주문하시러 가볼까요??');

	    	}else if (shiptime != "0" && shiptime === "1"){
	    		 $('#lunch').append('<div>아직 주문내역이 없네요. 주문하시러 가볼까요??</div>');

	    	} */
     }/* else if(check != shipDate){
	 $('#morning').append('아직 주문내역이 없네요. 주문하시러 가볼까요??');
 } */
   </c:forEach>
 </c:forEach>
	       $('.btn').click(function() {
	    	   $(location).attr('href', 'http://localhost:8091/dndn/list.do?page=1&category=4&sort=0')
	    		  //alert($(this).prev().text());
	    		});
 console.log("나 아직 살아있따아ㅏㅏ아아아아아아: "+shipDate);
	
}
 }
 


		document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				 selectable: true,
				 dateClick: function(info) {
				      detailfood(info.dateStr);
				    },
				events : [ 
					<c:forEach items="${Flist}" var="dto">
					<c:forEach items="${dto.resultShip}" var="ship">
					{
						<%--/* <c:if test="${dto.lunchcategory.equals("일반식")}">
					title : '<span class="material-symbols-outlined" style="color: #F86F03;">nutrition</span>${dto.lunchname}',
						</c:if>
						<c:if test="${dto.lunchcategory.equals("건강식")}">
					title : '<span class="material-symbols-outlined" style="color: #F86F03;">psychiatry</span>${dto.lunchname}',
						</c:if>
						<c:if test="${dto.lunchcategory.equals("프리미엄식")}">
					title : '<span class="material-symbols-outlined" style="color: #F86F03;">brunch_dining</span>${dto.lunchname}',
						</c:if> */--%>
					title : '${dto.lunchname}',
					start : '${ship}',
					//end : '${dto.endship}',
					backgroundColor : 'transparent',
					borderColor : 'white',
					allDay: true
					},
					</c:forEach>
					</c:forEach>
				],

			});
	        detailfood();
			calendar.render();

		});
		<%--/* document.addEventListener('DOMContentLoaded', function() {
		<c:forEach items="${Flist}" var="cate" varStatus="status">
		
		if(${cate.lunchcategory.equals("일반식")}){
$('.fc-event-title').eq(${status.index}).prepend('<span class="material-symbols-outlined" style="color: #F86F03;">nutrition</span>');
			
		}else if(${cate.lunchcategory.equals("건강식")}){
$('.fc-event-title').eq(${status.index}).prepend('<span class="material-symbols-outlined" style="color: #38E54D;">psychiatry</span>');
			
		}else if(${cate.lunchcategory.equals("프리미엄식")}){
			
$('.fc-event-title').eq(${status.index}).prepend('<span class="material-symbols-outlined" style="color: #068FFF;">brunch_dining</span>');
		}
		
		</c:forEach>

 }); */--%>
 
 

 </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</body>
</html>














