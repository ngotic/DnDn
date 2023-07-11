<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
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
    
    
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
   
    
    
    <style>
		
		/* 추가 버튼 */
		.add-button {
			float: right;
    		width: 60px;
    		height: 35px;
    		border: none;
    		background-color: #636363;
			color: white;
    		margin-top: 2.5px;
    		margin-right: 5px;
		}
	
		/* 수정 버튼 */
		.edit-button {
			width: 45px; height: 30px;
			border: none;
			/* background-color: #2e75b6; */
			background-color: #1f79e0;
			color: white;
		}
		
		/* 삭제 버튼 */
		.del-button {
			width: 45px; height: 30px;
			border: none;
			background-color: #f2f2f2;
			color: #3b3b3b;
		}
		
		
		thead > tr > th {
			text-align: center;
			font-weight: 500;
		}
		
		tbody > tr > td {
			text-align: center;
		}
		
		/* 검색창 */
		.datatable-input {
			position: absolute;
    		width: 550px;
    		left: 290px;
		}
		
		
		label {
			color: white;
		}
	
	</style>
</head>

<body>
    <div class="container-fluid position-relative bg-white d-flex p-0">
        
        <!-- 사이드바 -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
            
            	<!-- 로고 -->
                <a href="/dndn/admin/admin-main.do" class="navbar-brand mx-4 mb-3">
                    <img src="/dndn/resources/img/logo_long.png" class="mt-1 mb-2" style="height:80px;">
                </a>
                
                <!-- 관리자 프로필 -->
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="/dndn/resources/img/admin/pro.png" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">관리자</h6>
                        <span>Admin</span>
                    </div>
                </div>
                
                <!-- 메뉴 -->
                <div class="navbar-nav w-100">
                
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="font-family: 'Noto Sans KR';">
                        	<i class="fa fa-user me-2"></i>이용자 관리
                        </a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="/dndn/order/user.do" class="dropdown-item" style="font-family: 'Noto Sans KR';">1. 회원 관리</a>
                            <a href="/dndn/order/store-user.do" class="dropdown-item" style="font-family: 'Noto Sans KR';">2. 점주 관리</a>
                        </div>
                    </div>
                    
                   
                    <a href="/dndn/admin/store.do" class="nav-item nav-link" style="font-family: 'Noto Sans KR';">
                        <i class="fa fa-store me-2"></i>가맹점 관리
                    </a>
                                       
                    

	                <a href="/dndn/admin/product.do" class="nav-item nav-link" style="font-family: 'Noto Sans KR';">
	                    <i class="fa fa-bag-shopping me-2"></i>상품 관리
	                </a>

                    
                    <a href="/dndn/admin/orderlist.do" class="nav-item nav-link active" style="font-family: 'Noto Sans KR';">
                    	<i class="fa fa-cart-shopping me-2"></i>주문 관리
                    </a>
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="font-family: 'Noto Sans KR';">
                        	<i class="fa-regular fa-star me-2"></i>이벤트 관리
                        </a>
                        <div class="dropdown-menu bg-transparent border-0">
                            	<a href="/dndn/order/event-management.do?" class="dropdown-item" style="font-family: 'Noto Sans KR';">1. 이벤트 조회</a>
                            	<a href="/dndn/order/event-management.do?add=true" class="dropdown-item" style="font-family: 'Noto Sans KR';">2. 이벤트 추가</a>
			                    <a href="/dndn/order/event-management.do?edit=true" class="dropdown-item" style="font-family: 'Noto Sans KR';">3. 이벤트 수정</a>
			                    <a href="/dndn/order/event-management.do?delete=true" class="dropdown-item" style="font-family: 'Noto Sans KR';">4. 이벤트 삭제</a>
                        </div>
                    </div>
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="font-family: 'Noto Sans KR';">
                        	<i class="fa-solid fa-gift me-2"></i>쿠폰 관리
                        </a>
                        <div class="dropdown-menu bg-transparent border-0">      
                            <a href="/dndn/order/coupon.do?add=true" class="dropdown-item" style="font-family: 'Noto Sans KR';">1. 쿠폰 추가</a>
                            <a href="/dndn/order/coupon.do?edit=true" class="dropdown-item" style="font-family: 'Noto Sans KR';">2. 쿠폰 수정</a>
                            <a href="/dndn/order/coupon.do?delete=true" class="dropdown-item" style="font-family: 'Noto Sans KR';">3. 쿠폰 삭제</a>
                        </div>
                    </div>
                    
                    <a href="/dndn/admin/chart.do" class="nav-item nav-link" style="font-family: 'Noto Sans KR';">
                    	<i class="fa fa-chart-simple me-2"></i>통계
                    </a>
         
                </div>
            </nav>
        </div>


        <!-- Content Start -->
        <div class="content">
            

			<!-- nav -->
			<%@ include file="/WEB-INF/views/order/admin-nav.jsp" %>
			
			
			<section class="container">

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        
                        <div class="card mb-4" style="border: none; margin-top: 50px;">
                            
                            <div class="card-body">
                            
                            <table id="datatablesSimple" style="font-family: 'Noto Sans KR';">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>아이디</th>
                                            <th>결제금액</th>
                                            <th>주문날짜</th>
                                            <th>처리상태</th>
                                            <th>결제방법</th>
                                        </tr>
                                    </thead>
                                    

                                    <tbody>
	                                <c:forEach items="${orderlist}" var="dto">
	                                   <tr>
	                                     <td>
	                                       <a href="/dndn/admin/orderview.do?orderseq=${dto.orderseq}">
	                                         ${dto.orderseq}
	                                       </a>
	                                     </td>
	                                     <td>${dto.id}</td>
	                                     <td>${dto.price}</td>
	                                     <td>${dto.orderdate}</td>
	                                     <td>결제완료</td>
	                                     <td>${dto.payment}</td>
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
        </div>
		
		
            
        </div>
        <!-- Content End -->


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
    
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>

</html>