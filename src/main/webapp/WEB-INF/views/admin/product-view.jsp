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
</head>


	<style>

		.button-frame {
			padding-top: 20px;
			padding-bottom: 20px;
			float: right;
		}
		
		/* 수정 버튼 */
		.edit-button {
			/* background-color: #2e75b6; */
			background-color: #1f79e0;
			color: white;
		}
		
		/* 삭제 버튼 */
		.del-button {
			background-color: #f2f2f2;
			color: #3b3b3b;
		}
		
		/* 목록 버튼 */
		.list-button {
			border: #f2f2f2;
			background-color: #f2f2f2;
			color: #3b3b3b;
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
		
		
		
		.title {
			font-weight: 500;
			font-size: 1.5rem;
			color: #EE8035;
			font-family: 'Noto Sans KR';
		}
		
		
		.name1, .category1, .price1 {
			font-weight: 500;
			color: #EE8035;
			font-family: 'Noto Sans KR';
		}
		
		.name2, .category2, .price2 {
			font-weight: 500;
			font-size: 1.3rem;
			color: #555;
			font-family: 'Noto Sans KR';
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
			
			
			<section class="container" style="margin-top: 100px; font-family: 'Noto Sans KR';">
				
				<div style="display: flex;">
					
					<div class="col-sm-12 col-xl-6">
                        <div class="add-box rounded h-100 p-4" style="width: 1000px;">
                            <h6 class="title mb-4">[상품 정보]</h6>
                            	
                            	
                           	<div class="product-frame">
                            <div class="pic">
                               	<div class="mb-3">
                                	<div style="text-align: center;">
                                		<img alt="" src="${dto.pic}" style="width: 500px;">
                                	</div>
                                </div>
                            </div>
                            
                            <div>
                                <div class="mb-3" style="width: 430px; border-bottom: 1px solid #e8e8e8;">
                                    <label class="name1 form-label">이름</label>
                                    <p class="name2">${dto.name}</p>
                                </div>
                                
                                
                                <div style="width: 430px; border-bottom: 1px solid #e8e8e8;">
	                                <label class="category1 form-label">분류</label>
	                                <p class="category2">${dto.category}</p>
                                </div>
                            	
                            	<div style="width: 430px; margin-top: 20px;">
                            		<label class="price1 form-label">가격</label>
                            		<p class="price2">${dto.price}</p>
                            	</div>
                            </div>
                            </div>
                            	
                            	<div class="button-frame">
                            		<button type="button" class="edit-button btn"
                            				onclick="location.href='/dndn/admin/product-edit.do?lunchboxseq=${dto.lunchboxseq}';">수정</button>
                                    <button type="button" class="del-button btn">삭제</button>
                                	<button type="button" class="list-button btn"
	                                		onclick="location.href='/dndn/admin/product.do';">목록</button>
                                </div>
                               
                        </div>
                    </div>
	
				</div>
				
			</section>
            
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
    

    
    
</body>

</html>