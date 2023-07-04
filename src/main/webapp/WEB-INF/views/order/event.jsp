<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="/dndn/resources/css/headerstyle.css">
<link rel="stylesheet" href="/dndn/resources/css/order.css">
<style>

			
				    


</style>
</head>

<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<section class="order-container">
		<div>
			<div class="event-btn-box">
				<div class="event-page-title">
				<span class="">EVENT</span>
				<span class="evt-page-sp">이벤트</span>
			</div>
			</div>
			<div class="event-btn-box"  >

					<input type="button"  id="evt-btn1"  class="event-btn"  value="진행 이벤트"  onclick="location.href='./event.do?open_close=open'">
	
					<input type="button"   id="evt-btn2" class="event-btn"  value= "종료 이벤트" onclick="location.href='./event.do?open_close=close'">

				
			</div>
		</div>
		
	<ul class="event-content"><!-- 이벤트 콘텐츠    -->
	

	<c:forEach var="event"  items="${eventlist}">
			<li class="event-content">
				<div class="event-box ">

						<a href="/dndn/order/event-page.do?event_seq=${event.eventseq }" style="text-decoration: none"><img src="/dndn/resources/img/event/${event.pic_board }">
							<span class="event-title event-text-box"  >${event.title }</span>
								<div class="event-text-box">
									<span  class="event-state">진행중</span>
									<span class="event-txt " >${event.startdate.substring(0,10) }  ~  ${event.enddate.substring(0,10) }</span>
								</div>	 
						</a>
					</div>   	
			</li>
	</c:forEach>
	
						
	</ul>





	
	</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
<script>
	

</script>
</body>
</html>









