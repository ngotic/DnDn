<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>오늘은 든든</title>
    <%@ include file="/WEB-INF/views/include/asset.jsp" %>
    <style>

        #pdtImg{
            width:100px;
            height: 100px;
        }

        [class*="btnType1"] {
            height: 33px;
            line-height: 33px;
            padding: 0 40px;
            background: transparent;
            border: 1px solid #222;
            color: #333;
            font-size: 14px;
            border-radius: 46px;
            text-align: center;
        }
        [class*="btnType"] {
            display: inline-block;
            margin: 0 4px;
            vertical-align: middle;
            text-align: center;
            transition: all .3s;
            box-sizing: border-box;
        }
        input, select, textarea, button, pre, a {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
            letter-spacing: inherit;
            color: inherit;
            text-decoration: none;
            outline: none;
        }

        a:-webkit-any-link {
            color: -webkit-link;
            color: #222;
            cursor: pointer;
        }
        /* ↑여기까지 header */
        #container {
            position: relative;
            min-height: 500px;
            padding-bottom: 110px;
            border-top: 1px solid transparent;
        }
        .orderTitle {
            max-width: 1280px;
            min-width: 1024px;
            margin: 80px auto 22px;
            font: 36px/1 '나눔바른고딕OTF', '돋움';
            color: #222;
        }

        .orderContents .orderWrap {
            position: relative;
            min-height: 600px;
            padding-top: 18px;
            z-index: 0;
        }
        /* ↑여기까지 전체 컨테이너 */
        article, aside, canvas, details, figcaption, figure, footer, header, hgroup, nav, menu, nav, section, main {
            display: block;
        }

        [class*="subTitle"] {
            color: #222;
            font: 32px/1.2 'SDNeoM', 'notoM';
        }
        form {
            display: block;
            margin-top: 0em;
        }
        .tableTypeWrite {
            padding: 14px 0;
            border-top: 1px solid #222;
            border-bottom: 1px solid #dcdcdc;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border: 0;
            table-layout: fixed;
        }
        legend, caption, .hidden {
            position: absolute;
            z-index: -1;
            font-size: 0;
        }
        colgroup {
            background: none;
        }
        .tableTypeWrite th {
            padding: 10px 0 0 10px;
            text-align: left;
            color: #222;
            vertical-align: top;
        }
        .tableTypeWrite .required {
            margin-left: -10px;
            font-size: 0;
        }
        .tableTypeWrite .required:after {
            content: "*";
            display: inline-block;
            color: #bd1e31;
            font-size: 16px;
            vertical-align: -3px;
        }
        .tableTypeWrite td {
            height: 40px;
            padding: 4px 0;
            color: #222;
        }
        .tableTypeWrite .inputTxt, .tableTypeWrite .inputTxt + [class*="btnType"], .tableTypeWrite .radioWrap .inputTxt {
            vertical-align: middle;
        }

        .inputTxt {
            height: 40px;
            padding: 0 8px;
            border: 1px solid #dcdcdc;
            box-sizing: border-box;
            font-size: 16px;
            color: #222;
            vertical-align: middle;
        }
        .inputAlt {
            display: none;
            margin: 5px 0 0;
            font: 14px/1 '나눔바른고딕OTF', '돋움';
            color: #d72137;
        }
        .tableTypeWrite th {
            padding: 10px 0 0 10px;
            text-align: left;
            color: #222;
            vertical-align: top;
        }
        .tableTypeWrite .required {
            margin-left: -10px;
            font-size: 0;
        }
        .tableTypeWrite th {
            padding: 10px 0 0 10px;
            text-align: left;
            color: #222;
            vertical-align: top;
        }
        .tableTypeWrite td {
            height: 40px;
            padding: 4px 0;
            color: #222;
        }
        .selectArea {
            position: relative;
            display: inline-block;
            vertical-align: middle;
        }
        .selectArea .selTit {
            width: 100%;
            height: 40px;
            padding: 0 38px 0 8px;
            background: url('https://images.innisfree.co.kr/resources/web2/images/common/arw_select.png') no-repeat 100% 50%;
            border: 1px solid #a7a7a7;
            text-align: left;
            font-size: 16px;
            color: #222;
            vertical-align: top;
        }
        button {
            overflow: visible;
            cursor: pointer;
            background: none;
            border: 0;
            border-radius: 0;
            color: inherit;
            outline: none;
        }
        .selectArea .selList {
            display: none;
            position: absolute;
            left: 0;
            right: 0;
            z-index: 0;
            max-height: 170px;
            overflow: auto;
            margin: -1px 0 0;
            font-size: 16px;
            background: #fff;
            border: 1px solid #a7a7a7;
        }
        .selectArea .selList li {
            position: relative;
        }
        li {
            list-style: none;
        }
        .selectArea .selList input[type="radio"] {
            position: absolute;
            z-index: -1;
            opacity: 0;
        }
        .selectArea .selList label {
            display: block;
            padding: 5px 8px;
            cursor: pointer;
        }
        label, td img {
            vertical-align: middle;
        }
        .tableTypeWrite .hyphen {
            display: inline-block;
            width: 4%;
            text-align: center;
            vertical-align: -5px;
        }
        .tableTypeWrite .inputTxt, .tableTypeWrite .inputTxt + [class*="btnType"], .tableTypeWrite .radioWrap .inputTxt {
            vertical-align: middle;
        }
        .deliveryEmailWrap .row {
            padding: 4px 0;
        }
        .deliveryEmailWrap .inputChk {
            margin-right: 10px;
            font-size: 16px;
            color: #777;
        }
        .inputChk input, .inputRadio input {
            position: absolute;
            z-indeX: -1;
            opacity: 0;
        }
        .inputChk > span {
            color: #444;
            font-size: 16px;
            margin-left: 6px;
        }
        .deliveryEmailWrap .btnUserInfo {
            font-size: 14px;
            line-height: 16px;
            color: #222;
            text-decoration: underline;
            vertical-align: middle;
        }
        .deliveryEmailWrap .row {
            padding: 4px 0;
        }
        /* ↑여기까지 이메일 */

        .tableTypeWrite td {
            height: 40px;
            padding: 4px 0;
            color: #222;
        }
        deliverySelWrap .btn [class*="btnType"] {
            margin: 0 4px 0 0;
        }
        .btnType7s {
            height: 32px;
            line-height: 30px;
            padding: 0 16px;
        }
        [class*="btnType7"] {
            background: #f3f3f3;
            border: 1px solid #a7a7a7;
            color: #222;
            font-size: 14px;
        }
        [class*="btnType"] {
            display: inline-block;
            margin: 0 4px;
            vertical-align: middle;
            text-align: center;
            transition: all .3s;
            box-sizing: border-box;
        }
        [class*="btnType6"] {
            padding: 5px 32px;
            border: 1px solid #222;
            color: #222;
            font-size: 14px;
        }
        .deliverySelWrap .list {
            margin: 8px 0 0;
            padding: 24px;
            background: #f3f3f3;
        }
        .deliverySelWrap .list .inputRadio {
            display: block;
        }
        .tableTypeWrite .inputRadio {
            font-size: 16px;
            vertical-align: 0;
        }
        .deliverySelWrap .list .inputRadio {
            display: block;
        }
        .tableTypeWrite .inputRadio {
            font-size: 16px;
            vertical-align: 0;
        }
        .inputChk:last-child, .inputRadio:last-child {
            margin-right: 0;
        }
        .inputChk, .inputRadio {
            position: relative;
            display: inline-block;
            margin-right: 25px;
            padding-left: 23px;
            font-size: 14px;
            line-height: 1;
            cursor: pointer;
        }
        .deliverySelWrap .list .inputRadio > span {
            display: block;
            line-height: 1.5;
        }
        .deliverySelWrap .list .inputRadio .name {
            display: inline-block;
            margin-right: 6px;
        }
        .deliverySelWrap .list .inputRadio > span:after {
            top: 7px;
        }
        .inputRadio > span:after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 14px;
            height: 14px;
            background: #fff url('https://images.innisfree.co.kr/resources/web2/images/common/bg_input_radio.png') no-repeat 50% 50%;
            background-size: 0;
            border: 1px solid #a9a9a9;
            border-radius: 50%;
            transition: all .3s;
        }
        /* ↓ 새로운 배송지 추가 */
        .deliveryWriteWrap td {
            padding-top: 20px;
        }

        .deliveryWriteWrap .row:first-child {
            margin-top: -4px;
        }
        .deliveryWriteWrap .inputChk {
            font-size: 16px;
            color: #777;
            margin-right: 10px;
        }
        .inputChk {
            line-height: 22px;
        }
        .inputChk > span {
            color: #444;
            font-size: 16px;
            margin-left: 6px;
        }
        .inputChk input:checked + span:after {
            background: #fff url('https://images.innisfree.co.kr/resources/web2/images/home/bg_input_chked_v2.png') no-repeat 50% 50%;
        }
        .inputChk input:checked + span:after {
            background-color: #0f4138;
            border-color: #0f4138;
        }
        .inputChk > span:after {
            top: 0;
            left: 0;
            width: 20px;
            height: 20px;
            background: #fff url('https://images.innisfree.co.kr/resources/web2/images/home/bg_input_chk_v2.png') no-repeat 50% 50%;
            border: 0;
        }

        .inputChk > span:after, .inputRadio > span:after {
            content: "";
            position: absolute;
            z-index: 2;
            border-radius: 2px;
        }
        .deliveryWriteWrap .titLabel {
            display: inline-block;
            width: 100px;
            padding-left: 10px;
            color: #222;
            vertical-align: middle;
        }
        .deliveryWriteWrap .row {
            padding: 4px 0;
        }
        .tableTypeWrite .required {
            margin-left: -10px;
            font-size: 0;
        }
        .inputTxt.read-only {
            background: #fbfbfc;
            pointer-events: none;
        }
        .inputTxt {
            height: 40px;
            padding: 0 8px;
            border: 1px solid #dcdcdc;
            box-sizing: border-box;
            font-size: 16px;
            color: #222;
            vertical-align: middle;
        }
        .inputTxt {
            height: 40px;
            padding: 0 8px;
            border: 1px solid #dcdcdc;
            box-sizing: border-box;
            font-size: 16px;
            color: #222;
            vertical-align: middle;
        }
        .deliveryWriteWrap .deliveryInput [class*="btnType"] {
            margin: 0 0 0 4px;
        }
        .tableTypeWrite .inputTxt, .tableTypeWrite .inputTxt + [class*="btnType"], .tableTypeWrite .radioWrap .inputTxt {
            vertical-align: middle;
        }
        .btnType7m {
            height: 40px;
            line-height: 38px;
            padding: 0 16px;
        }
        [class*="btnType7"] {
            background: #f3f3f3;
            border: 1px solid #a7a7a7;
            color: #222;
            font-size: 14px;
        }
        [class*="btnType6"] {
            padding: 5px 32px;
            border: 1px solid #222;
            color: #222;
            font-size: 14px;
        }
        .deliveryWriteWrap .mobileInput {
            padding: 14px 0 0;
        }
        .shippingMsg .writeMsg {
            margin: 8px 0 0;
            display: none;
        }
        /* 여기까지 주문/배송정보 */



        [class*="subTitle"] {
            color: #222;
            font: 32px/1.2 'SDNeoM', 'notoM';
        }
        .orderWrap .cartList {
            border-top: 1px solid #222;
            border-bottom: 1px solid #222;
        }
        .orderWrap .cartList {
            border-top: 1px solid #222;
        }

        .orderWrap .cartList > ul > li {
            border-bottom: 1px solid #dcdcdc;
        }

        .orderWrap #orderChk .cartList .pdtRow {
            border-bottom: 0;
            margin-bottom: -1px;
        }
        .orderWrap .cartList .pdtRow {
            border-bottom: 1px solid #dcdcdc;
            margin-bottom: -1px;
        }
        .orderWrap .cartList .pdtRow {
            display: table;
            width: 100%;
            box-sizing: border-box;
        }
        .orderWrap .cartList .pdtRow .pdtImg {
            width: 120px;
            text-align: center;
        }
        .orderWrap .cartList .pdtRow .cell {
            display: table-cell;
            vertical-align: middle;
            padding: 16px 0;
        }
        .orderWrap .cartList .pdtRow .pdtInfo {
            padding-left: 9px;
            vertical-align: top;
        }
        .orderWrap .cartList .pdtRow .cell {
            display: table-cell;
            vertical-align: middle;
            padding: 16px 0;
        }
        .orderWrap .cartList .pdtRow .pdtCount {
            width: 15%;
            text-align: center;
            color: #222;
        }
        .orderWrap .cartList .pdtRow .cell {
            display: table-cell;
            vertical-align: middle;
            padding: 16px 0;
        }
        .orderWrap .cartList .pdtRow .pdtPrice {
            width: 160px;
            text-align: center;
        }
        .orderWrap .cartList .pdtRow .cell {
            display: table-cell;
            vertical-align: middle;
            padding: 16px 0;
        }
        .orderWrap .cartList .pdtRow .cell {
            display: table-cell;
            vertical-align: middle;
            padding: 16px 0;
        }
        .orderWrap .cartList .usePoint {
            position: relative;
            padding: 0 0 25px 130px;
            font: 14px/1 '나눔바른고딕OTF', '돋움';

        }
        .orderWrap .cartList .point {
            display: block;
            margin-right: 48px;
            text-align: right;
            color: #999;
            font-family: "나눔바른고딕OTF", "돋움";
            font-size: 14px;
        }

        .orderWrap .cartList .pdtPrice .price .num {
            font: 17px/1.2 '나눔바른고딕OTF','돋움';
            vertical-align: -2px;
            font-weight: 600;
        }
        /* 아래부터 결제박스  */
        .orderContents .totalPayment {
            position: absolute;
            top: 0;
            right: 0;
            width: 320px;
            height: 100%;
            z-index: 0;
        }

        .orderContents .totalPayment .inner {
            width: 320px;
            padding-top: 18px;
            background: #fff;
        }

        .orderContents .totalPayment .subTitle2 {
            margin: 0 0 15px;
        }
        [class*="subTitle"] {
            color: #222;
            font: 32px/1.2 '나눔바른고딕OTF', '돋움';

        }
        .totalPayment .box {
            padding: 0 18px;
            border: 2px solid #666;
            border-radius: 5px;
        }
        .totalPayment .orderPrice {
            padding: 8px 0 0;
        }
        article, aside, canvas, details, figcaption, figure, footer, header, hgroup, nav, menu, nav, section, main {
            display: block;
        }
        .totalPayment .orderPrice dl {
            position: relative;
            padding: 8px 0;
            color: #222;
            text-align: right;
        }

        .totalPayment .orderPrice dt {
            float: left;
        }
        .totalPayment .orderPrice dd {
            display: inline-block;
        }
        .totalPayment .orderPrice .num {
            font-family: "나눔바른고딕OTF", "돋움";
            letter-spacing: -.04em;
            font-weight: bold;
        }

        .totalPayment .orderPrice .totalSale .num {
            color: #d72137;
        }
        .btnTooltip {
            display: inline-block;
            width: 17px;
            height: 17px;
            margin-left: 4px;
            background: url('https://images.innisfree.co.kr/resources/web2/images/common/btn_tooltip.png') no-repeat 50% 50%;
            vertical-align: 6px;
            font-size: 0;
        }
        totalPayment .orderPrice .totalPrice {
            margin: 5px 0 0;
            padding: 10px 0 15px;
            border-top: 1px solid #dcdcdc;
        }
        .totalPayment .orderPrice dl {
            position: relative;
            padding: 8px 0;
            color: #222;
            text-align: right;
        }
        .totalPayment .orderPrice .totalPrice dt {
            line-height: 30px;
        }
        .totalPayment .orderPrice .totalPrice dd {
            font-size: 22px;
            color: #d72137;
        }
        .totalPayment .orderPrice dd {
            display: inline-block;
        }
        .totalPayment .orderPrice .totalPrice dd .num {
            font: 26px/1.2 '나눔바른고딕OTF','돋움';
            vertical-align: middle;
        }
        .totalPayment .orderPrice .num {
            font-family: "나눔바른고딕OTF", "돋움";
            letter-spacing: -.04em;
        }
        .paymentAgreeWrap {
            margin: 10px 0 0 24px;
            font-size: 14px;
        }
        .paymentAgreeWrap .agree {
            margin: 0 0 15px;
        }
        .paymentAgreeWrap .inputChk {
            margin: 0 0 5px -24px;
        }
        .inputChk {
            line-height: 22px;
        }
        .inputChk, .inputRadio {
            position: relative;
            display: inline-block;
            margin-right: 25px;
            padding-left: 23px;
            font-size: 14px;
            line-height: 1;
            cursor: pointer;
        }
        .inputChk input, .inputRadio input {
            position: absolute;
            z-indeX: -1;
            opacity: 0;
        }
        .inputChk > span {
            color: #444;
            font-size: 16px;
            margin-left: 6px;
        }
        .inputChk > span:after {
            top: 0;
            left: 0;
            width: 20px;
            height: 20px;
            background: #fff url('https://images.innisfree.co.kr/resources/web2/images/home/bg_input_chk_v2.png') no-repeat 50% 50%;
            border: 0;
        }
        .inputChk > span:after {
            top: 0;
            left: 0;
            width: 14px;
            height: 14px;
            background: #fff url('https://images.innisfree.co.kr/resources/web2/images/home/bg_input_chk_v2.png') no-repeat 50% 50%;
            border: 1px solid #a9a9a9;
            transition: all .2s;
        }
        .inputChk > span:after, .inputRadio > span:after {
            content: "";
            position: absolute;
            z-index: 2;
        }
        .inputChk > span {
            color: #444;
            font-size: 16px;
            margin-left: 6px;
        }
        .paymentAgreeWrap .agree .txt {
            color: #999;
            line-height: 1.4;
        }
        .paymentAgreeWrap .agree .btn {
            text-decoration: underline;
            color: #222;
        }
        .paymentAgreeWrap .agree {
            margin: 0 0 15px;
        }
        .paymentAgreeWrap .inputChk {
            margin: 0 0 5px -24px;
        }
        .inputChk input, .inputRadio input {
            position: absolute;
            z-indeX: -1;
            opacity: 0;
        }
        .paymentAgreeWrap .inputChk {
            margin: 0 0 5px -24px;
        }
        .paymentAgreeWrap .agree .btn {
            text-decoration: underline;
            color: #222;
        }
        .totalPayment .btnType4xl {
            width: 100%;
            margin: 16px 0 0;
        }
        .btnType4xl {
            height: 65px;
            line-height: 65px;
            font-size: 22px;
        }
        .btnType4xl:hover{
            color: #EE8035;
            background-color: #fff;
            border: 2px solid #EE8035;
        }

        #totPurPrcBtnTxt{
            color:white;
        }

        .btnType4xl:hover #totPurPrcBtnTxt{
            color: #EE8035;
        }

        [class*="btnType4"] {
            height: 65px;
            line-height: 40px;
            padding: 0 30px;
            background: #EE8035;
            color: #fff;
            font-size: 22px;
            text-align: center;
            border-radius: 5px;
        }


        .orderContents .totalPayment .fixed {
            position: fixed;
            top: 0;
            right: auto;
        }
        .orderContents .totalPayment .inner {
            width: 320px;
            padding-top: 18px;
            background: #fff;
            position: sticky;
            top: 100px;
        }
        .orderContents .totalPayment {
            position: absolute;
            top: 0;
            right: 0;
            width: 320px;
            height: 100%;
            z-index: 0;
        }
        .orderContents {
            position: relative;
            max-width: 950px;
            min-width: 664px;
            margin: 0 auto;
            padding-right: 360px;
        }
        bulListType > li {
            position: relative;
            padding-left: 16px;
            font: 14px/1.4 '나눔바른고딕OTF', '돋움';
            color: #999;
        }
        /* 여기까지 상품정보 */


        .tableTypeWrite.typeline {
            padding: 0;
        }
        .tableTypeWrite {
            padding: 14px 0;
            border-top: 1px solid #222;
            border-bottom: 1px solid #dcdcdc;
        }
        .ftColor3 {
            color: #999 !important;
        }
        .ftColor7 {
            color: #d72137 !important;
        }
        .bulListType2 > li {
            position: relative;
            margin: 0 0 5px;
            padding-left: 10px;
            font: 12px/1.4 '나눔바른고딕OTF', '돋움';
            color: #999;
        }
        /* 아래부터 환불방법 */
        .orderContents .subTitle2 {
            margin-bottom: 15px;
        }

        .inputChk, .inputRadio {
            position: relative;
            display: inline-block;
            margin-right: 25px;
            padding-left: 23px;
            font-size: 14px;
            line-height: 1;
            cursor: pointer;
        }

        .tableTypeWrite {
            padding-right:15px;
            border-top: 2px solid #222;
            border-bottom: 1px solid #dcdcdc;
        }
        .helpWrap {
            position: relative;
            margin: 15px 0 0;
            font: 14px/1.5 '나눔바른고딕OTF', '돋움';
        }
        .bulListType > li {
            position: relative;
            padding-left: 16px;
            font: 12px/1.4 '나눔바른고딕OTF', '돋움';
            color: #999;
        }

        .toptitle {
            padding:10px;
            padding-bottom: 10px;
            font-family : 'Noto Sans KR', sans-serif;
			font-weight: 700;
        }
        .subtitle{

            padding:10px;
            padding-bottom: 40px;
            font-family : 'Noto Sans KR', sans-serif;
			font-weight: 700;
            color:black;
        }

        section {
            padding-bottom: 40px;
        }

        #findaddressnumber:hover{
            color:white;
            background-color: #777777;
            border: 1px solid #777777;
        }

        #useAllBtPt:hover{
            color:white;
            background-color: #777777;
            border: 1px solid #777777;
        }
        .cartList ul {
            padding-left:0px;
        }



    </style>
