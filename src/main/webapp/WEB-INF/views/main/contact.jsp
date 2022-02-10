<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
	
  <body class="video-bg-homepage">
	
	
    <!-- =================== SITE HEADER BEGINS ============================= -->
	
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
	
    <!-- =================== SITE HEADER ENDS ============================= -->
	
	
    <!-- =================== MAIN SECTION BEGINS ============================= -->
	
    <main>
	
      <!-- BANNER SECTION STARTS -->
      <div id="map" style="width: auto;height: 800px;"></div>
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
	
    <jsp:include page="/WEB-INF/views/include/search.jsp" />
	
    <!-- =================== SITE FOOTER ENDS ============================= -->
	
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
	
  </body>
	
</html>