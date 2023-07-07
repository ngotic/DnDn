<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	
	.flex-container {
  display: flex;
}

.wrapper {
  text-align: center;
  flex-grow: 1;
  
  .image-box {
    width: 200px;
    height: 200px;
    object-fit: cover;
    display: block;
    margin: 20px auto;
  }

  .upload-btn {
    border: 1px solid #ddd;
    padding: 6px 12px;
    display: inline-block;
    cursor: pointer;

    input[type=file] {
      display: none;
    }
  }
}
.text_editbox{

	display: inline;
	widows: 400px;

}
.text_editbox div{
	
	margin-bottom: 20px;
	
}


.flex-container{

		width: 400px;
		display: inline-block;
	
}

#edit{

	display:  flex;
	justify-content: left;

}
    </style>
    <main>
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

                
                    <div class="container-fluid px-4 ">
                        
                        <div class="card mb-4" style="border: none;" id="event-table">
                            
                            <div class="card-body">
                               <span>이벤트 리스트</span> 
                               
                               <div>


                        </div>
                               
                                <table id="datatablesSimple">
                                    <thead>
                                    <tr>
                                        <th>이벤트번호</th>
                              <th>이벤트이름</th>
                              <th>등록일</th>
                              <th>시작날짜</th>
                              <th>종료날짜</th>
                              <th>할인률</th>
                              
                              <th>이벤트 사진</th>
                              </tr>
                                    </thead>
                                    

                                    <tbody>
                                       <c:forEach var="event"  items="${eventlist}">
                                 <tr class="event1">
                                    <td>${event.eventseq}</td>
                                    <td>${event.title}</td>
                                    <td>${event.regdate.substring(0,10) }</td>
                                    <td>${event.startdate.substring(0,10) }</td>
                                    <td>${event.enddate.substring(0,10) }</td>
                                    <td>${event.sale} %</td>
                                    <td>${event.pic }</td>
                                 </tr>
                              </c:forEach>   
                                    </tbody>


                                </table>

                        
                        <!-- 이미지업로드 테스트 -->
                 
                        <!-- 이미지업로드 테스트 -->
                        
                        
                        
                    </div>

				
			</div>
                </main>
			
<!-- 			<input type="button" id="btn1" value="Test"> -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
		<script>
		
		//$('#btn1').click(function() {
			
			setTimeout(function() {
				$("#datatablesSimple tbody tr").click(function(event1){
					
					location.href='http://localhost:8092/dndn/order/event-management.do?event_seq='+$(this).children("td").eq(0).text()+'&edit=';
				
				} );
			}, 300);
			
			
		//});
		
		
		
			
		
		
		
		
		
			/* var e =  event1.target.childNodes.children[0].value; */
/* 			var c =  event1.target.childNodes.children[1].nodeValue;
			alert(e);
			alert(c); */
			//alert($(e).children().eq(1)/* .innerText */ .text()/* .nodeValue */ /* .value */);
	
			//alert(event.target.childNodes[1].children[0]); 
			/* 
			
			*/
		 
		
		 /* 
		$('.event1').click(function(event){
			
		
			//var event_seq = event.target.children[0].textContent;
			alert(event.target.children[0].textContent); 
			location.href='http://localhost:8092/dndn/order/event-management.do?event_seq='+event_seq+'&edit='+edit;
		} );
		 */ 
/* 		
		function event_result(event_seq,edit){
			location.href='http://localhost:8092/dndn/order/event-management.do?event_seq='+event_seqpreventDefault()+'&edit='+edit;
		} ;

 */
 /* 		
			$('.event_result').onclick( 
							 ); 
 */			
	//						$(".event_result").click(function(event_seq,edit){

					
		//		});
			
 
</script>	