</head>
<body>
<!-- template.jsp -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<section class="container">
    <h4 class="toptitle">
        결제하기
    </h4>
    <div class="orderContents">
        <div class="orderWrap">
            <input type="hidden" id="pageFl" value="orderRenewal">

            <form id="ordForm" onsubmit="return false;">
                <section>
                    <h4 class="subtitle" >주문/배송정보</h4>
                    <input type="hidden" id="recentlyAddrNoDefaultListCnt" value="1">
                    <div class="tableTypeWrite">
                        <div id="ordererForm">
                        </div>
                        <table>
                            <caption>주문/배송정보 입력</caption>
                            <colgroup>
                                <col style="width:214px;">
                                <col>
                            </colgroup>
                            <tbody>

                            <!-- 주문자 -->
                            <tr>
                                <th scope="row"><span class="required" aria-required="true">필수입력</span> 주문자</th>
                                <td>
                                    <div class="row">
                                        <input type="text" id="name" required name="name" maxlength="10" class="form-control mb-2" title="이름입력" style=" text-align: center;" value="<sec:authentication property="principal.member.name"/>" readonly>
                                    </div>
                                </td>
                            </tr>
                            <!-- 연락처 -->
                            <tr>
                                <th scope="row"><span  class="required" aria-required="true">필수입력</span> 연락처</th>
                                <td>
                                    <div class="row" style="text-align: center; display: flex; flex-direction: row; justify-content:space-between;">
                                        <input type="text" name="tel"  id="tel" class="form-control " style="text-align:center;" value="<sec:authentication property="principal.member.tel"/>" readonly>
                                    </div>
                                </td>
                            </tr>

                            <!-- 이메일 -->
                            <tr class="deliveryEmailWrap">
                                <th scope="row">
                                    <span class="required" aria-required="true">필수입력</span> 이메일
                                </th>
                                <td>
                                    <div class="row">
                                        <input type="text" name="emailTxt" id="email" class="form-control"  style="text-align:center;" value="<sec:authentication property="principal.member.email"/>" readonly>
                                    </div>
                                </td>
                            </tr>


                            <!-- 배송지 작성 -->
                            <tr class="deliveryWriteWrap addWrite" style="display: table-row;">
                                <th scope="row"><span class="required" aria-required="true">필수입력</span> 배송지 작성</th>
                                <td>

                                    <!-- 배송지목록에 추가, 기본배송지로 등록 -->
                                    <div class="row deliverySel"  id="chkWrapper" style="display: none">
                                        <label class="inputChk addNewDiv" for="isAddNewChk"> <input type="checkbox"   name="isAddNewChk" id="isAddNewChk"  readonly=""  checked="checked"> <span>배송지 목록에 추가</span></label>
                                        <label class="inputChk" for="isAddDefaultChk"> <input type="checkbox" name="isAddDefaultChk" id="isAddDefaultChk"  > <span>기본 배송지로 등록</span></label>
                                    </div>

                                    <!-- 배송지명 -->
                                    <div class="row">
                                        <label for="addressname" class="titLabel"  style="display: block"><span class="required" aria-required="true">필수입력</span> 배송지명</label>
                                        <input type="text" id="addressname" name="dlvNmTxt" maxlength="10" class="inputTxt form-control" style="margin-top:4px; text-align: center;" placeholder="최대 10자 까지 입력 가능" >
                                        <p class="inputAlt"></p>
                                    </div>

                                    <!-- 받으실 분 -->
                                    <div class="row" >
                                        <label class="titLabel mb-1"><span class="required" aria-required="true" required>필수입력</span> 받으실 분</label>
                                        <label class="mb-1" for="sameaddress" style="padding-right: 5px;"><input id="sameaddress" type="checkbox" style="border-radius: 5px; margin:-5px 0 0 0; vertical-align:middle;" ><span style="margin-left: 0px;">&nbsp;&nbsp;주문자 배송정보와 동일</span></label>
                                        <p class="inputAlt"></p>
                                    </div>
                                    <div class="row">
                                        <!-- 우편 번호 -->
                                        <label class="control-label" >우편번호</label>
                                        <input id = "zipcode" class="form-control mb-2" type="hidden" id="sample4_postcode" placeholder="우편번호" value="12345" required>
                                        <input class="form-control mb-2" id="findaddressnumber" type="button" onclick="sample4_execDaumPostcode();" value="우편번호 찾기" required><br>

                                        <label class="control-label" >주소</label>
                                        <input class="form-control mb-2 address" type="text" id="sample4_roadAddress" name="address" placeholder="도로명주소" value="" readonly required style="text-align: center;">
                                        <span id="guide" style="color:#999;display:none"></span>

                                        <label class="control-label" >상세주소</label>
                                        <input class="form-control mb-2 addressdetail" type="text" id="sample4_detailAddress" name="addressdetail" value="" placeholder="상세주소" required style="text-align: center;">

                                        <input id="myaddress" type="hidden" value="<sec:authentication property='principal.member.address'/>">
                                        <input id="myaddressdetail" type="hidden" value="<sec:authentication property='principal.member.addressdetail'/>">

                                    </div>
                                </td>
                            </tr>
                            <tr class="addrMasg">
                                <th scope="row"><span class="required" aria-required="true">필수입력</span> 배송 요청사항</th>
                                <td class="shippingMsg">
                                    <div class="row">

                                        <select id="sellrequest" class="form-control" style="text-align: center;">
                                            <option value="0" selected>배송 요청사항을 선택해 주세요.</option>
                                            <option value="1">부재시 경비(관리)실에 맡겨주세요.</option>
                                            <option value="2">부재시 문앞에 놓아주세요.</option>
                                            <option value="3">파손의 위험이 있는 상품이 있으니, 배송에 주의해주세요.</option>
                                            <option value="4">배송전에 연락주세요.</option>
                                            <option value="5">메시지 직접 입력</option>
                                        </select>
                                        <input class="form-control mt-2" type="hidden" id="requestmessage" value="없음" style="text-align: center;">

                                    </div>
                                    <div class="writeMsg request">
                                        <input  type="text" id="dlvReqCntTxt" class="inputTxt" maxlength="45" style="width: 100%;" placeholder="배송 요청사항을 입력해주세요. (최대 45자까지 입력 가능)">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </section>

                <!-- 주문 상품 정보 -->
                
                    <section id="orderChk" style="display: block;">
                        <h4 class="subtitle">주문 상품 정보</h4>
                        <div class="cartList">
                            <c:forEach items="${clist}" var="cdto">
                            <ul>
                                <li>
                                    <div class="pdtRow">
                                        <div class="cell pdtImg">
                                            <input type="hidden" class="cartseq" value="${cdto.cartseq}">
                                            <a href="javascript:void(0);" >
                                                <img  id ="pdtImg" src="${cdto.pic}" alt="상품이미지">
                                            </a>
                                        </div>
                                        <div class="cell pdtInfo">
                                            <div class="pdtName" style="text-align: center;">
                                              <c:if test="${cdto.periodshipseq != 0}">
									       			<span style="font-size:14px; color: #EF6262;">[정기배송] <br> </span>
									       	  </c:if>
									       	  
                                                ${cdto.content}<br>
                                                
                                                  <c:if test="${cdto.periodshipseq != 0}">
										            배송요일 : <span class="dayperweek">${cdto.dayperweek}</span><br>
										            <c:if test="${cdto.shiptime == 0}">
										            	<span>배송시간 : 아침배송</span><br>	
										            </c:if>
										            <c:if test="${cdto.shiptime == 1}">
										            	<span>배송시간 : 점심배송</span><br>
										            </c:if>
										            <span>배송시작 : ${fn:substring(cdto.startship, 0 , 10)}</span><br>
										            <span>배송종료 : ${fn:substring(cdto.endship,0 , 10)}</span><br>
										          </c:if> 
										      	  <span class="storekind" style="color:#888;">지점 : ${cdto.storename}</span><br>    
                                            </div>
                                        </div>
                                        <div class="cell pdtCount">${cdto.cnt} 개</div>
                                        <div class="cell pdtPrice">
                                        
                                          <c:if test="${cdto.periodshipseq != 0}">
								            <input type="hidden" class="shipnum" value="${cdto.dayperweek}/${fn:substring(cdto.startship, 0 , 10)}/${fn:substring(cdto.endship, 0 , 10)}">
								          </c:if>
                                            <span class="price">
                                                <fmt:formatNumber value="${cdto.price * cdto.cnt * (1-(cdto.sale/100))}" pattern="#,###"></fmt:formatNumber>원
                                            </span>
                                            <span class="point"><fmt:formatNumber value="${cdto.cnt * cdto.price * 5/100 * (1-(cdto.sale/100))}"></fmt:formatNumber>P</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </section>
                


                <!-- 쿠폰확인 & 포인트적립 -->
                <section id="cpnPt">

                    <h4 class="subtitle">쿠폰/포인트 적용</h4>
                    <div class="tableTypeWrite typeline basicOrderCoupon">
                        <table style="padding-top:10px;">
                            <caption>쿠폰/포인트 적용</caption>
                            <colgroup>
                                <col style="width:214px;">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr id="userCouponList">
                                <th scope="row">쿠폰 <span class="ftColor3">(사용 가능한 쿠폰
                                    <span class="ftColor7" id="couponAllCnt">
                                        <fmt:formatNumber value="${fn:length(coulist)}"  />장</span>)
                                    </span>
                                </th>
                                <td>

                                    <select class="form-control" style="width:100%;" id="sellcoupon">
                                        <option value="0" selected style="text-align: center;">쿠폰을 선택하세요.</option>
                                        <c:forEach items="${coulist}" var="coudto">
                                            <option value="${coudto.couponmemberseq},${coudto.couponseq}/${coudto.sale}">${coudto.name}</option>
                                        </c:forEach>
                                    </select>
                                    <!-- 쿠폰 셋팅 -->


                                    <ul class="selCouponList" id="selUserCouponList">
                                        <li style="display:none;">
                                            <span></span>
                                            <button type="button" class="btnDel" $cpnno="" $cpnclcd="">삭제</button>
                                        </li>
                                    </ul>
                                    <ul class="selCouponList" id="dlvCouponList">
                                        <li style="display:none;">
                                            <span></span>
                                            <button type="button" class="btnDel" $cpnno="" $cpnclcd="">삭제</button>
                                        </li>
                                    </ul>
                                    <ul class="selCouponList" id="prdCouponList" style="display: none;">
                                        <li style="display:none;">
                                            <span></span>
                                        </li>
                                    </ul>
                                    <ul class="bulListType2" >
                                        <li>쿠폰은 주문하나당 1개의 쿠폰만 사용가능합니다.</li>
                                        <li>쿠폰은 조건에 따라 적용이 되지 않을 수 있습니다.</li>
                                        <li>쿠폰 사용 후, 최종 결제 금액에 대하여 적립금이 산정/적립 됩니다. (적립금 사용분 및 배송비제외) </li>
                                        <li>쿠폰 사용 요건에 따라 사은품이 지급되지 않을 수 있습니다. 최종 주문 완료 후, &lt;마이페이지-주문내역-사은품 목록&gt;에서사은품 내역을 반드시 확인해주세요. </li>
                                    </ul>
                                </td>
                            </tr>

                                <tr class="btPtUseTr" id="btPtUseTr">
                                    <th scope="row"><span class="required" aria-required="true">필수입력</span> 포인트</th>
                                    <td>
                                        <div class="beautyPoint">
                                            <div class="mb-1">
                                                사용가능 <strong><span id="canUseBtPt">${point}</span></strong> P &nbsp;/&nbsp; 보유 <strong><span id="myBtPtTxt">${point}</span></strong> P
                                            </div>
                                            <div class="display:margin:auto;">
                                            <input id="pointInput" type="text" class="form-control" name="totalUseBtPt" value="0" style="width:190px;margin-right: 10px; display: inline-block; text-align: center;">
                                            <button id="allUsePoint" type="button" class="form-control" name="useAllBtPt" id="useAllBtPt" style="display: inline-block; width:170px;">모두사용</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

