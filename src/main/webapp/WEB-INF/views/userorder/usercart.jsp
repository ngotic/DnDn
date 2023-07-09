<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <%@ include file="/WEB-INF/views/include/asset.jsp" %>
  <style>

    .cart__list {
      border-top: solid 1.5px black;
      border-collapse: collapse;
      width: 100%;
      font-size: 14px;
    }

    thead {
      text-align: center;
      font-weight: bold;
    }

    tbody {
      font-size: 12px;
    }

    td {
      padding: 15px 0px;
      border-bottom: 1px solid #eee;
    }

    .cart__list__detail :nth-child(3) p {
      margin-top: 6px;
      font-weight: bold;
    }

    .cart__list__option {
      vertical-align: top;
      padding: 20px;
    }

    .cart__list__option p {
      margin-bottom: 25px;
      position: relative;
    }

    .cart__list__option p::after {
      content: "";
      width: 90%;
      height: 1px;

      left: 0px;
      top: 25px;
      position: absolute;
    }

    .cart__list__optionbtn {
      background-color: white;
      font-size: 10px;
      border: #eee solid 1px;
      padding: 7px;
      border-radius: 5px;
    }
    .cart__list__optionbtn:hover{
      background-color: #777;
      color: white;
    }

    .cart__list__detail :nth-child(4),
    .cart__list__detail :nth-child(5),
    .cart__list__detail :nth-child(6),
    .cart__list__detail :nth-child(7),
    .cart__list__detail :nth-child(8){
      border-left: 1px solid whitesmoke;
      padding : 0 10px 0 10px;
    }

    .cart__list__detail :nth-child(8){
      width:140px;
    }

    .cart__list__detail :nth-child(n){
      text-align: center;
    }

    .cart__list__detail :nth-child(5) button {
      background-color: #EE8035;
      color: white;
      border: none;
      border-radius: 5px;
      padding: 4px 8px;
      font-size: 12px;
      margin-top: 5px;
    }

    .price {
      font-weight: bold;
    }

    .cart__mainbtns {
      width: 450px;
      height: 200px;
      padding-top: 40px;
      display: block;
      margin: auto;
    }

    .cart__bigorderbtn {
      width: 200px;
      height: 50px;
      font-size: 16px;
      margin: auto;
      margin-right: 10px;
      border-radius: 5px;
    }

    .cart__bigorderbtn.left {
      background-color: white;
      border: 1px #eee solid;
      color:#333;
    }

    .cart__bigorderbtn.left:hover{
      background-color: #EE8035;
      border: 1px #EE8035 solid;
      color:white;
    }

    .cart__bigorderbtn.right {
      background-color: #EE8035;
      color: white;
      border: none;
    }

    .cart__information{
      background-color: #eee;
    }
    .content{
      text-decoration: none;
      font-size: 16px;
      color : #EE8035;
    }
    a.content:hover{
      color : #EE8035 !important;
    }
    
    .page-title{
    	font-family : 'Noto Sans KR', sans-serif;
		font-weight: 700;
		padding:10px;
		padding-bottom: 5px;
    }
  </style>
