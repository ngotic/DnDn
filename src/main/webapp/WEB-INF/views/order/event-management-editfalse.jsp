<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD

    <style>
    	.order-event-image{
    		width: 100px;
    	}
    	.card-body > div{
    
    		
    	}
    	#event-table{
    		display: inline-block;
    	}
    	
    	.screen6{
    	      border: 1px solid #00000029;
    	}
    	tr {
	    font-size: 20px;
}
tr td {
	font-size: 15px;
	}
    </style>

	<div  class= " screen3 screen-width-88 event-screen3" >
				
				<div class="screen6" >
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
=======
				
		<section class="container">
>>>>>>> feature/admin2

            <div id="layoutSidenav_content">
                <main>
                
                
                    <div class="container-fluid px-4">
                        
                        <div class="card mb-4" style="border: none;">
                            
                            <div class="card-body">
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

<<<<<<< HEAD
					</div>
					
				</div>	
				
				
			</div> 
			

                
                    <div class="container-fluid px-4 ">
                        
                        <div class="card mb-4" style="border: none;" id="event-table">
                            
                            <div class="card-body">
                               <span>이벤트 리스트</span> 
                               
                               <div>


                        </div>
                               
                                <table id="datatablesSimple">
                                    <thead>
                                        <th>이벤트번호</th>
                              <th>이벤트이름</th>
                              <th>등록일</th>
                              <th>시작날짜</th>
                              <th>종료날짜</th>
                              <th>할인률</th>
                              
                              <th>이벤트 사진</th>
                              <c:if>
                              
                              </c:if>
=======
								</div>
                            	
                                <table id="datatablesSimple">
                                    <thead>
                                        <th>이벤트번호</th>
										<th>이벤트이름</th>
										<th>등록일</th>
										<th>시작날짜</th>
										<th>종료날짜</th>
										<th>할인률</th>
										
										<th>이벤트 사진</th>
>>>>>>> feature/admin2
                                    </thead>
                                    

                                    <tbody>
<<<<<<< HEAD
                                       <c:forEach var="event"  items="${eventlist}">
                                 <tr class="event" onclick="javascript:event()" hidden="">
                                    <td>${event.eventseq}</td>
                                    <td>${event.title}</td>
                                    <td>${event.regdate.substring(0,10) }</td>
                                    <td>${event.startdate.substring(0,10) }</td>
                                    <td>${event.enddate.substring(0,10) }</td>
                                    <td>${event.sale} %</td><!-- 요일  -->
                                    <td>${event.pic }</td>
                                 </tr>
                              </c:forEach>   
=======
                                    	<c:forEach var="event"  items="${eventlist}">
											<tr onclick="location.href='http://localhost:8092/dndn/order/event-management.do?event_seq=${event.eventseq}&edit=${edit }'">
												<td>${event.eventseq}</td>
												<td>${event.title}</td>
												<td>${event.regdate.substring(0,10) }</td>
												<td>${event.startdate.substring(0,10) }</td>
												<td>${event.enddate.substring(0,10) }</td>
												<td>${event.sale} %</td><!-- 요일  -->
												<td>${event.pic }</td>
											</tr>
										</c:forEach>	
>>>>>>> feature/admin2
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </main>
<<<<<<< HEAD

				
			</div>
			
<script>
		


			
</script>			
=======
            </div>
		</section>
>>>>>>> feature/admin2
