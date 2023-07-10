<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
  
<head>
    <meta charset="utf-8">
    <title>든든</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
<link rel="stylesheet" href="/dndn/resources/css/order.css">
	<!--  -->
    <%@ include file="/WEB-INF/views/include/asset.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
	<link href="/dndn/resources/startbootstrap-sb-admin-gh-pages/css/styles.css" rel="stylesheet" />
	<!-- <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script> -->
	
    <!-- Favicon -->
    <link href="/dndn/resources/bootstrap-admin-template-free/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/dndn/resources/bootstrap-admin-template-free/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/dndn/resources/bootstrap-admin-template-free/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="/dndn/resources/bootstrap-admin-template-free/css/style.css" rel="stylesheet">
    
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
    <style>
		
	.screen-width-88{
		width: 88%;
	}
	
	.event-screen3{
		    height: 250px;

	}
		.event-screen3 > div{

	    display: inline-flex;
		height: 100%;
    	width: 100%;
		
	}	
	.event-screen3 > div div:first-child{

	    display: inline-flex;
		height: 100%;
    	width: 45%;
		
	}	

	.event-screen3 > div div:nth-child(1){
	    display: inline-block;
	    height: 100%;
	       width: 400px;
		text-align: center;
	}	
		.event-screen3 > div div:nth-child(2){
	    display: inline-block;
	    height: 100%;
	       width: 20%;
		text-align: center;
	}	
		.event-screen3 > div div:nth-child(1) img{
	   	    height: 77%;
  		  width: auto;
		
	}	
			.event-screen3 > div div:nth-child(2) img{
	       height: 77%;
  		  width: auto;
		
	}	
	
			.event-screen3 > div div:nth-child(1) p{
		margin-top: 5px;
    	margin-bottom: 5px;
		
	}	
			.event-screen3 > div div:nth-child(2) p{
	   	margin-top: 5px;
    	margin-bottom: 5px;
	}		
		.event-screen3 > div div:nth-child(3){
	 	display: inline-block;
		height: 100%;
		width: 100%;
		padding: 10px;
	}
	
	.event-screen3 > div div:nth-child(3) table{
	    width: 100%;
    height: 100%;

	}

	.event-screen3 > div div:nth-child(3) table tr:nth-child(1){
	    height: 30px;
	
		}
	.event-screen3 > div div:nth-child(3) table tr:nth-child(2){
		height: 30px;
		}
		
	.event-screen3 > div div:nth-child(3) table tr:nth-child(3){
  		height: auto;
	
		}		

	.event-screen3 > div div:nth-child(3) table tr:nth-child(4){

		height: 30px;
		}		
	.event-screen3 > div div:nth-child(3) table tr:nth-child(5){

		height: 30px;
		}		
/* 
		 .event-screen3 > div div:nth-child(3) table tr td{

		border: 1px solid black;
		
		
		} */
		
		  .event-screen3 > div div table tr td{
		 	padding-left: 10px;
		 }
		   .event-screen3 > div div table tr th{
		   padding-left: 10px;
		   }
		
		.event-screen3 > div div:nth-child(3) table tr:nth-child(3) td{
   			border: none;
	
		}		
	 	.event-screen3 > div div:nth-child(3) table tr:first-child td:nth-child(1){
	 		width: 500px;
		}
		
	 	.event-screen3 > div div:nth-child(3) table tr:first-child td:nth-child(2){
	 		width: 200px;
		}
		
	 	.event-screen3 > div div:nth-child(3) table tr:first-child td:nth-child(3){
			width: 200px;
		}				
			 
	 	.event-screen3 > div div:nth-child(3) table tr:first-child td:nth-child(4){
	 		width: 200px;
		}
			 
		.event-screen3 > div div:nth-child(3) table tr:last-child{
		    width: 100%;
	
		}
		
	.event-screen5 div:first-child {
	        display: flex;
    		justify-content: right;
	}
	
	.event-screen5 div:first-child button{
		
		padding-left: 10px;
		
	}