</head>
<body>
<!-- template.jsp -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<section class="container">
  <h4 class="page-title">

     <c:if test="${right eq 'true'}">
          바로구매
     </c:if>
    <c:if test="${right eq 'false'}">
          장바구니
    </c:if>

  </h4>
  <div class="cart__information" style="padding:10px; padding-bottom: 10px; margin: 20px 0 10px 0" >
    <ul>
      <li>바로구매 상품은 장바구니에 저장됩니다.</li>
      <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
      <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
      <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
    </ul>
  </div>
  <form id="form1" method="POST" action="/dndn/userorder/userorder.do" >
  <table class="cart__list">
      <thead>
      <tr>
        <td>
          <c:if test="${right eq 'false'}"><input id="allCheck" type="checkbox" style="margin:-2px 0 0 0; vertical-align:middle;"></c:if></td>
        <td><c:if test="${right eq 'false'}">모두 선택 </c:if></td>
        <td>도시락정보</td>
        <td>개당가격</td>
        <td>수량</td>
        <td>지점</td>
        <td>할인</td>
        <td>가격</td>
        <td>적립포인트</td>
      </tr>
      </thead>
      <tbody>

      <c:forEach items="${list}" var="cdto">
      <tr class="cart__list__detail">
        <td><!-- jquery 걸림 -->
          <c:if test="${right eq 'false'}"><input class="ckbox" type="checkbox" name="cartseq" value="${cdto.cartseq}"></c:if>
          <c:if test="${right eq 'true'}"><input class="ckbox" type="hidden" checked><input type="hidden" name="cartseq" value="${cartseq}" checked></c:if>
        </td>
        <td><img src="${cdto.pic}"  width="80"></td>
        <td>
        
       	  <c:if test="${cdto.periodshipseq != 0}">
       			<span style="font-size:14px; color: #EF6262;">[정기배송]<br></span>
       	  </c:if>
          <c:if test="${cdto.periodshipseq == 0}">
            <a href="/dndn/lunchdetail/detail.do?seq=${cdto.sellboardseq}&period=F" class="content"><span>${cdto.content}</span><br></a>
          </c:if>
          <c:if test="${cdto.periodshipseq != 0}">
            <a href="/dndn/lunchdetail/detail.do?seq=${cdto.sellboardseq}&period=T" class="content"><span>${cdto.content}</span><br></a>
            배송요일 : <span class="dayperweek">${cdto.dayperweek}</span><br>
            <c:if test="${cdto.shiptime == 0}">
            	<span>배송시간 : 아침배송</span><br>	
            </c:if>
            <c:if test="${cdto.shiptime == 1}">
            	<span>배송시간 : 점심배송</span><br>
            </c:if>
            <span>배송시작 : ${fn:substring(cdto.startship, 0 , 10)}</span><br>
            <span>배송종료 : ${fn:substring(cdto.endship,0 , 10)}</span>
          </c:if>
        </td>
        <td>
          <span class="price"><fmt:formatNumber value="${cdto.price * (1-(cdto.sale/100))}" pattern="#,###"></fmt:formatNumber>원</span><br>
        </td>
        <td>
          ${cdto.cnt}개
        </td>
        <td style="text-align: center;">
          ${cdto.storename}
        </td>
        <td>
          <span style="color:#FF6666">${cdto.sale}%</span>
        </td>
        <td>
        	
          <c:if test="${cdto.periodshipseq != 0}">
            <input type="hidden" class="shipnum" value="${cdto.dayperweek}/${fn:substring(cdto.startship, 0 , 10)}/${fn:substring(cdto.endship, 0 , 10)}">
          </c:if>
          <c:if test="${cdto.sale != 0}">
            <span class="o_price" style="text-decoration: line-through; color: lightgray; display:block;"><fmt:formatNumber value="${cdto.cnt * cdto.price}" pattern="#,###"></fmt:formatNumber>원</span>
          </c:if>
          <span class="c_price"><fmt:formatNumber value="${cdto.cnt * cdto.price * (1-(cdto.sale/100))}" pattern="#,###"></fmt:formatNumber>원</span>
        </td>
        <td>
        	<span class="point"><fmt:formatNumber value="${cdto.cnt * cdto.price * 5/100 * (1-(cdto.sale/100))}" pattern="#,###"></fmt:formatNumber></span>p
        </td>
      </tr>
      </c:forEach>

      </tbody>
      <tfoot>
      <tr>
        <td colspan="2">
          <c:if test="${right eq 'false'}">
            <button type="button" id="delbtn" class="cart__list__optionbtn" style="margin-left: 20px;">선택상품 삭제</button>
          </c:if>
        </td>
        <td></td>
        <td colspan="6" style="text-align: right;"><h6>총 주문금액 : <span id="total_price">0원</span></h6></td>
      </tr>
      </tfoot>

  </table>
  <div class="cart__mainbtns">
    <button type="button" class="cart__bigorderbtn left" onclick="location.href='/dndn/main.do';">쇼핑 계속하기</button>
    <button id="order" type="button" class="cart__bigorderbtn right">주문하기</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  </div>
  </form>

</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
<script src="https://cdn.jsdelivr.net/npm/dayjs@1.11.8/dayjs.min.js"></script>
<script>

// 숫자 -> 가격 >
function convertPriceToNum(price){
  return parseInt(String(price).replaceAll('원','').replaceAll(',',''));
}
// 가격 -> 숫자 >
function convertNumToPrice(num){
  return parseInt(String(num)).toLocaleString()+'원';
}

