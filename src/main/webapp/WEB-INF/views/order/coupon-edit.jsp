<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>

    <title>든든</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
    <!--  -->
    <%@ include file="/WEB-INF/views/include/asset.jsp" %>
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

<body>
    <div class="container-fluid position-relative bg-white d-flex p-0">
        
        <!-- 사이드바 -->
        <%@ include file="/WEB-INF/views/order/admin-sidebar.jsp" %>



        <!-- Content Start -->
        <div class="content">
            

			<!-- nav -->
			<%@ include file="/WEB-INF/views/order/admin-nav.jsp" %>
			
		
		<form method="get" action="/order/coupon-edit.do">            
		 			  <c:set var="addBoolean" value="${not empty param.delete}" />
	                            <c:if test="${!addBoolean}">
		                                <div class="row mb-3">
		                                    <label for="inputEmail3" class="col-sm-2 col-form-label">쿠폰이름</label>
		                                    <div class="col-sm-10">
		                                        <input type="text" class="form-control" id="inputEmail3"  name ="name">
		                                    </div>
		                                </div>
		                                <div class="row mb-3">
		                                    <label for="inputPassword3" class="col-sm-2 col-form-label">할인 (%)</label>
		                                    <div class="col-sm-10">
		                                        <input type="number" class="form-control" id="inputPassword3" name ="sale">
		                                    </div>
		                                </div>
		                                <div class="row mb-3">
		                                    <label for="inputPassword3" class="col-sm-2 col-form-label">유효기간</label>
		                                    <div class="col-sm-10">
		                                        <input type="number" class="form-control" id="inputPassword3"  name ="period">
		                                    </div>
		                                </div>
	                            </c:if>
	                              <c:set var="addBoolean" value="${not empty param.add}" />
	                            <c:set var="editBoolean" value="${not empty param.edit}" />
	                            <c:set var="deleteBoolean" value="${not empty param.delete}" />
	                            
                                <c:if test="${add}">
                                <input type="hidden"  value="true" name = "add">
                                <button type="submit" class="btn btn-primary">추가</button>
                                </c:if>
 <%--                                <c:if test="${edit}">
                                <input type="hidden"  value="true" name = "edit">
                                <button type="submit" class="btn btn-primary">수정</button>
                                </c:if>
                                <c:if test="${delete}">
                                <input type="hidden"  value="true" name = "delete">
                                <button type="submit" class="btn btn-primary">삭제</button>
                                </c:if>
                                 --%>
                                
                                
                            </form>
                        </div>
                    </div>
                    		 	</form>

					 	
					<table id="datatablesSimple"> 
					<thead>
						<tr>
							<th>쿠폰번호</th>
							<th>쿠폰이름</th>
							<th>할인율</th>
							<th>유효기간</th>
						</tr>
						</thead>
				<c:forEach var="coupon"  items="${couponlist}"> 
						<tr>
							<td>${coupon.couponseq}</td>
							<td>${coupon.name}</td>
							<td>${coupon.sale}</td>
							<td>${coupon.period}</td>
						</tr>
					</c:forEach> 
						
					</table>
					
					 
				
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

<script>


</script>

</html>