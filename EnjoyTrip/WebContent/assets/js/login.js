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
  let loginBtns = document.getElementsByClassName("login-btn");
  for (let btn of loginBtns) {
    btn.addEventListener("click", () => {
      alert("아직 준비중인 기능입니다.");
    });
  }
});