<%--                                <tr class="btPtUseTr" >--%>
<%--                                    <th scope="row" ><span class="required" aria-required="true">필수입력</span> 이벤트</th>--%>
<%--                                    <td>--%>
<%--                                        <div class="beautyPoint">--%>
<%--                                            <div class="display:margin:auto;">--%>
<%--                                                <input type="text" class="form-control" name="totalUseBtPt" value="머머머이벤트" style="width:190px;margin-right: 10px; display: inline-block; text-align: center;" readonly>--%>
<%--                                                <button type="button" class="form-control" name="useAllBtPt" style="display: inline-block; width:170px;"> 10%할인 </button>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableTypeWrite typeline abcCampaignChk" style="display:none;">
                        <table>
                            <tbody>
                            <tr>
                                <th scope="row">연계 구매 프로모션</th>
                                <td>
                                    <ul class="selCouponList">
                                        <li id="abcBnfTxt"></li>
                                    </ul>
                                    <ul class="couponDetail">
                                        <li>쿠폰은 주문하나당 1개의 쿠폰만 사용가능합니다.</li>
                                        <li>연계 구매 프로모션 적용 시 장바구니에서 쿠폰적용이 불가합니다.</li>
                                        <li>할인 쿠폰 사용을 원할 경우 연계 구매 프로모션 상품을 제외하고 분할 주문을 해주세요.</li>
                                        <li>프로모션 제품에 뷰티포인트 사용 시 연계구매 프로모션이 적용되지 않습니다.</li>
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </section>


                <div id="odGift">

                    <!-- 결제 수단 선택 -->
                    <section id="refundMethodArea" style="display: block;">
                        <h4 class="subtitle">결제수단</h4>
                        <div class="refundPayMethod radioTabContents">
                            <div id="ACCOUNT" class="radioTabCont">
                                <div class="tableTypeWrite">
                                    <table>
                                        <tbody>
                                        <tr>
                                            <th scope="row">방법</th>
                                            <td>
                                                <select class="form-control" id="sellpaymethod">
                                                    <option value="1">카카오페이</option>
                                                    <option value="2">카드</option>
                                                    <option value="3">계좌이체</option>
                                                </select>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                                <div class="helpWrap">
                                    <ul class="bulListType">
                                        <li> 저희 쇼핑몰은 고객님의 안전한 거래를 위해 카카오페이/카드결제/계좌이체 거래에 대해 구매안전서비스를 적용하고 있습니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- //품절 시 환불 방법 -->
                </div>
                <!-- //상품 정보 -->
            </form><!--ordForm -->
        </div>

        <!-- 결제 금액 정보 -->
        <div class="totalPayment">
            <div class="inner">
                <h4 class="subtitle">결제 예정 금액</h4>
                <div class="box">

                    <section class="orderPrice">
                        <dl>
                            <dt>주문금액</dt>
                            <dd><span class="num" id="totPrdPrcTxt"></span></dd>
                        </dl>
                        <dl>
                            <dt>할인/차감 금액</dt>
                            <dd class="totalSale"><span class="num" id="totDcCpnPrcTxt">0원</span></dd>
                        </dl>
                        <dl>
                            <dt>배송비</dt>
                            <%--                                <dd id="totPurDlvPrcTxt" $dlvcost="2500"></dd>--%>
                            <dd id="totalDlvTxt" ><span class="num" id="delveryCost"> 0</span></dd>
                        </dl>
                        <div class="saleBox" id="dlvUseBtPtDiv" style="display: none;">
                            <dl id="dlvUseBtPtDl">
                                <dt>적립금 사용</dt>
                                <dd><span class="num" id="dlvPurPtTxt">-0</span>P</dd>
                            </dl>
                        </div>

                        <dl>
                            <dt>예정 적립 포인트 <button type="button" class="btnTooltip" onclick="tooltip('btPointInfo3','fixed');">툴팁</button></dt>
                            <dd><span class="num" id="totReservePtTxt"></span>P</dd>
                        </dl>

                        <dl class="totalPrice">
                            <dt>최종 결제 금액</dt>
                            <dd><span class="num" id="totPurPrcTxt"></span></dd>
                        </dl>
                        <div class="paymentAgreeWrap">
                            <div class="agree">
                                <label class="inputChk" for="payWayProvision"><input type="checkbox" id="payWayProvision"><span>[필수] 구매 조건 및 결제 진행 동의</span></label>
                                <p class="txt">주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 구매 진행에 동의 하시겠습니까? (전자상거래법 제8조 제2항)</p>
                            </div>
                            <div class="agree">
                                <label class="inputChk VbankWayProvision" for="VbankWayProvision" style="display: none;"><input type="checkbox" id="VbankWayProvision"><span>[필수] 개인정보 수집/이용동의</span></label>
                                <button type="button" class="btn VbankWayProvision" onclick="layerOpen('privacyTerms');" style="display: none;">개인정보 수집 자세히 보기</button>
                            </div>
                        </div>
                    </section>
                </div>
                <button type="button" class="btnType4xl" id="payBtn" onclick="payrequest();">
                    <span class="num" id="totPurPrcBtnTxt">10,000원</span> 결제하기
                </button>
            </div>
        </div>
        <!-- //결제 금액 정보 -->
    </div>

