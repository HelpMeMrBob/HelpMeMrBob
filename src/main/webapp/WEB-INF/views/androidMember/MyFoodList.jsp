<%@page import="member.model.ParameterDTO"%>
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
								   width: 100%; height: 80px; font-size: 18px;">
						나의 정보 보기
					</button>
				</td>
				<td style="width: 12%;">
					<button onclick="location.href='./myfoodAnd.do';"
							style="background-color: #ED6A5A; color: #FFFFFF;
								   width: 100%; height: 80px; font-size: 18px;">
						나의 음식 목록
					</button>
				</td>
				<td style="width: 12%;">
					<button onclick="location.href='./mylistAnd.do';"
							style="background-color: #FFFFFF; color: #ED6A5A;
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
		
	<div style="width: 100%; margin-Top:1%;">
		<table style="width: 60%;">
			<tr>
				<td style="width: 60%; text-align: center;
						   padding-Bottom: 0px; padding-Top: 3%;">
					
					<label style="font-size: 40px; font-weight: bold; color: #585858">
						나의 음식 목록
					</label>

					<br />
					<label style="font-size: 14px; padding-Top: 1%">
						체크한 메뉴는 룰렛에 선택될 확률이 올라갑니다.<br />
						최대 10개까지 선택이 가능하니 신중하게 선택해주세요.
					</label>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; text-align: center; padding-Top: 3%;">
					<button type="button" onclick="location.href='./myfoodAnd.do';"
						   style="width: 16%; height: 40px; background-color: #ED6A5A;
								  border: 1px solid #ED6A5A; margin: 1px; color: #FFFFFF;
								  font-size: 14px; border-radius: 5px;
								  text-align: center; padding: 1px">
							나의 첫번째 목록
					</button>
					<c:if test="${ sessionScope.AndroidID.lev >= 10 }">
					<button type="button" onclick="location.href='./myfood2And.do';"
						   style="width: 16%; height: 40px; background-color: #FFFFFF;
								  border: 1px solid #10212F; margin: 1px;
								  font-size: 14px; border-radius: 5px;
								  text-align: center; padding: 1px">
							나의 두번째 목록
					</button>
					</c:if>
					<c:if test="${ sessionScope.AndroidID.lev >= 20 }">
					<button type="button" onclick="location.href='./myfood3And.do';"
						   style="width: 16%; height: 40px; background-color: #FFFFFF;
								  border: 1px solid #10212F; margin: 1px;
								  font-size: 14px; border-radius: 5px;
								  text-align: center; padding: 1px">
							나의 세번째 목록
					</button>
					</c:if>
					<c:if test="${ sessionScope.AndroidID.lev >= 30 }">
					<button type="button" onclick="location.href='./myfood4And.do';"
						   style="width: 16%; height: 40px; background-color: #FFFFFF;
								  border: 1px solid #10212F; margin: 1px;
								  font-size: 14px; border-radius: 5px;
								  text-align: center; padding: 1px">
							나의 네번째 목록
					</button>
					</c:if>
					<c:if test="${ sessionScope.AndroidID.lev >= 40 }">
					<button type="button" onclick="location.href='./myfood5And.do';"
						   style="width: 16%; height: 40px; background-color: #FFFFFF;
								  border: 1px solid #10212F; margin: 1px;
								  font-size: 14px; border-radius: 5px;
								  text-align: center; padding: 1px">
							나의 다섯번째 목록
					</button>
					</c:if>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; text-align: center;
						   padding-Bottom: 0px; padding-Top: 1%;">
					<c:if test="${ countMyFood != 0 }">
					<label style="font-size: 12px; padding-Top: 1%">
						메뉴를 누르면 삭제됩니다.
					</label>
					</c:if>
					<c:if test="${ countMyFood == 0 }">
					<label style="font-size: 20px; font-weight: bold; color: #DFDFDF;
								  margin-Top: 3%">
						메뉴가 없습니다. 메뉴를 추가해주세요.
					</label>
					</c:if>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; text-align: center; padding-Left: 80px;
						   padding-right: 0px;
						   padding-Bottom: 0px; padding-Top: 1%; padding-Bottom: 3%">

					<c:forEach items="${ myFood }" var="myFood">
						<form action="./deletemyfoodAnd.do"
							  style="width:18%; height: 40px; float: left;
							  		 margin: 2px">
						<input type="hidden" name="myfood" value="${ myFood.myfood }"/>
						<input type="hidden" name="tab" value="1"/>
						<button type="submit" onclick="redirect:/"
							    style="width: 100%; height: 40px; background-color: #10212F;
									   border: 1px solid #10212F; margin: 1px;
									   font-size: 12px; border-radius: 5px; padding: 1px;
									   text-align: center; color: #FFFFFF"
								onMouseOver="this.style.backgroundColor='#FFFFFF';
											 this.style.color='#10212F'"
								onMouseOut="this.style.backgroundColor='#10212F'
											this.style.color='#FFFFFF'">
								${ myFood.myfood }
						</button>
						</form>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; text-align: center;
						   padding-Bottom: 0px; padding-Top: 0px">
					<input type="text" value="면"
						   style="width: 93%; height: 80px; background-color: #FFFFFF;
						   		  border: none; border-bottom: 1px solid #DFDFDF;
						   		  color: #ED6A5A; font-size: 40px; text-align: center"/>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; padding: 20px; padding-Left: 40px; text-align: left">
					<c:forEach items="${ food }" var="food">
						<c:if test="${ food.lgroup == 'noodle' }">
							<form action="./insertmyfoodAnd.do"
								  style="width: 16%; height: 40px; float: left; margin: 2px">
							<input type="hidden" name="myfood" value="${ food.food }"/>
							<input type="hidden" name="tab" value="1"/>
							<button type="submit"
									style="width: 100%; height: 40px; background-color: #FFFFFF;
										   border: 1px solid #ED6A5A; margin: 1px;
										   font-size: 12px; border-radius: 5px; padding: 1px"
									 onMouseOver="this.style.backgroundColor='#ED6A5A';"
									 onMouseOut="this.style.backgroundColor='#FFFFFF'">
								${ food.food }
							</button>
							</form>
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; text-align: center;
						   padding-Bottom: 0px; padding-Top: 0px">
					<input type="text" value="밥"
						   style="width: 93%; height: 80px; background-color: #FFFFFF;
						   		  border: none; border-bottom: 1px solid #DFDFDF;
						   		  color: #ED6A5A; font-size: 40px; text-align: center"/>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; padding: 20px; padding-Left: 40px; text-align: left">
					<c:forEach items="${ food }" var="food">
						<c:if test="${ food.lgroup == 'rice' }">
							<form action="./insertmyfoodAnd.do"
								  style="width: 16%; height: 40px; float: left; margin: 2px">
							<input type="hidden" name="myfood" value="${ food.food }"/>
							<input type="hidden" name="tab" value="1"/>
							<button type="submit"
									style="width: 100%; height: 40px; background-color: #FFFFFF;
										   border: 1px solid #ED6A5A; margin: 1px;
										   font-size: 12px; border-radius: 5px; padding: 1px"
									 onMouseOver="this.style.backgroundColor='#ED6A5A';"
									 onMouseOut="this.style.backgroundColor='#FFFFFF'">
								${ food.food }
							</button>
							</form>
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; text-align: center;
						   padding-Bottom: 0px; padding-Top: 0px">
					<input type="text" value="국·탕"
						   style="width: 93%; height: 80px; background-color: #FFFFFF;
						   		  border: none; border-bottom: 1px solid #DFDFDF;
						   		  color: #ED6A5A; font-size: 40px; text-align: center"/>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; padding: 20px; padding-Left: 40px; text-align: left">
					<c:forEach items="${ food }" var="food">
						<c:if test="${ food.lgroup == 'soup' }">
							<form action="./insertmyfoodAnd.do"
								  style="width: 16%; height: 40px; float: left; margin: 2px">
							<input type="hidden" name="myfood" value="${ food.food }"/>
							<input type="hidden" name="tab" value="1"/>
							<button type="submit"
									style="width: 100%; height: 40px; background-color: #FFFFFF;
										   border: 1px solid #ED6A5A; margin: 1px;
										   font-size: 12px; border-radius: 5px; padding: 1px"
									 onMouseOver="this.style.backgroundColor='#ED6A5A';"
									 onMouseOut="this.style.backgroundColor='#FFFFFF'">
								${ food.food }
							</button>
							</form>
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; text-align: center;
						   padding-Bottom: 0px; padding-Top: 0px">
					<input type="text" value="고기"
						   style="width: 93%; height: 80px; background-color: #FFFFFF;
						   		  border: none; border-bottom: 1px solid #DFDFDF;
						   		  color: #ED6A5A; font-size: 40px; text-align: center"/>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; padding: 20px; padding-Left: 40px; text-align: left">
					<c:forEach items="${ food }" var="food">
						<c:if test="${ food.lgroup == 'meat' }">
							<form action="./insertmyfoodAnd.do"
								  style="width: 16%; height: 40px; float: left; margin: 2px">
							<input type="hidden" name="myfood" value="${ food.food }"/>
							<input type="hidden" name="tab" value="1"/>
							<button type="submit"
									style="width: 100%; height: 40px; background-color: #FFFFFF;
										   border: 1px solid #ED6A5A; margin: 1px;
										   font-size: 12px; border-radius: 5px; padding: 1px"
									 onMouseOver="this.style.backgroundColor='#ED6A5A';"
									 onMouseOut="this.style.backgroundColor='#FFFFFF'">
								${ food.food }
							</button>
							</form>
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; text-align: center;
						   padding-Bottom: 0px; padding-Top: 0px">
					<input type="text" value="해산물"
						   style="width: 93%; height: 80px; background-color: #FFFFFF;
						   		  border: none; border-bottom: 1px solid #DFDFDF;
						   		  color: #ED6A5A; font-size: 40px; text-align: center"/>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; padding: 20px; padding-Left: 40px; text-align: left">
					<c:forEach items="${ food }" var="food">
						<c:if test="${ food.lgroup == 'seafood' }">
							<form action="./insertmyfoodAnd.do"
								  style="width: 16%; height: 40px; float: left; margin: 2px">
							<input type="hidden" name="myfood" value="${ food.food }"/>
							<input type="hidden" name="tab" value="1"/>
							<button type="submit"
									style="width: 100%; height: 40px; background-color: #FFFFFF;
										   border: 1px solid #ED6A5A; margin: 1px;
										   font-size: 12px; border-radius: 5px; padding: 1px"
									 onMouseOver="this.style.backgroundColor='#ED6A5A';"
									 onMouseOut="this.style.backgroundColor='#FFFFFF'">
								${ food.food }
							</button>
							</form>
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; text-align: center;
						   padding-Bottom: 0px; padding-Top: 0px">
					<input type="text" value="튀김·분식·패스트푸드"
						   style="width: 93%; height: 80px; background-color: #FFFFFF;
						   		  border: none; border-bottom: 1px solid #DFDFDF;
						   		  color: #ED6A5A; font-size: 40px; text-align: center"/>
				</td>
			</tr>
			<tr>
				<td style="width: 60%; padding: 20px; padding-Left: 40px; text-align: left">
					<c:forEach items="${ food }" var="food">
						<c:if test="${ food.lgroup == 'etc' }">
							<form action="./insertmyfoodAnd.do"
								  style="width: 16%; height: 40px; float: left; margin: 2px">
							<input type="hidden" name="myfood" value="${ food.food }"/>
							<input type="hidden" name="tab" value="1"/>
							<button type="submit"
									style="width: 100%; height: 40px; background-color: #FFFFFF;
										   border: 1px solid #ED6A5A; margin: 1px;
										   font-size: 12px; border-radius: 5px; padding: 1px"
									 onMouseOver="this.style.backgroundColor='#ED6A5A';"
									 onMouseOut="this.style.backgroundColor='#FFFFFF'">
								${ food.food }
							</button>
							</form>
						</c:if>
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>
	</div>
<!--──────────────────────────────────── MAIN SECTION END ────────────────────────────────────-->
 	</main>
<!--──────────────────────────────────── SITE FOOTER ENDS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
</body>
</html>