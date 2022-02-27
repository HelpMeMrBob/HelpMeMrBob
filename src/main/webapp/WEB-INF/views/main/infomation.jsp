<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />

<script type="text/javascript">
function toggle(flag) {
	var sidebar = document.getElementById("sidebar");
	var button = document.getElementById("open");
	var bob_map = document.getElementById("bob_map");
	var favo = document.getElementById("favo");
	
	if (flag == 'close') {
		sidebar.hidden = true;
		button.style.display = "inline";
		bob_map.hidden = true;
		favo.hidden = true;
		
		relayout();
	}
	else if (flag == 'open') {
		sidebar.hidden = false;
		button.style.display = "none";
		bob_map.hidden = false;
		favo.hidden = false;
		
		relayout();
	}
}

function sidebarChange(flag) {
	var bob_mapArea = document.getElementById("bob_mapArea");
	var favoriteArea = document.getElementById("favoriteArea");
	var favoriteMemo = document.getElementById("favoriteMemo");
	var modify = document.getElementById("modify");
	
	if (flag == 'bob_map') {
		bob_mapArea.style.display = "block";
		favoriteArea.style.display = "none";
		favoriteMemo.style.display = "none";
		modify.style.display = "none";
	}
	else if (flag == 'favo') {
		bob_mapArea.style.display = "none";
		favoriteArea.style.display = "block";
		favoriteList.style.display = "block";
		favoriteMemo.style.display = "none";
		modify.style.display = "none";
	}
}

function favorite(flag, place, address) {
	var bob_mapArea = document.getElementById("bob_mapArea");
	var modify = document.getElementById("modify");
	var favoriteArea = document.getElementById("favoriteArea");
	var favoriteMemo = document.getElementById("favoriteMemo");
	var favoriteList = document.getElementById("favoriteList");
	var form = document.favoFrm;
	
	form.place.value = place;
	form.address.value = address;
	
	//로그인이 된 상태
	if (flag == 1) {
		bob_mapArea.style.display = "none";
		favoriteArea.style.display = "none";
		modify.style.display = "none";
		favoriteMemo.style.display = "block";
	}
	//로그인이 되지 않은 상태
	else if (flag == 2) {
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "./login.do";
	}
}

function vali() {
	var form = document.searchFrm;
	
	if (form.keyword.value == "") {
		alert("검색어를 입력해주세요!");
		return false;
	}
	
	form.method = "get";
	form.action = "./restaurant.do";
	form.submit();
}

function deleteRow(idx) {
	if (confirm("정말로 삭제하시겠습니까?")) {
		location.href="./favoriteDelete.do?idx="+idx;
	}
}

function modifyRow(idx, place, address) {
	var bob_mapArea = document.getElementById("bob_mapArea");
	var favoriteList = document.getElementById("favoriteList");
	var modify = document.getElementById("modify");
	
	var location = "./favoriteList.do";
	
	bob_mapArea.style.display = "none";
	favoriteList.style.display = "none";
	modify.style.display = "block";
	
	var form =  '<div style="text-align:center;">';
		form += '<hr />';
		form += '<form action="./favoriteModify.do">';
		form += 	'<input type="hidden" name="idx" value="'+idx+'" />';
		form += 	'<div style="padding:5px;font-size:14px;">이름 : '+ place +'</div>';
		form +=		'<div style="padding:5px;font-size:14px;">주소 : '+ address +'</div>';
		form +=		'<textarea name="memo" id="memo" cols="40" rows="5" placeholder="수정할 내용을 작성해주세요!(최대 50자)"' +
						'style="margin-left:10px;"></textarea>';
		form +=		'<button type="submit" id="submit1" style="text-align:center;margin-left:10px;">확인</button>';
		form +=		'<button type="button" id="submit1" style="text-align:center;margin-left:10px;"' +
						'onclick="cancel();">취소</button>';
		form += '</form>';
		form += '<hr />';
		form += '</div>';
	
	modify.innerHTML = form;
}

function cancel() {
	location.href="./favoriteList.do";
}

function detailView(place) {
	location.href="./detailView.do?place=" + place;
}
</script>

