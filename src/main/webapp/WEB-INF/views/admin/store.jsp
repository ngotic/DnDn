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
			font-weight: 500;
		}
		
		tbody > tr > td {
			text-align: center;
		}
		
		label {
			color: white;
		}
		
		.datatable-top {
			display: flex;
		}
		
		.datatable-search {
			width: 60%;
		}
		
		
		
		
		#mapcontainer{
			position: relative;
			width:70%;
			height:700px;
			margin-bottom:50px;
		}
		
		#map{
			position: absolute;
			left:-20px;
		}
		
		#storeinfo{
			position: absolute;
			left:780px;
			transition:2s all;
			padding-left:10px;
			font-size:15px;
			font-weight:bold;
			color:black;
		}
		
		.place-item{
			padding:20px 10px;
		}	
		
		.place-item:hover{
			cursor:pointer;
			background-color:#F1F3F4;
		}
    	
    </style>
    
    
</head>

<body>
    <div class="container-fluid position-relative bg-white d-flex p-0">
        
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
                    
                   
                    <a href="/dndn/admin/store.do" class="nav-item nav-link active" style="font-family: 'Noto Sans KR';">
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


        <!-- Content Start -->
        <div class="content">
            

			<!-- nav -->
			<%@ include file="/WEB-INF/views/order/admin-nav.jsp" %>
			

			<div class="container-fluid px-4" style="display: flex; justify-content: space-between; margin-top: 100px;">
			
			<div id="mapcontainer">
							<div id="map" style="width:100%; height:80%; margin-top:60px;" ></div>
							<!-- <div id="storeinfo" style="width:300px;height:500px;">
								<div id="placelist">
								</div>
							</div> -->
						</div>
						<!-- <div>
							<div id="placelist">
							</div>
						</div> -->
			
				<div class="card mb-4" style="border: none; width: 50%; margin-top: 100px;">
                            
                            <div class="card-body">
                            
                            <div>
                            	<button type="button" class="add-button" 
                            			onclick="location.href='/dndn/admin/store-add.do';">추가</button>
                            </div>
                            
                            
                                <table id="datatablesSimple" style="font-family: 'Noto Sans KR';">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>이름</th>
                                            <th>주소</th>
                                            <th>번호</th>
                                            <th>위도</th>
                                            <th>경도</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    

                                    <tbody>
	                                <c:forEach items="${storelist}" var="dto">
	                                   <tr class="store-list">
	                                     <td>${dto.storeseq}</td>
	                                     <td>${dto.name}</td>
	                                     <td>${dto.address}</td>
	                                     <td>${dto.tel}</td>
	                                     <td>${dto.lat}</td>
	                                     <td>${dto.lng}</td>
	                                     <td>
	                                       <button type="button" class="edit-button" onclick="location.href='/dndn/admin/store-edit.do?storeseq=${dto.storeseq}';">수정</button>
	                                       <button type="button" class="del-button" data-bs-toggle="modal" data-bs-target="#exampleModalDel${dto.storeseq}" onclick="f1(this)">삭제</button>
	                                     </td>
	                                 
	                                     <%-- <!-- Modal -->
	                                     <div class="modal fade" id="exampleModalDel${dto.storeseq}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	                                       <div class="modal-dialog modal-dialog-centered">
	                                         <div class="modal-content">
	                                         
	                                           <div class="modal-header">
	                                             <h5 class="modal-title" id="exampleModalLabel">상품 삭제</h5>
	                                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
	                                           </div>
	                                           
	                                           <div class="modal-body">
	                                             가맹점 이름: #{dto.name}<br>
	                                             가맹점을 삭제하시겠습니까?
	                                           </div>
	                                           
	                                           <div class="modal-footer">
	                                             <form method="POST" action="/dndn/admin/store-delok">
	                                               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                                               <input type="hidden" name="id" value='<sec:authentication property="principal.username"/>'>
	                                               <input type="hidden" name="storeseq" value="${dto.storeseq}">
	                                               <button type="submit" class="btn btn-primary">삭제</button>
	                                             </form>
	                                             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.href='/dndn/admin/store.do';">취소</button>
	                                           </div>
	                                           
	                                         </div>
	                                       </div>
	                                     </div> --%>
	                                   </tr>
	                                </c:forEach>
                                    </tbody>

                                </table>
                                
							
                            </div>
                        </div>
                        
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
	
	
	<script>
	  function setstoreSeq(storeSeq) {
	    document.getElementById('storeseqInput').value = storeSeq;
	  }
	</script>
	
	<script type="	text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c837c78add7b31e526a1b98c5a9910f"></script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
<script>
var prevOverlay = null;
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(${37.4992}, ${127.033}), //지도의 중심좌표.
    level: 6 //지도의 레벨(확대, 축소 정도),
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

