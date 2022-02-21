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
</head>
<body>
<div class="container">
<h2>파일 업로드 결과보기</h2>

<c:forEach items="${resultList }" var="fmap" varStatus="vs">		
		<ul>
			<li>No${vs.count}</li>
			<li>제목 : ${fmap.title }</li>
			<li>원본파일명 : ${fmap.originalName }</li>
			<li>저장된파일명 : ${fmap.saveFileName }</li>			
			<li><img src="./resources/upload/${fmap.saveFileName }" style="max-width:200px;"></li>
		</ul>	
	</c:forEach>
</div>
</body>
</html>