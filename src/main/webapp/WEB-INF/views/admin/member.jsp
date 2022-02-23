<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${ path }/adsources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    </head>
    <style>
    	#memberTb { width: 80% ;}
    </style>
    <body class="sb-nav-fixed">
        <jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">회원 휴면 및 탈퇴 관리</li>
                        </ol>
							<div>
							<form action="" name="memberFrm">
							
							<c:forEach items="${lists }" var="row">	
							<table class="table table-bordered" id="memberTb">
								
								 <colgroup>
						            <col width=*>
						            <col width=*>
						            <col width=*>
						            <col width=*>
						            <col width=15%>
						            <col width=5%>
						        </colgroup>
							
								<tr class="table-success">
									<th>아이디</th>
									<th>이름</th>
									<th>이메일</th>
									<th>전화번호</th>
									<th>활성화/비활성화</th>
									<th>선택</th>
								</tr>
								<tr>
									<td>${row.id }</td>
									<td>${row.name }</td>
									<td>${row.email }</td>
									<td>${row.telNum }</td>
									<td>
									 <select name="select1">
						                <option value="On">활성화</option>
						                <option value="Off">비활성화</option>
						            </select>
									</td>
									<td>
									<input type="radio" name="select2" value="black"/>
									</td>
								</tr>
							</table>
							</c:forEach>
							</form>
							</div>
							
							                        
                    </div>
                </main>
                <jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${ path }/adsources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${ path }/adsources/assets/demo/chart-area-demo.js"></script>
        <script src="${ path }/adsources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${ path }/adsources/js/datatables-simple-demo.js"></script>
    </body>
</html>