let m = null;


	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${37.4992}, ${127.033}); 
	var imageSrc = '/dndn/resources/img/pngwing.com.png'; // 마커이미지의 주소입니다 
	var imageSize = new kakao.maps.Size(65, 65); // 마커이미지의 크기입니다
	var imageOption = {offset: new kakao.maps.Point(25, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	  
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);	
	const ms=[];
	$(document).ready(function(){
			

		// 각 장소에 대한 정보를 가져와 목록에 추가하는 함수
		  function addPlaceToList(name, address, tel, lat, lng, customOverlay) {
	
	        placeItem.on('click', function() {
	        	
	            var position = new kakao.maps.LatLng(lat, lng);
	            map.panTo(position);
	            for (var i = 0; i < ms.length; i++) {
	                if (ms[i].getPosition().getLat() === lat && ms[i].getPosition().getLng() === lng) {
	                    ms[i].setMap(map);
	                    break;
	                }
	            }
	            $('.store-list').css('background-color', 'transparent');
	            $(this).css('background-color', '#F1F3F4');
	            if (prevOverlay) {
	                prevOverlay.setMap(null);
	            }
	            customOverlay.setMap(map);
	            prevOverlay = customOverlay;

	            // 마우스오버 이벤트 핸들러 제거
	            $('.place-item').not(this).off('mouseover');
	            
	        });
	        placeItem.on('mouseover',function(){
	        	var position = new kakao.maps.LatLng(lat, lng);
	        	 map.panTo(position);
	        	 for (var i = 0; i < ms.length; i++) {
		                if (ms[i].getPosition().getLat() === lat && ms[i].getPosition().getLng() === lng) {
		                    ms[i].setMap(map);
		                    break;
		                }
		            }
	            $('.place-item').css('background-color', 'transparent');
	            $(this).css('background-color', '#F1F3F4');
	            if (prevOverlay) {
	                prevOverlay.setMap(null);
	            }
	            customOverlay.setMap(map);
	            prevOverlay = customOverlay;
	        });
	    }
	  
		
		<c:forEach items="${storelist}" var="dto" varStatus="status">
		content${status.count}='<div class="overlaybox" style="background-color:white; width:240px; height:70px;border-radius:10px;">' +
	    '    <table class="first" style="padding: auto auto;"><tr><td><img src="/dndn/resources/img/logo_short.png" style="margin-left:7px;margin-right:7px;margin-top:5px;width:50px; height:50px;"></td>' +
	    '<td style="padding-top:5px;"><span>${dto.name}</span><br><span>${dto.address}</span><br><span>tel: ${dto.tel}</span></td></tr></table>' +
	    '</div>'; 
		let p${status.count} = new kakao.maps.LatLng(${dto.lat},${dto.lng});
		
		let m${status.count} = new kakao.maps.Marker({
			position: p${status.count},
			image: markerImage
		});
		var customOverlay${status.count}=new kakao.maps.CustomOverlay({
		    position : p${status.count},
		    content : content${status.count},
		    xAnchor: 0.47,
		    yAnchor: 1.65
		});
		
		  /* kakao.maps.event.addListener(m${status.count}, 'click', function(mouseEvent) {
			  var position = new kakao.maps.LatLng(${dto.lat}, ${dto.lng});
			  map.panTo(p${status.count}); // 부드럽게 이동
			  // 선택된 장소에 배경색 적용
			  $('.place-item').css('background-color', 'transparent'); // 모든 장소 초기화
			  $('.place-item[data-lat="${dto.lat}"][data-lng="${dto.lng}"]').css('background-color', '#F1F3F4'); // 선택된 장소에 배경색 적용
			  
			  if (prevOverlay) {
		          prevOverlay.setMap(null); // 이전 cusstomOverlay를 지도에서 제거
		        }
			  customOverlay${status.count}.setMap(map);
			  prevOverlay = customOverlay${status.count}; 
		});  
		 kakao.maps.event.addListener(m${status.count}, 'mouseover', function() {   
			customOverlay${status.count}.setMap(map);
		});
		kakao.maps.event.addListener(m${status.count}, 'mouseout', function() {      
			if (prevOverlay !== customOverlay${status.count}) {
		        customOverlay${status.count}.setMap(null);
		    } 
		});  */
		
		m${status.count}.setMap(map);
		
		ms.push(m${status.count});
		/* $('#list td').css('background-color','transparent');
		$(this).css('background-color','gold');
		
		
		addPlaceToList('${dto.name}', '${dto.address}', '${dto.tel}', ${dto.lat}, ${dto.lng},customOverlay${status.count}); */
		</c:forEach>
	});
	
	
	

</script>

    
</body>

</html>