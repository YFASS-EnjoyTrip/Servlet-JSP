<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/include/head.jsp"%>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%@ include file="/include/nav.jsp"%>
	<main> <!-- 메인 navigator start -->
	<div class="main-nav">
		<a href="${root}/navigator?action=searchTrip" class="main-nav-item">여행지 검색</a> <a href=""
			class="main-nav-item">여행 플래너</a> <a href="" class="main-nav-item">핫
			플레이스</a> <a href="" class="main-nav-item">자유 게시판</a>
	</div>
	<!-- 메인 navigator end --> <!-- swiper 메뉴 1 -->
	<div class="swiper-title">
		<span id="swiper-title-key">국내</span> <span id="swiper-title-sub">주요여행지</span>
	</div>
	<div class="main-swiper-ank">
		<div class="main-swiper">
			<div class="swiper-button-prev">
				<img id="left-arrow1" src="${commonImg}/left-arrow.png" width="30px" />
			</div>
			<div class="swiper-container base-slider">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="main-item">
							<img class="main-item-img" src="${commonImg}/seoul-main.jpg" />
							<div class="main-item-text">서울</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="main-item">
							<img class="main-item-img" src="${commonImg}/busan-main.jpg" />
							<div class="main-item-text">부산</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="main-item">
							<img class="main-item-img" src="${commonImg}/daegu-main.jpg" />
							<div class="main-item-text">대구</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="main-item">
							<img class="main-item-img" src="${commonImg}/gyeongju-main.jpg" />
							<div class="main-item-text">경주</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="main-item">
							<img class="main-item-img" src="${commonImg}/jeonju-main.jpg" />
							<div class="main-item-text">전주</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="main-item">
							<img class="main-item-img" src="${commonImg}/jeju-main.jpg" />
							<div class="main-item-text">제주</div>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-button-next">
				<img id="right-arrow1" src="${commonImg}/right-arrow.png"
					width="30px" />
			</div>
		</div>
	</div>
	<!-- swiper menu2 주요 행사 -->
	<div class="swiper-title">
		<span id="swiper-title-key">지역별</span> <span>주요 행사</span>
	</div>
	<div class="main-swiper-ank">
		<div class="main-swiper">
			<div class="swiper-button-prev swiper2_prev">
				<img id="left-arrow1" src="${commonImg}/left-arrow.png" width="30px" />
			</div>
			<div class="swiper-container2 base-slider">
				<div class="swiper-wrapper" id="swiper-wrapper"></div>
			</div>
			<div class="swiper-button-next swiper2_next">
				<img id="right-arrow1" src="${commonImg}/right-arrow.png"
					width="30px" />
			</div>
		</div>
	</div>
	
	<!-- swiper menu2 주요 행사 -->
	<div class="swiper-title">
		<span id="swiper-title-key">관심 TOP!</span> <span>여행지 & 행사</span>
	</div>
	<div class="main-swiper-ank">
		<div class="main-swiper">
			<div class="swiper-button-prev swiper2_prev">
				<img id="left-arrow1" src="${commonImg}/left-arrow.png" width="30px" />
			</div>
			<div class="swiper-container2 base-slider">
				<div class="swiper-wrapper" id="swiper-wrapper"></div>
			</div>
			<div class="swiper-button-next swiper2_next">
				<img id="right-arrow1" src="${commonImg}/right-arrow.png"
					width="30px" />
			</div>
		</div>
	</div>

	<%@ include file="/user/signup.jsp"%>
	<%@ include file="/user/login.jsp"%>
	
	</main>

	<%@ include file="/include/footer.jsp"%>