.img{
    width: auto;
    border-radius: 10px;
    cursor: pointer;
    transition: 0.3s;
  }
  /* 이미지 클릭 시, 밝기 조절 */
  .img:hover {opacity: 0.8;}

	#event_modal1{
	  display: none; /* 모달창 숨겨 놓기 */
	  padding-top: 100px;
	}
	#event_modal2{
	  display: none; /* 모달창 숨겨 놓기 */
	  padding-top: 100px;
	}
  .modal {
    display: none; /* 모달창 숨겨 놓기 */
    position: fixed; 
    z-index: 1; /* 모달창을 제일 앞에 두기 */
    padding-top: 100px;
    left: 0; top: 0;
    width: 100%; height: 100%;
    overflow: auto; /* 스크롤 허용 auto */
    cursor: pointer; /* 마우스 손가락모양 */
    background-color: rgba(0, 0, 0, 0.8);
  }
  /* 모달창 이미지 */
  .modal_content {
    margin: auto;
    display: block;
    width: 50%; height: auto;
    max-width: 1000px;
    border-radius: 10px;
    animation-name: zoom;
    animation-duration: 0.8s;
  }
  /* 모달창 애니메이션 추가 */
  @keyframes zoom {
    from {transform: scale(0)}
    to {transform: scale(1)}
  }
  /* 닫기 버튼 꾸미기 */
  .close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
  }
  .close:hover, .close:focus{
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
  }
  .event-td-btn{
  padding: 0px;
  text-align: center;
  }
  .event-td-btn input{
  	width: 100%;
  	height: 100%;
  	z-index: 2;
  }
  

    #event_modal {
        display: none;
        width: 300px;
        padding: 20px 60px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
    }

    #event_modal .event_modal_close {
        position: absolute;
        top: 10px;
        right: 10px;
    }
  

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
    <%@ include file="/WEB-INF/views/include/asset.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
	<link href="/dndn/resources/startbootstrap-sb-admin-gh-pages/css/styles.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	

    <!-- Favicon -->
    <link href="/dndn/resources/bootstrap-admin-template-free/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/dndn/resources/bootstrap-admin-template-free/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/dndn/resources/bootstrap-admin-template-free/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="/dndn/resources/bootstrap-admin-template-free/css/style.css" rel="stylesheet">
</head>



<body style=" height: 100%;">
    <div class="container-fluid position-relative bg-white d-flex p-0">
        
        <!-- 사이드바 -->
        <%@ include file="/WEB-INF/views/order/admin-sidebar.jsp" %>



        <!-- Content Start -->
        <div class="content">
            

			<!-- nav -->
			<%@ include file="/WEB-INF/views/order/admin-nav.jsp" %>
