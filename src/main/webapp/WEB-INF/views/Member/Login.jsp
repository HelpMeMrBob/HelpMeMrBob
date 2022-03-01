<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
<!--────────────────────────────────── SITE HEADER BEGINS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script type="text/javascript">
function loginValidate(loginForm)
{
	if (loginForm.id.value == "")
	{
		alert("아이디를 입력하세요");
		loginForm.id.focus();
		return false;
	}
	if (loginForm.pass.value == "")
	{
		alert("패스워드를 입력하세요"); 
		loginForm.pass.focus();
		return false;
	} 
}
</script>
<!--─────────────────────────────────── SITE HEADER ENDS ─────────────────────────────────────-->
<!--────────────────────────────────── MAIN SECTION BEGINS ───────────────────────────────────-->
    <main>
   	<div style="width: 100%; margin-Left: 20%; margin-Right: 20%; margin-Top:5%;
   			    text-align: center">
   	<span style="font-size:1.5em; color:red;">${ LoginNG }</span>
   	<form name="loginForm" method="post" action="./loginAction.do"
   		  onsubmit="return loginValidate(this);">
   	<input type="hidden" name="backUrl" value="${ param.backUrl }"/>
	<table style="width: 60%; margin:0.5px">
		<tr style="padding-left: 20px">
			<td colspan="2" style="width: 60%; padding-left: 45%">
				<img alt="LOGIN" src="./resources/include_img/bob_logo1.png"
					 style="width: 100px; height: 100px;">
			</td>
		</tr>
		<tr>	
			<td colspan="2">
				<label style="width: 40%; height: 60px; border: none; color: #585858;
					   		  font-size: 80px; margin-bottom: 5%">
					LOGIN
				</label>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" name="id" id="id"
					   placeholder="아이디" tabindex="1"
					   style="width: 40%; height: 60px; border: 1px solid #DFDFDF;
					   		  padding-left: 20px; font-size: 16px; margin-bottom: 1%">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="password" name="pass" id="pass"
					   placeholder="패스워드" tabindex="2"
					   style="width: 40%; height: 60px; border: 1px solid #DFDFDF;
					   		  padding-left: 20px; font-size: 16px; margin-bottom: 1%">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" tabindex="3"
					    style="width: 40%; height: 60px; border: 1px solid #ED6A5A;
 		  					   text-align: center; font-size: 16px; margin-bottom: 1%;
 		  					   padding: 10px; background-color: #ED6A5A; color: #FFFFFF">
					로그인
				</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit"
					    style="width: 40%; height: 60px; border: 1px solid #FAE100;
 		  					   text-align: center; font-size: 16px; margin-bottom: 1%;
 		  					   padding: 10px; background-color: #FAE100; color: #3B1E1E">
					카카오톡 로그인
				</button>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" onclick="location.href='./memberRegister.do';"
					    style="width: 20%; height: 30px; border: none;
		  					   text-align: left; font-size: 14px; margin-bottom: 1%;
		  					   background-color: #FFFFFF; color: #10212F">
					회원가입
				</button>
				<button type="button" onclick="location.href='./findIdPassword.do';"
					    style="width: 20%; height: 30px; border: none;
		  					   text-align: right; font-size: 14px; margin-bottom: 1%;
		  					   background-color: #FFFFFF; color: #10212F">
					아이디·비밀번호 찾기
				</button>
			</td>
		</tr>
	</table>
	</form>
	</div>
<!--──────────────────────────────────── MAIN SECTION END ────────────────────────────────────-->
 	</main>
<jsp:include page="/WEB-INF/views/include/search.jsp" />
<!--──────────────────────────────────── SITE FOOTER ENDS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
</body>
</html>