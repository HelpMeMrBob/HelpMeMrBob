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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type = "text/javascript">
	$(function(){
			console.log("hello");
			//url은 kakapay2지만, 이모티콘 폴더 밑이라서 mapping 경로가 달라진다.
			$.ajax({
				url:'kakaopay2' ,
				dataType : 'json',
				success:function(data){
					alert("ajax 통신완료");
					alert(data.tid);
					var box = data.next_redirect_pc_url;
					window.open(box);
				},
				error: function(error){
					alert(error);
				}
			});	
	});
</script>
</head>
<body>
<div class="container">

<h2>카카오충전 밥알 교환 페이지 </h2>

</div>
</body>
</html>