<main>
		<div>
			<section class=" admin-page" style="    margin-left: 145px;">
		
			
					<!-- 좌측 메뉴 스크린 -->
				<%-- <%@ include file="/WEB-INF/views/order/order-screen1.jsp" %> --%>
		    	                 <c:set var="addBoolean" value="${not empty param.add}" />
		    	                  
	                            <c:set var="editBoolean" value="${not empty param.edit}" />
	                            <c:set var="deleteBoolean" value="${not empty param.delete}" />

				<!-- 이벤트 조회 메뉴 스크린 -->
			<div  class= " screen3 screen-width-88 event-screen3" >
					<c:if test="${!addBoolean && !editBoolean}">
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
				</c:if>
				
					<c:if test="${addBoolean}">
					  
				<div class="screen6" >
				 
					<div>
						<p>이벤트 썸네일</p>
						 <%-- <input class= "order-event-image" type="image"  src="/dndn/resources/img/event/${eventdto.pic_board} "  > --%>
						
						<img class="order-event-image"  id ="modal_img1" src="/dndn/resources/img/event/${eventdto.pic_board}"  >
					
				
							<div class="modal" id="event_modal1">
							  <span class="close">&times;</span>
							  <img class="modal_content" id="img01">
							</div>
						<%--  onclick="location.href='http://localhost:8092//dndn/resources/img/event/${eventdto.pic_board}'" --%> 
						
					</div>
					<div>
						<p>이벤트 콘텐츠</p>
						<img class="order-event-image"  id ="modal_img2" src="/dndn/resources/img/event/${eventdto.pic}"  >
						<div class="modal" id="event_modal2" >
							  <span class="close">&times;</span>
							  <img class="modal_content" id="img02">
							</div>
						<%-- <input class= "order-event-image" type="image"  src="/dndn/resources/img/event/${eventdto.pic }" --%>  
						<%-- onclick="location.href='http://localhost:8092//dndn/resources/img/event/${eventdto.pic}'"  --%>
						
					</div>
					
					<div >
				<form method="POST" action="/dndn/order/event-management1.do" enctype="multipart/form-data"  style="margin-top: 0px;
    height: 100%;'">  
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
                		     <%-- <sec:authentication property="principal.member.id"/> --%>
				<input type="hidden" name="add" value="ture">
	 					<table id="table_2">
			
						<tr>
						
								<th colspan="3">이벤트 이름</th>
								
								
								<th>시작날짜</th>
								<th>종료날짜</th>
								<th>할인율</th>	
						</tr>
						
						<tr>
								<td  colspan="3"><input type="text"  name="title" value="${ eventdto.title}"></td>
								
								<td><input type="date"  name="startdate" value="${eventdto.startdate.substring(0,10) }"></td>
								<td><input type="date"  name="enddate" value="${ eventdto.enddate.substring(0,10) }"></td>
								<td><input type="number" name="sale" value="${ eventdto.sale}"></td>
						</tr>
						
						<tr>
							<td colspan="6" style=" height: 10px;"></td>
						</tr>
						
						<tr>

								<th colspan="3">이벤트 사진 썸네일 경로</th>
						<th colspan="2">이벤트 사진 콘텐츠 경로</th>
								<th colspan="1">추가</th>
						</tr>

						<tr>
								<td colspan="3"><input type="file"  id = "event_pic1" name="pic"  value="${eventdto.pic}" onchange="readURL(this);" style="padding-top: 8px;"></td>
								<td colspan="2"><input type="file"  id = "event_pic2"  name="pic_board" value="${eventdto.pic_board}" onchange="readURL2(this);"  style="padding-top: 8px;"></td>
								 <td style="padding: 0px;"><input type="submit"  id="event_add_btn"  value="추가" style="height: 100%;"></td>
						</tr>

					 </table>
