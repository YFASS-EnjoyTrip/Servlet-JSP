<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<nav class="header-nav">
		<div>
			<a class="header-home" href="${root}/main"> <span
				id="header-title">SSAFY</span> <span>TRIP</span>
			</a>
		</div>
		<div class="nav-menu">
			<c:if test="${empty userInfo}">
				<!-- 로그인 전 -->
				<ul>
					<li><a id="login" class="nav-menu-item" style="display: block"
						href="#">로그인</a></li>
						<li><a id="signup" class="nav-menu-item" style="display: block"
						href="#">회원가입</a></li>
				</ul>
			</c:if>
			<c:if test="${not empty userInfo}">
				<!-- 로그인 후 -->
				<strong>${userInfo.nickName} 님 환영합니다.</strong>
				<a class="nav-menu-item" style="display: block"
					href="${root}/user?action=logout">로그아웃</a>
				<a class="nav-menu-item" style="display: block"
					href="${root}/user?action=mypage">마이페이지</a>
				<a class="nav-menu-item" style="display: block" href="#">고객센터</a>
			</c:if>
		</div>
	</nav>
</header>