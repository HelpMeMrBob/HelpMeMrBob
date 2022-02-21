<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="container">
<h2>카카오페이 실행</h2>
<script type = "text/javascript">
	$(function(){
		$('#apibtn').click(function(){
			console.log("hello");
			//url은 kakapay2지만, 이모티콘 폴더 밑이라서 mapping 경로가 달라진다.
			$.ajax({
				url:'kakaopay2' ,
				dataType : 'json',
				success:function(data){
					alert("ajax 통신완료");
					alert(data.tid);
					alert(data.total_amount);
					var box = data.next_redirect_pc_url;
					window.open(box);
				},
				error: function(error){
					alert(error);
				}
			});	
		});
	});
	</script>
	
	<button id="apibtn" class="btn btn-primary">카카오페이</button>

</div>
</body>
</html>