</form>
				

					</div>
					
	 			</div>	
			
				</c:if>
				
				<!--  addd -->
				<!-- edit -->
				<c:if test="${editBoolean}">
					  
				<div class="screen6" >
				 
					<div>
						<p>이벤트 썸네일</p>
						<%-- <input class= "order-event-image" type="image"  src="/dndn/resources/img/event/${eventdto.pic_board} "  > --%>
						
						<img class="order-event-image"  id ="modal_img1" src="/dndn/resources/img/event/${eventdto.pic_board}"  >
					
				
							<div class="modal" id="event_modal1">
							  <span class="close">&times;</span>
							  <img class="modal_content" id="img01">
							</div>
						<%--  onclick="location.href='http://localhost:8092//dndn/resources/img/event/${eventdto.pic_board}'" --%> 
						
					</div>
					<div>
						<p>이벤트 콘텐츠</p>
						<img class="order-event-image"  id ="modal_img2" src="/dndn/resources/img/event/${eventdto.pic}"  >
						<div class="modal" id="event_modal2" >
							  <span class="close">&times;</span>
							  <img class="modal_content" id="img02">
							</div>
						<%-- <input class= "order-event-image" type="image"  src="/dndn/resources/img/event/${eventdto.pic }" --%>  
						<%-- onclick="location.href='http://localhost:8092//dndn/resources/img/event/${eventdto.pic}'"  --%>
						
					</div>
					
					<div >
				<form method="POST" action="/dndn/order/event-management1.do" enctype="multipart/form-data"  style="margin-top: 0px;
    height: 100%;'">  
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
                		     <%-- <sec:authentication property="principal.member.id"/> --%>
				<input type="hidden" name="edit" value="ture">
					<input type="hidden" name="event_seq" value="${event_seq }">
	 					<table id="table_2">
			
						<tr>
						
								<th colspan="3">이벤트 이름</th>
								
								
								<th>시작날짜</th>
								<th>종료날짜</th>
								<th>할인율</th>	
						</tr>
						
						<tr>
								<td  colspan="3"><input type="text"  name="title" value="${ eventdto.title}"></td>
								
								<td><input type="date"  name="startdate" value="${eventdto.startdate.substring(0,10) }"></td>
								<td><input type="date"  name="enddate" value="${ eventdto.enddate.substring(0,10) }"></td>
								<td><input type="number" name="sale" value="${ eventdto.sale}"></td>
						</tr>
						
						<tr>
							<td colspan="6" style=" height: 10px;"></td>
						</tr>
						
						<tr>

								<th colspan="3">이벤트 사진 썸네일 경로</th>
						<th colspan="2">이벤트 사진 콘텐츠 경로</th>
								<th colspan="1">수정</th>
						</tr>

						<tr>
								<td colspan="3"><input type="file"  id = "event_pic1" name="pic"  value="${eventdto.pic}" onchange="readURL(this);" style="padding-top: 8px;"></td>
								<td colspan="2"><input type="file"  id = "event_pic2"  name="pic_board" value="${eventdto.pic_board}" onchange="readURL2(this);"  style="padding-top: 8px;"></td>
								 <td style="padding: 0px;"><input type="submit"  id="event_add_btn"  value="추가" style="height: 100%;"></td>
						</tr>

					 </table>
