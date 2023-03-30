<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="footer-nav">
	<div class="footer-item1">
		<a href="#"><span>이용약관</span></a> <span>&nbsp;|&nbsp;</span> <a
			href="#"><span>개인정보 처리방침</span></a>
	</div>
	<div class="footer-item2">
		<span>SSAFY 대전 6반</span> <span>Contact &nbsp;&nbsp;
			ssafy@ssafy.com</span> <br /> <span>&copy; SSAFY 9th KDP&LDK</span>
	</div>
</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${commonJs}/swiper.js"></script>
<script src="${commonJs}/signup.js"></script>
<script src="${commonJs}/login.js"></script>
<script type="module" src="${commonJs}/main.js"></script>

<script>
//시 정보 선택 시 발생하는 구군 항목 업데이트
document.querySelector("#search-city").addEventListener("change", function () {
  	   let seleted_code = this[this.selectedIndex].value;
  	   if (seleted_code) {
  	       getRegionDetail(seleted_code);
  	   }
  });

// "도시" 정보를 선택하면 이벤트로 발생하는 "지역구" 정보 가져오기
function getRegionDetail(data) {
	let Region_Code_T10_2 = "https://apis.data.go.kr/B551011/KorService1/areaCode1?"
      	+ "serviceKey=${serviceKey}"
      	+ "&numOfRows=100"
      	+ "&MobileOS=ETC"
      	+ "&MobileApp=AppTest"
      	+ "&_type=json"
      	+ "&areaCode=" + data;

  	fetch(Region_Code_T10_2).then((response) => response.json())
      .then((text) => {
          let RDetails = text.response.body.items.item;
          let TagSet = "";
          let Select_div = document.querySelector("#search-gugun");

          if (RDetails) {
              RDetails.forEach(function (city) {
                  let Rcode = city.code;
                  let Rname = city.name;

                  TagSet += "<option value=" + Rcode + ">" + Rname + "</option>";
              });
          }
          Select_div.innerHTML = TagSet;
      });
	}

// 관광지 정보 가져오기 이벤트 ("검색" 버튼 이벤트) --> DB select 조건에 필요한 매개변수 담아서 던짐.
// (추가) keyword가 null일 때 alert 처리
document.getElementById("btn-search").addEventListener("click", () => {
	
	let sidoCode = document.querySelector("#search-city").value;
	let gugunCode = document.querySelector("#search-gugun").value;
	let typeCode = document.querySelector("#search-content-id").value;
  	let form = document.querySelector("#form-search");
  	let keyword = document.querySelector("#search-keyword").value;
  	if (!keyword) {
  	    alert("검색할 키워드를 적어주세요");
  	    return;
    } else {
        form.setAttribute("action", "${root}/navigator?action=searchTap&sido="+sidoCode+"&gugun="+gugunCode+"&type="+typeCode+"&keyword="+keyword);
        form.submit();
    }
  	
});

// (추가) 지역명 버튼 클릭시 가져오기
let fastbtns = document.getElementsByClassName("btn-outline-primary");
for (let fb of fastbtns) {
  fb.addEventListener("click", () => {
    let keyword = fb.id;
    let form = document.querySelector("#Tap-search");
    form.setAttribute("action", "${root}/navigator?action=searchTap&keyword="+keyword);
    form.submit();
  });
} 


function moveCenter(lat, lng) {
  map.setCenter(new kakao.maps.LatLng(lat, lng));
}
    </script>
</body>
</html>