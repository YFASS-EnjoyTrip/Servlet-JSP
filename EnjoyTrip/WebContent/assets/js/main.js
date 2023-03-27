import { serviceKey } from './key.js';

window.addEventListener("load", function () {
	function getToday(){
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + month + day;
	}
	let areaUrl = `https://apis.data.go.kr/B551011/KorService1/searchFestival1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&eventStartDate=${getToday()}`;
  
	fetch(areaUrl)
    	.then((response) => response.json())
    	.then((data) => checkData(data));
  
	function checkData(data) {
	    let areas = data.response.body.items.item;
	    let ele = document.getElementById('swiper-wrapper');
	   
	    for (let i = 0; i < 10; i++) {
	      let img = areas[i].firstimage;
	      
	      let eleDiv = document.createElement("div");
	      let eleDiv2 = document.createElement("div");
	      eleDiv.setAttribute('class', 'swiper-slide');
	      eleDiv2.setAttribute('class', 'main-event-item');
	      
	      
	      let eleImg = document.createElement("img");
	      let eleInfo = document.createElement("div");

	      eleImg.setAttribute('class', 'event-item-img');
	      eleImg.setAttribute('src', img);
	      
	      eleInfo.setAttribute('class', 'event-item-text');

	      let title = areas[i].title;
	      let startDate = areas[i].eventstartdate;
	  
	      startDate =
	        startDate.substr(2, 2) + '.' + startDate.substr(4, 2) + '.' + startDate.substr(6, 2);
	      
	      let endDate = areas[i].eventenddate;
	      endDate = endDate.substr(2, 2) + '.' + endDate.substr(4, 2) + '.' + endDate.substr(6, 2);

	      eleInfo.innerHTML = `<h5 id="title">${title}</h5>
	                           <h5 id="start-date">${startDate} ~ ${endDate}</h5>`;
	  
	      eleDiv2.appendChild(eleImg);
	      eleDiv2.appendChild(eleInfo);
	      eleDiv.appendChild(eleDiv2);
	      ele.appendChild(eleDiv);
	      console.log(ele);
	    }
	  }
});