</form>
				

					</div>
					
	 			</div>	
			
				</c:if>
				<!-- edit -->
				
				
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
                                    		
							 <c:if test="${deleteBoolean}">
							<th></th>
							</c:if>							
								 
                                    </thead>
                                    

                                    <tbody>
                                    
                                       <c:forEach var="event"  items="${eventlist}">
                                 <tr class="event" onclick="javascript:event()" hidden="">
                                    <td><input type="hidden" value="${event.eventseq}"name="eventseq">${event.eventseq}</td>
                                    <td>${event.title}</td>
                                    <td>${event.regdate.substring(0,10) }</td>
                                    <td>${event.startdate.substring(0,10) }</td>
                                    <td>${event.enddate.substring(0,10) }</td>
                                    <td>${event.sale} %</td><!-- 요일  -->
                                    <td>${event.pic }</td>
                   
									
									  <c:if test="${deleteBoolean}">
									   <input type="hidden"  name = "delete" value="true">
									<td><input type="button" value ="삭제" class="coupon_delete_button"></td>
									</c:if>
                                 </tr>
                              </c:forEach>  
        
                   <%--      
                              
                                   <c:forEach var="event"  items="${eventlist}">
                                 <tr class="event" onclick="javascript:event()" hidden="">
                                    <td><input type="hidden" value="${event.eventseq}"name="eventseq">${event.eventseq}</td>
                                    <td><input type="text" value="${event.title}" name="title"></td>
                                    <td>${event.regdate.substring(0,10) }</td>
                                    <td><input type="date" value="${event.startdate.substring(0,10) }" name="startdate"></td>
                                    <td><input type="date" value="${event.enddate.substring(0,10) }" name="endate"></td>
                                    <td><input type="number" value="${event.sale}" name="sale"></td><!-- 요일  -->
                                    <td>${event.pic }</td>
                     
									  <input type="hidden"  name = "edit" value="true">
									<td><input type="button" value ="수정"  class="event_edit_button"></td>
						 --%>
						
                      <%--            </tr>
                              </c:forEach>  
                              
                              </c:if>  --%>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
      <%--               
			<form method="POST" action="/dndn/order/event-management1.do" enctype="multipart/form-data">
                		   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
					    <div>
					        <label for="pic">이벤트이미지</label>
					        <input type="file" id="pic" name="pic" accept="image/*" required>
					    </div>
					    <div>
					        <label for="pic_board">이벤트이미지 2</label>
					        <input type="file" id="pic_board" name="pic_board" accept="image/*" required>
					    </div>
					    <div>
					 
					        <input type="hidden" value= "true" name="edit" required>
					     
					         <label for="pic">${_csrf.token}</label>
					         <sec:authentication property="principal.member.id"/>
					    </div>
					    <button type="submit">추가</button>
					</form> --%>
                    


				
			</div>
			


	
				 <!--       
                        <form action="order/event-management.do" method="POST"  enctype="multipart/form-data" >
                       		<input type="hidden" name="edit" value="true">
                       		
					 	   <input type="file" name="pic" accept="image/*" required>
					        <br>
					       	<input type="file" name="pic_board" accept="image/*" required>
					       		 
									<input type="hidden" name="edit" value="true">
											제목
											<input type="text"  name="title" >
										</div>
										<div>
										이벤트시작 날짜
											<input type="text"  name="startdate">
										</div>
										<div>
										종료날짜
											<input type="text"  name="enddate">
										</div>
										<div>
										할인률
											<input type="text"  name="sale">
										</div>
					        <input type="submit" value="Upload">
					 
					        
					    </form>
                                -->
		
		
		
		
		

		
			</section>
		
		
			<div id="event_modal">

					<a class="event_modal_close" >닫기</a>
			</div>

		</div>
		                </main>
		</div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>






    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- <script src="/dndn/resources/bootstrap-admin-template-free/lib/chart/chart.min.js"></script> -->

    <script src="/dndn/resources/bootstrap-admin-template-free/lib/easing/easing.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/waypoints/waypoints.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/js/moment.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

  
    <!-- <script src="/dndn/resources/bootstrap-admin-template-free/js/main.js"></script> -->
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	

	<script src="/dndn/resources/startbootstrap-sb-admin-gh-pages/js/scripts.js"></script>
	
	<!--  오류발생 -->
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"  crossorigin="anonymous"></script>
	
	
	<script src="/dndn/resources/startbootstrap-sb-admin-gh-pages/js/datatables-simple-demo.js"></script>

</body>

<script>
/* .event_img2  */
/* id = "event_pic1"  */
/*  
	<img class="order-event-image"  id ="modal_img1" src="/dndn/resources/img/event/${eventdto.pic_board} "> */
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('modal_img1').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		    
		     document.getElementById('modal_img1').style.height = '77%'; 
		      document.getElementById('modal_img1').style.width = 'auto';
		      document.getElementById('modal_img1').style.border = '0px';
		/*     	$(this).css({
		    		
		    	   " height: auto",
		        	"width: 140px",
		       	 	"border" : "0px"
		    	
		    	} ); */
	

		  } else {
		    document.getElementById('modal_img1').src = "";
		  }
		}
	function readURL2(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('modal_img2').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		    
		      getElementById('modal_img2').style.height = '77%'; 
		      document.getElementById('modal_img2').style.width = 'auto';
		      document.getElementById('modal_img2').style.border = '0px';
/* 
		    document.getElementById('modal_img2').css({
		    		
		    	   " height: auto",
		        	"width: 140px",
		       	 	"border" : "0px"
		    	
		    	} );
 */

		  } else {
		    document.getElementById('modal_img2').src = "";
		  }
		}
