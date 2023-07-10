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
.cartboxcontent{
	display: grid;
	grid-template-columns: 1fr 2.2fr 4fr 2fr 5fr 3fr 2fr;
	text-align: center;
	font-size: 1.2rem;
	margin-bottom: 10px;
}
#cartbox {
	margin: 15px 0;
	height: 1;
	display: grid;
	grid-template-columns: 1.2fr 2.2fr 4fr 2fr 5fr 3fr 2fr;
	font-size: 1.4rem;
	font-weight: bold;
}

#cartbox>div {
	text-align: center;
	font-size: 1.2rem;
}

input[type=button] {
	background-color: #EDEDEF;
	font-weight: bold;
	font-size: 1.2rem;
	border: .2px #999 solid;
	margin: 5px;
	padding: 3px;
	border-radius: 5px;
}

button {
	font-weight: bold;
	color: black;
	font-size: 1.2rem;
	border: none;
	margin: 5px;
	padding: 5px;
	background-color: #fa9f55;
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
	margin-left: 30px;
	width: 60%;
	text-align: center;
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
	font-size: 0.8rem;
}
#up,
#down{
	float: right;
	margin:0 auto;
	width: 18px;
	margin-right: 3px;
	cursor: pointer;
	margin-top: 3.5%;
}
#down{
	transform: rotateX(180deg);
}
#cartsal{
	width: 25px;
	margin-top: 0px;
	margin-buttom: 10px;
}
</style>
</head>
<body>
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div id="box">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp" %>
		<section class="container">
        <h1>장바구니</h1>        
        <hr>
        <div id="bc">
        <div id="cartbox">
            <div><input type="checkbox" name="aa" id="all" onchange="sum('y')">&nbsp;선택</div>
            <div>이미지</div>
            <div>상품명</div>
            <div>가격</div>
            <div>수량</div>
            <div>합계</div>
            <div>삭제</div>
        </div>
        <div class="cartboxcontent">
            <div>
            <input type="checkbox" name="" class="one" onchange="sum('n')">
            </div>
            <div><img src="/dndn/resources/img/mypage/cart.png" id="cartsal"></div>
            <div>맛있는 샐러드</div>
            <div class="price">20,000원</div>
            <div><input type="number" name="" class="count">
                <img src="/dndn/resources/img/mypage/arrow.png" id="up" onclick="account('+')">
                <img src="/dndn/resources/img/mypage/arrow.png" id="down" onclick="account('-')">
            </div>
            <div class="sum">100000원</div>
            <div><input type="button" value="삭제" id="delbtn"></div>
        </div>
        
        <%-- <c:forEach items="${list}" var="dto"> --%>
        <div class="cartboxcontent">
            <div>
            <input type="checkbox" name="" class="one" onchange="sum('n')">
            </div>
            <div><img src="/dndn/resources/img/mypage/cart.png" id="cartsal"></div>
            <div>맛있는 샐러드</div>
            <div class="price">50,000원</div>
            <div><input type="number" name="" class="count">
                <img src="/dndn/resources/img/mypage/arrow.png" id="up" onclick="account('+')">
                <img src="/dndn/resources/img/mypage/arrow.png" id="down" onclick="account('-')">
            </div>
            <div >100000원</div>
            <div><input type="button" value="삭제" id="delbtn"></div>
        </div>
        <%-- </c:forEach> --%>
        <hr>
        <div id="cartboxbottom">
            <div>
                <input type="button" value="선택상품삭제">
                <input type="button" value="장바구니 비우기">
            </div>
            <div>상품갯수 : 4개</div>
            <div id="total">원</div>
        </div>
        <div id="orderbtn"><button>주문하기</button></div>
        </div>
    </section>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>

	
	
	 $('#all').change(() => {
		
	  for (var i = 0; i < one.length; i++) {
	    one[i].checked = $('#all').is(':checked');
	  }
	  
	  
	});

	$('.one').change(() => {
		
	  for (var i = 0; i < one.length; i++) {
		if(one[i].checked){
			alert('check?');
		}
	  }
	});
	var one = $('.one');
	function sum(yn) {
	var num = 0;
		if(yn=='y' && $('#all').is(':checked')){
			for (var i = 0; i < one.length; i++) {
			    one[i].checked = $('#all').is(':checked');
				num += parseInt($('.sum').text());
			  }

			$('#total').text("합계금액 : "+name(String(num))+"원");
			    	
		}else{
			for (var i = 0; i < one.length; i++) {
			    one[i].checked = $('#all').is(':checked');
			}
			$('#total').text("합계금액 : 0원");
		}
	}

	
		  
	function account(pm) {

	var stPrice = $(event.target).parent().prev().text();
	var unit = parseInt(stPrice.replace(/,/g, ""));
		
		var value = parseInt($(event.target).siblings('.count').val());

		if(value >= 1){
			
			if(pm=='+'){
				console.log(value);
				value = value+1;
				
			}else if(pm=='-'){
				
				console.log(value);
				value = value-1;
			}
		}else{
			if(pm=='+'){
				console.log(value);
			value = value+1;
				
			}	
		}
		
		$(event.target).siblings('.count').val(value);
		
		
		var price = String(value * unit);
		
		$(event.target).parent().next().text(name(price));
	}
	
	function name(price){
		var line = '';
		  for (var i = price.length - 1, count = 0; i >= 0; i--, count++) {
			    if (count !== 0 && count % 3 === 0) {
			      line = ',' + line;
			    }
			   line = price[i] + line;
			  }
		  return line;
	}
	</script>
</body>
</html>














