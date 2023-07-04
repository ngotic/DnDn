<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<div  class= " screen3 screen-width-88 event-screen3" >
				
				<div >
					<div>
						<p>이벤트 썸네일</p>
						<%-- <input class= "order-event-image" type="image"  src="/dndn/resources/img/event/${eventdto.pic_board} "  > --%>
						<img class="order-event-image"  id ="modal_img1" src="/dndn/resources/img/event/${eventdto.pic_board} ">
							<div class="modal" id="event_modal1">
							  <span class="close">&times;</span>
							  <img class="modal_content" id="img01">
							</div>
						<%--  onclick="location.href='http://localhost:8092//dndn/resources/img/event/${eventdto.pic_board}'" --%> 
						
					</div>
					<div>
						<p>이벤트 콘텐츠</p>
						<img class="order-event-image"  id ="modal_img2"src="/dndn/resources/img/event/${eventdto.pic} ">
						<div class="modal" id="event_modal2" >
							  <span class="close">&times;</span>
							  <img class="modal_content" id="img02">
							</div>
						<%-- <input class= "order-event-image" type="image"  src="/dndn/resources/img/event/${eventdto.pic }" --%>  
						<%-- onclick="location.href='http://localhost:8092//dndn/resources/img/event/${eventdto.pic}'"  --%>
						
					</div>
					
					<div >
					
						<table>

						<tr>
						
								<th colspan="2">이벤트 이름</th>
								
								<th>등록일</th>
								<th>시작날짜</th>
								<th>종료날짜</th>
								<th>할인율</th>	
						</tr>
						
						
		
						<c:choose>
						<c:when test="${eventdto ne null}">
						<tr>
								<td  colspan="2">${ eventdto.title}</td>
								<td>${eventdto.regdate.substring(0,10) }</td>
								<td>${eventdto.startdate.substring(0,10) }</td>
								<td>${ eventdto.enddate.substring(0,10) }</td>
								<td>${ eventdto.sale} %</td>
						</tr>
						</c:when>
						<c:when test="${ eventdto eq null}">
							<tr>
									<td  colspan="2">이벤트 이름</td>
									<td>등록일</td>
									<td>시작날짜</td>
									<td>종료날짜</td>
									<td>할인율</td>
							</tr>
							</c:when>
						</c:choose>
						<tr>
							<td colspan="5" style=" height: 10px;"></td>
						</tr>
						
						<tr>
						
						
								<th colspan="3">이벤트 사진 썸네일 경로</th>
						<th colspan="3">이벤트 사진 콘텐츠 경로</th>
						</tr>
						<c:choose>
						<c:when test="${ eventdto ne null}">
						<tr>
								<td colspan="3">${eventdto.pic}</td>
								<td colspan="3">${eventdto.pic_board}</td>
						</tr>
						</c:when>
						<c:when test="${ eventdto eq null}">
								<td colspan="3">이벤트 사진 썸네일 경로</td>
								<td colspan="3">이벤트 사진 콘텐츠 경로</td>
						</c:when>
						</c:choose>
					 </table>

					</div>
					
				</div>	
				
				
			</div> 

	
	
		
			<div   class= " screen5 screenAll screen-width-88 event-screen5">
					<span>이벤트 리스트</span> 
					<div>

						<span> 정렬 </span>
						 <button class=" "  type="button" >
						    	이벤트명
						  </button>
						   <button class=" "  type="button" >
						    	시작날짜
						  </button>
						 <button class=" "  type="button" >
						    	등록일
						  </button>
					
						 <button class=" "  type="button">
						    	종료일
						  </button>
					

						<div>
							<input type="text" >
							<input type="button"  value="검색">
						</div> 
					</div>
					 	
					<table> 
					
						<tr>
							<th>이벤트번호</th>
							<th>이벤트이름</th>
							<th>등록일</th>
							<th>시작날짜</th>
							<th>종료날짜</th>
							<th>할인률</th>
							
							<th>이벤트 사진</th>
						
							<th>수정</th>
							<th>삭제</th>		
							
						</tr>
						
					<c:forEach var="event"  items="${eventlist}">
						<tr onclick="location.href='http://localhost:8092/dndn/order/event-management.do?event_seq=${event.eventseq}&edit=${edit }'">
							<td>${event.eventseq}</td>
							<td>${event.title}</td>
							<td>${event.regdate.substring(0,10) }</td>
							<td>${event.startdate.substring(0,10) }</td>
							<td>${event.enddate.substring(0,10) }</td>
							<td>${event.sale} %</td><!-- 요일  -->
							<td>${event.pic }</td>
							<td class="event-td-btn"><a >수정</a></td>
							<td class="event-td-btn"><a >삭제</a></td>
						</tr>
					</c:forEach>	
						
					</table>
					
					 
				
			</div>