setTimeout(function() {
	$(document).ready(function() {
		  $('.event_edit_button').click(function() {
		    // Get the parent <tr> element
		    var parentRow = $(this).closest('tr');
		    
		    // Get the values of the child input elements
		      var eventseq = parentRow.find('input[name="eventseq"]').val();
		    var name = parentRow.find('input[name="title"]').val();
		    var startdate = parentRow.find('input[name="startdate"]').val();
		    var endate = parentRow.find('input[name="endate"]').val();
		    var sale = parentRow.find('input[name="sale"]').val();
/* 		    var period = parentRow.find('input[name="pic"]').val();
		    var period = parentRow.find('input[name="pic_board"]').val(); */
		    
		    // Construct the query parameters string
		    var queryParams =
							'&eventseq=' + encodeURIComponent(eventseq) +
		    				'&title=' + encodeURIComponent(name) +
		    				'&startdate=' + encodeURIComponent(startdate) +
		                      '&enddate=' + encodeURIComponent(endate) +
		                      '&sale=' + encodeURIComponent(sale)/*  +
		                      '&pic=' + encodeURIComponent(pic) +
		                      '&pic_board=' + encodeURIComponent(pic_board) */;
		    
		    // Append the query parameters to the URL
		    var url = './event-edit.do?' + queryParams+'&edit=true';
		    
		    // Redirect to the URL
		    window.location.href = url;
		  });
		});
	},300);	

/* 
setTimeout(function() {
$(document).ready(function() {
	  $('#event_add_btn').click(function() {
	    // Get the parent <tr> element
	    var parentRow = $(this).closest('tr');
	    
	    // Get the values of the child input elements
	    
	    var name = parentRow.find('input[name="title"]').val();
	    var name = parentRow.find('input[name="startdate"]').val();
	    var name = parentRow.find('input[name="endate"]').val();
	    var sale = parentRow.find('input[name="sale"]').val();
	    var period = parentRow.find('input[name="pic"]').val();
	    var period = parentRow.find('input[name="pic_board"]').val();
	    
	    // Construct the query parameters string
	    var queryParams =
	    				'&title=' + encodeURIComponent(name) +
	    				'&startdate=' + encodeURIComponent(startdate) +
	                      '&endate=' + encodeURIComponent(endate) +
	                      '&sale=' + encodeURIComponent(sale) +
	                      '&pic=' + encodeURIComponent(pic) +
	                      '&pic_board=' + encodeURIComponent(pic_board);
	    
	    // Append the query parameters to the URL
	    var url = './event-add.do?' + queryParams+'&add=true';
	    
	    // Redirect to the URL
	    window.location.href = url;
	  });
	});
},300);	

 */
	/* 
	 setTimeout(function() {
	 	$("#datatablesSimple tbody tr td input").css({
	 		
	 		"width" : "100%",
	     "height" : "43px",
	     "border" : "0px"
	 	
	 	} );
	 }, 120);
	  */
setTimeout(function() {
	$("#table_2 tbody tr td input").css({
		
	"width" : "100%",
    "height" : "43px",
    "border" : "0px"
	
	} );
}, 120);


setTimeout(function() {
	$(document).ready(function() {
		  $('.coupon_delete_button').click(function() {
		    // Get the parent <tr> element
		    var parentRow = $(this).closest('tr');
		    
		    // Get the values of the child input elements
		    var eventseq = parentRow.find('input[name="eventseq"]').val();
		 
		    
		    // Construct the query parameters string
		    var queryParams = 'event_seq=' + encodeURIComponent(eventseq)+'&delete=true'
		              
		    
		    // Append the query parameters to the URL
		    var url = './event-management-delete.do?' + queryParams;
		    
		    // Redirect to the URL
		    window.location.href = url;
		  });
		});
	},300);	

//------------------------
/* 
function modal(id) {
    var zIndex = 9999;
    var modal = $('#' + id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = $('<div>')
        .css({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        })
        .appendTo('body');

    modal
        .css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        })
        .show()
        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        .find('.event_modal_close')
        .on('click', function() {
            bg.remove();
            modal.hide();
        });
} */						 

