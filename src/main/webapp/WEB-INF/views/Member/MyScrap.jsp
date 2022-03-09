<%@page import="member.model.ParameterDTO"%>
<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
<body class="video-bg-homepage">
<!--────────────────────────────────── SITE HEADER BEGINS ─────────────────────────────────── -->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<!--─────────────────────────────────── SITE HEADER ENDS ─────────────────────────────────────-->
<!--────────────────────────────────── MAIN SECTION BEGINS ───────────────────────────────────-->
	<main>
	<div style="width: 100%; margin-Left: 20%; margin-Right: 20%; margin-Top:5%;">
		<table style="width: 60%; margin:0.5px">
			<tr style="border: 1px solid #DFDFDF">
				<td style="width: 12%;">
					<button onclick="location.href='./mypage.do';"
							style="background-color: #FFFFFF; color: #ED6A5A;
								   width: 100%; height: 80px; font-size: 18px;
	  							   ">
						나의 정보 보기
					</button>
				</td>
				<td style="width: 12%;">
					<button onclick="location.href='./myfood.do';"
							style="background-color: #FFFFFF; color: #ED6A5A;
								   width: 100%; height: 80px; font-size: 18px;
	  							   border-left: 1px solid #DFDFDF;
	  							   border-right: 1px solid #DFDFDF;">
						나의 음식 목록
					</button>
				</td>
				<td style="width: 12%;">
					<button onclick="location.href='./mylist.do';"
							style="background-color: #FFFFFF; color: #ED6A5A;
								   width: 100%; height: 80px; font-size: 18px;
	  							   border-left: 1px solid #DFDFDF;
	  							   border-right: 1px solid #DFDFDF;">
						나의 작성 목록
					</button>
				</td>
				<td style="width: 12%;">
					<button onclick="location.href='./myscrap.do';"
							style="background-color: #ED6A5A; color: #FFFFFF;
								   width: 100%; height: 80px; font-size: 18px;
	  							   border-right: 1px solid #DFDFDF;">
						나의 스크랩 목록
					</button>
				</td>
				<td style="width: 12%;">
					<button onclick="location.href='./memberUpdate.do';"
							style="background-color: #FFFFFF; color: #ED6A5A;
								   width: 100%; height: 80px; font-size: 18px;
	  							   ">
						회원 정보 수정
					</button>
				</td>
			</tr>
		</table>
	
	
	<div>
	<div style="margin-left: 4%; margin-top: 3%; margin-right: 4.5%;">
	<form method="get">
	<table style="width: 100%; text-align: center">
		<tr>
			<td>
				<select name="searchField"
						style="width:4%; height: 40px; font-size: 12px; padding: 0px;
					   		  background-color: #FFFFFF; color: #10212F; border-radius: 5px;
					   		  text-align: center">
					<option value="title">제목</option>
					<option value="contents">내용</option>
				</select>
				
				<input type="hidden" name="id" value="${ sessionScope.siteUserInfo.id }" readonly
					   style="width: 10%; height: 40px; font-size: 12px; padding-left: 20px;
					   		  background-color: #FFFFFF; color: #10212F; border-radius: 5px;"/>
				<input type="text" name="searchTxt"
					   style="width: 10%; height: 40px; font-size: 12px; padding-left: 20px;
					   		  background-color: #FFFFFF; color: #10212F; border-radius: 5px;"/>
				<input type="submit" value="검색"
					   style="width: 3%; height: 40px; font-size: 12px; padding: 0px;
					   		  background-color: #10212F; color: #FFFFFF; border-radius: 5px"/>
			</td>
		</tr>
	</table>
	</form>
	</div>
	
	<div style="width: 90%; margin-Top:2%; margin-left: 2%; padding-left: 20px;">
		<table style="width: 60%; margin-top:20px; margin-bottom: 0px">
			<tr style="text-align: center; border-top: 1px solid #DFDFDF;
					   border-bottom: 1px solid #DFDFDF; font-size: 14px">
				<th style="width: 10%; height: 40px; padding: 20px">
					번호
				</th>
				<th style="width: 50%; height: 40px; padding: 20px">
					제목
				</th>
				<th style="width: 10%; height: 40px; padding: 20px">
					작성자
				</th>
				<th style="width: 10%; height: 40px; padding: 20px">
					조회수
				</th>
				<th style="width: 20%; height: 40px; padding: 20px">
					작성일
				</th>
			</tr>
		<c:forEach items="${ lists }" var="mylist">
			<tr style="border-top: 1px solid #DFDFDF;
					   border-bottom: 1px solid #DFDFDF; font-size: 14px">
				<td style="width: 10%; height: 15px; padding: 15px; text-align: center">
					${ mylist.virtualNum }
				</td>
				<td style="width: 50%; height: 15px; padding: 15px; padding-left: 20px">
					<a href="./reviewView.do?idx=${ mylist.idx }"
					   style="color: #000000; text-decoration: none;">
						${ mylist.title }
					</a>
				</td>
				<td style="width: 10%; height: 15px; padding: 15px; text-align: center">
					${ mylist.id }
				</td>
				<td style="width: 10%; height: 15px; padding: 15px; text-align: center">
					${ mylist.visitCnt }
				</td>
				<td style="width: 20%; height: 15px; padding: 15px; text-align: center">
					${ mylist.postdate }
				</td>
			</tr>
		</c:forEach>				
		</table>
	</div>	
	</div>
	</div>
<!--──────────────────────────────────── MAIN SECTION END ────────────────────────────────────-->
 	</main>
<jsp:include page="/WEB-INF/views/include/search.jsp" />
<!--──────────────────────────────────── SITE FOOTER ENDS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
</body>
</html>