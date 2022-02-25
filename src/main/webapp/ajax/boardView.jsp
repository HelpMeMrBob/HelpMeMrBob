<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>♥손준영 바보♥</title>
<!-- 부트스트랩 CSS코어, JS코어 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
$(function(){
    $('#btnBoard').click(function(){
        $.ajax({
            type : 'get',						// 전송방식
            url : '../restapi/boardView.do',	// 요청URL
            data : {num : $('#num').val()},		// 파라미터는 게시물의 일련번호
            contentType : "text/html;charset:utf-8",
            dataType : "json",		// 콜백데이터의 형식
            success : sucCallBack,
            error : errCallBack
        });
    });
    $('#btnBoard').trigger('click');
});
function sucCallBack(resData){
	// 콜백받은 데이터를 각각의 td태그에 삽입한다.
    let tableData = "";
    $('#td1').html(resData.num);
    $('#td2').html(resData.id);
    $('#td3').html(resData.postdate);
    $('#td4').html(resData.visitcount);
    $('#td5').html(resData.title);
    $('#td6').html(resData.content);
}
function errCallBack(errData){
    console.log(errData.status +":"+ errData.statusText);
}
</script>
</head>
<body>
<div class="container">
    <h2>게시판 API 활용하여 내용 출력하기</h2>
    <table class="table table-bordered">
        <tr>
            <th>번호</th><td id="td1"></td>
            <th>아이디</th><td id="td2"></td>
        </tr>
        <tr>
            <th>작성일</th><td id="td3"></td>
            <th>조회수</th><td id="td4"></td>
        </tr>
        <tr>
            <th>제목</th><td colspan="3" id="td5"></td>
        </tr>
        <tr>
            <th>제목</th><td colspan="3" id="td6"></td>
        </tr>
    </table>
    <div>
        <input type="text" id="num" value="13">
        <input type="button" value="내용불러오기" id="btnBoard" />
    </div>
</div>
</body>
</html>