<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZENSHOP</title>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/style_order.css" />
</head>
<body>
	
	<div id = "wrap">
		
		<div id="innerWrap">
			
			<%@ include file ="/WEB-INF/views/inc/headerGNB_admin.jsp" %>
			<%@ include file ="/WEB-INF/views/inc/sitemap.jsp" %>
			
			<div id="orderTbl">
				<h1>주문내역</h1>
				<h1>uid: ${uid} // uname : ${param.uname}</h1>
				<div id="goodsImg">
					<img src="/uploadDir/${param.filename}" alt="주문상품사진" />
				</div>
				<div id="orderInfo">
					
					<span>상품이름 : </span><span>${param.goodsName}</span>
					<span>상품색상 : </span><span>${param.goodsColor}</span>
					<span>상품크기 : </span><span>${param.goodsSize}</span>
					<fmt:formatNumber var="goodsPrice" value="${param.goodsPrice}" pattern="#,###" />
					<span>상품가격 : </span><span>${goodsPrice} 원</span>
					<span>상품개수 : </span><span>${param.goodsCnt} 개</span>
					<span>결제예정금액 : </span><span>${goodsPrice*3} 원</span>
					
				</div>
				<div id="orderInput">
					<span>주소지 : </span><span><input type="text" name="adress" form="orderFrm"/></span>
					<span>전화번호(-빼고입력) : </span><span><input type="text" name="phonenum" form="orderFrm"/></span>
					<span>결제수단</span>
					<span>
						<select name="paymentType" form="orderFrm">
							<option>무통장입금</option>
							<option>신용카드</option>
							<option>카카오뱅크</option>
							<option>네이버페이</option>
							<option>핸드폰</option>
						</select>
					</span>
				</div>
				<div id="orderBtnArea">
					<button type="button" id="orderBtn">주문하기</button>
					<button type="button" id="cancelOrder">주문취소</button>
				</div>
				
				<form id="orderFrm">
					<input type="hidden" name="uid" value="${uid}"/>
					<input type="hidden" name="uname" value="${param.uname}" />
					<input type="hidden" name="goodsCode" value="${param.goodsCode}" />
					<input type="hidden" name="goodsName" value="${param.goodsName}" />
					<input type="hidden" name="goodsColor" value="${param.goodsColor}" />
					<input type="hidden" name="goodsSize" value="${param.goodsSize}" />
					<input type="hidden" name="goodsPrice" value="${param.oriPrice}" />
					<input type="hidden" name="goodsCnt" value="${param.goodsCnt}" />
					<input type="hidden" name="filename" value="${param.filename}" />
				</form>
				
			</div>
			
		</div>
		
		<%@ include file ="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<!-- div#wrap -->
	
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_order.js"></script>
	
</body>
</html>