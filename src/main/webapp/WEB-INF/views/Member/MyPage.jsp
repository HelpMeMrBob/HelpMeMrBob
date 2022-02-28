<%@page import="member.model.ParameterDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
							style="background-color: #ED6A5A; color: #FFFFFF;
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
							style="background-color: #FFFFFF; color: #ED6A5A;
								   width: 100%; height: 80px; font-size: 18px;
	  							   ">
						회원 정보 수정
					</button>
				</td>
			</tr>
		</table>
		
	<div style="width: 100%; margin-Top:1%;">
		<table style="width: 60%; color: #000000; font-size: 14px;
					border: none; padding: 10px; ">
			<%
				ParameterDTO parameterDTO = new ParameterDTO();
				
				int level = parameterDTO.getLev();
				int experience = parameterDTO.getExp();
			%>
			<tr style="text-align: center">
				<td colspan="2" style="width: 20%; padding: 10px; text-algin: center">
					<input type="text" id="id" name="id"
						style="width: 100px; height: 100px; text-align: center; border: none;
							   background-color: #10212F; color: #FFFFFF; font-size: 30px;
							   border-radius: 50px; font-weight: bold"
						value="Lv. ${ sessionScope.siteUserInfo.lev }" readonly />
				</td>
			</tr>
			<tr style="text-align: center">
				<td colspan="2" style="width: 50%; padding: 10px;">
					<label style="padding: 15px; border: none; text-align: center;
						   		  border-bottom: 1px solid #10212F; color: #10212F;">
						   		  EXP  ${ sessionScope.siteUserInfo.exp }
					</label>
					<c:forEach items="${ point }" var="point">
					<label style="padding: 15px; border: none; text-align: center;
						   		  border-bottom: 1px solid #10212F; color: #10212F;">
						POINT  ${ point.point }
					</label>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding-bottom: 0px">
					<input style="background-color: #ED6A5A; border: 1px solid #ED6A5A;
								  border-right: 1px solid #DFDFDF; width: 100%; height: 50px;
								  text-align: center; margin-top: 10px;
								  color: #FFFFFF; font-size: 16px; font-weight: bold;"
								  value="보유 스티커" readonly></input>
				</td>
				<td style="width: 50%; padding-bottom: 0px">
					<input style="background-color: #ED6A5A; border: 1px solid #ED6A5A;
								  border-right: 1px solid #DFDFDF; width: 100%; height: 50px;
								  text-align: center; margin-top: 10px; 
								  color: #FFFFFF; font-size: 16px; font-weight: bold;"
								  value="나의 취향 분석" readonly></input>
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 20px; padding-top: 5px;
						   border: 1px solid #DFDFDF; vertical-align: top;">
					<c:forEach items="${ stickers }" var="stickers">
						<img src="./resources/upload/${ stickers.temOname }"
							 style="width: 50px; height: 50px; float: left;
							 		margin: 5px">
					</c:forEach>
				</td>
				<td style="width: 50%; padding: 20px; padding-top: 5px;
						   border: 1px solid #DFDFDF; vertical-align: top;">
					<canvas id="myChart" width="100%" height="1000px"
							style="margin: 10px"></canvas>
				</td>
			</tr>
		</table>
		<c:forEach items="${ preference }" var="preference">
			<input type="hidden" id="noodle" value="${ preference.prenoodle }"/>
			<input type="hidden" id="rice" value="${ preference.prerice }"/>
			<input type="hidden" id="soup" value="${ preference.presoup }"/>
			<input type="hidden" id="meat" value="${ preference.premeat }"/>
			<input type="hidden" id="seafood" value="${ preference.preseafood }"/>
			<input type="hidden" id="etc" value="${ preference.preetc }"/>
		</c:forEach>
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	</div>
	</div>
<script type="text/javascript">
	const labels = ['면', '밥', '국·탕', '분식·튀김·패스트푸드', '해산물', '고기'];
	
	const data = {
	  labels: labels,
	  datasets: [{
	    label: '나의 음식 선호도',
	    backgroundColor: 'RGB(237, 106, 90, 0.8)',
	    borderColor: '#DFDFDF',
	    data: [
	    	document.getElementById('noodle').value,
	    	document.getElementById('rice').value,
	    	document.getElementById('soup').value,
	    	document.getElementById('etc').value,
	    	document.getElementById('seafood').value,
	    	document.getElementById('meat').value],
	  }]
	};

	const config = {
	  type: 'radar',
	  data: data,
	};
</script>

<script>
	const myChart = new Chart(
	  document.getElementById('myChart'),
	  config
	);
</script>
<!--──────────────────────────────────── MAIN SECTION END ────────────────────────────────────-->
 	</main>
<jsp:include page="/WEB-INF/views/include/search.jsp" />
<!--──────────────────────────────────── SITE FOOTER ENDS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
</body>
</html>