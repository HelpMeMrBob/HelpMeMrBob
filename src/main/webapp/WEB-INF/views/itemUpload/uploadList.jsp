<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/springlegacy/static/bootstrap5.1.3/css/bootstrap.css" />
<script src="/springlegacy/resources/jquery/jquery-3.6.0.js"></script>
</head>
<body>
<div class="container">

	<h2>upload폴더의 파일목록 보기(후에 디스플레이 페이지로 변경)</h2>

	<ul>
	<c:forEach items="${fileMap }" var="file" varStatus="vs">		
		<li>
			파일명 : ${file.key }
			&nbsp;&nbsp;
			<!--  
			fileName : 서버에 저장된 파일명
			oriFileName : 원본 파일명
			-->
			
			<li><img src="./resources/upload/${file.key }" style="width:100px; height:100px; align:center;"></li>
			<!-- 
				다운로드시 원본파일명으로 변경하려면 기존파일명을 DB에
				저장해야 하므로, 여기서는 "임시파일명"으로 변경한다.  
			-->
		</li>
	</c:forEach>	
	</ul>
</div>
</body>
</html>