if(${editBoolean}){
setTimeout(function() {
	console.log(${editBoolean});
	var todate_input = '"#datatablesSimple tbody tr td:nth-child(4) input"';
	$("#datatablesSimple tbody tr td:nth-child(4)").click( function(event){
		console.log("클릭이벤트");
		
		/* var couponinput = $("#datatablesSimple tbody tr td:nth-child(4) input").val(); */
		 /* var couponinput = $(this).val(); */
		var couponperiod = $(this).text().substring(0,	10);

		 console.log("Text = "+couponperiod); 
		console.log("Type = "+typeof(couponperiod));
		/* console.log("input = "+couponinput);  */
			if(couponperiod != ""){
 			$(this).html("<input class = todate type= date name = period value="+couponperiod+">");
			}
			
 			
			console.log(todate_input);
	
	setTimeout(function() {
	$("#datatablesSimple tbody tr td:nth-child(4) input").css({
		"width": "100%",
	    "height": "42px",
	    "border": "none"
	} );
	},10); 
	} );
	

});
}

/* 	var todate_input =  document.getElementsByClassName("todate");-
		$(document.getElementsByClassName("todate")).css({
			"width": "100%",
		    "height": "42px",
		    "border": "none"
		});
 */
/* 	
}, 200/* ,{ once : true } */

$('#event_modal_open').on('click', function() {
    // 모달창 띄우기
    modal('event_modal');
});


if(${editBoolean}||${addBoolean}||${deleteBoolean}){
setTimeout(function() {
	$("#datatablesSimple tbody tr").each(function() {
		var firstTd = $(this).find("td:first");
		firstTd.click(function(event1) {
		
		 var url = 'http://localhost:8092/dndn/order/event-management.do?event_seq='+$(this).text();
				if (${editBoolean}) {
				 url += '&edit=true';					
				}else if(${addBoolean}){
					url += 	'&add=true';					
				}else if(${deleteBoolean}){
					url += '&delete=true';				
				}
		location.href= url;
		});
	} );
}, 300);
}else{
	setTimeout(function() {
		$("#datatablesSimple tbody").on("click", "tr", function(event1) {
			var eventSeq = $(this).find("td:first").text();
			var url = 'http://localhost:8092/dndn/order/event-management.do?event_seq=' + eventSeq;

	

			location.href = url;
		});
	}, 300);
}

//--------
const modal = document.querySelector(".modal");
const img = document.querySelector("#modal_img1");
const img2 = document.querySelector("#modal_img2");
const modal_img = document.querySelector(".modal_content");
const span = document.querySelector(".close");

img.addEventListener('click', ()=>{
  modalDisplay("block");
  modal_img.src = img.src;
});
img2.addEventListener('click', ()=>{
	  modalDisplay("block");
	  modal_img.src = img2.src;
	});
span.addEventListener('click', ()=>{
  modalDisplay("none");
});
modal.addEventListener('click', ()=>{
  modalDisplay("none");
});
function modalDisplay(text){
  modal.style.display = text;
};

/*  
function event_result(event_seq,edit){
	location.href='http://localhost:8092/dndn/order/event-management.do?event_seq='+event_seq+'&edit='+edit;
} ;
 */
/* 
const fileDOM = document.querySelector('#file');
const previews = document.querySelectorAll('.image-box');

fileDOM.addEventListener('change', () => {
  const reader = new FileReader();
  reader.onload = ({ target }) => {
    previews[0].src = target.result;
  };
  reader.readAsDataURL(fileDOM.files[0]);
});

const fileDOM2 = document.querySelector('#file2');

fileDOM2.addEventListener('change', () => {
	 const reader2 = new FileReader();
	  reader.onload = ({ target }) => {
	    previews[0].src = target.result;
	  };
	  reader.readAsDataURL(fileDOM.files[0]);
});


 */


</script>
</html>