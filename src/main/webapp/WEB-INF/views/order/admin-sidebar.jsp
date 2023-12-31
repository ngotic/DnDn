<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

                    
                    <a href="/dndn/admin/orderlist.do" class="nav-item nav-link" style="font-family: 'Noto Sans KR';">
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

