<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var = "path" value = "${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <link href="${path}/resources/css/MemberJoin.css" rel="stylesheet">
</head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$("#cancel").on("click", function(){
			
			location.href = "/helpmemrbob";
					    
		});
	});
	
	function vali(frm) {
		if (frm.id.value == "") {
			alert("아이디 입력좀");
			frm.id.focus();
			return false;
		}
		if (frm.pass.value == "") {
			alert("비밀번호 입력좀");
			frm.pass.focus();
			return false;
		}
		if (frm.name.value == "") {
			alert("이름 입력좀");
			frm.name.focus();
			return false;
		}
		if (frm.email.value == "") {
			alert("이메일 입력좀");
			frm.email.focus();
			return false;
		}
		if (frm.telNum.value == "") {
			alert("핸드폰 입력좀");
			frm.telNum.focus();
			return false;
		}
	}
</script>
<body>
<div class="member-register__wrapper">
		<form name="register" action="./registerAction.do" method="post"
			onsubmit="return vali(this);">
			<div class="form-group has-feedback">
				<input class="form-control" type="button" value="아이디" id="userId" readonly="readonly"/>
				<input class="form-control" type="text" id="id" name="id" />
			</div>
			<div class="form-group has-feedback">
				<input class="form-control" type="button" value="이름" id="userName" readonly="readonly"/>
				<input class="form-control" type="text" id="name" name="name" />
			</div>
			<div class="form-group has-feedback">
				<input class="form-control" type="button" value="비밀번호" id="userPass" readonly="readonly"/>
				<input class="form-control" type="password" id="pass" name="pass" />
			</div>
			<div class="form-group has-feedback">
				<input class="form-control" type="button" value="이메일" readonly="readonly"/>
				<input class="form-control" type="text" id="email" name="email" />
			</div>
			<div class="form-group has-feedback">
				<input class="form-control" type="button" value="핸드폰 번호" readonly="readonly" />
				<input class="form-control" type="text" id="telNum" name="telNum" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cancle btn btn-danger" type="button" id="cancel" onclick="cancel();">취소</button>
			</div>
		</form>
		</div>
</body>
</html>