var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
let sum=0;
let count = $('.c_price').length;

let yoilList = ['', '월','화', '수', '목', '금'];

$('.dayperweek').each(function(index, item){
	let str=$(item).text().trim();
	$(item).text(str.split('').map(i => yoilList[i]).join().replaceAll(',',''));
});


$('.shipnum').each(function(index, item){
	
	let dayperweek = $(item).val().split('/')[0];
	let startship = $(item).val().split('/')[1];
	let endship = $(item).val().split('/')[2];
	
	let startdayjsObj = dayjs(startship);
	let enddayjsObj = dayjs(endship);
	let curr = dayjs(startship);
	let diff = enddayjsObj.diff(startdayjsObj, 'd');

	let cnt = 0;
	let dayList= [];
	let selectYoil = dayperweek.split('');
	
	for( let i=0; i<= diff ; i++){
		if( selectYoil.find( n => n == curr.get('d') ) != undefined ){
			cnt += 1;	
		} 
		curr = curr.add(1, 'day'); // 하루 증가
	}
	
	if(cnt==0)
		$(item).val(1);
	else 
		$(item).val(cnt);
	
	let result = cnt * convertPriceToNum($(item).next().text());
	$(item).next().text(convertNumToPrice(result));
	result = cnt * convertPriceToNum($(item).next().next().text());
	$(item).next().next().text(convertNumToPrice(result));
	let point = $(item).parent().next().find('.point');
	point.text(convertPriceToNum(point.text())*cnt);
	
	
});


$('#order').click(function(){
  checkBoxCnt();
});

function checkBoxCnt(){
  let cnt = 0;
  $('.ckbox').each(function(index,item){
    if($(item).prop('checked') ==true){
      cnt+=1;
    }
  });
  if(cnt==0) {
      alert('주문할 품목을 클릭하세요.');
      return false;
  } else {
    $('#form1').submit();
  }
}




function updateCheckboxAndTotalPrice(){
  let csum = 0;
  $('.ckbox').each(function(index,item){

    let price = $(item).parent().parent().children().last().prev().find('.c_price').text();

    if($(item).prop('checked') ==true) {
      csum = csum + convertPriceToNum(price);
    }
    if (index + 1 == count) {
      $('#total_price').text(convertNumToPrice(csum));
    }
  });
}

///////////////////////////////////////////////////////////////
$('.ckbox').change(function(){
  updateCheckboxAndTotalPrice();
});
//////////////////////////////////////////////////////////////

$('#delbtn').click(function(){

  let cartseqList = [];

  if( confirm("정말로 삭제하시겠습니까?") ){

  } else {
    return false;
  }

  $('.ckbox').each(function (index, item) {
      if ( $(item).prop('checked') == true) {
        cartseqList.push($(item).val());
      }
  });

  $.ajax({
    type: 'DELETE',
    url: '/dndn/cart/delCart',
    headers: {"content-type" : "application/json"}, // 보내는 데이터
    beforeSend: function(xhr) {
      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    },
    data : JSON.stringify(cartseqList),
    success : function(result) {
      new Swal('삭제', '삭제하였습니다.','success').then(function() {
        window.location.reload();
      });
    } ,
    error : function (a, b, c){
      console.log(a ,b, c)
      if(b == 'error') {
        new Swal('서비스이용 실패', '로그인 해주세요. 로그인 페이지로 이동합니다.','error').then(function() {
          location.href='/dndn/auth/login.do';
        });
      }
    }
  });

});

$('.c_price').each(function(index,item){
  sum = sum + convertPriceToNum($(this).text());
  if(index +1 == count){
      $('#total_price').text(convertNumToPrice(sum));
  }
});

// 모두 선택 체크바스 선택시 장바구니에 있는 것들 전부 선택
$('#allCheck').click(function(){

  if($(this).prop('checked') ==true) {
    $('.cart__list__detail').each(function (index, item) {
      $(item).children().children().eq(0).prop('checked', true);
    });
  } else {
    $('.cart__list__detail').each(function (index, item) {
      $(item).children().children().eq(0).prop('checked', false);
    });
  }
  updateCheckboxAndTotalPrice();
});

$('#allCheck').click();



</script>
</body>
</html>
