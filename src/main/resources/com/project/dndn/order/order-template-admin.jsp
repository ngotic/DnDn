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
	.screen{
	    border-top: 11px solid #7c7c7c;
	    height: 480px;;
	    border-right: 8px solid #cacaca;
	    border-left: 8px solid #cacaca;
	    border-bottom: 11px solid #7c7c7c;
	}

	.screen1{
	
		display: inline;
		width: 10%;
		height: 95%;
		float: left;
		margin-right: 10px;
		margin-left: 10px;
	}
	.screen2{
		
		width:23%;
		display: inline;
		height: 95%;

		float: left;
		margin-right: 10px;
		
		
	}
	.screen2 div:first-child{
		    text-align: center;
		    margin-top: 15px;
	}

	.screen2 table{
		    width: 95%;
    		margin: 15px 9px;
    		
	}
	.screen2 table  tr:nth-child(2) th{
		    background-color: #6b6b6b;
    		color: white;
	}
	
	.screen2 table tr td , .screen2 table tr th{
	padding-left: 5px;
	border: 1px solid black;
	
	}
	
	.screen2 table tr:first-child th{
		text-align: center;
		border: 0px;
		margin-top:4px;
		font-size: 30px;
		
	}
	.screen2 table tr:nth-child(2) th:nth-child(1){
	width: 185px;
	}
	.screen2 table tr:nth-child(2) th:nth-child(2){
    width: 90px;
	}
	.screen2 table tr:nth-child(2) th:nth-child(3){
    width: 145px;
	}
/* 		.screen3{
		border: 1px solid black;
		width:18%;
		float: left;
			height: 35%;
		margin-right: 10px;
		margin-bottom: 10px;
		
	} */
		.screen4{
	
		width:64%;
		display: flex;
		float: left;
		height: 31%;
			margin-bottom: 10px;
	}
	
	.screen4 table{
		    width: 100%;
    		margin: 15px 9px;
    		
	}
	.screen4 table tr:first-child th:nth-child(1){
	width: 80px;
	}
	.screen4 table tr:first-child th:nth-child(2){
	width: 80px;
	}
	.screen4 table tr:first-child th:nth-child(3){
	width: 150px;
	}
	.screen4 table tr:first-child th:nth-child(4){
	width: 80px;
	}
	.screen4 table tr:first-child th:nth-child(5){
	width: 150px;
	}

	.screen4 table tr:first-child th:nth-child(6){
	width: 300px;
	}

	.screen4 table tr:nth-child(3) th:nth-child(2){
	width: 225px;
	}
		.screen4 table tr:nth-child(3) th:nth-child(3){
	width: 100px;
	}
	.screen4 table tr td {
		font-size: 13px;
	}
 
	.screen4 table tr th,.screen4 table tr td{
	border: 1px solid black;
	padding-left: 5px;
	}
		.screen4 table tr th{
		border-bottom:0px;
		padding-left: 5px;
	}
			.screen4 table tr td{
	
	padding-left: 5px;
	}
		.screen5{

		width:64%;
		    height: 64%;
		display: block;
		float: left ;
		
		
	}
	form{
		margin-top:20px;
	}
	
	.admin-page{
		
		height: 100%;
	}
	.screen{
		height: 100%;
	}

	.screen3 div{
		border: 1px solid black;
		display: block;
	} 



	
	
	.screen5 table{
		    width: 95%;
    		margin: 15px auto;
    		
    		}
    		
	.screen5 table th, .screen5 table td{
		border: 1px solid black;
		
	}    		
    		.screen5 table th{
				background-color: #6b6b6b;
	    		color: white;
	    		text-align: center;
    		}
    		
    		.screen5 table td:nth-child(2){
    		width:200px;
    		text-align: left;
    		}
    		.screen5 table td:nth-child(1)
    		,.screen5 table td:nth-child(2){
    		padding-left: 5px;
    		}
    		
    		.screen5 table td:nth-child(3)
    		,.screen5 table td:nth-child(4) 
    		,.screen5 table td:nth-child(5)
    		,.screen5 table td:nth-child(6)
    		,.screen5 table td:nth-child(7)
    		,.screen5 table td:nth-child(8){
			text-align: right;
			padding-right: 5px;
}

	.screen5>span{
		   display: flex;
		    justify-content: center;
		    font-size: 30px;
		    font-weight: 600;
		    margin: 10px 0px;
	}

	.screen5>div {
		display: flex;
		width: 95%;
		margin: 0px auto;
}

	.screenAll{
		
		border: 2px solid black;
		border-radius: 5px;
		
	}}


</style>
</head>
<body style="    height: 100%;">
	<%@ include file="/WEB-INF/views/order/header.jsp" %>
