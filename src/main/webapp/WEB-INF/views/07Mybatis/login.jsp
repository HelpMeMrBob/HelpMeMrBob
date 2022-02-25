<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<script type="text/javascript">
function loginValidate(f)
{
	if(f.id.value==""){
		alert("아이디를 입력하세요");
		f.id.focus();
		return false;
	}
	if(f.pass.value==""){
		alert("패스워드를 입력하세요"); 
		f.pass.focus();
		return false;
	} 
}
</script>
<div class="container"> 
	<h3>방명록(로그인)</h3> 
	<c:choose>
		<c:when test="${not empty sessionScope.siteUserInfo }">
			<!-- 로그인되었을때의 페이지 출력 -->
			<div class="row" style="border:2px solid #cccccc;padding:10px;">			
				<!-- 로그인에 성공할 경우 MemberVO객체를 통해 반환받아 세션 영역에
				저장할 것이므로 아래는 각 멤버변수에 접근해서 데이터를 출력하는 것이다. -->
				<h4>아이디:${sessionScope.siteUserInfo.id }</h4>
				<h4>이름:${sessionScope.siteUserInfo.name }</h4>
				<br /><br />
				<button class="btn btn-danger" onclick="location.href='logout.do';">
					로그아웃</button>
				&nbsp;&nbsp;
				<button class="btn btn-primary" onclick="location.href='list.do';">
					방명록리스트</button>
			</div>
		</c:when>
		<c:otherwise>
			<!-- 로그인되지 않았을 떄 페이지 출력 -->
			<!-- 로그인에 실패할 경우 에러메시지 출력 부분 -->
			<span style="font-size:1.5em; color:red;">${LoginNG }</span>
			<form name="loginForm" method="post" action="./loginAction.do" onsubmit="return loginValidate(this);">
				<!-- 로그인에 성공할 경우 돌아갈 페이지 경로 -->
				<input type="hidden" name="backUrl" value="${param.backUrl }"/>
				<table class="table-bordered" style="width:50%;">
					<tr>
						<td><input type="text" class="form-control" name="id" placeholder="아이디" tabindex="1"></td>
						<td rowspan="2" style="width:80px;"><button type="submit" class="btn btn-primary" style="height:77px; width:77px;"  tabindex="3">로그인</button></td>
					</tr>
					<tr>
						<td><input type="password" class="form-control" name="pass" placeholder="패스워드" tabindex="2"></td>
					</tr>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
</div>

</body>
</html>
