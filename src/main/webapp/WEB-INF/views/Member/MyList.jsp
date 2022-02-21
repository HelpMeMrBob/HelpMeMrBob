<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
	
  <body class="video-bg-homepage">
	
	
    <!-- =================== SITE HEADER BEGINS ============================= -->
	
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
	
    <!-- =================== SITE HEADER ENDS ============================= -->
	
	
    <!-- =================== MAIN SECTION BEGINS ============================= -->
	
    <main>
		<div style="width: 100%; margin-Left: 20%; margin-Right: 20%; margin-Top:5%;">
			<table style="width: 60%; margin:0.5px">
				<tr style="border: 1px solid #DFDFDF">
					<td style="width: 20%;">
						<button onclick="location.href='./mypage.do';"
								style="background-color: #FFFFFF; color: #ED6A5A;
									   width: 100%; height: 100px; font-size: 24px;">
							나의 정보 보기
						</button>
					</td>
					<td style="width: 20%;">
						<button onclick="location.href='./mylist.do';"
								style="background-color: #ED6A5A; color: #FFFFFF;
									   width: 100%; height: 100px; font-size: 24px;
		  							   border-left: 1px solid #DFDFDF;
		  							   border-right: 1px solid #DFDFDF;">
							나의 작성 목록
						</button>
					</td>
					<td style="width: 20%;">
						<button onclick="location.href='./memberUpdate.do';"
								style="background-color: #FFFFFF; color: #ED6A5A;
									   width: 100%; height: 100px; font-size: 24px;
		  							   ">
							회원 정보 수정
						</button>
					</td>
				</tr>
			</table>
		</div>
    </main><!-- main ends -->
    <jsp:include page="/WEB-INF/views/include/search.jsp" />
	
    <!-- =================== SITE FOOTER ENDS ============================= -->
	
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
  </body>
</html>