</section>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
<script src="https://cdn.jsdelivr.net/npm/dayjs@1.11.8/dayjs.min.js"></script>
<script>

    let sel_pg = 'kakaopay.TC0ONETIME';
    let sel_pg_method ='kakaopay';
    let ordercnt = 0;
    let delvery_price = 3000;
    let discountDelivery=0;
    let pointSum =0;

    let count = $('.price').length;
    let sum=0;

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
    	let point = $(item).parent().find('.point');
    	point.text(convertPriceToNum(point.text().replace('P',''))*cnt+'P');
    	
    });
    
    
    
    // 주문금액 구하기
    $('.price').each(function(index,item){
        sum = sum + convertPriceToNum($(this).text());
        if(index +1 == count){
            $('#totPrdPrcTxt').text(convertNumToPrice(sum));
        }
    });

    // > 배송비 구하기, 배송비는 주문당 하나로 측정된다. 5만원이상 배송비 무료
    $('.storekind').each(function (index, item) {
        let price = $(item).parent().parent().next().next().find('.price').text().trim();
        if( convertPriceToNum(price) > 50000 )
            discountDelivery+=1;
        ordercnt+=1;
    });
    $('.storekind').promise().done(function(){
        ordercnt = ordercnt - discountDelivery;
        $('#delveryCost').text((ordercnt*delvery_price).toLocaleString()+'원');
    });

    updateTotalDiscountPrice(); // 가격 셋팅

    function updateTotalDiscountPrice(){
        //totPrdPrcTxt   >
        //totDcCpnPrcTxt > - 할인/차감 결과
        // delveryCost > + 배달비
        // totPurPrcBtnTxt > 마지막 합산
        // totPurPrcTxt
        let discountprice = 0;
        if($('#sellcoupon').val()!='0')
            discountprice = parseInt($('#sellcoupon').val().split('/')[1]) /100 * convertPriceToNum($('#totPrdPrcTxt').text());
        let point = parseInt($('#pointInput').val());
        $('#totDcCpnPrcTxt').text( convertNumToPrice (discountprice+point));
        let totPrdPrcTxt= convertPriceToNum($('#totPrdPrcTxt').text());
        let totDcCpnPrcTxt = discountprice+point;
        let delveryCost = convertPriceToNum($('#delveryCost').text());
        // alert(totPrdPrcTxt+'/'+totDcCpnPrcTxt+"/"+delveryCost);
        $('#totPurPrcTxt').text(convertNumToPrice(totPrdPrcTxt-totDcCpnPrcTxt+delveryCost));
        $('#totPurPrcBtnTxt').text(convertNumToPrice(totPrdPrcTxt-totDcCpnPrcTxt+delveryCost));
    }

    $('#pointInput').on('change keyup', function(){
       if( $(this).val()=='' || parseInt($(this).val())< 0 || parseInt($(this).val()) > parseInt($('#canUseBtPt').text())  )
         $(this).val(0);
       updateTotalDiscountPrice();
    });

    $('#allUsePoint').click(function(){
        let point = '${point}'
        $('#pointInput').val(point);
        updateTotalDiscountPrice();
    });

    $('#sellcoupon').change(function(){
       //alert($('#sellcoupon').val().split('/')[0]);
        updateTotalDiscountPrice();
    });

    $('.point').each(function (index, item) {
        pointSum += parseFloat($(item).text().trim().replaceAll('+','').replaceAll('P','').replaceAll(',',''));
    });

    $('.point').promise().done(function(){
        $('#totReservePtTxt').text(Math.floor(pointSum));
    });

    $('#sellpaymethod').change(function(){
        // 카카오페이
        if($("#sellpaymethod option:checked").val()=='1'){
            sel_pg = 'kakaopay.TC0ONETIME';
            sel_pg_method ='kakaopay';
        // 카드결제
        } else if($("#sellpaymethod option:checked").val()=='2'){
            sel_pg = 'html5_inicis.INIBillTst';
            sel_pg_method ='card';
        // 계좌이체
        } else if($("#sellpaymethod option:checked").val()=='3'){
            sel_pg = 'html5_inicis.INIBillTst';
            sel_pg_method ='trans';
        }
    });

    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";


    function payrequest(){
        // 예외처리하기
        if( $('#payWayProvision').prop('checked')==false){
            alert('약관에 동의하세요.');
            return;
        }

        if( $('.address').val()=='' || $('.addressdetail')=='' ) {
            alert('주소를 입력해주세요.');
            return;
        }

        // 주문금액
        // 아이디
        // 전화번호
        // 우편번호
        // 배송주소
        // 배송상세주소
        // 주문날짜 > sysdate
        // 결제방식
        // 적립포인트
        let cartseqList = [];
        $('.cartseq').each(function (index, item) {
            cartseqList.push($(item).val());
        })

        let price = convertPriceToNum($('#totPurPrcBtnTxt').text());
        let id = '<sec:authentication property="principal.member.id"/>';
        let tel = $('#tel').val();
        let email = $('#email').val(); // x
        let zipcode = $('#zipcode').val();
        let address = $('.address').val();
        let addressdetail = $('.addressdetail').val();
        let addpoint = $('#totReservePtTxt').text();
        let usepoint = $('#pointInput').val();
        let request = $("#requestmessage").val();
        let payment = sel_pg_method;
        let couponmemberseq = $('#sellcoupon').val().split('/')[0];// 0번이면 null이 들어간다.



        let addressname = $('#addressname').val();

        var IMP = window.IMP;
        IMP.init('imp86112373');
        IMP.request_pay({
            pg : sel_pg,
            pay_method : sel_pg_method,
            merchant_uid : 'merchant_' + new Date().getTime(),   //주문번호
            name : id,                                  //상품명
            amount : price,                                    //가격
            //customer_uid : buyer_name + new Date().getTime(),  //해당 파라미터값이 있어야 빌링 키 발급 시도
            buyer_email : email,             //구매자 이메일
            buyer_name : id,                           //구매자 이름
            buyer_tel : tel,                                    //전화번호
            buyer_addr : address,	                             //주소
            buyer_postcode : zipcode                           //우편번호
        },function(rsp){
            if(rsp.success){
                var msg = "결제 완료";
                msg += '고유ID : ' + rsp.imp_uid;                //아임포트 uid는 실제 결제 시 결제 고유번호를 서버와 비교해서 결제처리하는데 필요없긴함.
                msg += '// 상점 거래ID : ' + rsp.merchant_uid;
                msg += '// 결제 금액 : ' + rsp.paid_amount;
                msg += '// 카드 승인번호 : ' + rsp.apply_num;
                $.ajax({
                    type : 'POST',
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                    },
                    url : '/dndn/verifyIamport/'+ rsp.imp_uid // 결제금액, 상태에 대한 위변조 때문에 넣는 검증로직
                }).done(function(data) {
                    // return값은 xml로 받는다. 그래서 jquery로 xml 파싱
                    if(rsp.paid_amount == $(data).find('amount').text()){
                        // alert("결제 및 결제검증완료");
                        // 비즈니스 로직 추가
                        // ~> 기록에 쓴다., 포인트 차감시 포인트 감소
                        // ajax 처리 > 해당 사용자
                        // 트랜잭션 처리,
                        $.ajax({
                            type: 'POST',
                            url: '/dndn/order/addOrder',
                            headers: {"content-type" : "application/json"}, // 보내는 데이터
                            beforeSend: function(xhr) {
                                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                            },
                            data : JSON.stringify({
                                id : id,
                                price: price,
                                request : request,
                                couponmemberseq : couponmemberseq,
                                payment: payment,
                                addressname: addressname,
                                tel : tel,
                                zipcode: zipcode,
                                address: address,
                                addressdetail: addressdetail,
                                addpoint :addpoint,
                                usepoint : usepoint,
                                cartseqList : cartseqList
                            }),
                            success : function(result) {
                                if(result=='OK') {
                                    new Swal('주문', '주문이 완료되었습니다.', 'success').then(function () {
                                        location.href = '/dndn/main.do';
                                    });
                                }
                            },
                            error : function (a, b, c){
                                console.log(a ,b, c)
                                if(b == 'error') {
                                    new Swal('서비스이용 실패', '로그인 해주세요. 로그인 페이지로 이동합니다.','error').then(function() {
                                        location.href='/dndn/auth/login.do';
                                    });
                                }
                            }
                        });
                    } else {
                        alert("결제 실패");
                    }
                });
            }else{
                var msg = "결제 실패"
                // msg += "에러 내용" + rsp.error_msg;
            }
            // alert(msg);
        });
    }

    $('#sameaddress').change(function(){
        //(uri);
        if($('#sameaddress').prop('checked') ==true) {
            let address = $('#myaddress').val();
            let addressdetail = $('#myaddressdetail').val();
            $('.address').val(address);
            $('.addressdetail').val(addressdetail);
        } else {
            $('.address').val('');
            $('.addressdetail').val('');
        }
    });

    $('#sellrequest').change(function(){

        if($("#sellrequest option:checked").val()=='5'){
            $("#requestmessage").attr('type','text');
            $("#requestmessage").val("");
        } else {
            $("#requestmessage").val($("#sellrequest option:checked").text());
            $("#requestmessage").attr('type','hidden');
        }
    });

    function sample4_execDaumPostcode() {
        new daum.Postcode({
            width: 600, // 창의 가로 크기
            height: 800, // 창의 세로 크기
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

    // 숫자 -> 가격 >
    function convertPriceToNum(price){
        return parseInt(String(price).replaceAll('원','').replaceAll(',',''));
    }
    // 가격 -> 숫자 >
    function convertNumToPrice(num){
        return parseInt(String(num)).toLocaleString()+'원';
    }
</script>
</body>
</html>