<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dndn</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<style>
.container {
	background-color: #faf9d0;
	padding: 10px;
	height: 100%;
}

.container>h1 {
	padding-bottom: 30px;
}
#cartboxcontent{
	display: grid;
	grid-template-columns: 1fr 2.2fr 5fr 2fr 4fr 3fr 2fr;
	text-align: center;
}
#cartbox {
	margin: 15px 0;
	height: 1;
	display: grid;
	grid-template-columns: 1fr 2.2fr 5fr 2fr 4fr 3fr 2fr;
	font-size: 1rem;
	font-weight: bold;
}

#cartbox>div {
	text-align: center;
}

input[type=button] {
	background-color: #BBBBBB;
	font-weight: bold;
	color: black;
	font-size: 1.2rem;
	border: .5px #777 solid;
	margin: 5px;
	padding: 1.5px;
	border-radius: 5px;
}

button {
	font-weight: bold;
	color: black;
	font-size: 1.2rem;
	border: .5px #777 solid;
	margin: 5px;
	padding: 2.5px;
	background-color: white;
	border-radius: 5px;
}

#cartboxbottom {
	float: right;
	text-align: right;
	display: contents;
}

#cartboxbottom::after {
	clear: right;
}

#orderbtn {
	text-align: center;
}
input[type="number"]{
	width: 80%;
}
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button{
	-webkit-appearance: none;
	margin: 0;
}
input[type="number"]:focus {
	outline: none;
}
#bc{
	background-color: white;
	padding: 10px;
}
#delbtn{
	margin: 0px;
	font-size: 0.7rem;
}
#up,
#down{
	border-radius: 100%;
	background-color: blue;
	float: right;
	width: 20px;
}
#cartsal{
	width: 30px;
}
</style>
</head>
<body>
	<div id="box">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp"%>
		<section class="container">
        <h1>장바구니</h1>
        <hr>
        <div id="bc">
        <div id="cartbox">
            <div>선택</div>
            <div>이미지</div>
            <div>상품명</div>
            <div>가격</div>
            <div>수량</div>
            <div>합계</div>
            <div>삭제</div>
        </div>
        <div id="cartboxcontent">
            <div><input type="checkbox" name="" id=""></div>
            <div><img src="/dndn/resources/img/mypage/cart.png" id="cartsal"></div>
            <div>맛있는 샐러드</div>
            <div>20,000원</div>
            <div><input type="number" name="" id="">
                <img src="/dndn/resources/img/mypage/arrow.png" id="up">
                <img src="/dndn/resources/img/mypage/arrow.png" id="down">
            </div>
            <div>100,000원</div>
            <div><input type="button" value="삭제" id="delbtn"></div>
        </div>
        <hr>
        <div id="cartboxbottom">
            <div>
                <input type="button" value="선택상품삭제">
                <input type="button" value="장바구니 비우기">
            </div>
            <div>상품갯수 : 4개</div>
            <div>합계금액 : 74,200원</div>
        </div>
        <div id="orderbtn"><button>선택한 상품 주문</button></div>
        </div>
    </section>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
		
	</script>
</body>
</html>














