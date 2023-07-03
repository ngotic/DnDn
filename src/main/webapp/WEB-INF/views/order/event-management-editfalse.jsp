<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				
		<section class="container">

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
                                    </thead>
                                    

                                    <tbody>
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
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
		</section>