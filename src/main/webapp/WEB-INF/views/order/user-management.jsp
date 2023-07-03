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
						
						<input type="text"   placeholder="회원 검색"><input type="submit" value="검색" >
						
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
					
						<c:forEach var="user"  items="${userlist}">
						
							<tr onclick="location.href='http://localhost:8092/dndn/order/user.do?user_id=${user.id}'">
								<td>${user.id}</td>
								<td>${user.name}</td>
								<td>${user.tel }</td>
						
							</tr>
						
						</c:forEach>
						
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
						<c:choose>
						<c:when test="${ userdto ne null}">
						<tr>
							<td>${ userdto.name}</td>
							<td>${ userdto.id}</td>
							<td>${ userdto.tel}</td>
							<td>${ userdto.gender}</td>
							<td>${ userdto.birth}</td>
							<td colspan="4">${ userdto.email}</td>
						
						</tr>
						</c:when>
						<c:when test="${ userdto eq null}">
							<tr>
								<td hidden="이름"> </td>
								<td>회원명 </td>
								<td>아이디 </td>
								<td> 연락처 </td>
								<td> 성별 </td>
								<td> 생년월일</td>
								<td colspan="4"> 이메일 </td>
							</c:when>
						</c:choose>

				
						<tr>
							<th colspan="5">주소</th>
							<th colspan="2">상세주소</th>
							<th>등급</th>
							<th>가입일</th>
				
						</tr>
					
						<c:choose>
						<c:when test="${ userdto ne null}">
						<tr>
								<td colspan="5">${ userdto.address}</td>
							<td colspan="2">${ userdto.addressdetail}</td>
							<td id ="td-auth">${ userdto.auth}</td>
							<td>${ userdto.regdate}</td>
				
						</tr>
						</c:when>
						<c:when test="${ userdto eq null}">
							<tr>
								<td colspan="5"> 주소 </td>
								<td colspan="2"> 상세 주소 </td>
								<td> 등급 </td>
								<td> 가입일 </td>
							</c:when>
						</c:choose>
						
				
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
						
					<c:forEach var="order"  items="${orderlist}">
						<tr>
							<td>${order. orderseq}</td>
							<td>${order.name}</td>
							<td>${order.price}</td>
							<td>${order.orderdate}</td>
							<td>${order.shipdate}</td><!-- 요일  -->
							
							<td>${order.periodshipseq }</td>
							<td>${order.shipperiod}</td>
							<td>${order.shipdate}</td> <!-- 날짜  -->
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
/* 	const auth = document.getElementById("td-auth");
	auth.authname( function() {
		  if (auth.innerText === "ROLE_MEMBER") {
		    auth.innerText = "일반 회원";
		  } else {
		    mode.innerText = "바뀌기 전 text";
		  }
		});
	}); */
		if(document.getElementById("td-auth").innerText === "ROLE_MEMBER"){
		document.getElementById("td-auth").innerText='일반 회원';
		}
	
	/* 
	function changeAuth() {
		   let auth = document.getElementById("td-auth");
		   auth.innerText="일반 회원"; 
		   
		} */
</script>
</html>