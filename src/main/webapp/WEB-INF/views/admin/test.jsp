<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
</head>
<body style="width:100%">

	
	<h1>차트 테스트</h1>
	<canvas id="myChart" style="width: 40; height: 40;"></canvas>
	<%-- <canvas id="testChart" style="width: 40; height: 40;"></canvas> --%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
    // 만들기 원하는 차트의 유형
    type: 'line',

    // 데이터 집합을 위한 데이터
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [
	        {
	            label: '1',
	            backgroundColor: 'red',
	            borderColor: 'red',
	            data: [0, 10, 5, 2, 20, 30, 45]
	        },
			{
			    label: '2',
			    backgroundColor: 'blue',
			    borderColor: 'blue',
			    data: [10, 5, 2, 20, 30, 45, 60]
			}
		]
    },

    // 설정은 여기서 하세요
    options: {}
});


/* var ctx = document.getElementById('testChart').getContext('2d');
var chart = new Chart(ctx, {
    // 만들기 원하는 차트의 유형
    type: 'line',

    // 데이터 집합을 위한 데이터
    data: {
        labels: ['2월', '3월', '4월', '5월', '6월', '7월'],
        datasets: [{
	        data: ['${totalCount}']
			backgroundColor: [
			    'rgba(255, 99, 132, 0.2)'
			
			],
			borderColor: [
			    'rgba(255,99,132,1)'
			
			],
			borderWidth: 1
        }]
    },

    // 설정은 여기서 하세요
    options: {}
}); */

</script>
</body>
</html>










