<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--────────────────────────────────── SITE HEADER BEGINS ────────────────────────────────────-->
<script>
function btn() {
	alert('고객센터로 전송이 완료되었습니다.');
}
</script>
<script type="text/javascript">
function validate(form)
{
	if (form.name.value == "")
	{
		alert("이름을 입력하세요");
		form.name.focus();
		return false;
	}
	if (form.email.value == "")
	{
		alert("이메일을 입력하세요"); 
		form.email.focus();
		return false;
	} 
	if (form.contents.value == "")
	{
		alert("내용을 입력하세요"); 
		form.contents.focus();
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
	   		<tr>
	   			<td style="width: 100%;">
					<label style="width: 40%; height: 60px; border: none; color: #585858;
						   		  font-size: 80px; margin-bottom: 5%">
						고객센터
					</label>
	   			</td>
	   		</tr>
	   	</table>
   	</div>
   	
   	<div style="width: 100%; text-align: center;">
	<form name="form" action="./customerServiceSend.do" method="post"
		onsubmit="return validate(this); ">
	<table style="width: 100%; margin:0.5px">
		<tr>
			<td>
				<input type="text" value="이름" readonly
					   style="width: 7%; height: 60px; border: 1px solid #ED6A5A;
					   		  background-color: #ED6A5A; border-radius: 10px;
					   		  color: #FFFFFF;
						  	  text-align: center; font-size: 14px; margin-bottom: 1%"/>
			<c:choose>
				<c:when test="${ not empty sessionScope.siteUserInfo }">
				<input type="text" value="${ sessionScope.siteUserInfo.name }"
					   id="name" name="name" readonly
					   style="width: 15%; height: 60px; border: none;
							  border-Bottom: 1px solid #DFDFDF;
							  padding-left: 20px;
			  	  			  text-align: left; font-size: 14px; margin-bottom: 1%"/>
			  	</c:when>
			  	<c:otherwise>
				<input type="text" id="name" name="name" value=""
					   style="width: 15%; height: 60px; border: none;
							  border-Bottom: 1px solid #DFDFDF;
							  padding-left: 20px;
			  	  			  text-align: left; font-size: 14px; margin-bottom: 1%"/>
				</c:otherwise>
			</c:choose>
				<input type="text" value="이메일" readonly
					   style="width: 7%; height: 60px; border: 1px solid #ED6A5A;
					   		  background-color: #ED6A5A; border-radius: 10px;
					   		  color: #FFFFFF;
						  	  text-align: center; font-size: 14px; margin-bottom: 1%"/>
			<c:choose>
				<c:when test="${ not empty sessionScope.siteUserInfo }">
				<input type="text" value="${ sessionScope.siteUserInfo.email }"
					   id="email" name="email" readonly
					   style="width: 15%; height: 60px; border: none;
							  border-Bottom: 1px solid #DFDFDF;
							  padding-left: 20px;
			  	  			  text-align: left; font-size: 14px; margin-bottom: 1%"/>
			  	</c:when>
			  	<c:otherwise>
				<input type="text" id="email" name="email" value="" 
					   style="width: 15%; height: 60px; border: none;
							  border-Bottom: 1px solid #DFDFDF;
							  padding-left: 20px;
			  	  			  text-align: left; font-size: 14px; margin-bottom: 1%"/>
			  	</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" value="내용" readonly
					   style="width: 7%; height: 60px; border: 1px solid #ED6A5A;
					   		  background-color: #ED6A5A; border-radius: 10px;
					   		  color: #FFFFFF;
						  	  text-align: center; font-size: 14px; margin-bottom: 1%"/>
				<input type="text" readonly
					   style="width: 37.5%; height: 60px; border: 1px solid #ED6A5A;
							  border: none;
							  padding-left: 20px;
			  	  			  text-align: left; font-size: 14px; margin-bottom: 1%"/>
			</td>
		</tr>
		<tr>
			<td>
				<textarea id="contents" name="contents"
						  style="width: 44.5%; height: 200px; border: none;
							     border: 1px solid #DFDFDF; padding: 20px;
			  	  			     text-align: left; font-size: 14px; margin-bottom: 2%"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<button type="submit" onclick="javascript:btn()"
					    style="width: 8%; height: 60px; border: 1px solid #ED6A5A;
			  				   text-align: center; font-size: 16px; margin-bottom: 1%;
			  				   padding: 10px; background-color: #ED6A5A; color: #FFFFFF;
					    	   border-radius: 10px;">
					작성완료
				</button>
				<button type="reset"
					    style="width: 8%; height: 60px; border: 1px solid #0F202E;
			  				   text-align: center; font-size: 16px; margin-bottom: 1%;
			  				   padding: 10px; background-color: #FFFFFF; color: #0F202E;
					    	   border-radius: 10px;">
					새로작성
				</button>
			</td>
		</tr>
	</table>
	</form>
	</div>
   	
   	
	
	</div>
<!--──────────────────────────────────── MAIN SECTION END ────────────────────────────────────-->
 	</main>
<!--──────────────────────────────────── SITE FOOTER ENDS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
</body>
</html>