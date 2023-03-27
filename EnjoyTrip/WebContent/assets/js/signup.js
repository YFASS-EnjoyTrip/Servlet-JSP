window.addEventListener("load", function () {
  let modal = document.getElementById("signup-modal");
  
  // 회원가입 모달 이벤트
  document.getElementById("signup").addEventListener("click", () => {
    modal.style.display = "block";
  });
  
  document.getElementById("signup-modal-close").addEventListener("click", () => {
    modal.style.display = "none";
  });
  
  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  };
  
  // 회원가입 버튼 이벤트
  document.getElementById("signup-submit").addEventListener("click", () => {
    alert("아직 준비중인 기능입니다.");
  });
});
