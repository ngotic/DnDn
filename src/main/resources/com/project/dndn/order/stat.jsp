<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/dndn/resources/css/order.css">
<style>
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/order/header.jsp" %>

	<h2>카테고리별 주문추이</h2>
		
		<div id= "chart">
			<canvas id ="myChart"></canvas>
		</div>
	


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	

</body>

<script>
const ctx = document.getElementById('myChart');

let total = 12 + 19 + 3 + 5 + 4 + 10;
	    //일반식 + 건강식 + 샐러드 + 샌드위치 + 정기배송 전체 주문수

new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: ['일반식', '건강식', '샐러드', '샌드위치', '정기배송', ],
	      datasets: [{
	        label: '카테고리 주문별 추이 %',
	        
	        data: [total/12, total/19, total/3, total/5, total/4 ,total/10],
	        borderWidth: 3
	      }]
	    },
	    options: {
	      scales: {
	        y: {
	          beginAtZero: 0
	        }
	      }
	    }
	  });

</script>
</html>