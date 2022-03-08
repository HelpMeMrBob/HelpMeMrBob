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
			alert("아이디를 입력하세요");
			frm.id.focus();
			return false;
		}
		if (frm.pass.value == "") {
			alert("비밀번호를 입력하세요");
			frm.pass.focus();
			return false;
		}
		if (frm.name.value == "") {
			alert("이름을 입력하세요");
			frm.name.focus();
			return false;
		}
		if (frm.email.value == "") {
			alert("이메일을 입력하세요");
			frm.email.focus();
			return false;
		}
		if (frm.telNum.value == "") {
			alert("핸드폰번호를 입력하세요");
			frm.telNum.focus();
			return false;
		}
	}
</script>
<body>
<div class="member-register__wrapper">
<h1>회원 가입</h1>
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
			
			<br><br><br><br>
							
		<table style="width: 60%; color: #000000; font-size: 14px; padding: 10px; ">
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
			<tr>
				<td colspan="4"
					style="width: 50%; margin: 20px; text-align: center;">
					<input type="text" value="면류" readonly
						   style="width: 15%; height: 60px; text-align: center;
								  background-color: #ED6A5A; color: #FFFFFF;
								  border: 1px solid #ED6A5A; border-radius: 10px;"/>
					<select name="prenoodle"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
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
					<select name="prerice"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
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
					<select name="presoup"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
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
					<select name="premeat"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
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
					<select name="preseafood"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
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
					<select name="preetc"
							style="width: 7%; height: 60px; text-align: center;
								  background-color: #FFFFFF; color: #0F202E; font-weight: bold;
								  border: 1px solid #0F202E; border-radius: 10px;">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					&nbsp;
				</td>
			</tr>
		</table>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">가입하기</button>
				<button class="cancle btn btn-danger" type="button" id="cancel" onclick="cancel();">취소</button>
			</div>
		</form>
		</div>
	
    <!-- =================== SITE FOOTER ENDS ============================= -->
	
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
</body>
</html>