<style>
#close {margin-top: 5px;margin-bottom: 5px;padding-right: 5px;}
#open {display: none;font-size: 14px;color: white;border: solid 1px white;}
#title {font-size: 30px;margin-top: 5px;margin-bottom: 5px;}
#favo {padding: 0;width: 147px;font-size: 16px;background-color: #09151F;color: white;border: solid 1px white;}
#bob_map {width:147px;font-size:16px;background-color: #09151F;color: white;border: solid 1px white;}
#locationCheck {padding: 5px;font-size: 14px;width: 80px;}
#favoriteModify {padding: 5px;font-size: 14px;width: 80px;}
#favoriteDelete {padding: 5px;font-size: 14px;width: 80px;}
#modifyBtn {padding: 5px;font-size: 14px;width: 80px;}
#sidebar {background-color: white;overflow: auto;float: left;width: 300px; height: 85vh;}
#submit1 {all: unset;width:50px;height:auto;font-size: 14px;cursor: pointer;padding: 5px;background-color:#085FD7;color:white;border-radius:3px;}
#submit2 {all: unset;font-size: 14px;cursor: pointer;background-color: yellow;font-weight: bold;padding: 5px;}
#submit3 {all: unset;font-size: 14px;cursor: pointer;background-color: yellow;font-weight: bold;padding: 5px;}
#menu_wrap {height: inherit;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
</style>

