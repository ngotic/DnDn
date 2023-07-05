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
		}
		
		tbody > tr > td:nth-child(1), td:nth-child(2), 
					 td:nth-child(3), td:nth-child(4), 
					 td:nth-child(6), td:nth-child(7), td:nth-child(8) {
			text-align: center;
		}
		
		tbody > tr > td:nth-child(5) {
			padding-right: 15px;
			text-align: right;
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
        <%@ include file="/WEB-INF/views/order/admin-sidebar.jsp" %>



        <!-- Content Start -->
        <div class="content">
            

			<!-- nav -->
			<%@ include file="/WEB-INF/views/order/admin-nav.jsp" %>
			
			
			<section class="container">

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        
                        <div class="card mb-4" style="border: none;">
                            
                            <div class="card-body">
                            
                            <div>
                            	<button type="button" class="add-button" 
                            			onclick="location.href='/dndn/admin/product-add.do';">추가</button>
                            </div>
                            
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>이미지</th>
                                            <th>이름</th>
                                            <th>분류</th>
                                            <th>가격</th>
                                            <th>등록일</th>
                                            <th>수정일</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    

                                    <tbody>
                                    <c:forEach items="${list}" var="dto">
                                    	<tr>
                                    		<td>${dto.lunchboxseq}</td>
                                    		<td>
                                    			<img alt="도시락" src="${dto.pic}" 
                                    				 style="width: 50px; height: 50px;">
                                    		</td>
                                    		<td>
                                    			<a href="/dndn/admin/product-view.do?lunchboxseq=${dto.lunchboxseq}">
                                    				${dto.name}
                                    			</a>
                                    		</td>
                                    		<td>${dto.category}</td>
                                    		<td>${dto.price}</td>
                                    		<td>${dto.regdate}</td>
                                    		<td>${dto.modidate}</td>
                                    		
                                    		
                                    		
                                    		
                                    		<td>
                                    		
                                    			<button type="button" class="edit-button"
                                    					onclick="location.href='/dndn/admin/product-edit.do?lunchboxseq=${dto.lunchboxseq}';">수정</button>



                                    					
                                    			<button type="button" class="del-button" data-toggle="modal" data-target="#exampleModal">삭제</button>

	                                    		<!-- Modal -->
	                                    		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" 
	                                    			 aria-labelledby="exampleModalLabel" aria-hidden="true">
	                                    			 
												  <div class="modal-dialog" role="document">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h5 class="modal-title" id="exampleModalLabel">상품 삭제</h5>
												        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
												          <span aria-hidden="true">&times;</span>
												        </button>
												      </div>
												      <div class="modal-body">
												        상품을 삭제하시겠습니까?
												      </div>
												      <div class="modal-footer">
												      	<button type="button" class="btn btn-primary" onclick="clickDel(boardInfo)">삭제</button>
												       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
												      </div>
												    </div>
												  </div>
												  
												</div>
												
												<form name="boardInfo">
													<input type="hidden" name="lunchboxseq" value="${lunchboxseq}">
												</form>

												
                                    		</td>
                                    		
                                    		
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
    
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    
    
    <script>
	    function clickDel(formName) {
			formName.action = "/dndn/admin/product-del";
			formName.method = "post";
			formName.submit();
		}
    </script>
    
</body>

</html>