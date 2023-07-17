<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_index.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
</head>
<fmt:formatNumber var="discountRate" value="${0.20}" type="percent" />
<body>
	<div id="wrap">

		<div id="innerWrap">

			<%@ include file="/WEB-INF/views/inc/headerGNB.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>
			<div id="mainPage">
				<main id="main">
					<div id="slideBtnArea">
						<div class="custom-prev-button">
						  <span class="arrow-left"></span>
						</div>
						
						<div class="custom-next-button">
						  <span class="arrow-right"></span>
						</div>
					</div>
					<!-- sildeBtnArea -->
					<div id="sildeArea">
						<div id="slideImgs" class="slide_div">
							<div>
								<img id="SlideImg1" src="http://jogunshop.img18.kr/web/upload/main/main_visual_daily_look_pk_short_sleeve_tee.jpg" alt="SlideImg1">
							</div>
							<div>
								<img id="SlideImg2" src="http://jogunshop.img18.kr/web/upload/main/main_visual_cool_tensel_3type_hidden_banding_denim.jpg" alt="SlideImg2">
							</div> 
							<div>
								<img id="SlideImg3" src="http://jogunshop.img18.kr/web/upload/main/main_visual_buttonless_overfit_summer_cardigan.jpg" alt="SlideImg3">
							</div>
							<div>
								<img id="SlideImg4" src="http://jogunshop.img18.kr/web/upload/main/main_visual_arctic_19colors_spandex_summer_shorts.jpg" alt="SlideImg4">
							</div>
							<div>
								<img id="SlideImg5" src="http://jogunshop.img18.kr/web/upload/main/main_visual_cool_6color_summer_linen_banding_pants.jpg" alt="SlideImg5">
							</div>
							<div>
								<img id="SlideImg6" src="http://jogunshop.img18.kr/web/upload/main/main_visual_thanksgiving_thierry_slit_short_sleeve_tee.jpg" alt="SlideImg6">
							</div>
							<div>
								<img id="SlideImg7" src="http://jogunshop.img18.kr/web/upload/main/main_visual_cool_summer_wide_banding_pants.jpg" alt="SlideImg7">
							</div>
							<div>
								<img id="SlideImg8" src="http://jogunshop.img18.kr/web/upload/main/main_visual_gentle_cutaway_open_collar_tee.jpg" alt="SlideImg8">
							</div>
						</div>
						<!-- div#slideImgs -->
					</div>
					<div id="dailyBestArea">
						<h1>TODAY BEST</h1>
			
						<form action="/productDetail">
						<div id="TodayBestArea" class="slide_div2">

								<c:forEach begin="0" end="5" step="1"  var="i" items="${goodsInfo}" >
								<c:set var="disRate" value="${i.goodsDiscount/100}" />
								<fmt:formatNumber var="discountRate" value="${disRate}" type="percent" pattern="0%" />

								<div class="TodayBestImgArea">
									<div class="TodayBestImg dFlex">
										<!-- num 값으로 데이터 전송  -->
										<a href="/productDetail?goodsCode=${i.goodsCode}"><img src="/uploadDir/${i.filename}" alt=""></a>
									</div>
									
									<!-- div.TodayBestImg -->
									<div class="TodayBestStatus dFlex">
										<div class="colorOption">
											<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
										</div>
										<!-- div.colorStatus -->
										<div class="reviewCnt">
											리뷰 : <span>50</span>
										</div>
										<!-- div.reviewCnt -->
									</div>
									
									<!-- div.TodayBestStatus -->
									<div class="goods-Thumb-Info">
										<a href="#" class="goodsName">${i.goodsName}</a> <br>
										<a href="#" class="goodsSize">M~2XL(95~115)</a>

										<p class="goodsDescript">
											<!-- [세가지 타입의 기장 선택] -->
										</p>
										<p class="goodsPrice-thumb">
									<fmt:formatNumber var="goodsPrice" value="${i.goodsPrice}" pattern="#,###" />
										${goodsPrice}원
										<span data-link="${i.goodsDiscount}">
											<c:if test="${discountRate != '0%'}">
												${discountRate}
											</c:if>
										</span>
										
										</p>
										

									</div>
									<!-- div.goodsInfo -->
									<div id="delStatusArea">
										<span id="rushOrder">${i.goodsStatus}</span> <span id="fastDeliver">당일배송</span>
									</div>
								</div>

								<!-- div.TodayBestImgArea -->

								</c:forEach>
						</div>
						<!-- div#TodayBestArea -->
					</form>

					</div>
					<!-- div#dailyBestArea -->

					<hr>

					<div id="categoryBestArea">
						<h1>CATEGORY BEST</h1>
						<div id="cateroryGnbArea">
							<nav id="gnb">
								<!-- ul#mainMenu>li.mainLi*3>a[href=#]{메인메뉴$}+ul.subMenu>li.subLi*4>a[href=#]{서브메뉴$} -->
								<ul id="mainMenu" class="dFlex">
									<li class="mainLi"><a href="#">All</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="">TOP</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="#">SHIRTS</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="#">PANTS</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="#">OUTER</a></li>
								</ul>
								<!-- ul#mainMenu -->
							</nav>
						
							<!-- nav#gnb -->
						</div>
						<!-- div#cateroryGnbArea -->


						<div class="categoryBestImgDiv">

						<c:forEach var="i" begin="0" end="16" step="1" items="${goodsInfo}">
								<c:set var="disRate" value="${i.goodsDiscount/100}" />
								<fmt:formatNumber var="discountRate" value="${disRate}" type="percent" pattern="0%" />
								<div class="categoryBestImgArea">
									<!-- div.categoryBestImg 시작 -->
									<div class="categoryBestImg">
										<a href="/productDetail?goodsCode=${i.goodsCode}"><img class="cate-Thumb" src="/uploadDir/${i.filename}" alt=""></a>
									</div>
									<!-- <!-- div.categoryBestImg 끝 -->
									<div class="TodayBestStatus dFlex">
										<div class="colorOption">
											<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
										</div>
										<!-- div.colorStatus -->
										<div class="reviewCnt">
											리뷰 : <span>50</span>
										</div>
										<!-- div.reviewCnt -->
									</div>
									<!-- div.TodayBestStatus -->
									<div class="goodsInfo">
										<a href="#" class="goodsName">${i.goodsName}</a> <br>
										<b>${i.goodsCategory}</b>
										<a href="#" class="goodsSize">M~2XL(95~115)</a>
										<p class="goodsDescript">
											<!-- [세가지 타입의 기장 선택] -->
										</p>
										<p class="goodsPrice">
											<fmt:formatNumber var="goodsPrice" value="${i.goodsPrice}" pattern="#,###" />
										${goodsPrice}원
										<span data-link="${i.goodsDiscount}">
											<c:if test="${discountRate != '0%'}">
												${discountRate}
											</c:if>
										</span>
										</p>
									</div>
									<!-- div.goodsInfo -->
									<div id="delStatusArea">
										<span id="rushOrder">주문폭주</span> <span id="fastDeliver">당일배송</span>
									</div>
									<!-- div#delStatusArea -->
								</div>
								<!-- div.categoryBestImgArea -->

						</c:forEach>

						</div>
						<!-- div.categoryBestImgDiv -->


					</div>
					<!-- div#categotyBestArea -->

				</main>
				<!-- main#main -->


			</div>
			<!-- div#mainPage -->
		</div>

		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>
	<!-- div#wrap -->

	<script src="../script/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script src="../script/script.js"></script>
</body>
</html>