<body class="video-bg-homepage">
	
	<!-- HEADER -->  
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
	
    <main>
    
    <!-- 왼쪽 사이드 바 -->
    <div>
    	<!-- 지도/즐겨찾기 탭 -->
    	<div style="background-color: #09151F;">
			<button id="bob_map" type="button" onclick="sidebarChange(id);">지도 ∨</button>
			<button id="favo" type="button" onclick="sidebarChange(id);">즐겨찾기 ∨</button>
   		</div>
   		
	    <div id="sidebar">
	    	
	    	<!-- 접기 버튼 -->
	   		<div id="close" align="right">
	   			<button type="button" id="close" onclick="toggle(id);"
	   				class="btn-close"></button>
   			</div>
   			
   			<!-- 밥 지도 영역 S -->
   			<div id="bob_mapArea">
   				<!-- 타이틀 -->
	   			<div align="center">
	   				<span id="title">밥&nbsp;지도</span>
		   		</div>
		   		
		   		<!-- 검색 -->
		   		<div id="menu_wrap">
			   		<div class="option">
				   		<div>
					   		<form onsubmit="return vali();" name="searchFrm">
					   			<span style="font-size: 16px;">검색 : </span>
								<input type="text" id="keyword" name="search" style="width: 150px;" />
								<button type="submit" id="submit1">확인</button>
					   		</form>
				   		</div>
			   		</div>
			   	</div>
			   	
		   		<!-- 내 위치 버튼 -->
		   		<div id="favorite" class="m-3" align="center">
		   			<button type="button" class="btn btn-primary" onclick="geo_tracking();">내 위치</button>
		   			<select name="radius" id="radius" onchange="rad(this.value);">
		   				<option value="0">--선택--</option>
		   				<option value="300">300M</option>
		   				<option value="500">500M</option>
		   				<option value="1000">1KM</option>
		   			</select><br />
		   			<span style="margin-top:20px;font-size:14px;">내 위치가 이상하신가요?</span><br />
		   			<input type="text" name="userLocation" id="userLocation" size="25" value="" />
		   			<button type="button" id="submit1" onclick="myLocation();">확인</button>
		   		</div>
		   		
		   		<!-- 검색 목록 -->
		   		<div>
		   			<hr />
		   			<c:choose>
						<c:when test="${ empty keyword }">
							<div style="font-size:16px;text-align:center;">검색어를 입력해주세요!</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${ keyword }" var="row" varStatus="loop">
								<ul style="font-size: 15px;">
									<li>이름 : <a href="./detailView.do?place=${ row.place }">${ row.place }</a></li>
									<li>주소 : ${ row.address }</li>
									<c:if test="${ row.plcNum != 'null' }"><li>전화번호 : ${ row.plcNum }</li></c:if>
									<c:if test="${ row.plcNum == 'null' }"><li style="color:red;">전화번호 : 정보제공없음</li></c:if>
									<c:if test="${ row.menu != 'null' }"><li align="center">--------- 메뉴 ---------</li></c:if>
									<c:if test="${ row.menu != 'null' }">
										<c:forEach items='${ row.menu.split("@") }' var="menu" varStatus="status">
										<c:set var="price" value='${ row.price.split("@") }' />
											<li align="center">
												${ menu } &nbsp;
												<c:if test="${ price[status.index] != 'null' and not empty price[status.index] }"> 
													<span>${ price[status.index] }원</span>
												</c:if>
											</li>
										</c:forEach>
									</c:if>
									<c:if test="${ row.menu == 'null' }"><li style="color:red;">메뉴 : 정보제공없음</li></c:if>
									<li align="center">-------------------------</li>
									<c:if test="${ row.operTime != 'null' }"><li>영업시간 : ${ row.operTime }</li></c:if>
									<c:if test="${ row.operTime == 'null' }"><li style="color:red;">영업시간 : 정보제공없음</li></c:if>
									<button id="locationCheck" type="button" class="button button-block-sm button--primary button--fill" 
										onclick="marker('${row.address}', '${ row.place }');">위치보기</button>
								</ul>
								<hr />
							</c:forEach>
						</c:otherwise>
					</c:choose>
		   		</div>
   			</div>
   			<!-- 밥 지도 영역 E -->
   			
   			
   			
   			<!-- 즐겨찾기 영역 S -->
   			<div id="favoriteArea" style="display: none;">
	   			<!-- 타이틀 -->
	   			<div align="center">
	   				<span id="title">즐겨찾기</span>
		   		</div>
		   		
		   		<!-- 내 위치 버튼 -->
		   		<div id="favorite" class="m-3" align="center">
		   			<button type="button" class="btn btn-primary" onclick="geo_tracking();">내 위치</button>
		   			<select name="radius" id="radius"  onchange="rad(this.value);">
		   				<option value="0">--선택--</option>
		   				<option value="300">300M</option>
		   				<option value="500">500M</option>
		   				<option value="1000">1KM</option>
		   			</select>
		   		</div>
		   		
		   		<!-- 즐겨찾기 목록 -->
		   		<div id="favoriteList">
		   			<c:if test="${ param.string eq 'error' }">
		   				<div style="font-size:16px;text-align:center;font-weight:bold;">이미 추가한 즐겨찾기 입니다!</div>
		   			</c:if>
		   			<hr />
		   			<c:choose>
						<c:when test="${ empty favoriteList }">
							<div style="font-size:16px;text-align:center;">즐겨찾기 항목을 추가해보세요!</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${ favoriteList }" var="row">
								<ul style="font-size: 15px;">
									<li>이름 : <a href="./detailView.do?place=${ row.place }">${ row.place }</a></li>
									<li>주소 : ${ row.address }</li>
									<li>메모 : ${ row.memo }</li>
									<button id="locationCheck" type="button" class="button button-sm button--primary button--fill" 
										onclick="marker('${row.address}', '${ row.place }');">위치보기</button>
									<button id="favoriteModify" type="submit" class="button button-sm button--primary button--fill"
										onclick="modifyRow('${row.idx}', '${ row.place }', '${ row.address }');">수정하기</button>
									<button id="favoriteDelete" type="submit" class="button button-sm button--primary button--fill"
										onclick="javascript:deleteRow('${row.idx}');">삭제하기</button>
								</ul>
								<hr />
							</c:forEach>
						</c:otherwise>
					</c:choose>
		   		</div>
		   		<div id="modify"></div>
   			</div>
   			<!-- 즐겨찾기 영역 E -->
   			
   			
   			<div id="favoriteMemo" style="text-align:center;display:none;">
   				<hr />
   				<form action="./favorite.do" name="favoFrm" method="post">
   					<input type="hidden" name="id" value="${ siteUserInfo.id }" />
   					<input type="hidden" name="place" value="" />
   					<input type="hidden" name="address" value="" />
   					<span style="font-weight:bold;font-size:14px;">장소에 대한 간단한 메모를 작성해주세요! <br />
   					(최대 50자)</span>
   					<textarea name="memo" id="memo" cols="40" rows="5" maxlength="50"></textarea>
   					<button type="submit" id="submit1">등록</button>
   					<button type="button" id="submit1" style="text-align:center;margin-left:10px;"
						onclick="cancel();">취소</button>
   				</form>
				<hr />
   			</div>
	    </div>
	    
	    <!-- 펼치기 버튼 -->
	    <div style="background-color: #09151F">
	    	<button type="button" id="open" onclick="toggle(id);" class="btn btn-outline-primary">사이드 바 펼치기</button>
		</div>
	    
	    <!-- 지도를 띄울 div태그 -->
	    <div id="map" style="width: auto;height: 87vh;"></div>
    </div>
	
    </main><!-- main ends -->
	
	<!-- SEARCH -->
    <jsp:include page="/WEB-INF/views/include/search.jsp" />
	
	<!-- JQUERY -->
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
</body>


