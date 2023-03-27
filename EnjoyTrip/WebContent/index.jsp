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
		<a href="search.html" class="main-nav-item">여행지 검색</a> <a href=""
			class="main-nav-item">여행 플래너</a> <a href="" class="main-nav-item">핫
			플레이스</a> <a href="" class="main-nav-item">자유 게시판</a>
	</div>
	<!-- 메인 navigator end --> <!-- swiper 메뉴 1 -->
	<div class="swiper-title">
		<span id="swiper-title-key">국내</span> <span id="swiper-title-sub">주요
			여행지</span>
	</div>
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
			<img id="right-arrow1" src="${commonImg}/right-arrow.png" width="30px" />
		</div>
	</div>

	<!-- swiper menu2 주요 행사 -->
	<div class="swiper-title">
		<span id="swiper-title-key">지역별</span> <span>주요 행사</span>
	</div>
	<div class="main-swiper">
		<div class="swiper-button-prev swiper2_prev">
			<img id="left-arrow1" src="${commonImg}/left-arrow.png" width="30px" />
		</div>
		<div class="swiper-container2 base-slider">
			<div class="swiper-wrapper" id="swiper-wrapper">
				
			</div>
		</div>
		<div class="swiper-button-next swiper2_next">
			<img id="right-arrow1" src="${commonImg}/right-arrow.png" width="30px" />
		</div>
	</div>


	<!-- modal signup start -->
	<div id="signup-modal">
		<div id="signup-modalBody">
			<div id="signup-title">
				<h1>회원가입</h1>
				<span id="signup-modal-close">&times;</span>
			</div>
			<form id="signup-info">
				<span>아이디 &nbsp;</span> <input id="input-box" type="text"
					placeholder=" 아이디 (ssafy@ssafy.com)" />
			</form>
			<form id="signup-info">
				<span>비밀번호 &nbsp;</span> <input id="input-box" type="password"
					placeholder=" 8자리 이상" />
			</form>
			<form id="signup-info">
				<span>닉네임 &nbsp;</span> <input id="input-box" type="password" />
			</form>
			<button id="signup-submit">회원 가입</button>
		</div>
	</div>
	<!-- modal signup end --> <!-- modal login start -->
	<div id="login-modal">
		<div id="login-modalBody">
			<div id="login-title">
				<h1>로그인</h1>
				<span id="login-modal-close">&times;</span>
			</div>
			<form id="login-info">
				<span>아이디 &nbsp;</span> <input id="input-box" type="text" />
			</form>
			<form id="login-info">
				<span>비밀번호 &nbsp;</span> <input id="input-box" type="password" />
			</form>
			<button id="login-submit" class="login-btn">로그인</button>
			<button id="login-kakao" class="login-btn">
				<img id="login-kakao-img" src="/img/kakao_login_image.png" />
			</button>
			<button id="login-google" class="login-btn">
				<img id="login-google-img" src="/img/login-google.png" />
			</button>
		</div>
	</div>
	<!-- modal login end --> </main>
	<%@ include file="/include/footer.jsp"%>