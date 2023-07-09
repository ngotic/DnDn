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
    
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
    
    <style>
    
    	.button-bar {
    		display: flex;
    		justify-content: center;
    		margin-top: 50px;
    	}
    
    	.display-button {
			border: none;
			background-color: #f2f2f2;
			color: #3b3b3b;
			border-radius: 10px;
			padding: 7px;
			margin-left: 10px;
    	}
    
    	.chart {
    		justify-content: center;
    		display: flex;
    		padding-bottom: 30px;
    	}
    
    	.chart1 {
    		width: 1000px;
    		text-align: center;
    	}
    	
    	.chart-title {
    		margin-top: 70px;
    		margin-bottom: 20px;
    		text-align: center;
    		font-weight: 900;
    		font-size: 1.3rem;
    		color: #333;
    	}
    	
    	.chart-subtitle {
    		text-align: center;
    		font-weight: 700;
    		font-size: 1rem;
    		color: #666;
    	}
    	
    	.chart2 {
    		width: 500px;
    		text-align: center;
    	}
    	
    	.chart5 {
    		width: 1000px;
    		text-align: center;
    	}
    	
    	.chart6 {
    		width: 1000px;
    		text-align: center;
    	}
    	
    	.chart7 {
    		width: 500px;
    		text-align: center;
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
			
			
			<div class="button-bar">
				<button class="display-button">
					<a href="javascript:chart1Display()">신규 가입자 수</a>
				</button>
				<button class="display-button">
					<a href="javascript:chart2Display()">회원 연령별</a>
				</button>
				<button class="display-button">
					<a href="javascript:chart5Display()">월별 주문 수</a>
				</button>
				<button class="display-button">
					<a href="javascript:chart6Display()">카테고리별 주문 수(연령)</a>
				</button>
				<button class="display-button">
					<a href="javascript:chart7Display()">카테고리별 주문 수(성별)</a>
				</button>
			</div>
			
			
			<div id="chart1-display">
				<div class="chart-title">신규 가입자 수</div>
				<div class="chart">
					<div class="chart1">
						<canvas id="chart1"></canvas>
					</div>
				</div>
			</div>
			
			<div id="chart2-display">
				<div class="chart-title">회원 연령별</div>
				<div class="chart">
					<div class="chart2">
						<div class="chart-subtitle">전체</div>
						<canvas id="chart2"></canvas>
					</div>
					<div class="chart2">
						<div class="chart-subtitle">여자</div>
						<canvas id="chart3"></canvas>
					</div>
					<div class="chart2">
						<div class="chart-subtitle">남자</div>
						<canvas id="chart4"></canvas>
					</div>
				</div>
			</div>
			
			<div id="chart5-display">
				<div class="chart-title">월별 주문 수</div>
				<div class="chart">
					<div class="chart5">
						<canvas id="chart5"></canvas>
					</div>
				</div>
			</div>
			
			<div id="chart6-display">
				<div class="chart-title">카테고리별 주문 수(연령, 6개월)</div>
				<div class="chart">
					<div class="chart6">
						<canvas id="chart6"></canvas>
					</div>
				</div>
			</div>
			
			<div id="chart7-display">
				<div class="chart-title">카테고리별 주문 수(성별, 6개월)</div>
				<div class="chart">
					<div class="chart7">
						<div class="chart-subtitle">여자</div>
						<canvas id="chart7"></canvas>
					</div>
					<div class="chart7">
						<div class="chart-subtitle">남자</div>
						<canvas id="chart8"></canvas>
					</div>
				</div>
			</div>
			
			

			         
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
       <!--  <a href="#top-moving" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a> -->
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
	  
	  
	  
	  const labels2 = ['남', '여'];
		
	  const data2 = {
	    labels: labels2,
	    datasets: [{
            data: [164, 221]
        }]
	  };
	
	  const config2 = {
	    type: 'doughnut',
	    data: data2,
	    options: {}
	  };
	  
	  
	  
	  const labels3 = ['10대', '20대', '30대', '40대', '50대 이상'];
		
	  const data3 = {
	    labels: labels3,
	    datasets: [{
            data: [38, 68, 45, 37, 33]
        }]
	  };
	
	  const config3 = {
	    type: 'doughnut',
	    data: data3,
	    options: {}
	  };
	  
	  
	  
	  const labels4 = ['10대', '20대', '30대', '40대', '50대 이상'];
		
	  const data4 = {
	    labels: labels4,
	    datasets: [{
            data: [21, 36, 22, 17, 18]
        }]
	  };
	
	  const config4 = {
	    type: 'doughnut',
	    data: data4,
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
	  
	  
	  
	  const labels6 = ['10대', '20대', '30대', '40대', '50대 이상'];
		
	  const data6 = {
	    labels: labels6,
	    datasets: [{
            label: '일반식',
            backgroundColor: 'rgb(73, 182, 253)',
            borderColor: 'rgb(73, 182, 253)',
            data: [304, 897, 674, 341, 175]
        },
        {
            label: '건강식',
            backgroundColor: 'rgb(255, 167, 119)',
            borderColor: 'rgb(255, 167, 119)',
            data: [184, 514, 216, 174, 146]
        },
		{
		    label: '프리미엄식',
		    backgroundColor: 'rgb(255, 217, 62)',
		    borderColor: 'rgb(255, 217, 62)',
		    data: [112, 289, 210, 185, 79]
		}]
	  };
	
	  const config6 = {
	    type: 'bar',
	    data: data6,
	    options: {}
	  };
	  
	  
	  
	  const labels7 = ['일반식', '건강식', '프리미엄식'];
		
	  const data7 = {
	    labels: labels7,
	    datasets: [{
            data: [1444, 809, 389]
        }]
	  };
	
	  const config7 = {
	    type: 'doughnut',
	    data: data7,
	    options: {}
	  };
	  
	  
	  
	  const labels8 = ['일반식', '건강식', '프리미엄식'];
		
	  const data8 = {
	    labels: labels8,
	    datasets: [{
            data: [947, 425, 486]
        }]
	  };
	
	  const config8 = {
	    type: 'doughnut',
	    data: data8,
	    options: {}
	  };
	  
	</script>
	
	
	<script>
		const Chart1 = new Chart(
			document.getElementById('chart1'),
			config1
		);
	  
		const Chart2 = new Chart(
			document.getElementById('chart2'),
			config2
		);
		
		const Chart3 = new Chart(
			document.getElementById('chart3'),
			config3
		);
		
		const Chart4 = new Chart(
			document.getElementById('chart4'),
			config4
		);
		
		const Chart5 = new Chart(
				document.getElementById('chart5'),
				config5
			);
		
		const Chart6 = new Chart(
				document.getElementById('chart6'),
				config6
			);
		
		const Chart7 = new Chart(
				document.getElementById('chart7'),
				config7
			);
		
		const Chart8 = new Chart(
				document.getElementById('chart8'),
				config8
			);
	</script>
	
	<script type="text/javascript">

	
		var bDisplay = true; function chart1Display(){ 	
	        var con = document.getElementById("chart1-display"); 	
	        if(con.style.display=='none'){ 		
	            con.style.display = 'block';
	        }else{ 		
	            con.style.display = 'none';
	        } 
	    } 
		
		var bDisplay = true; function chart2Display(){ 	
	        var con = document.getElementById("chart2-display"); 	
	        if(con.style.display=='none'){ 		
	            con.style.display = 'block';
	        }else{ 		
	            con.style.display = 'none';
	        } 
	    } 
		
		var bDisplay = true; function chart5Display(){ 	
	        var con = document.getElementById("chart5-display"); 	
	        if(con.style.display=='none'){ 		
	            con.style.display = 'block';
	        }else{ 		
	            con.style.display = 'none';
	        } 
	    } 
		
		var bDisplay = true; function chart6Display(){ 	
	        var con = document.getElementById("chart6-display"); 	
	        if(con.style.display=='none'){ 		
	            con.style.display = 'block';
	        }else{ 		
	            con.style.display = 'none';
	        } 
	    } 
		
		var bDisplay = true; function chart7Display(){ 	
	        var con = document.getElementById("chart7-display"); 	
	        if(con.style.display=='none'){ 		
	            con.style.display = 'block';
	        }else{ 		
	            con.style.display = 'none';
	        } 
	    } 
		
	</script>

    
</body>

</html>