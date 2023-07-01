<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="    height: 100%;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="/dndn/resources/css/headerstyle.css">
<link rel="stylesheet" href="/dndn/resources/css/order.css">
<style>

	.screen-width-88{
		width: 88%;
	}
	
	.event-screen3{
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
	       width: 20%;
		text-align: center;
	}	
		.event-screen3 > div div:nth-child(1) input{
	   	height: 100%;
    width: auto;
		
	}	
		.event-screen3 > div div:nth-child(2){
	 	display: inline-block;
		height: 100%;
		width: 100%;
		padding: 10px;
	}
	
	.event-screen3 > div div:nth-child(2) table{
	    width: 100%;
    height: 100%;

	}
		 .event-screen3 > div div:nth-child(2) table tr td{

		border: 1px solid black;
	}
		
	.event-screen3 > div div:nth-child(2) table tr:first-child{
	    width: 100%;
    	height: 30%;
	
		}
	 
	.event-screen3 > div div:nth-child(2) table tr:last-child{
	    width: 100%;
  	 	 height: 70%;
	
	}
		
	.event-screen5 div:first-child {
	        display: flex;
    		justify-content: right;
	}
	
	.event-screen5 div:first-child button{
		
		padding-left: 10px;
		
	}

	

</style>
</head>
<body style="    height: 100%;">
	<%@ include file="/WEB-INF/views/order/header.jsp" %>
<div class= "screen">
	<section class="admin-page">

		<form method="get" style="    height: 100%;">
			<div class= "screen1 screenAll" >
				<ol>
				
				</ol>
				이용자관리
				<ol>
				    <li  onclick="location.href='http://localhost:8092/dndn/order/user.do'" >회원관리</li>
				    <li  onclick="location.href='http://localhost:8092/dndn/order/store-user.do'" >점주관리</li>
				   
				</ol>
				가맹점관리
				<ol>
					 <li>가맹점 등록</li>
					 <li>가맹점 조회</li>
					 <li>가맹점 삭제</li>
				</ol>
				매출관리
				<ol>
					 <li>매출 관리</li>
				</ol>
				이벤트관리
				<ol>
					 <li  onclick="location.href='http://localhost:8092/dndn/order/event-management.do'" >이벤트등록</li>
					 <li  onclick="location.href='http://localhost:8092/dndn/order/event-management.do'" >이벤트수정</li>
					 <li  onclick="location.href='http://localhost:8092/dndn/order/event-management.do'" >이벤트삭제</li>
				</ol>
				쿠폰 관리
				<ol>
					 <li>쿠폰등록</li>
					 <li>쿠폰수정</li>
					 <li>쿠폰삭제</li>
				</ol>
				통계
				<ol>
					<li>통계</li>
				</ol>
				

				
			</div>
		
		
		
			<div  class= " screen3 screen-width-88 event-screen3" >
				
				<div >
					<div>
						<input type="image">
					</div>
					
					<div >
					
						<table>

						<tr>
						
								<th>이벤트 이름</th>
								<th>등록일</th>
								<th>시작날짜</th>
								<th>종료날짜</th>
								
						</tr>
						
						
						<tr>
								<td>이벤트 이름</td>
								<td>등록일</td>
								<td>시작날짜</td>
								<td>종료날짜</td>
						</tr>
						
						<tr>
							<td colspan="4" style=" height: 10px;"></td>
						</tr>
						
						<tr>
						
								<th>할인율</th>
								<th colspan="3">이벤트 사진 경로</th>
					
						</tr>
					
						<tr>
						
								<td>할인율</td>
								<td colspan="3">이벤트 사진 경로</td>
						
						</tr>
						
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
							<th>이벤트이름</th>
							<th>등록일</th>
							<th>시작날짜</th>
							<th>종료날짜</th>
							<th>할인률</th>
							
							<th>이벤트 사진</th>
		
							
						</tr>
						
					<c:forEach var="order"  items="${orderlist}">
						<tr>
							<td>${order. orderseq}</td>
							<td>${order.name}</td>
							<td>${order.price}</td>
							<td>${order.orderdate}</td>
							<td>${order.shipdate}</td><!-- 요일  -->
							
							<td>${order.periodshipseq }</td>

						</tr>
					</c:forEach>	
						
					</table>
					
					 
				
			</div>
			
		
		</form>
		
</section>
	
</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	

</body>

<script>

</script>
</html>