<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Main CSS -->
    <link href="${path}/resources/dist/css/main.css" rel="stylesheet">

    <!-- Your page title -->
    <title>골라줘요 밥선생님</title>

    <!-- Place Custom Favicon here -->
    <link rel="shortcut icon" href="${path}/resources/include_img/bob_favicon.ico" type="image/png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- 룰렛 -->
	<link rel="stylesheet" href="${path}/resources/recommand/main.css" type="text/css" />
    <script type="text/javascript" src="${path}/resources/recommand/Winwheel.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
</head>

