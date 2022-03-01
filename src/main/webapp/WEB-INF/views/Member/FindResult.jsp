<%@page import="member.model.MemberVO"%>
<%@page import="member.model.ParameterDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
<!--────────────────────────────────── SITE HEADER BEGINS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<!--─────────────────────────────────── SITE HEADER ENDS ─────────────────────────────────────-->
<!--────────────────────────────────── MAIN SECTION BEGINS ───────────────────────────────────-->
    <main>
    <div style="width: 100%">
    
   	<div style="width: 100%">
	   	<table style="width: 100%; margin-Top: 6%; text-align: center">
	   		<tr>
	   			<td style="width: 100%; padding-left: 47.1%">
	   				<img alt="LOGIN" src="./resources/include_img/bob_logo1.png"
					 style="width: 100px%; height: 100px;">
	   			</td>
	   		</tr>
	   	</table>
   	</div>


   	<div style="width: 48%; text-align: right; float: left; margin-right: 2%">
   	<form name="findForm" action="Findprocess.jsp" method="post"
		  onsubmit="return findValidate(this); ">
	<table style="width: 100%; margin:0.5px">
		<tr>
			<td>
				<label style="width: 50%; height: 60px; border: none; color: #585858;
						  	  text-align: center; font-size: 64px; margin-bottom: 5%">
						  	  ID
				</label>
			</td>
		</tr>
		<c:choose>
		<c:when test="${ not empty sessionScope.findId }">
		<tr>
			<td>
				<label style="width: 50%; height: 200px; border: 1px solid #DFDFDF;
						      padding-left: 20px; font-size: 16px; margin-bottom: 1%;
						      text-align: center;
						      padding-top: 70px; padding-Bottom: 70px">
					<strong>${ sessionScope.findId.name }</strong> 님의 아이디는<br />
					<strong>${ sessionScope.findId.id }</strong> 입니다.
				</label>
			</td>
		</tr>
		</c:when>
		<c:when test="${ not empty sessionScope.findPassword }">
		<tr>
			<td>
				<input type="text" name="name" id="name" placeholder="이름"
					   style="width: 50%; height: 60px; border: 1px solid #DFDFDF;
					   		  padding-left: 20px; font-size: 16px; margin-bottom: 1%">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="email" id="email" placeholder="이메일"
					   style="width: 50%; height: 60px; border: 1px solid #DFDFDF;
					   		  padding-left: 20px; font-size: 16px; margin-bottom: 1%">
			</td>
		</tr>
		<tr>
			<td>
				<button type="submit"
					    style="width: 50%; height: 60px; border: 1px solid #ED6A5A;
			  					   text-align: center; font-size: 16px; margin-bottom: 1%;
			  					   padding: 10px; background-color: #ED6A5A; color: #FFFFFF">
					아이디 찾기
				</button>
			</td>
		</tr>
		</c:when>
		<c:otherwise>
					<script>
						alert('정보가 일치하지 않습니다.');
						history.back();
					</script>
		</c:otherwise>
		</c:choose>
	</table>
	</form>
	</div>
   	
   	<div style="width: 48%; text-align: left; float: left; margin-left: 2%">
	<form name="findForm" action="./findPassword.do" method="post"
		onsubmit="return findValidate(this); ">
	<table style="width: 100%; margin:0.5px">
		<tr>
			<td>
				<label style="width: 50%; height: 60px; border: none; color: #585858;
						  	  text-align: center; font-size: 64px; margin-bottom: 5%">
					PASSWORD
				</label>
			</td>
		</tr>
		<c:choose>
		<c:when test="${ not empty sessionScope.findPassword }">
		<tr>
			<td>
				<label style="width: 50%; height: 200px; border: 1px solid #DFDFDF;
						      padding-left: 20px; font-size: 16px; margin-bottom: 1%;
						      text-align: center;
						      padding-top: 70px; padding-Bottom: 70px">
					<strong>${ sessionScope.findPassword.name }</strong> 님의 비밀번호를<br />
					<strong>${ sessionScope.findPassword.email }</strong>로 전송했습니다.
				</label>
			</td>
		</tr>
		</c:when>
		<c:when test="${ not empty sessionScope.findId }">
		<tr>
			<td>
				<input type="text" name="id" id="id" placeholder="아이디"
					   style="width: 50%; height: 60px; border: 1px solid #DFDFDF;
					   		  padding-left: 20px; font-size: 16px; margin-bottom: 1%">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="email" id="email" placeholder="이메일"
					   style="width: 50%; height: 60px; border: 1px solid #DFDFDF;
					   		  padding-left: 20px; font-size: 16px; margin-bottom: 1%">
			</td>
		</tr>
		<tr>
			<td>
				<button type="submit"
					    style="width: 50%; height: 60px; border: 1px solid #ED6A5A;
			  					   text-align: center; font-size: 16px; margin-bottom: 1%;
			  					   padding: 10px; background-color: #ED6A5A; color: #FFFFFF">
					비밀번호 찾기
				</button>
			</td>
		</tr>
		</c:when>
		<c:otherwise>
			<script>
				alert('정보가 일치하지 않습니다.');
				history.back();
			</script>
		</c:otherwise>
		</c:choose>
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