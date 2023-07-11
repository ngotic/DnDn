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
                                	<a href="#">NEW ORDER</a>
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
                        <h6 class="mb-0">Recent Salse</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Invoice</th>
                                    <th scope="col">Customer</th>
                                    <th scope="col">Amount</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>01 Jan 2045</td>
                                    <td>INV-0123</td>
                                    <td>Jhon Doe</td>
                                    <td>$123</td>
                                    <td>Paid</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>01 Jan 2045</td>
                                    <td>INV-0123</td>
                                    <td>Jhon Doe</td>
                                    <td>$123</td>
                                    <td>Paid</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>01 Jan 2045</td>
                                    <td>INV-0123</td>
                                    <td>Jhon Doe</td>
                                    <td>$123</td>
                                    <td>Paid</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>01 Jan 2045</td>
                                    <td>INV-0123</td>
                                    <td>Jhon Doe</td>
                                    <td>$123</td>
                                    <td>Paid</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>01 Jan 2045</td>
                                    <td>INV-0123</td>
                                    <td>Jhon Doe</td>
                                    <td>$123</td>
                                    <td>Paid</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Recent Sales End -->


            <!-- Widgets Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    
                    <div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="h-100 bg-light rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="title mb-0">Calender</h6>
                            </div>
                            <div id="calender"></div>
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