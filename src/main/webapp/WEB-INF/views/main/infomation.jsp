<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />

<script type="text/javascript">
function toggle(flag) {
	var sidebar = document.getElementById("sidebar");
	var button = document.getElementById("open");
	
	if (flag == 'close') {
		sidebar.hidden = true;
		button.style.display = "inline";
		
		relayout();
	}
	else if (flag == 'open') {
		sidebar.hidden = false;
		button.style.display = "none";
		
		relayout();
	}
}

function favorite() {
	var star = document.getElementById("star");
	star.innerHTML = "★";
	alert("즐겨찾기 등록 완료");
}

function vali() {
	var form = document.frm;
	
	if (form.keyword.value == "") {
		alert("검색어를 입력해주세요!");
		return false;
	}
	
	form.method = "get";
	form.action = "./restaurant.do";
	form.submit();
}
</script>

<style>
#sidebar {background-color: pink;}
#submit1 {width: 3px;height: 3px;padding-left: 3rem;padding-right: 3rem;}
#submit2 {all: unset;font-size: 14px;cursor: pointer;background-color: yellow;font-weight: bold;padding: 5px;}
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
	    <div id="sidebar" style="overflow: auto;float: left;width: 300px; height: 87vh;">
	    	<!-- 접기 버튼 -->
	   		<div align="right" style="margin-top: 5px;margin-bottom: 5px;padding-right: 5px;">
	   			<button type="button" id="close" onclick="toggle(id);"
	   				class="btn-close"></button>
   			</div>
   			
   			<!-- 타이틀 -->
   			<div align="center" style="margin-top: 5px;margin-bottom: 5px;">
   				<span style="font-size: 30px;">밥&nbsp;지도</span>
	   		</div>
	   		<!-- 검색 -->
	   		<div id="menu_wrap">
		   		<div class="option">
			   		<div>
				   		<form onsubmit="return vali();" name="frm">
				   			<span style="font-size: 16px;">검색 : </span>
							<input type="text" id="keyword" name="search" style="width: 150px;" />
							<button type="submit" id="submit1" class="btn btn-primary">Search</button>
				   		</form>
			   		</div>
		   		</div>
		   		
		   		
		   		<!-- 내 위치 버튼 -->
		   		<div id="favorite" class="m-5" align="center">
		   			<button type="button" class="btn btn-primary" onclick="gps_tracking();">내 위치</button>
		   		</div>
		   		
		   		<hr />
		   		<ul id="placesList">
		   			<c:choose>
						<c:when test="${ empty keyword }">
							검색어를 입력해주세요!
						</c:when>
						<c:otherwise>
							<c:forEach items="${ keyword }" var="row" varStatus="loop">
								<ul style="font-size: 15px;">
									<li>이름 : <a href="#" onclick="marker('${row.address}', '${ row.place }');">${ row.place }</a></li>
									<li>주소 : ${ row.address }</li>
									<li>전화번호 : ${ row.plcNum }</li>
									<li>메뉴 : ${ row.menu }</li>
									<li>영업시간 : ${ row.operTime }</li>
									<button type="button" class="btn btn-success" onclick="marker('${row.address}', '${ row.place }');">위치보기</button>
								</ul>
								<hr />
							</c:forEach>
						</c:otherwise>
					</c:choose>
		   		</ul>
   			</div>
	    </div>
	    
	    <!-- 펼치기 버튼 -->
	    <div>
	    	<button type="button" id="open" onclick="toggle(id);" style="display: none;font-size: 10px;"
	    		class="btn btn-outline-primary">〉</button>
		</div>
	    
	    <!-- 지도를 띄울 div태그 -->
	    <div id="map" style="width: auto;height: 87vh;"></div>
    </div>
	
    </main><!-- main ends -->
	
	<!-- SEARCH -->
    <jsp:include page="/WEB-INF/views/include/search.jsp" />
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
	
</body>


<!-- 카카오 지도 API -->
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1c4c2a88f75c42cd25f8a7382dc6c49&libraries=services"></script>
<script>
	// 마커를 담을 배열입니다
  	var markers = [];
	
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
				
	   	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	   	        /* var infowindow = new kakao.maps.InfoWindow({
	   	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ place +'</div>'
	   	        });
	   	        infowindow.open(map, marker); */
	   	        
		   	  	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
				var iwContent = '<div style="padding:5px;font-size:14px;">이름 : '+ place +'</div>' + 
								'<div style="padding:5px;font-size:14px;width:350px;">주소 : '+ address +'</div>' + 
								'<div style="padding:5px;font-size:14px;"><a href="#">상세보기</a></div>' + 
								'<div style="padding:5px;"><button type="submit" id="submit2" onclick="favorite();">즐겨찾기 등록 <span id="star">☆</span></button></div>', 
				    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
				    
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
   	
   	var gps_use = null; //gps의 사용가능 여부
   	var gps_lat = null; // 위도
   	var gps_lng = null; // 경도
   	var gps_position;   // gps 위치 객체
	
   	gps_check();
   	// gps가 이용가능한지 체크하는 함수이며, 이용가능하다면 show location 함수를 불러온다.
   	// 만약 작동되지 않는다면 경고창을 띄우고, 에러가 있다면 errorHandler 함수를 불러온다.
   	// timeout을 통해 시간제한을 둔다.
   	function gps_check(){
   	    if (navigator.geolocation) {
   	        var options = {timeout:60000};
   	        navigator.geolocation.getCurrentPosition(showLocation, errorHandler, options);
   	    } 
   	    else {
   	        alert("GPS_추적이 불가합니다.");
   	        gps_use = false;
   	    }
   	}
	
   	// gps 이용 가능 시, 위도와 경도를 반환하는 showlocation함수.
   	function showLocation(position) {
   	    gps_use = true;
   	    gps_lat = position.coords.latitude;
   	    gps_lng = position.coords.longitude;
   	}
	
   	// error발생 시 에러의 종류를 알려주는 함수.
   	function errorHandler(error) {
   	    if(error.code == 1) {
   	        alert("접근차단");
   	    } 
   	    else if(err.code == 2) {
   	        alert("위치를 반환할 수 없습니다.");
   	    }
   	    gps_use = false;
   	}
   	
   	//내 위치를 눌렀을 경우
   	function gps_tracking(){
   	    if (gps_use) {
   	        map.panTo(new kakao.maps.LatLng(gps_lat, gps_lng));
   	        
			var geocoder = new kakao.maps.services.Geocoder();
			
			var coord = new kakao.maps.LatLng(gps_lat, gps_lng);
			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        console.log(result[0].address.address_name);
			    }
			};
			
	   	    geocoder.coord2Address(coord.getLng(), coord.getLat(), function(result) {
	   	    	console.log(result[0].address.address_name);
   	    		marker(result[0].address.address_name, '내 위치');
	   	    });
   	        
   	    } 
   	    else {
		    alert("접근차단하신 경우 새로고침, 아닌 경우 잠시만 기다려주세요.");
		    gps_check();
   	    }
   	    
   	}
   	
   	function relayout() {
   		
   	    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
   	    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
   	    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
   	    map.relayout();
   	}
</script>
</html>