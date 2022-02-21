<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script type = "text/javascript">
var isValidate = function(frm){
	var isOk = false;
	for(var i = 0; i<frm.sticker.length;i++){
		if(frm.sticker[i].checked == true){
			isOk = true;
			break;
		}
	}
	
	if(isOk != true){
		alert('구매하실 스티커를 선택해주세요.');
		return false;
	}
	
	var confirmed = confirm("정말로 구매하시겠습니까?");
	if(confirmed){
		var form = document.buyFrm;
		form.method="post"; 
		form.action="./buyProcess.do";
		form.submit(); 	
	}
}

function confirmForm(form){          
    if(form.radioTxt.checked==false){
       alert("구매할 스티커를 체크해주세요");
       return;
    }
    var confirmed = confirm("정말로 구매하시겠습니까?");
    if(confirmed==true){
       form.method="post";
       form.action="폼값전송할URL";
       form.submit();
    }
 }


</script>
</head>
<body>
<div class="container">
<h2>이모티콘 디스플레이 페이지</h2>

<br /><br />

<h3>스티커 출력하기1</h3>
<div class="container">

	<h2>이모티콘샵</h2>

	<!-- vs를 이용해서 동적으로 테이블을 출력함 -->
	<form name="buyFrm" method="get" onsubmit="return isValidate(this);">
		<table class="table table-bordered" style="width:500px; height:400px;">
			<tr>
				<c:forEach items="${fileMap }" var="file" varStatus="vs">
				<c:if test="${vs.index%3==0}"></tr><tr></c:if>
					<td>		
						&nbsp;&nbsp;
						<img src="./resources/upload/${file.key}" style="width:100px; height:100px; align:center;">
						<br/><br/><label for="${file.key }" style="algin:center;"> ${file.key }</label>
						<br/><br/>
						<input type="radio" id="iceflake" name="sticker" value="${file.key }"style="algin:center;">
					</td>
				</c:forEach>	
			</tr>
		</table>
		<button type="submit" class="btn btn-danger" >구매하기</button>
	</form>

</div>	
<br/><br/>




</body>
</html>