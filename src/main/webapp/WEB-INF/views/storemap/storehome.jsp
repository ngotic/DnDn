<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<style>

	
	#mapcontainer{
		position: relative;
		width:100%;
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
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		<h1>든든 지점</h1>
		
		<div id="mapcontainer">
			<div id="map" style="width:800px;height:600px;"></div>
			<div id="storeinfo" style="width:300px;height:500px;">
				<div id="placelist">
				</div>
			</div>
		</div>
		<div>
			<div id="placelist">
			</div>
		</div>
		
		
		
	</section>
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
<script type="	text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c837c78add7b31e526a1b98c5a9910f"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
<script>

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(${37.4992}, ${127.033}), //지도의 중심좌표.
		level: 6 //지도의 레벨(확대, 축소 정도),
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	let m  = null;
	
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${37.4992}, ${127.033}); 
	var imageSrc = '/dndn/resources/img/logo_short.png'; // 마커이미지의 주소입니다 
	var imageSize = new kakao.maps.Size(70, 70); // 마커이미지의 크기입니다
	var imageOption = {offset: new kakao.maps.Point(25, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	  
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);	
	const ms=[];
	$(document).ready(function(){
		
		//리스트에 뿌려주기 
		var placeList = $('#placelist');

		// 각 장소에 대한 정보를 가져와 목록에 추가하는 함수
		  function addPlaceToList(name, address, tel, lat, lng) {
			
			
		    var placeItem = $('<div style="border-bottom:1px solid #F1F3F4; width:250px;"></div>').addClass('place-item');
		    placeItem.attr('data-lat', lat); // 해당 장소의 위도를 data-lat 속성에 추가
		    placeItem.attr('data-lng', lng); // 해당 장소의 경도를 data-lng 속성에 추가
		    var nameElement = $('<div style="font-size:22px;"></div>').text(name);
		    var addressElement = $('<div></div>').text(address);
		    var telElement = $('<div></div>').text(tel);
		    
		    placeItem.append(nameElement,addressElement, telElement);
		    placeList.append(placeItem);
		    
		 	// 테이블 클릭 이벤트 등록
		    placeItem.on('click', (function(lat, lng) {
		      return function() {
		        // 해당 장소의 좌표로 이동
		        var position = new kakao.maps.LatLng(lat, lng);
		        map.panTo(position); // 부드럽게 이동
		        
		        for (var i = 0; i < ms.length; i++) {
		          if (ms[i].getPosition().getLat() === lat && ms[i].getPosition().getLng() === lng) {
		            ms[i].setMap(map); // 해당 장소 마커 표시
		            break;
		          }
		        }
		        $('.place-item').css('background-color', 'transparent'); // 모든 장소 초기화
		        $(this).css('background-color', '#F1F3F4'); // 선택된 장소에 배경색 적용
		      };
		    })(lat, lng));
		  }
		
		
		<c:forEach items="${blist}" var="dto" varStatus="status">
		content${status.count}='<div class="overlaybox" style="background-color:white;">' +
	    '    <div class="first" style="background: url(\'/dndn/resources/img/logo_short.png\') no-repeat center;position:relative;width:157px;height:160px;margin-left:5px;margin-bottom:8px;background-size: cover;" >' +
	    '    </div>' +
	    '</div>'; 
		let p${status.count} = new kakao.maps.LatLng(${dto.lat},${dto.lng});
		
		let m${status.count} = new kakao.maps.Marker({
			position: p${status.count},
			image: markerImage
		});
		var customOverlay${status.count}=new kakao.maps.CustomOverlay({
		    position : p${status.count},
		    content : content${status.count},
		    xAnchor: 0.35,
		    yAnchor: 1.15
		});
		
		  kakao.maps.event.addListener(m${status.count}, 'click', function(mouseEvent) {
			  var position = new kakao.maps.LatLng(${dto.lat}, ${dto.lng});
			  map.panTo(p${status.count}); // 부드럽게 이동
			  // 선택된 장소에 배경색 적용
			  $('.place-item').css('background-color', 'transparent'); // 모든 장소 초기화
			  $('.place-item[data-lat="${dto.lat}"][data-lng="${dto.lng}"]').css('background-color', '#F1F3F4'); // 선택된 장소에 배경색 적용
			  
		});  
		/* kakao.maps.event.addListener(m${status.count}, 'mouseover', function() {   
			customOverlay${status.count}.setMap(map);
		});
		kakao.maps.event.addListener(m${status.count}, 'mouseout', function() {      
			customOverlay${status.count}.setMap(null);     
		}); */
		
		m${status.count}.setMap(map);
		
		ms.push(m${status.count});
		$('#list td').css('background-color','transparent');
		$(this).css('background-color','gold');
		
		
		addPlaceToList('${dto.name}', '${dto.address}', '${dto.tel}', ${dto.lat}, ${dto.lng});
		</c:forEach>
	});
	function showBuildingInfo(name, address,tel) {
	    var storeInfoDiv = document.getElementById('storeinfo');
	    $('#storeinfo').css('transform', 'translate(450px,0px)');
	    // 기존 내용을 초기화
	    storeInfoDiv.innerHTML = '';
	    
	    // 정보를 추가
	    var nameElement = document.createElement('p');
	    nameElement.innerText = '지점: ' + name;
	    
	    var addressElement = document.createElement('p');
	    addressElement.innerText = '위치: ' + address;
	    
	    var telElement = document.createElement('p');
	    telElement.innerText = '전화번호: ' + tel;
	    

	    storeInfoDiv.appendChild(nameElement);
	    storeInfoDiv.appendChild(addressElement);
	    storeInfoDiv.appendChild(telElement);
	}
	

</script>
</body>
</html>