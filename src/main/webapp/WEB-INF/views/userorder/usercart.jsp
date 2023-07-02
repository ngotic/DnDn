<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <%@ include file="/WEB-INF/views/include/asset.jsp" %>
  <style>

    table {
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
  </style>
</head>
<body>
<!-- template.jsp -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<section class="container">
  <h4 style="padding:10px;padding-bottom: 5px; font-family: ''; font-weight: 900;">

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

  <table class="cart__list">
    <form>
      <thead>
      <tr>
        <td><input id="allCheck" type="checkbox" style="margin:-2px 0 0 0; vertical-align:middle;"></td>
        <td>모두 선택</td>
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
      <tr class="cart__list__detail">
        <td><input type="checkbox"></td>
        <td><img src="${cdto.pic}"  width="80"></td>
        <td>
          <c:if test="${cdto.periodshipseq eq null}">
            <a href="/dndn/lunchdetail/detail.do?seq=${cdto.sellboardseq}&period=F" class="content"><span>${cdto.content}</span><br></a>
          </c:if>
          <c:if test="${cdto.periodshipseq ne null}">
            <a href="#" class="content"><span>${cdto.content}</span><br></a>
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
          <span style="text-decoration: line-through; color: lightgray;"><fmt:formatNumber value="${cdto.cnt * cdto.price}" pattern="#,###"></fmt:formatNumber>원</span><br>
          <span class="price"><fmt:formatNumber value="${cdto.cnt * cdto.price * (1-(cdto.sale/100))}" pattern="#,###"></fmt:formatNumber>원</span>
        </td>
        <td><fmt:formatNumber value="${cdto.cnt * cdto.price * 5/100 * (1-(cdto.sale/100))}" pattern="#,###"></fmt:formatNumber>p</td>
      </tr>
      </tbody>
      <tfoot>
      <tr>
        <td colspan="3"><button class="cart__list__optionbtn" style="margin-left: 20px;">선택상품 삭제</button>
          <button class="cart__list__optionbtn" style="margin-left: 5px;">선택상품 찜</button>
        </td>
        <td></td>
        <td colspan="5" style="text-align: right;"><h6>총 주문금액 : 10,000원</h6></td>
      </tr>
      </tfoot>
    </form>
  </table>
  <div class="cart__mainbtns">
    <button class="cart__bigorderbtn left" onclick="location.href='/dndn/main.do';">쇼핑 계속하기</button>
    <button class="cart__bigorderbtn right" onclick="location.href='/dndn/userorder/userorder.do';">주문하기</button>
  </div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

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

});
</script>
</body>
</html>
