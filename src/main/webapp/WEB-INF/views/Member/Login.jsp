<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
<!--────────────────────────────────── SITE HEADER BEGINS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<head>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
Kakao.init('189181d4e0826e0d5408d39d563ff1b6');
//	카카오 로그인
function kakaoLogin()
{
    Kakao.Auth.login
    (
    	{
      		success: function (authObj)
      		{
        		Kakao.API.request
        		(
        			{
          				url: '/v2/user/me',
          				success: function (response)
       					{
       	  					$.ajax
       	  					(
       	  						{
       	  							url: "kakaologin.do",
       	  							type: "post",
       	  							data:
       	  							{
       	  								id: response.id,
       	  								name: response.properties.nickname,
       	  								email: response.kakao_account.email
       	  							},
       	  							success: function (data)
       	  							{
       	  						    	location.href="./";
       	  							}
       	  						}
       	  					)
       					},
          				fail: function (error)
          				{
            				console.log(error)
          				},
        			}
        		)
      		},
      		fail: function (error)
      		{
        		console.log(error)
      		},
    	}
    )

}
//	카카오 로그아웃  
function kakaoLogout()
{
    if (Kakao.Auth.getAccessToken())
    {
		Kakao.API.request
		(
			{
        		url: '/v1/user/unlink',
        		success: function (response)
        		{
        			console.log(response)
        		},
        		fail: function (error)
        		{
          			console.log(error)
        		},
      		}
		)
      	Kakao.Auth.setAccessToken(undefined)
    }
}
</script>
<script>
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
	<c:choose>
		<c:when test="${ not empty sessionScope.siteUserInfo }">
		<tr>
			<td colspan="2">
				<button type="button" onclick="kakaoLogout();" 
					    style="width: 40%; height: 60px; border: 1px solid #FAE100;
 		  					   text-align: center; font-size: 16px; margin-bottom: 1%;
 		  					   padding: 10px; background-color: #FAE100; color: #3B1E1E">
					카카오톡 로그아웃
				</button>
			</td>
		</tr>
		</c:when>
		<c:otherwise>
		<tr>
			<td colspan="2">
				<button type="button" onclick="kakaoLogin();" 
					    style="width: 40%; height: 60px; border: 1px solid #FAE100;
 		  					   text-align: center; font-size: 16px; margin-bottom: 1%;
 		  					   padding: 10px; background-color: #FAE100; color: #3B1E1E">
					카카오톡 로그인
				</button>
			</td>
		</tr>
		</c:otherwise>
	</c:choose>
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