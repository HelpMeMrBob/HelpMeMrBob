<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	for(var i = 0; i<frm.money.length;i++){
		if(frm.money[i].checked == true){
			isOk = true;
			break;
		}
	}
	
	if(isOk != true){
		alert('충전 금액을 선택해주세요.');
		return false;
	}
	
	var confirmed = confirm("정말로 충전하시겠습니까?");
	if(confirmed){
		var form = document.buyFrm;
		form.method="post"; 
		form.action="./chargeProcess.do";
		form.submit(); 	
	}
		
}
</script>

</head>
<body>
<div class="container">
<h2>카카오 밥알 결제 페이지</h2>
<form name="buyFrm" method="get" onsubmit="return isValidate(this);">
	<table class="table table-bordered" style="width:500px; height:200px;">
		<tr>
			<td>
				1000원
				<br/>
				<input type="radio" id="1000" name="money" value="1000">		
			</td>
			<td>
				3000원
				<br/>
				<input type="radio" id="3000" name="money" value="3000">
			</td>
			<td>
				5000원
				<br/>
				<input type="radio" id="5000" name="money" value="5000">
			</td>
		</tr>
	</table>
	<button id="apibtn" type="submit" class="btn btn-danger" >충전하기</button>
</form>
</div>
</body>
</html>