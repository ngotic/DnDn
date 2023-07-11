<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


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
	<!-- <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script> -->
	
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
    
    	.chart1 {
    		width: 500px;
    		text-align: center;
    	}
    	
    	.title {
    		margin-bottom: 20px;
    		font-weight: 900;
    		font-size: 1.3rem;
    		color: #333;
    		font-family: 'Noto Sans KR';
    	}
    	
    	.title-frame {
    		justify-content: space-between;
    		display: flex;
    	}
    	
    	.show-all {
    		font-family: 'Heebo';
    	}
    	
    	.count {
    		float: right;
    	}
    	
    	
    	.order-table > thead > tr > th {
    		font-weight: 500;
    		text-align: center;
    		color: #009CFF;
    	}
    	
    	.order-table > tbody > tr > td {
    		text-align: center;
    	}
    	
    	
    	
    	.title-rank {
    		font-weight: 900;
    		font-size: 1.3rem;
    		color: #333;
    		font-family: 'Noto Sans KR';
    		padding-bottom: 30px;
    	}
    	
    	.content-rank {
    		font-size: 1rem;
    		color: #333;
    		font-family: 'Noto Sans KR';
    		padding-bottom: 10px;
    	}
    	
    </style>
    
    
</head>

<body>
    <div class="container-fluid position-relative bg-white d-flex p-0">
        
        <!-- 사이드바 -->
        <%@ include file="/WEB-INF/views/order/admin-sidebar.jsp" %>



        <!-- Content Start -->
        <div class="content">
            

			<!-- nav -->
			<%@ include file="/WEB-INF/views/order/admin-nav.jsp" %>
			


            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa-solid fa-user-plus fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">
                                	<a href="/dndn/order/user.do">NEW MEMBER</a>
                                </p>
                                <h6 class="count mb-0">2</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-cart-shopping fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">
                                	<a href="/dndn/admin/orderlist.do">NEW ORDER</a>
                                </p>
                                <h6 class="count mb-0">11</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa-solid fa-eye fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">
                                	<a href="#">PAGE VIEWS</a>
                                </p>
                                <h6 class="count mb-0">99</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa-sharp fa-solid fa-envelope fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">
                                	<a href="/dndn/inform/notice.do">NEW SUPPORT REQUEST</a>
                                </p>
                                <h6 class="count mb-0">1</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sale & Revenue End -->


            <!-- Sales Chart Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-xl-6" style="width: 50%">
                        <div class="bg-light text-center rounded p-4" style="width: 100%;">
                            <div class="title-frame">
                                <span class="title">신규 가입자</span>
                                <a href="/dndn/admin/chart.do" class="show-all">Show All</a>
                            </div>
                            <canvas id="chart1"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-6" style="width: 50%">
                        <div class="bg-light text-center rounded p-4" style="width: 100%;">
                            <div class="title-frame">
								<span class="title">주문량</span>
                                <a href="/dndn/admin/chart.do" class="show-all">Show All</a>
							</div>
                            <canvas id="chart5"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sales Chart End -->


            <!-- Recent Sales Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="title mb-0">최근 주문 정보</h6>
                        <a href="/dndn/admin/orderlist.do" class="show-all">Show All</a>
                    </div>
                    <div class="table-responsive">
                    			<table class="order-table table text-start align-middle table-bordered table-hover mb-0" style="font-family: 'Noto Sans KR';">
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
	                                <c:forEach items="${orderlist}" var="dto" varStatus="status">
									<c:if test="${status.index < 5}">
	                                   <tr>
	                                     <td>${dto.orderseq}</td>
	                                     <td>${dto.id}</td>
	                                     <td>${dto.price}</td>
	                                     <td>${dto.orderdate}</td>
	                                     <td>결제완료</td>
	                                     <td>${dto.payment}</td>
	                                   </tr>
	                                </c:if>
	                                </c:forEach>
                                    </tbody>

                                </table>
                    </div>
                </div>
            </div>
            <!-- Recent Sales End -->


            <!-- Widgets Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    
                    <!-- <div class="col-sm-12 col-md-6 col-xl-4" style="width: 30%;">
                        <div class="h-100 bg-light rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="title mb-0">Calender</h6>
                            </div>
                            <div id="calender"></div>
                        </div>
                    </div> -->
                    
                    <div class="col-sm-12 col-md-6 col-xl-4" style="width: 25%;">
                    	<div class="h-100 bg-light rounded p-4">
                    		<h6 class="title-rank mb-0">일반식 Top 5</h6>
                    		
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #ffd60a;"></i>
                    			빠에야 볶음밥 and 핫스테이크
                    		</div>
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #c2c2c2;"></i>
                    			미니컵밥 유부초
                    		</div>
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #c49c48;"></i>
                    			야채 볶음밥 and 햄에그롤
                    		</div>
                    		<div class="content-rank" style="display: flex;">
                    			<span class="material-symbols-outlined me-2" style="color: #666;">counter_4</span>
                    			<span>미니컵밥 돼지고기 고추장비빔</span>
                    		</div>
                    		<div class="content-rank" style="display: flex;">
                    			<span class="material-symbols-outlined me-2" style="color: #666;">counter_5</span>
                    			<span>두부파스타 마라소스 and 방울소시지</span>
                    		</div>
                    	</div>
                    </div>
                    
                    <div class="col-sm-12 col-md-6 col-xl-4" style="width: 25%;">
                    	<div class="h-100 bg-light rounded p-4">
                    		<h6 class="title-rank mb-0">건강식 Top 5</h6>
                    		
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #ffd60a;"></i>
                    			두부파스타 레드커리 and 닭가슴살볼
                    		</div>
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #c2c2c2;"></i>
                    			파스타 샐러드
                    		</div>
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #c49c48;"></i>
                    			닭가슴살볼 깻잎가득 샐러드
                    		</div>
                    		<div class="content-rank" style="display: flex;">
                    			<span class="material-symbols-outlined me-2" style="color: #666;">counter_4</span>
                    			<span>닭가슴살볼 숯불갈비맛 샐러드</span>
                    		</div>
                    		<div class="content-rank" style="display: flex;">
                    			<span class="material-symbols-outlined me-2" style="color: #666;">counter_5</span>
                    			<span>닭가슴살 샐러드</span>
                    		</div>
                    	</div>
                    </div>
                    
                    <div class="col-sm-12 col-md-6 col-xl-4" style="width: 25%;">
                    	<div class="h-100 bg-light rounded p-4">
                    		<h6 class="title-rank mb-0">프리미엄식 Top 5</h6>
                    		
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #ffd60a;"></i>
                    			로제쉬림프치킨+두루치기 도시락
                    		</div>
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #c2c2c2;"></i>
                    			명품 연잎밥 도시락
                    		</div>
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #c49c48;"></i>
                    			뜨끈뜨끈 두루치기 도시락
                    		</div>
                    		<div class="content-rank" style="display: flex;">
                    			<span class="material-symbols-outlined me-2" style="color: #666;">counter_4</span>
                    			<span>VIP 도시락</span>
                    		</div>
                    		<div class="content-rank" style="display: flex;">
                    			<span class="material-symbols-outlined me-2" style="color: #666;">counter_5</span>
                    			<span>뜨끈뜨끈 소불고기 도시락</span>
                    		</div>
                    	</div>
                    </div>
                    
                    <div class="col-sm-12 col-md-6 col-xl-4" style="width: 25%;">
                    	<div class="h-100 bg-light rounded p-4">
                    		<h6 class="title-rank mb-0">지점 매출 Top 5</h6>
                    		
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #ffd60a;"></i>
                    			역삼동 한독빌딩점
                    		</div>
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #c2c2c2;"></i>
                    			삼성동 트레이드타워점
                    		</div>
                    		<div class="content-rank">
                    			<i class="fas fa-medal fa-lg me-2" style="color: #c49c48;"></i>
                    			신사동 강남빌딩점
                    		</div>
                    		<div class="content-rank" style="display: flex;">
                    			<span class="material-symbols-outlined me-2" style="color: #666;">counter_4</span>
                    			<span>논현동 하림타워점</span>
                    		</div>
                    		<div class="content-rank" style="display: flex;">
                    			<span class="material-symbols-outlined me-2" style="color: #666;">counter_5</span>
                    			<span>대치동 동일타워점</span>
                    		</div>
                    	</div>
                    </div>
                    
                </div>
            </div>
            <!-- Widgets End -->
            
            
            <div style="height: 20px;">
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
	
	
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    
    <script>
    const labels1 = ['2월', '3월', '4월', '5월', '6월', '7월'];
	
	  const data1 = {
	    labels: labels1,
	    datasets: [{
          label: '전체',
          backgroundColor: 'rgb(73, 182, 253)',
          borderColor: 'rgb(73, 182, 253)',
          data: [34, 32, 47, 39, 49, 21]
      },
      {
          label: '여',
          backgroundColor: 'rgb(255, 167, 119)',
          borderColor: 'rgb(255, 167, 119)',
          data: [18, 20, 22, 24, 22, 9]
      },
		{
		    label: '남',
		    backgroundColor: 'rgb(255, 217, 62)',
		    borderColor: 'rgb(255, 217, 62)',
		    data: [16, 12, 25, 15, 27, 6]
		}]
	  };
	
	  const config1 = {
	    type: 'line',
	    data: data1,
	    options: {}
	  };
	  
	  
	  
	  const labels5 = ['2월', '3월', '4월', '5월', '6월', '7월'];
		
	  const data5 = {
	    labels: labels5,
	    datasets: [{
            label: '전체',
            backgroundColor: 'rgb(73, 182, 253)',
            borderColor: 'rgb(73, 182, 253)',
            data: [611, 789, 941, 844, 1051, 264]
        },
        {
            label: '일반주문',
            backgroundColor: 'rgb(255, 167, 119)',
            borderColor: 'rgb(255, 167, 119)',
            data: [295, 408, 440, 362, 380, 106]
        },
		{
		    label: '정기주문',
		    backgroundColor: 'rgb(255, 217, 62)',
		    borderColor: 'rgb(255, 217, 62)',
		    data: [316, 381, 501, 482, 671, 158]
		}]
	  };
	
	  const config5 = {
	    type: 'bar',
	    data: data5,
	    options: {}
	  };
	  
	  
    </script>
    
    
    <script>
    const Chart1 = new Chart(
			document.getElementById('chart1'),
			config1
		);
    
    const Chart5 = new Chart(
			document.getElementById('chart5'),
			config5
		);
    </script>
    
    
</body>

</html>