<%@page import="member.model.MemberDAOImpl"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--────────────────────────────────── SITE HEADER BEGINS ─────────────────────────────────── -->
<!--─────────────────────────────────── SITE HEADER ENDS ─────────────────────────────────────-->
<!--────────────────────────────────── MAIN SECTION BEGINS ───────────────────────────────────-->
	<main>
	<div style="width: 100%; margin-Left: 20%; margin-Right: 20%; margin-Top:5%;">
		<table style="width: 60%; margin:0.5px">
			<tr style="border: 1px solid #DFDFDF">
				<td style="width: 12%;">
					<button onclick="location.href='./mypageAnd.do';"
							style="background-color: #FFFFFF; color: #ED6A5A;
								   width: 100%; height: 80px; font-size: 18px;
	  							   ">
						나의 정보 보기
					</button>
				</td>
				<td style="width: 12%;">
					<button onclick="location.href='./myfoodAnd.do';"
							style="background-color: #FFFFFF; color: #ED6A5A;
								   width: 100%; height: 80px; font-size: 18px;
	  							   border-left: 1px solid #DFDFDF;
	  							   border-right: 1px solid #DFDFDF;">
						나의 음식 목록
					</button>
				</td>
				<td style="width: 12%;">
					<button onclick="location.href='./mylistAnd.do';"
							style="background-color: #ED6A5A; color: #FFFFFF;
								   width: 100%; height: 80px; font-size: 18px;
	  							   border-left: 1px solid #DFDFDF;
	  							   border-right: 1px solid #DFDFDF;">
						나의 작성 목록
					</button>
				</td>
				<td style="width: 12%;">
					<button onclick="location.href='./myscrapAnd.do';"
							style="background-color: #FFFFFF; color: #ED6A5A;
								   width: 100%; height: 80px; font-size: 18px;
	  							   border-right: 1px solid #DFDFDF;">
						나의 스크랩 목록
					</button>
				</td>
				<td style="width: 12%;">
					<button onclick="location.href='./memberUpdateAnd.do';"
							style="background-color: #FFFFFF; color: #ED6A5A;
								   width: 100%; height: 80px; font-size: 18px;
	  							   ">
						회원 정보 수정
					</button>
				</td>
			</tr>
		</table>
	<div>
	

	<div style="margin-left: 4%; margin-top: 3%; margin-right: 4.5%">
	<form method="get">
		<button type="button" onclick="location.href='./mylistAnd.do';"
				style="width: 5%; height: 40px; font-size: 14px;
					   background-color: #FFFFFF; color: #10212F; border: none;">
			리뷰 게시판
		</button>
		<button type="button" onclick="location.href='./mycommentlistAnd.do';"
				style="width: 5%; height: 40px; font-size: 14px; margin-right: 28%;
					   background-color: #FFFFFF; color: #10212F; border: none;
					   font-weight: bold;">
			댓글
		</button>
		<select name="searchField"
				style="width:4%; height: 40px; font-size: 12px; padding: 0px;
			   		  background-color: #FFFFFF; color: #10212F; border-radius: 5px;
			   		  text-align: center">
			<option value="title">제목</option>
			<option value="contents">내용</option>
		</select>
		
		<input type="text" name="searchTxt"
			   style="width: 10%; height: 40px; font-size: 12px; padding-left: 20px;
			   		  background-color: #FFFFFF; color: #10212F; border-radius: 5px;"/>
		<input type="submit" value="검색"
			   style="width: 3%; height: 40px; font-size: 12px; padding: 0px;
			   		  background-color: #10212F; color: #FFFFFF; border-radius: 5px"/>
	</form>
	</div>

	<div style="width: 90%; margin-Top:2%; margin-left: 2%; padding-left: 20px;">
		<table style="width: 60%; margin-top:20px; margin-bottom: 0px">
		<thead>
			<tr style="text-align: center; border-top: 1px solid #DFDFDF;
					   border-bottom: 1px solid #DFDFDF; font-size: 14px">
				<th style="width: 10%; height: 40px; padding: 20px">
					번호
				</th>
				<th style="width: 65%; height: 40px; padding: 20px">
					내용
				</th>
				<th style="width: 10%; height: 40px; padding: 20px">
					좋아요
				</th>
				<th style="width: 15%; height: 40px; padding: 20px">
					작성일
				</th>
			</tr>
		</thead>
			<c:forEach items="${ lists }" var="mylist">
			<tr style="border-top: 1px solid #DFDFDF;
					   border-bottom: 1px solid #DFDFDF; font-size: 14px">
				<td style="width: 10%; height: 15px; padding: 15px; text-align: center">
					${ mylist.virtualNum }
				</td>
				<td style="width: 65%; height: 15px; padding: 15px; padding-left: 20px">
					<a href="./reviewViewAnd.do?idx=${ mylist.idx }"
					   style="color: #000000; text-decoration: none;">
						${ mylist.contents }
					</a>

				</td>
				<td style="width: 10%; height: 15px; padding: 15px; text-align: center">
					${ mylist.recomndCnt }
				</td>
				<td style="width: 15%; height: 15px; padding: 15px; text-align: center">
					${ mylist.writedate }
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>		

	<div style="width: 90%; padding-left: 20px">
		<table style="width: 65%; height: 200px;">
			<tr>
				<td style="width: 100%; text-align: center">
					${ pagingImg }
				</td>
			</tr>
		</table>
	</div>
	</div>
	</div>
<!--──────────────────────────────────── MAIN SECTION END ────────────────────────────────────-->
 	</main>
<!--──────────────────────────────────── SITE FOOTER ENDS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
</body>
</html>