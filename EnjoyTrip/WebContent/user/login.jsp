<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- modal login start -->
	<div id="login-modal">
		<div id="login-modalBody">
			<div id="login-title">
				<h1>로그인</h1>
				<span id="login-modal-close">&times;</span>
			</div>
			<form id="login-info">
				<div>
					<label for="userId" class="form-label">아이디</label> <input
						class="login-value" id="loginId" name="userId" type="email" />
				</div>
				<div>
					<label for="userpwd" class=" form-label">비밀번호</label> <input
						class="login-value" id="loginPwd" name="userId" type="password" />
				</div>
			</form>
			<button id="login-submit" class="login-btn">로그인</button>
			<button id="login-kakao" class="login-btn">
				<img id="login-kakao-img" src="${commonImg}/kakao_login_image.png" />
			</button>
			<button id="login-google" class="login-btn">
				<img id="login-google-img" src="${commonImg}/login-google.png" />
			</button>
		</div>
	</div>
	<!-- modal login end -->