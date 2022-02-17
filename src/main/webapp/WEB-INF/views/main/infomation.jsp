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
</script>

<style>
#sidebar {background-color: pink;}
</style>

<body class="video-bg-homepage">
  
	<!-- HEADER -->  
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
	
    <main>
    
    <!-- 왼쪽 사이드 바 -->
    <div>
	    <div id="sidebar" style="float: left;width: 300px; height: 87vh;">
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
	   		<div id="search" style="height: 30px;">
	   		<form action="./restaurant.do" method="get">
	   			<span style="font-size: 16px;">검색 : </span>
				<input type="text" name="search" style="width: 100px;height: 40px;"/>
				<button type="submit" style="font-size: 14px;width: 10px;height: 10px;" class="btn btn-primary">Search</button>
	   		</form>
	   		</div>
	   		
	   		<!-- 즐겨찾기 -->
	   		<div id="favorite" class="m-5">
	   			<button type="submit" class="btn btn-warning">즐겨찾기 등록</button>
	   		</div>
	   		
	   		<!-- 지도에서 내 현재 위치로 가기 -->
	   		<div align="center">
	   			<button type="button" class="btn btn-primary" onclick="panTo()">내 위치</button>
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
    
    <!-- 카카오 지도 API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1c4c2a88f75c42cd25f8a7382dc6c49"></script>
    <script>
      	var container = document.getElementById('map');
      	var options = {
      			center : new kakao.maps.LatLng(37.47868297981449, 126.87866945602173),
      			level : 4
      	};
      	var map = new kakao.maps.Map(container, options);
      	
      	function panTo() {
      	    // 이동할 위도 경도 위치를 생성합니다 
      	    var moveLatLon = new kakao.maps.LatLng(37.4722797, 126.8909263);
      	    
      	    // 지도 중심을 부드럽게 이동시킵니다
      	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
      	    map.panTo(moveLatLon);            
      	}
      	
      	function relayout() {
      		
      	    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
      	    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
      	    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
      	    map.relayout();
      	}
      	
     // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
      	if (navigator.geolocation) {
      	    
      	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
      	    navigator.geolocation.getCurrentPosition(function(position) {
      	        
      	        var lat = position.coords.latitude, // 위도
      	            lon = position.coords.longitude; // 경도
      	        
      	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
      	            message = '<div style="padding:5px;">내 위치</div>'; // 인포윈도우에 표시될 내용입니다
      	        
      	        // 마커와 인포윈도우를 표시합니다
      	        displayMarker(locPosition, message);
      	        
      	    });
      	    
      	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
      	    
      	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
      	        message = 'geolocation을 사용할수 없어요..'
      	        
      	    displayMarker(locPosition, message);
      	}

      	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
      	function displayMarker(locPosition, message) {

      	    // 마커를 생성합니다
      	    var marker = new kakao.maps.Marker({
      	        map: map,
      	        position: locPosition
      	    });
      	    
      	    var iwContent = message, // 인포윈도우에 표시할 내용
      	        iwRemoveable = true;

      	    // 인포윈도우를 생성합니다
      	    var infowindow = new kakao.maps.InfoWindow({
      	        content : iwContent,
      	        removable : iwRemoveable
      	    });
      	    
      	    // 인포윈도우를 마커위에 표시합니다 
      	    infowindow.open(map, marker);
      	    
      	    // 지도 중심좌표를 접속위치로 변경합니다
      	    map.setCenter(locPosition);
      	}
    </script>
	
    </main><!-- main ends -->
	
	<!-- SEARCH -->
    <jsp:include page="/WEB-INF/views/include/search.jsp" />
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
	
</body>
</html>