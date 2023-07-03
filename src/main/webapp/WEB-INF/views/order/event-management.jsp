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
    
    <link rel="stylesheet" href="/dndn/resources/css/order.css">
    
<style>

	.screen-width-88{
		width: 88%;
	}
	
	.event-screen3{
		    height: 205px;

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

		 .event-screen3 > div div:nth-child(3) table tr td{

		border: 1px solid black;
		
		
		}
		
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
</style>
</head>



<body style="    height: 100%;">

<div class="container-fluid position-relative bg-white d-flex p-0">
        
        <!-- 사이드바 -->
        <%@ include file="/WEB-INF/views/order/admin-sidebar.jsp" %>



        <!-- Content Start -->
        <div class="content">
            

			<!-- nav -->
			<%@ include file="/WEB-INF/views/order/admin-nav.jsp" %>

		<div>
			<section class="admin-page">
		
				<form method="get"  style="height: 100%;">
					
					<!-- 좌측 메뉴 스크린 -->
				<%-- <%@ include file="/WEB-INF/views/order/order-screen1.jsp" %> --%>
		
				<c:if test="${!edit }">
				<!-- 이벤트 조회 메뉴 스크린 -->
				<%@ include file="/WEB-INF/views/order/event-management-editfalse.jsp" %>
				</c:if>
				
				<c:if test="${edit}">
				<!--  이벤트 수정/삭제 메뉴 스크린-->	
				<%@ include file="/WEB-INF/views/order/event-management-edittrue.jsp" %>
				</c:if>
		
		
		
				</form>
		
			</section>
			
		</div>
		
		</div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 

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

<script>
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
}

</script>
</html>