<!-- 카카오 지도 API -->
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1c4c2a88f75c42cd25f8a7382dc6c49&libraries=services"></script>
<script>
	// 마커를 담을 배열입니다
  	var markers = [];
  	var userLatitude; //위도
   	var userLongitude; //경도
   	var container = document.getElementById('map');
   	var options = {
   			center : new kakao.maps.LatLng(37.47868297981449, 126.87866945602173),
   			level : 4
   	};
   	
   	var map = new kakao.maps.Map(container, options);
   	
   	function marker(address, place) {
	 	// 주소-좌표 변환 객체를 생성합니다
	   	var geocoder = new kakao.maps.services.Geocoder();
	 	
	   	// 주소로 좌표를 검색합니다
	   	geocoder.addressSearch(address, function(result, status) {
	   		
	   	    // 정상적으로 검색이 완료됐으면 
	   	    if (status === kakao.maps.services.Status.OK) {
				
	   	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
	   	        // 결과값으로 받은 위치를 마커로 표시합니다
	   	        var marker = new kakao.maps.Marker({
	   	            map: map,
	   	            position: coords,
	   	         	clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	   	        });
	   	        
		   	  	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
				var iwContent =	'<div style="padding:5px;font-size:14px;">이름 : '+ place +'</div>' +
								'<div style="padding:5px;font-size:14px;width:350px;">주소 : '+ address +'</div>' + 
								'<div style="padding:5px;font-size:14px;"><a href="#" onclick="detailView('+'\''+place+'\''+');">상세보기</a></div>' +
						<c:choose>
					   	  	<c:when test="${ not empty siteUserInfo }">
				   	 			'<div style="padding:5px;"><button type="button" id="submit2" onclick="favorite(1,'+'\''+place+'\''+','+'\''+address+'\''+');">즐겨찾기 등록</button></div>';
						   	</c:when>
							<c:otherwise>
								'<div style="padding:5px;"><button type="button" id="submit3" onclick="favorite(2,'+'\''+""+'\''+','+'\''+""+'\''+');">로그인하고 즐겨찾기 하기</button></div>';
						   	</c:otherwise>
						</c:choose>
						
				var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
				    
				if (place === '내 위치') {
					iwContent = '<div style="padding:5px;font-size:14px;">내 위치</div>';
				}
				
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    content : iwContent,
				    removable : iwRemoveable
				});
				
				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function() {
				    // 마커 위에 인포윈도우를 표시합니다
				    infowindow.open(map, marker);
				});
				
	   	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	   	        map.panTo(coords);
	   	    }
	   	    else {
	   	    	console.log("검색 실패");
	   	    }
	   	});
   	}
   	
   	<c:forEach items="${ keyword }" var="row">
		marker('${row.address}', '${ row.place }');
	</c:forEach>
	<c:forEach items="${ favoriteList }" var="row">
		marker('${row.address}', '${ row.place }');
	</c:forEach>
   	
   	/* setInterval함수 */
   	var timer;
   	function reGeo() {
   		timer = window.setInterval("geo_check()", 3000);
   	}
   	reGeo();
   	
   	var geo_use = null; //geo의 사용가능 여부
   	var geo_lat = null; // 위도
   	var geo_lng = null; // 경도
   	var geo_position;   // geo 위치 객체
	
   	geo_check();
   	// gps가 이용가능한지 체크하는 함수이며, 이용가능하다면 show location 함수를 불러온다.
   	// 만약 작동되지 않는다면 경고창을 띄우고, 에러가 있다면 errorHandler 함수를 불러온다.
   	// timeout을 통해 시간제한을 둔다.
   	function geo_check(){
   	    if (navigator.geolocation) {
   	        var options = {
        		enbleHighAccurcy : true, /* 정확도 설정 */
        		timeout:50000 /* 대기시간 */
       		};
   	        navigator.geolocation.getCurrentPosition(showLocation, errorHandler, options);
   	    } 
   	    else {
   	        alert("GeoLocation_추적이 불가합니다.");
   	        geo_use = false;
   	    }
   	}
	
   	// gps 이용 가능 시, 위도와 경도를 반환하는 showlocation함수.
   	function showLocation(position) {
   	    geo_use = true;
   	    geo_lat = position.coords.latitude;
   	    geo_lng = position.coords.longitude;
   	}
	
   	// error발생 시 에러의 종류를 알려주는 함수.
   	function errorHandler(error) {
   	    if(error.code == 1) {
   	        alert("접근차단");
   	    } 
   	    else if(err.code == 2) {
   	        alert("위치를 반환할 수 없습니다.");
   	    }
   	    geo_use = false;
   	}
   	
   	//내 위치를 눌렀을 경우
   	function geo_tracking(){
   	    if (geo_use) {
   	    	
   	        map.panTo(new kakao.maps.LatLng(geo_lat, geo_lng));
   	        
			var geocoder = new kakao.maps.services.Geocoder();
			
			var coord = new kakao.maps.LatLng(geo_lat, geo_lng);
			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        console.log(result[0].address.address_name);
			    }
			};
			
	   	    geocoder.coord2Address(coord.getLng(), coord.getLat(), function(result) {
   	    		marker(result[0].address.address_name, '내 위치');
	   	    });
   	        
   	    } 
   	    else {
		    alert("접근차단하신 경우 새로고침, 아닌 경우 잠시만 기다려주세요.");
		    geo_check();
   	    }
   	    
   	}
   	
   	//사용자로부터 정확한 위치 얻어오기
   	function myLocation() {
   		
   		// 주소-좌표 변환 객체를 생성합니다
	   	var geocoder = new kakao.maps.services.Geocoder();
   		
   		var address = document.getElementById("userLocation").value;
   		console.log(address);
	 	
	   	// 주소로 좌표를 검색합니다
	   	geocoder.addressSearch(address, function(result, status) {
	   		
	   	    // 정상적으로 검색이 완료됐으면 
	   	    if (status === kakao.maps.services.Status.OK) {
				
	   	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	   	     	userLatitude = result[0].y;
	   	     	userLongitude = result[0].x;
	   	     	
	   	     	console.log(userLatitude);
	   	     	console.log(userLongitude);
	   	     	
				
	   	        // 결과값으로 받은 위치를 마커로 표시합니다
	   	        var marker = new kakao.maps.Marker({
	   	            map: map,
	   	            position: coords,
	   	         	clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	   	        });
	   	        
		   	  	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
				var iwContent = '<div style="padding:5px;font-size:14px;">내 위치</div>';
				var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
				    
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    content : iwContent,
				    removable : iwRemoveable
				});
				
				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function() {
				    // 마커 위에 인포윈도우를 표시합니다
				    infowindow.open(map, marker);
				});
				
	   	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	   	        map.panTo(coords);
	   	    }
	   	    else {
	   	    	console.log("검색 실패");
	   	    }
	   	});
   	}
   	
   	//내 주변 반경 구하기
	var beforeRadius;
   	var beforeCircle;
   	
   	function rad(radius) {
   		
   		if (userLatitude == null || userLongitude == null) {
   			userLatitude = geo_lat;
   			userLongitude = geo_lng;
   		}
   		
		// 지도에 표시할 원을 생성합니다
	   	var circle = new kakao.maps.Circle({
	   	    center : new kakao.maps.LatLng(userLatitude, userLongitude),  // 원의 중심좌표 입니다 
	   	    radius: radius, // 미터 단위의 원의 반지름입니다 
	   	    strokeWeight: 5, // 선의 두께입니다 
	   	    strokeColor: '#75B8FA', // 선의 색깔입니다
	   	    strokeOpacity: 0.5, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	   	    strokeStyle: 'solid', // 선의 스타일 입니다
	   	    fillColor: '#CFE7FF', // 채우기 색깔입니다
	   	    fillOpacity: 0.3  // 채우기 불투명도 입니다   
	   	});
	 	
	 	if(beforeCircle) {
	   		beforeCircle.setMap(null);
	 	}
	 	
	   	// 지도에 원을 표시합니다
	   	circle.setMap(map);
	   	beforeCircle = circle;
   	}
   	
   	function relayout() {
   		
   	    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
   	    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
   	    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
   	    map.relayout();
   	}
</script>
</html>