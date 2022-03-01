<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />

<style>
#locationCheck {padding: 5px;font-size: 14px;width: 160px;}
</style>

<body class="video-bg-homepage">
	
	<!-- HEADER -->  
    <jsp:include page="/WEB-INF/views/include/header2.jsp" />
	
    <main>
    	<div align="center">
   			<hr />
			<c:forEach items="${ detailView }" var="row" varStatus="loop">
				<ul style="font-size: 15px;">
					<li style="font-size:20px;font-weight:bold;">이름 : ${ row.place }</li>
					<li style="font-size:20px;">주소 : ${ row.address }</li>
					<c:if test="${ row.plcNum != 'null' }"><li>전화번호 : ${ row.plcNum }</li></c:if>
					<c:if test="${ row.plcNum == 'null' }"><li style="color:red;">전화번호 : 정보제공없음</li></c:if>
					<c:if test="${ row.menu != 'null' }"><li style="font-size:16px;font-weight:bold;">--------- 메뉴 ---------</li></c:if>
					<c:if test="${ row.menu != 'null' }">
						<c:forEach items='${ row.menu.split("@") }' var="menu" varStatus="status">
						<c:set var="price" value='${ row.price.split("@") }' />
							<li style="font-size:18px;">
								${ menu } &nbsp;
								<c:if test="${ price[status.index] != 'null' and not empty price[status.index] }"> 
									<span style="font-size:18px;">${ price[status.index] }원</span>
								</c:if>
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${ row.menu == 'null' }"><li style="color:red;">메뉴 : 정보제공없음</li></c:if>
					<li style="font-size:16px;font-weight:bold;">-------------------------</li>
					<c:if test="${ row.operTime != 'null' }"><li>영업시간 : ${ row.operTime }</li></c:if>
					<c:if test="${ row.operTime == 'null' }"><li style="color:red;">영업시간 : 정보제공없음</li></c:if>
				</ul>
				<hr />
			</c:forEach>
  		</div>
  		
  		<div align="right">
			<button id="locationCheck" type="button" class="button button-block-sm button--primary button--fill" 
				onclick="location.href='infomation.do';">지도로 돌아가기</button>
		</div>
    </main><!-- main ends -->
	
	<!-- SEARCH -->
    <jsp:include page="/WEB-INF/views/include/search.jsp" />
    
    <!-- FOOTER -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
	<!-- JQUERY -->
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
	
</body>
</html>