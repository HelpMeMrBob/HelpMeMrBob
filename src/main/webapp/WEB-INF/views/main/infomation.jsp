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
		}
		else if (flag == 'open') {
			sidebar.hidden = false;
			button.style.display = "none";
		}
	}
</script>

<body class="video-bg-homepage">
  
	<!-- HEADER -->  
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
	
    <main>
    
    <!-- 왼쪽 사이드 바 -->
    <div>
	    <div id="sidebar" style="float: left;width: 300px;">
	    	<!-- 접기 버튼 -->
	   		<div align="left" style="margin-top: 5px;margin-bottom: 5px;">
	   			<input type="button" id="close" value="접기" onclick="toggle(id);"/>
   			</div>
   			
   			<!-- 타이틀 -->
   			<div align="center" style="margin-top: 5px;margin-bottom: 5px;">
   				<span>밥&nbsp;지도</span>
	   		</div>
	   		
	   		<!-- 검색 -->
	   		<form action="./restaurant.do" method="get">
	   		<div id="search">
	   			<span>검색 : </span>
				<input type="text" name="search" style="width: 100px;"/>
				<button type="submit" style="width: auto;height: 20px;">확인</button>
	   		</div>
	   		</form>
	    </div>
	    
	    <!-- 펼치기 버튼 -->
	    <div>
    		<input type="button" id="open" value="펼치기" onclick="toggle(id);" style="display: none;"/>
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
      			level : 3
      	};
      	var map = new kakao.maps.Map(container, options);
    </script>
	
    </main><!-- main ends -->
	
	<!-- SEARCH -->
    <jsp:include page="/WEB-INF/views/include/search.jsp" />
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
	
</body>
</html>