<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <title>든든</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
    <!--  -->
    
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
	<link href="/dndn/resources/startbootstrap-sb-admin-gh-pages/css/styles.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	

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


	<style>

		.button-frame {
			padding-top: 20px;
			padding-bottom: 20px;
			float: right;
		}
		
		/* 목록 버튼 */
		.list-button {
			border: #f2f2f2;
			background-color: #f2f2f2;
			color: #3b3b3b;
		}
		
		.pic-button {
			position: absolute;
			margin-top: 20px;
		}				
		
		
		.add-box {
			border: 1px solid #ced4da;
		}
		
		
		.category-price {
			display: flex;
			justify-content: space-between;
		}
		
		.image, .name {
			width: 800px;
		}
		
		
		.product-frame {
			display: flex;
    		align-items: center;
		}
		
		.pic {
			float: left;
    		padding-right: 30px;
		}
		
		
		.product-menu {
			font-size: 1.4rem;
		}


	</style>


<body>
    <div class="container-fluid position-relative bg-white d-flex p-0">
        
        <!-- 사이드바 -->
        <%@ include file="/WEB-INF/views/order/admin-sidebar.jsp" %>



        <!-- Content Start -->
        <div class="content">
            

			<!-- nav -->
			<%@ include file="/WEB-INF/views/order/admin-nav.jsp" %>
			
			
			<section class="container" style="margin-top: 50px;">
				
				<div style="display: flex; justify-content: center;">
					
					<div class="col-sm-12 col-xl-6">
                        <div class="add-box rounded h-100 p-4">
                        <h6 class="product-menu mb-4">상품 수정</h6>
                            
                        <div class="product-frame">
                        
                            <div class="pic" style="margin-bottom: 40px; width: 100%;">
								
							
                            <form method="POST" action="/dndn/admin/product-editok.do">
                            
							    <img id="preview" src="${dto.pic}" alt="" style="margin-bottom: 10px; width: 500px;">
							    <br>
	                            <input class="form-control" name="pic"
	                            	   type="text" id="urlInput" placeholder="이미지 URL을 입력하세요." required
	                            	   value="${dto.pic}">
                            </div>
                            
                           
                            	
                            <div  style="width: 100%;">

                                <div class="mb-3">
                                    <label class="form-label">이름</label>
                                    <input class="form-control" name="name" style="width: 100%" required
                                    	   value="${dto.name}">
                                </div>
                                
                                <label class="form-label">분류</label>
                                <select class="form-select mb-3" aria-label="Default select example" aria-hidden="true"
                                		name="category" required>
	                                <option value=""></option>
	                                <option value="일반식" ${dto.category.equals("일반식") ? "selected" : ""}>일반식</option>
	                                <option value="건강식" ${dto.category.equals("건강식") ? "selected" : ""}>건강식</option>
	                                <option value="프리미엄식" ${dto.category.equals("프리미엄식") ? "selected" : ""}>프리미엄식</option>
                            	</select>
                            	
                            	<div>
                            		<label class="form-label">가격</label>
                            		<input class="form-control" type="number" min="0" 
                            			   name="price" required value="${dto.price}">
                            	</div>
                            	</div>
                            </div>
                            	
                            	<!-- 버튼 -->
                            	<div class="button-frame">
                                	<button type="submit" class="edit-button btn btn-primary">수정</button>
	                                <button type="button" class="list-button btn"
	                                		onclick="location.href='/dndn/admin/product.do';">목록</button>
                                </div>
                                
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input type="hidden" name="id" value='<sec:authentication property="principal.username"/>'>
								<input type="hidden" name="lunchboxseq" value="${dto.lunchboxseq}">
	
                                
                            </form>
                            
                            <button class="pic-button btn btn-primary" onclick="previewImage()">이미지 미리보기</button>
                            
                        </div>
                    </div>
	
				</div>
				
			</section>
            
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
    
    
    <script>
		function previewImage() {
		    var urlInput = document.getElementById('urlInput');
		    var preview = document.getElementById('preview');
		    
		    var imageUrl = urlInput.value;
		    preview.src = imageUrl;
		  }
	</script>
    
    
</body>

</html>