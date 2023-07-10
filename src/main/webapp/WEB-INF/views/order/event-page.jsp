<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet"  href="/dndn/resources/css/headerstyle.css">
<link rel="stylesheet"  href="/dndn/resources/css/order.css">
<style>
		.event-page_padding ul li{
		 list-style-type: none;
		 }
		 .event-page-table tr td:nth-child(1) ,.event-page-table tr td:nth-child(3){
		 	width: 120px;
			 	
		 }

		.event-page-table tr:last-child td:nth-child(3){
				text-align: right;
		}
		.event-page-table tr:last-child td:nth-child(4){
				text-align: left;
				padding-left: 12px;
		}
		 .event-page-table tr:last-child td:nth-child(2){
		 		width: 1000px;
		 	
		 }
		  .event-page-table tr td:nth-child(2){
		 	padding-left: 10px;
		 	}
		  .event-page-table-box{
		    text-align: left;
		    }
		    
		      .event-page-table tr  th:nth-child(2) {
			padding-left: 10px;
			}
		        .event-page-img > img{
		        width: 80%;
		        }
		    
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<section class="order-container">
	
	
		<div>
			<div class="event-page-title">
				<span class="">EVENT</span>
				<span class="evt-page-sp">이벤트</span>
			</div>
			<div class= "event-page-table-box">
				<table class="event-page-table">
						<tr>
							<td>제목</td>
							<td colspan="3">${eventdto.title}</td>
						</tr>
						<tr>
							<td>이벤트 기간</td>
							<td>${eventdto.startdate.substring(0,10)} ~ ${eventdto.enddate.substring(0,10)}</td>
							<td>조회수</td>
							<td>${eventdto.count } </td>
						</tr>		
				</table>
			</div> 
				
			<div class="event-page-img">
				<img alt="" src="/dndn/resources/img/event/${eventdto.pic }">
			</div>
			<div>
				<div class="event-page_padding">
					<h2>유의사항</h2>
					<ul>
                        <li>- 첫 결제 즉시 캐시백은 토스 전체 가맹점에서 결제 이력이 없는 경우 적용됩니다. (토스 ID당 1회)</li>
                        <li>- 캐시백 선택사항에 생애 첫 결제 혜택이 보이지 않을 경우 대상이 아닙니다.</li>
                        <li>- 생애 첫 결제 프로모션은 기타 할인 및 캐시백 프로모션과 중복으로 적용이 가능합니다.</li>
                        <li>- 결제 전체 취소 후 기간 내 재결제 시 혜택 적용되며, 결제 부분취소 후 재결제 시 혜택 미적용 됩니다.</li>
                        <li>- 캐시백 받은 결제내역을 취소하면, 수령하신 토스포인트는 회수됩니다.</li>
                        <li>- 토스 간편결제 선택 시에만 캐시백이 적용되며 토스페이 이외의 간편결제수단 (네이버페이, 카카오페이 등)이용 혹은 신용카드 선택 시에는 적용이 불가능합니다.</li>
                        <li>- 결제 금액은 쿠폰 할인 및 적립금 적용 후 실 결제 금액입니다.</li>
                        <li>- 법인, 선불, 충전, 기프트 카드는 혜택 적용이 불가합니다.</li>
                        <li>- 상품권, 순금 등 일부 상품은 결제 혜택을 받을 수 없습니다.</li>
                        <li>- 4월 1일부터 8월 31일까지 한정된 고객에게 선착순으로 적용되는 행사로, 조기 종료될 수 있습니다.</li>
                        <li>- <span>예산이 소진되면 이벤트가 예정보다 빨리 마감될 수 있으니 결제 전 적립 적용여부를 꼭 확인바랍니다.</span></li>
                        <li>- 행사 내용은 토스페이 및 와이파이도시락의 사정으로 중단 또는 변동될 수 있습니다.</li>
                        <li>- 결제처에서 토스페이(토스)를 선택하고 결제해야 혜택을 받을 수 있습니다. (결제처에서 하나카드를 선택하고 토스뱅크카드로 결제한 경우 혜택 적용 대상이 아님)</li>
                        <li>- 관련 문의는 토스 고객센터(1599-4905)로 문의 부탁드립니다.</li>
                    </ul>
                </div>
			</div>
			
			<div class="order-container">
				<table class= "event-page-table">
		
						<c:forEach var="eventpage" items="${eventpage }">
						
						<c:if test="${eventpage.rnum eq eventdto.rownum  -1}">
						<tr onclick="location.href='./event-page.do?event_seq=${eventpage.eventseq }'">
						
							<td>이전글   <span style="margin-left: 5px;">▲</span></td>			
							<td>${eventpage.title}</td>

						</tr>
						</c:if>
				
					
					
						
						<c:if test="${eventpage.rnum eq eventdto.rownum  +1}">
						<tr onclick="location.href='./event-page.do?event_seq=${eventpage.eventseq }'">
							<td>다음글  <span style="margin-left: 5px;">▼</span></td>
							<td>${eventpage.title}</td>
						</tr>
						</c:if>
						
	<%-- 						<% int eventnum = ${eventpage.eventseq};%> --%>
							
		
							<c:if test="${eventdto.rownum  -1 eq 0}">
							<tr style="border: none">
								<td></td>
								<td></td>
							<tr>
	
								</c:if>
					<%-- 
									<%if(eventnum != %>${eventpage.eventseq} <%+1 ){%>
									
									<tr style="border: none">
										<td></td>
										<td></td>
									</tr>
									<%}%>
					 --%>			
						</c:forEach>
						
					</table>
			</div>
			
			<div class="event-page_padding">
				<input type="button" value="목록으로"  onclick="location.href='http://localhost:8092/dndn/order/event.do'">
			</div>
			
		</div>
	
	</section>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
</body>

<script>
	


</script>
</html>