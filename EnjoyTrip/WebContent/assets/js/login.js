window.addEventListener("load", function () {
  let modal2 = document.getElementById("login-modal");
  
  // 로그인 모달 이벤트
  document.getElementById("login").addEventListener("click", () => {
    console.log("ok");
    modal2.style.display = "block";
  });
  
  document.getElementById("login-modal-close").addEventListener("click", () => {
    modal2.style.display = "none";
  });
  
  window.addEventListener('click', function (event) {
	  if (event.target == modal2) {
		  modal2.style.display = "none";
	  }
  });
  
  
  // 로그인 버튼 이벤트
  let loginBtns = document.getElementById("login-submit");
  
  loginBtns.addEventListener("click", () => {
	  if (!document.querySelector("#loginId").value) {
          alert("아이디 입력!!");
          return;
        } else if (!document.querySelector("#loginPwd").value) {
          alert("비밀번호 입력!!");
          return;
        } else {
          form.submit();
        }
  })
  
});
