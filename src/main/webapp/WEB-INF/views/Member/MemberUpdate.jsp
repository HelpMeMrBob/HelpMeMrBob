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
					<td style="width: 15%;">
						<button onclick="location.href='./mypage.do';"
								style="background-color: #FFFFFF; color: #ED6A5A;
									   width: 100%; height: 80px; font-size: 18px;
		  							   ">
							나의 정보 보기
						</button>
					</td>
					<td style="width: 15%;">
						<button onclick="location.href='./mylist.do';"
								style="background-color: #FFFFFF; color: #ED6A5A;
									   width: 100%; height: 80px; font-size: 18px;
		  							   border-left: 1px solid #DFDFDF;
		  							   border-right: 1px solid #DFDFDF;">
							나의 작성 목록
						</button>
					</td>
					<td style="width: 15%;">
						<button onclick="location.href='./myscrap1.do';"
								style="background-color: #FFFFFF; color: #ED6A5A;
									   width: 100%; height: 80px; font-size: 18px;
		  							   border-right: 1px solid #DFDFDF;">
							나의 스크랩 목록
						</button>
					</td>
					<td style="width: 15%;">
						<button onclick="location.href='./memberUpdate.do';"
								style="background-color: #ED6A5A; color: #FFFFFF;
									   width: 100%; height: 80px; font-size: 18px;
		  							   ">
							회원 정보 수정
						</button>
					</td>
				</tr>
			</table>
		<div style="width: 100%; margin-Top:1%;">
			<form action="./memberUpdateAction.do" method="post">
			<table style="width: 60%; color: #000000; font-size: 14px;
						border: 1px solid #DFDFDF; padding: 10px; ">
				<tr>
					<td style="width: 50%; padding: 10px;">
						<input type="text" value="아이디" readonly 
							style="width: 25%; height: 60px; text-align: center;
								   background-color: #ED6A5A; color: #F5F5F5;
								   border: none; border-radius: 20px;"/>
						<input type="text" id="id" name="id"
							style="width: 70%; height: 60px; padding-left: 30px; border: none;
								   border: none; border-bottom: 1px solid #DFDFDF"
							value=${ sessionScope.siteUserInfo.id } readonly />
					</td>
					<td colspan="2" rowspan="4"
						style="width: 50%; margin: 20px; border: 1px solid #000000; text-align: center;">
						<h2>키워드 넣어야 함</h2>
					</td>
				</tr>
				<tr>
					<td style="padding: 10px;">
						<input type="text" value="이름" readonly 
							   style="width: 25%; height: 60px; text-align: center;
								      background-color: #ED6A5A; color: #F5F5F5;
								      border: none; border-radius: 20px;"/>
						<input type="text" id="name" name="name"
							style="width: 70%; height: 60px; padding-left: 30px; border: none;
								   border: none; border-bottom: 1px solid #DFDFDF"
							value=${ sessionScope.siteUserInfo.name } readonly />
					</td>
				</tr>
				<tr>
					<td style="padding: 10px;">
						<input type="text" value="이메일" readonly
							   style="width: 25%; height: 60px; text-align: center;
								      background-color: #ED6A5A; color: #F5F5F5;
								      border: none; border-radius: 20px;"/>
						<input type="text" id="email" name="email"
							   style="width: 70%; height: 60px; padding: 30px; bodrer: none;
							   		  border: none; border-bottom: 1px solid #DFDFDF;"
							   value=${ sessionScope.siteUserInfo.email } />
					</td>
				</tr>
				<tr>
					<td style="padding: 10px;">
						<input type="text" value="핸드폰 번호" readonly 
							   style="width: 25%; height: 60px; text-align: center;
								      background-color: #ED6A5A; color: #F5F5F5;
								      border: none; border-radius: 20px;"/>
						<input type="text" id="telNum" name="telNum"
							   style="width: 70%; height: 60px; padding-left: 30px;
							   	      border: none; border-bottom: 1px solid #DFDFDF"
							   value=${ sessionScope.siteUserInfo.telNum } />
					</td>
				</tr>
				
			
				<tr>
					<td colspan="4" style="text-align: center; padding: 40px">
						<button type="submit" id="submit"
								style="width: 120px; height: 50px; font-size: 14px;
									   background-color: #0F202E; color: #FFFFFF;
									   padding: 20px; border-radius: 10px;">
							수정완료
						</button>
						<button type="reset"
								style="width: 120px; height: 50px ; font-size:14px;
									   background-color: #FFFFFF; color: #0F202E;
									   border: 1px solid #0F202E; border-radius: 10px;">
							다시작성
						</button>
					</td>
				</tr>
			</table>
			</form>
		</div>
		</div>
    </main><!-- main ends -->
	
    <jsp:include page="/WEB-INF/views/include/search.jsp" />
	
    <!-- =================== SITE FOOTER ENDS ============================= -->
	
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
  </body>
</html>