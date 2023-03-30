<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- modal signup start -->
	<div id="signup-modal">
		<div id="signup-modalBody">
			<div id="signup-title">
				<h1>회원가입</h1>
				<span id="signup-modal-close">&times;</span>
			</div>
			<form id="form-signup" method="POST" action="">
				<input type="hidden" name="action" value="signup">
				<div>
					<label for="userId" class="form-label">아이디</label> 
					<input class="signup-value" id="userId" name="userId" type="email" required placeholder=" 아이디 (ssafy@ssafy.com)" />
					<div id="idcheck-result" name="${root}"></div>
				</div>
				<div>
					<label for="userpwd" class="form-label">비밀번호</label> <input
						class="signup-value" id="userpwd" name="userpwd" type="password"
						placeholder=" 8자리 이상" />
				</div>
				<div>
					<label for="userpwd" class="form-label">비밀번호 확인</label> <input
						class="signup-value" id="pwdcheck" name="pwdcheck" type="password" />
				</div>
				<div>
					<label for="userName" class="form-label">닉네임</label> <input
						class="signup-value" id="userName" name="userName" type="text" />
				</div>
				<button id="signup-submit">회원 가입</button>
			</form>
		</div>
	</div>
	<!-- modal signup end --> 