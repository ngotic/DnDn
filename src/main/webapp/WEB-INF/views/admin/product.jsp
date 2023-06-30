<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>든든</title>
	<%@ include file="/WEB-INF/views/include/asset.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
	<link href="/dndn/resources/startbootstrap-sb-admin-gh-pages/css/styles.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	
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
    		width: 350px;
    		left: 290px;
		}
		
		
		label {
			color: white;
		}
	
	</style>
</head>

<body class="sb-nav-fixed">
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<section class="container">

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        
                        <div class="card mb-4" style="border: none;">
                            
                            <div class="card-body">
                            
                            <div>
                            	<button class="add-button">추가</button>
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
                                    		<td>${dto.name}</td>
                                    		<td>${dto.category}</td>
                                    		<td>${dto.price}</td>
                                    		<td>${dto.regdate}</td>
                                    		<td>${dto.modidate}</td>
                                    		<td>
                                    			<button class="edit-button">수정</button>
                                    			<!-- <button class="del-button">삭제</button> -->
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
        </div>
		
		
	</section>
	
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/dndn/resources/startbootstrap-sb-admin-gh-pages/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="/dndn/resources/startbootstrap-sb-admin-gh-pages/js/datatables-simple-demo.js"></script>

<script>
</script>
</body>
</html>














