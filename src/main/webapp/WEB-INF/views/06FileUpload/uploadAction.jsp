<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/springlegacy/static/bootstrap5.1.3/css/bootstrap.css" />
<script src="/springlegacy/resources/jquery/jquery-3.6.0.js"></script>
</head>
<body>
<div class="container">
	<h2>파일 업로드 결과보기</h2>
	
	<a href="./uploadForm.do">
		파일업로드 폼 바로가기
	</a>
	<!-- model객체에 저장된 갯수만큼 반복 출력함. -->
	<c:forEach items="${resultList }" var="fmap" varStatus="vs">		
		<ul>
			<li>No${vs.count}</li>
			<li>제목 : ${fmap.title }</li>
			<li>원본파일명 : ${fmap.originalName }</li>
			<li>저장된파일명 : ${fmap.saveFileName }</li>			
			<li><img src="../static/upload/${fmap.saveFileName }" style="max-width:200px;"></li>
		</ul>	
	</c:forEach>
</div>
</body>
</html>