<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
<!--────────────────────────────────── SITE HEADER BEGINS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script type="text/javascript">
function findValidate(findForm)
{
	if (findForm.id.value == "")
	{
		alert("아이디를 입력하세요");
		findForm.id.focus();
		return false;
	}
	if (findForm.name.value == "")
	{
		alert("이름을 입력하세요"); 
		findForm.name.focus();
		return false;
	} 
	if (findForm.email.value == "")
	{
		alert("이메일을 입력하세요"); 
		findForm.email.focus();
		return false;
	} 
}
</script>
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
	<form name="findForm" action="./findId.do" method="post"
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