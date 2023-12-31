<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>

<style>
	#form_1{
	   margin: 30px;
    padding: 0px;

    border-radius: 10px;
    margin-bottom: 20px;
   
    }
    .screen2{
	    padding: 50px;
    background-color: #f8f9fa !important;
    border-radius: 10px;
        border:1px solid #00000029;
    margin-bottom:30px;
    }
    	.screen4{
	    padding: 50px;
    background-color: #f8f9fa !important;
    border-radius: 10px;
    
    margin-bottom:30px;
    }
    	#store_tbl1{
    border:1px solid #00000029;
    background-color: #f8f9fa !important;
    border-radius: 10px;
        
    padding: 50px;
    }
    .datatable-wrapper{
       margin: 33px;
    padding: 50px;
    background-color: #f8f9fa !important;
    border-radius: 10px;
        border:1px solid #00000029;
    }
</style>
    <meta charset="utf-8">
    <title>든든</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
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
</head>
<body>
    <div class="container-fluid position-relative bg-white d-flex p-0">
<%@ include file="/WEB-INF/views/order/admin-sidebar.jsp" %>
        
        <!-- 사이드바 -->
        



        <!-- Content Start -->
        <div class="content">
            

			<!-- nav -->
			<%@ include file="/WEB-INF/views/order/admin-nav.jsp" %>
			
			<form method="get"  id="form_1">	
<div  class= " screen2 screenAll"   >
		
					<table class ="table table-hover" >
					<thead>
						<tr>
							<th colspan="2">
								회원리스트 
							</th>
							<th>
							<!-- 	<input type="text"  name="user_id" placeholder="회원 검색"><input type="submit" value="검색" > -->
							</th>
						</tr>
				
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>연락처</th>

						</tr>
					</thead>
					<tbody>
					
						<c:forEach var="user"  items="${userlist}">
						
							<tr onclick="location.href='http://localhost:8092/dndn/order/store-user.do?user_id=${user.id}'">
								<td>${user.id}</td>
								<td>${user.name}</td>
								<td>${user.tel }</td>
							</tr>
						
						</c:forEach>
						
					</tbody>	
					</table>

				</div>
			<div id="store_tbl1">
				<table  class ="table table-hover" >
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
							<td>${ userdto.enabled}</td>
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
			
				</form>

						 	
					<table id="datatablesSimple" > 
						<thead>
							<tr>
								<th>주문번호</th>
								<th>상품명</th>
								<th>결제금액</th>
								<th>주문날짜</th>
			<!-- 					<th>배송요일</th>
								
								<th>정기배송여부</th>
								<th>정기배송기간</th> -->
			<!-- 					<th>정기배송날짜</th> -->
								
							</tr>
							</thead>
						<tbody>
			
							<c:forEach var="order"  items="${orderlist}">
							
								<tr>
									<td>${order. orderseq}</td>
									<td>${order.name}</td>
									<td>${order.price}</td>
									<td>${order.orderdate}</td>
					<%-- 				<td>${order.dayperweek}</td><!-- 요일  -->
									
									<td>${order.periodshipseq }</td>
									<td>${order.startship} ~ ${order.endship}</td> --%>
			<%-- 						<td>${order.orderdate}</td> --%> <!-- 날짜  -->
								</tr>
								
							</c:forEach>	
							

						</tbody>
			<%-- 	<c:if test= "${!orderlist}">
						
						</c:if> --%>
					</table>
					
					
					 
				
			</div>
			

	
</div>





            
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/chart/chart.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/easing/easing.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/waypoints/waypoints.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/js/moment.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="/dndn/resources/bootstrap-admin-template-free/js/main.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="/dndn/resources/startbootstrap-sb-admin-gh-pages/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
	<script src="/dndn/resources/startbootstrap-sb-admin-gh-pages/js/datatables-simple-demo.js"></script>
    
    
    
</body>

</html>
