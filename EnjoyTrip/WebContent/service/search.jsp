<!--  	"지역별여행지" 네비게이션 화면: KakaoMap API를 이용한 지역별 관광지 졍보 가져오기 화면 
		관광지 정보 DB 구현 -> SQL Dump 파일 수록 (Dump20230324.sql)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/include/head.jsp"%>
</head>
<body>
	<%@ include file="/include/nav.jsp"%>
	<!-- 중앙 content start -->
	<div class="container">
		<div class="col-md-9">
			<div class="alert alert-primary mt-3 text-center fw-bold"
				role="alert">
				<span id="search-title">여행지</span> <span id="search-sub">검색</span>
			</div>
			<!-- 관광지 검색 start -->
			<form id="form-search" class="d-flex my-3" method="POST"
				action="serchTrip" role="search"">
				<select id="search-city" class="form-select me-2">
					<option value="0" selected>검색 할 지역 선택</option>
					<!--	JSTL 적용: DB에서 도시정보를 가져와서 HTML로 표시 (SelectBox에 도시 정보 항목들이 Update) 
		            			sidoCode: 도시 고유 코드번호,  sidoName: 도시 이름
		            	-->
					<c:forEach var="city" items="${cities}">
						<option value="${city.sidoCode}">${city.sidoName}</option>
					</c:forEach>
				</select>

				<!-- 도시 정보를 선택하면 JS로 이벤트 처리 발생: 해당 도시에 대한 구군 정보를 가져와서 Update(공공데이터 API 이용) -->
				<select id="search-gugun" class="form-select me-2">
					<option value="0" selected>구군 항목</option>
				</select>

				<!--  관광지 세부 선택 항목  -->
				<select id="search-content-id" class="form-select me-2">
					<option value="0" selected>관광지 유형</option>
					<option value="12">관광지</option>
					<option value="14">문화시설</option>
					<option value="15">축제공연행사</option>
					<option value="25">여행코스</option>
					<option value="28">레포츠</option>
					<option value="32">숙박</option>
					<option value="38">쇼핑</option>
					<option value="39">음식점</option>
				</select> <input id="search-keyword" class="form-control me-2" type="search"
					placeholder="검색어" aria-label="검색어" />
				<button id="btn-search" class="btn btn-outline-success"
					type="button">검색</button>
			</form>
			
			<form class="area-body" id="Tap-search" method="POST" action="searchTap">
			          <div class="area-name">
			            <button type="button" id="서울" class="btn btn-outline-primary">서울</button>
			            <button type="button" id="인천" class="btn btn-outline-primary">인천</button>
			            <button type="button" id="대전" class="btn btn-outline-primary">대전</button>
			            <button type="button" id="대구" class="btn btn-outline-primary">대구</button>
			            <button type="button" id="광주" class="btn btn-outline-primary">광주</button>
			            <button type="button" id="부산" class="btn btn-outline-primary">부산</button>
			            <button type="button" id="울산" class="btn btn-outline-primary">울산</button>
			            <button type="button" id="경기" class="btn btn-outline-primary">경기도</button>
			            <button type="button" id="강원" class="btn btn-outline-primary">강원도</button>
			            <button type="button" id="충청" class="btn btn-outline-primary">충청도</button>
			            <button type="button" id="경상" class="btn btn-outline-primary">경상도</button>
			            <button type="button" id="전라" class="btn btn-outline-primary">전라도</button>
			            <button type="button" id="제주" class="btn btn-outline-primary">제주도</button>
			          </div>
			        </form>


			<!-- kakaoMap API  start  -->
			<div id="map" class="mt-3" style="width: 100%; height: 400px;">
				<!-- 	KakaoAPI 활용을 위한 appKey Setting.
		        			★ root 서버 주소 세팅 필요. (127.0.0.1:8088, 8081, 8080 설정? 한 상태로 마지막 확인
		        	 -->
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8820d3277f771b41fa361424002a1649"></script>

				<!-- 카카오맵 API 초기 화면 보여주기  -->
				<script>
		        	// 카카오지도
		            var mapContainer = document.getElementById("map"), // 지도를 표시할 div
		              mapOption = {
		                center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
		                level: 5, // 지도의 확대 레벨
		              };
		
		            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		            var map = new kakao.maps.Map(mapContainer, mapOption);
		        	</script>

				<c:if test="${not empty attrinfo}">
					<script type="text/javascript">
		        			var pos = new kakao.maps.LatLng(${attrinfo[0].latitude}, ${attrinfo[0].longitude});
		        			map.setCenter(pos);
		        		</script>

					<c:forEach var="position" items="${attrinfo}">
						<script type="text/javascript">
		        				var imageSize = new kakao.maps.Size(24,35);
		        				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		        				var makerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		        				
		        				//마커 생성
		        				var marker = new kakao.maps.Marker({
							        map: map, // 마커를 표시할 지도
							        position: new kakao.maps.LatLng(${position.latitude}, ${position.longitude}), // 마커를 표시할 위치
							        image : makerImage // 마커 이미지 
							    });
		        				
		        				var content = '<div class="wrap">' + 
		        	            '    <div class="info">' + 
		        	            '        <div class="title">' + 
		        	            '            "${position.title}"' + 
		        	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		        	            '        </div>' + 
		        	            '        <div class="body">' + 
		        	            '            <div class="img">' +
		        	            '                <img src="${position.imgUrl}" width="73" height="70">' +
		        	            '           </div>' + 
		        	            '            <div class="desc">' + 
		        	            '                <div class="ellipsis">"${position.address}"</div>' + 
		        	            '                <div class="jibun ellipsis">"${position.address2}"</div>' + 
		        	            '            </div>' + 
		        	            '        </div>' + 
		        	            '    </div>' +    
		        	            '</div>';

						        	// 마커 위에 커스텀오버레이를 표시합니다
						        	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
						        	var overlay = new kakao.maps.CustomOverlay({
						        	    content: content,
						        	    map: map,
						        	    position: marker.getPosition()       
						        	});
				
						        	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
						        	kakao.maps.event.addListener(marker, 'click', function() {
						        	    overlay.setMap(map);
						        	});
				
						        	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
						        	function closeOverlay() {
						        	    overlay.setMap(null);     
						        	}
		        				
		        			</script>
					</c:forEach>
				</c:if>
			</div>

			<div class="row row-cols-3 g-4" id="cardlist">
				<!-- DB에서 가져온 관광지 정보는 attrinfo에 담겨져 있으므로 이를 foreach로 꺼내와 출력 -->
				<c:forEach var="attr" items="${attrinfo}">
					<div class="col"
						onclick="moveCenter(${attr.latitude}, ${attr.longitude});">
						<div class="card">
							<div class="card-hov">
								<img src="${attr.imgUrl}" style="height: 280px"
									class="card-img-top"
									onerror="this.onerror=null; this.src='${commonImg}/blank2.png';">
							</div>
							<div class="card-body">
								<h5 class="card-title">${attr.title}</h5>
								<p class="card-text">${attr.address}${attr.address2}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<%@ include file="/user/signup.jsp"%>
		<%@ include file="/user/login.jsp"%>
	</div>
	<%@ include file="/include/footer.jsp"%>