<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function btn() {
	alert('수정이 완료되었습니다. 다시 로그인 해주세요.')
}
</script>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
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
								   width: 100%; height: 80px; font-size: 18px;">
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
		<table style="width: 60%; color: #000000; font-size: 14px; padding: 10px; ">
			<tr>
				<td style="width: 50%; padding-left: 19.5%; padding-top: 40px">
					<input type="text" value="아이디" readonly 
						   style="width: 25%; height: 60px; text-align: center;
								  background-color: #ED6A5A; color: #F5F5F5;
								  border: none; border-radius: 10px;"/>
					<input type="text" id="id" name="id"
						   style="width: 70%; height: 60px; padding-left: 30px; border: none;
							      border: none; border-bottom: 1px solid #DFDFDF;
							      font-weight: bold;"
						   value=${ sessionScope.siteUserInfo.id } readonly />
				</td>
				<td style="padding-right: 18%; padding-top: 40px;">
					<input type="text" value="이름" readonly 
						   style="width: 25%; height: 60px; text-align: center;
							      background-color: #ED6A5A; color: #F5F5F5;
							      border: none; border-radius: 10px;"/>
					<input type="text" id="name" name="name"
						   style="width: 70%; height: 60px; padding-left: 30px; border: none;
							      border: none; border-bottom: 1px solid #DFDFDF;
							      font-weight: bold;"
						   value=${ sessionScope.siteUserInfo.name } readonly />
				</td>
			</tr>


			<tr>
				<td style="padding-left: 19.5%; padding-top: 20px; padding-bottom: 40px">
					<input type="text" value="이메일" readonly
						   style="width: 25%; height: 60px; text-align: center;
							      background-color: #ED6A5A; color: #F5F5F5;
							      border: none; border-radius: 10px;"/>
					<input type="text" id="email" name="email"
						   style="width: 70%; height: 60px; padding: 30px; bodrer: none;
						   		  border: none; border-bottom: 1px solid #DFDFDF;"
						   value=${ sessionScope.siteUserInfo.email } />
				</td>
				<td style="padding-right: 18%; padding-top: 20px; padding-bottom: 60px">
					<input type="text" value="핸드폰 번호" readonly 
						   style="width: 25%; height: 60px; text-align: center;
							      background-color: #ED6A5A; color: #F5F5F5;
							      border: none; border-radius: 10px;"/>
					<input type="text" id="telNum" name="telNum"
						   style="width: 70%; height: 60px; padding-left: 30px;
						   	      border: none; border-bottom: 1px solid #DFDFDF"
						   value=${ sessionScope.siteUserInfo.telNum } />
				</td>
			</tr>
			<tr style="text-align: center;">
				<td colspan="4" style=" padding-bottom: 24px">
					<label style="font-size: 20px; font-weight: bold; color: #0F202E;
								  padding-bottom: 10px;">
						선호 음식 우선순위
					</label>
					<br />
					<label style="font-size: 12px; color: #0F202E">
						우선 순위가 5에 가까울 수록 룰렛에 반영되는 확률이 증가합니다.
					</label>
				</td>
			</tr>
			<c:forEach items="${ preference }" var="preference">
			<tr>
				<td colspan="4"
					style="width: 50%; margin: 20px; text-align: center;">
					<input type="text" value="면류" readonly
						   style="width: 15%; height: 60px; text-align: center;
								  background-color: #ED6A5A; color: #FFFFFF;
								  border: 1px solid #ED6A5A; border-radius: 10px;"/>
					<input type="text" value="${ preference.prenoodle }" readonly
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #ED6A5A; font-weight: bold;
								  border: 1px solid #ED6A5A; border-radius: 10px;" />
					<select name="prenoodle"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
						<option value="${ preference.prenoodle }"></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					&nbsp;
					<input type="text" value="밥류" readonly
						   style="width: 15%; height: 60px; text-align: center;
								  background-color: #ED6A5A; color: #FFFFFF;
								  border: 1px solid #ED6A5A; border-radius: 10px;"/>
					<input type="text" value="${ preference.presoup }" readonly
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #ED6A5A; font-weight: bold;
								  border: 1px solid #ED6A5A; border-radius: 10px;" />
					<select name="prerice"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
						<option value="${ preference.prerice }"></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<br /><br />
					<input type="text" value="국·탕류" readonly
						   style="width: 15%; height: 60px; text-align: center;
								  background-color: #ED6A5A; color: #FFFFFF;
								  border: 1px solid #ED6A5A; border-radius: 10px;"/>
					<input type="text" value="${ preference.presoup }" readonly
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #ED6A5A; font-weight: bold;
								  border: 1px solid #ED6A5A; border-radius: 10px;" />
					<select name="presoup"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
						<option value="${ preference.presoup }"></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					&nbsp;
					<input type="text" value="고기류" readonly
						   style="width: 15%; height: 60px; text-align: center;
								  background-color: #ED6A5A; color: #FFFFFF;
								  border: 1px solid #ED6A5A; border-radius: 10px;"/>
					<input type="text" value="${ preference.premeat }" readonly
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #ED6A5A; font-weight: bold;
								  border: 1px solid #ED6A5A; border-radius: 10px;" />
					<select name="premeat"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
						<option value="${ preference.premeat }"></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<br /><br />
					<input type="text" value="해산물류" readonly
						   style="width: 15%; height: 60px; text-align: center;
								  background-color: #ED6A5A; color: #FFFFFF;
								  border: 1px solid #ED6A5A; border-radius: 10px;"/>
					<input type="text" value="${ preference.preseafood }" readonly
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #ED6A5A; font-weight: bold;
								  border: 1px solid #ED6A5A; border-radius: 10px;" />
					<select name="preseafood"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
						<option value="${ preference.preseafood }"></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					&nbsp;
					<input type="text" value="튀김·분식·패스트푸드" readonly
						   style="width: 15%; height: 60px; text-align: center;
								  background-color: #ED6A5A; color: #FFFFFF;
								  border: 1px solid #ED6A5A; border-radius: 10px;"/>
					<input type="text" value="${ preference.preetc }" readonly
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #ED6A5A; font-weight: bold;
								  border: 1px solid #ED6A5A; border-radius: 10px;" />
					<select name="preetc"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
						<option value="${ preference.preetc }"></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</td>
			</tr>
			<tr>
			<td>
			</td>
			</tr>
		</c:forEach>
		
		
			<tr>
				<td colspan="4" style="text-align: center; padding: 40px">
					<button type="submit" id="submit" onclick="javascript:btn()"
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
<!--──────────────────────────────────── MAIN SECTION END ────────────────────────────────────-->
 	</main>
<jsp:include page="/WEB-INF/views/include/search.jsp" />
<!--──────────────────────────────────── SITE FOOTER ENDS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
</body>
</html>