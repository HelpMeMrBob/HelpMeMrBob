<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){
			
			location.href = "/login";
					    
		})
	
		$("#submit").on("click", function(){
			if($("#userId").val()==""){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			if($("#userPass").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}
			if($("#userName").val()==""){
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
		});
	})
</script>
<body>
		<form action="/member/memberRegister" method="post">
			<div class="form-group has-feedback">
				<input class="form-control" type="text" value="아이디" />
				<input class="form-control" type="text" id="id" name="id" />
			</div>
			<div class="form-group has-feedback">
				<input class="form-control" type="text" value="이름" />
				<input class="form-control" type="text" id="name" name="name" />
			</div>
			<div class="form-group has-feedback">
				<input class="form-control" type="text" value="비밀번호" />
				<input class="form-control" type="password" id="pass" name="pass" />
			</div>
			<div class="form-group has-feedback">
				<input class="form-control" type="text" value="이메일" />
				<input class="form-control" type="text" id="email" name="email" />
			</div>
			<div class="form-group has-feedback">
				<input class="form-control" type="text" value="핸드폰 번호" />
				<input class="form-control" type="text" id="telNum" name="telNum" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
</body>
</html>