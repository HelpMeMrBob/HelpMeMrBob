<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value = "${pageContext.request.contextPath}" />
<!-- JQUERY -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- loading in JQuery locally if CDN failed -->
<script>window.jQuery || document.write('<script src="${path}/resources/js/jquery.min.js">\x3C/script>')</script>
<!-- Owl Carousel script -->
<script src="${ path }/resources/js/plugins/owl.carousel.min.js"></script>
<!-- Main (custom) script -->
<script src="${ path }/resources/dist/js/main.min.js"></script>