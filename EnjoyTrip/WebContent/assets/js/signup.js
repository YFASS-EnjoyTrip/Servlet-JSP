window.addEventListener("load", function () {
  let modal = document.getElementById("signup-modal");
  
  // 회원가입 모달 이벤트
  document.getElementById("signup").addEventListener("click", () => {
    modal.style.display = "block";
    
    var ele = document.getElementsByClassName('signup-value');
    for (var e of ele) {
      console.log(e);
      e.value = '';
    }
  });
  
  document.getElementById("signup-modal-close").addEventListener("click", () => {
    modal.style.display = "none";
  });
  
//  window.addEventListener('click', function (event) {
//	  if (event.target == modal) {
//		  modal.style.display = "none";
//	  }
//  });
  
  // 아이디 중복 검사
  let isUseId = false;
  let resultDiv = "";
  document.querySelector("#userId").addEventListener("keyup", function () {
		let userId = this.value;
	 	resultDiv = document.querySelector("#idcheck-result");
	 	
	 	if (userId.includes("@")) {
	 		fetch(resultDiv.getAttribute("name") + "/user?action=idcheck&userId=" + userId)
	 		.then(response => response.text())
	 		.then(data => { // 
	 			if(data == 0) { // "0" == 0?
	 				resultDiv.setAttribute("class", "text-ok");
	 				resultDiv.textContent = "사용 가능한 아이디 입니다.";
	 				isUseId = true;
	 			} else {
	 				resultDiv.setAttribute("class", "text-danger");
	 				resultDiv.textContent = "사용할 수 없는 아이디 입니다.";
	 				isUseId = false;
	 			}
	 		});	 		
	 	}
  });
  
  // 회원가입 버튼 이벤트
  document.getElementById("signup-submit").addEventListener("click", () => {
	  if (!document.querySelector("#userName").value) {
          alert("닉네임 입력!!");
          return;
        } else if (!document.querySelector("#userId").value) {
          alert("아이디 입력!!");
          return;
        } else if (!document.querySelector("#userpwd").value) {
          alert("비밀번호를 입력해주세요.");
          return;
        } else if (document.querySelector("#userpwd").value != document.querySelector("#pwdcheck").value) {
          alert("비밀번호가 일치하지 않습니다.");
          return;
        } else {
          let form = document.querySelector("#form-signup");
          console.log(resultDiv.getAttribute("name"));
          form.setAttribute("action", resultDiv.getAttribute("name") + "/user")
          form.submit();
        }
  });
  
});