<div class= "screen">
	<section class="admin-page">

		<form method="get" style="    height: 100%;">
					<!-- 좌측 메뉴 스크린 -->
		<%@ include file="/WEB-INF/views/order/order-screen1.jsp" %>
		
				<div  class= " screen2 screenAll"   >
					<div>
						<input type="text"   placeholder="회원 검색"><input type="button" value="검색" >
					</div>
					<table>
						<tr>
							<th colspan="3">
								회원리스트
							</th>
						</tr>
						
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>연락처</th>

						</tr>
						
						
						<tr>
							<td>gsdg</td>
							<td>홍길동</td>
							<td>010-1263-1263</td>
					
						</tr>
						
							<tr>
							<td>gq3usk3</td>
							<td>아무개</td>
							<td>010-1243-1243</td>
					
						</tr>
						
							<tr>
							<td>1365drxfdg</td>
							<td>강아지</td>
							<td>010-1213-1213</td>
					
						</tr>
						
							<tr>
							<td>64375urjgf</td>
							<td>홍길동</td>
							<td>010-123-123</td>
					
						</tr>
						
					</table>
				</div>
				
<!-- 				<div  class= " screen3" >
				 
					<div >
						
					</div>
							<div>아이디</div>
							<div>
								<div>성별</div>
								<div>생년월일</div>
							</div>
					</div>
				</div> 
	 -->
	
			<div  class= " screen4 screenAll">
				<table>
						<tr>
							<th>회원명</th>
							<th>아이디</th>
							
							<th>연락처</th>
							<th>성별</th>
							<th>생년월일</th>
							<th colspan="4">이메일</th>
						
						</tr>				
						<tr>
							<td>홍길동</td>
							<td>hong</td>
							<td>010-123-123</td>
							<td>남</td>
							<td>1999-11-11</td>
							<td colspan="4">hong@gmail.co</td>
						
						</tr>
						<tr>
							<th colspan="5">주소</th>
							<th colspan="2">상세주소</th>
							<th>등급</th>
							<th>가입일</th>
				
						</tr>
						<tr>
							<td colspan="5">서울시 강동구 천호동</td>
							<td colspan="2">OO아파트 101호</td>
							<td>일반등급</td>
							<td>2023-05-15</td>
				
						</tr>
				</table>
			</div>
			
		
		
			<div   class= " screen5 screenAll">
					<span>주문 리스트</span> 
					<div>
						<span></span> 
						<div class="dropdown">
						<span> 정렬 </span>
						 <button class=" dropdown-toggle"  type="button" data-bs-toggle="dropdown"  aria-expanded="false">
						    	주문번호
						  </button>
						  <ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="#">주문번호</a></li>
							    <li><a class="dropdown-item" href="#">정기배송</a></li>
							    <li><a class="dropdown-item" href="#">일반배송</a></li>
							    <li><a class="dropdown-item" href="#">결제금액</a></li>
							</ul>
							
							<button class=" dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						    	배송기간
						  </button>
							<ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="#"></a></li>
							    <li><a class="dropdown-item" href="#">주문날짜</a></li>
							    <li><a class="dropdown-item" href="#">정기배송</a></li>
							    <li><a class="dropdown-item" href="#">일반배송</a></li>
							    <li><a class="dropdown-item" href="#">일반배송</a></li>
							</ul>
						</div>
						<div>
							<input type="text" >
							<input type="button"  value="검색">
						</div> 
					</div>
					 	
					<table> 
					
						<tr>
							<th>주문번호</th>
							<th>상품명</th>
							<th>결제금액</th>
							<th>주문날짜</th>
							<th>배송요일</th>
							
							<th>정기배송여부</th>
							<th>정기배송기간</th>
							<th>정기배송날짜</th>
							
						</tr>
						
						
						<tr>
							<td>1</td>
							<td>도시락</td>
							<td>10000</td>
							<td>2023-06-05</td>
							<td>수요일</td>
							
							<td>정기배송</td>
							<td>2023-07-01~2023-08-01</td>
							<td>2023-07-01</td>
						</tr>
						
						
						<tr>
							<td>2</td>
							<td>도시락</td>
							<td>10000</td>
							<td>2023-06-05</td>
							<td>수요일</td>
							
							<td>정기배송</td>
							<td>2023-07-01~2023-08-01</td>
							<td>2023-07-01</td>
						</tr>
												
						<tr>
							<td>3</td>
							<td>도시락</td>
							<td>10000</td>
							<td>2023-06-05</td>
							<td>수요일</td>
							
							<td>정기배송</td>
							<td>2023-07-01~2023-08-01</td>
							<td>2023-07-01</td>
						</tr>
												
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