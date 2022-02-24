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
							style="background-color: #ED6A5A; color: #FFFFFF;
								   width: 100%; height: 80px; font-size: 18px;
	  							   border-right: 1px solid #DFDFDF;">
						나의 스크랩 목록
					</button>
				</td>
				<td style="width: 15%;">
					<button onclick="location.href='./memberUpdate.do';"
							style="background-color: #FFFFFF; color: #ED6A5A;
								   width: 100%; height: 80px; font-size: 18px;
	  							   ">
						회원 정보 수정
					</button>
				</td>
			</tr>
		</table>
	
	
	<div style="width: 100%; margin-Top:3%;">
		<table style="width: 60%; font-size: 14px; padding: 10px; text-align: center">
			<tr>
				<td>
				<button type="button" onClick="location.href='./myscrap1.do';"
						style="width: 9%; height: 40px; background-color: #10212F;
							   color: #FFFFFF; text-align: center">
						TAP 1
				</button>
				<%
					ParameterDTO parameterDTO = new ParameterDTO();
					parameterDTO.setTab(2);
					int tab = parameterDTO.getTab();
					int level = parameterDTO.getLev();
				
					if (level > 5)
					{
				%>
				<button type="button" onClick="location.href='./myscrap2.do';"
						style="width: 9%; height: 40px; background-color: #ED6A5A;
							   color: #FFFFFF; text-align: center">
						TAB 2
				</button>
				<%
					}
					if (level > 10)
					{
				%>
				<button type="button" onClick="location.href='./myscrap3.do';"
						style="width: 9%; height: 40px; background-color: #10212F;
							   color: #FFFFFF; text-align: center">
						TAB 3
				</button>
				<%
					}
					if (level > 15)
					{
				%>
				<button type="button" onClick="location.href='./myscrap4.do';"
						style="width: 9%; height: 40px; background-color: #10212F;
							   color: #FFFFFF; text-align: center">
						TAB 4
				</button>
				<%
					}
					if (level > 20)
					{
				%>
				<button type="button" onClick="location.href='./myscrap5.do';"
						style="width: 9%; height: 40px; background-color: #10212F;
							   color: #FFFFFF; text-align: center">
						TAB 5
				</button>
					<%
					}
					if (level > 25)
					{
				%>
				<button type="button" onClick="location.href='./myscrap6.do';"
						style="width: 9%; height: 40px; background-color: #10212F;
							   color: #FFFFFF; text-align: center">
						TAB 6
				</button>
					<%
					}
					if (level > 30)
					{
				%>
				<button type="button" onClick="location.href='./myscrap7.do';"
						style="width: 9%; height: 40px; background-color: #10212F;
							   color: #FFFFFF; text-align: center">
						TAB 7
				</button>
					<%
					}
					if (level > 35)
					{
				%>
				<button type="button" onClick="location.href='./myscrap8.do';"
						style="width: 9%; height: 40px; background-color: #10212F;
							   color: #FFFFFF; text-align: center">
						TAB 8
				</button>
					<%
					}
					if (level > 40)
					{
				%>
				<button type="button" onClick="location.href='./myscrap9.do';"
						style="width: 9%; height: 40px; background-color: #10212F;
							   color: #FFFFFF; text-align: center">
						TAB 9
				</button>
				<%
					}
					if (level > 45)
					{
				%>
				<button type="button" onClick="location.href='./myscrap10.do';"
						style="width: 9%; height: 40px; background-color: #10212F;
							   color: #FFFFFF; text-align: center">
						TAB 10
				</button>
				<%
					}
				%>
				</td>
			</tr>
		</table>
		
	<div style="width: 90%; margin-Top:2%; margin-left: 2%; padding-left: 20px;">
		<table style="width: 60%; margin-top:20px; margin-bottom: 0px">
			<tr style="text-align: center; border-top: 1px solid #DFDFDF;
					   border-bottom: 1px solid #DFDFDF; font-size: 14px">
				<th style="width: 5%; height: 40px; padding: 20px">
					번호
				</th>
				<th style="width: 50%; height: 40px; padding: 20px">
					제목
				</th>
				<th style="width: 10%; height: 40px; padding: 20px">
					작성자
				</th>
				<th style="width: 15%; height: 40px; padding: 20px">
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
					${ mylist.name }
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