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
	<main> <!-- 좌측 회원 프로필, 사진 -->
	<div class="container">
		<div class="member-info">
			<div id="member-profile">
				<img id="profile-img" src="${commonImg}/user_default.png" /> <span
					id="member-nickname">${userInfo.nickName}</span> <span
					id="member-email">${userInfo.id}</span> <input id="member-bio"
					type="text" placeholder="  자신을 한 줄로 소개해보세요!">
				<button id="member-edit">프로필 수정</button>
			</div>
		</div>

		<div class="member-item">
			<span id="member-plan">나의 여행 플랜</span> <span id="member-plan-edit">관리/수정</span>
			<div id="member-plan-items">
				<div id="member-plan-item">
					<img id="member-plan-thumbnail" src="${commonImg}/seoul-main.jpg"> <span
						id="member-plan-title">즐거운 서울 여행기</span> <span
						id="member-plan-date">23.03.17 ~ 23.03.19 (2박 3일)</span>
				</div>
			</div>
		</div>

		<!-- 우측 회원 정보 -->
		<div></div>
	</main>
	<%@ include file="/include/footer.jsp"%>