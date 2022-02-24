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
    	.row { width: 90% ;}
    </style>
    <body class="sb-nav-fixed">
        <jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">댓글 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">게시글에 달린 댓글을 삭제합니다.</li>
                        </ol>
							<div class="row">
							<form action="./delete.do';" name="repFrm">
							
							<div class="col-lg-12 text-lg-end mb-1">
							<button type="submit" class="btn btn-dark" id="delete" >삭제</button>
							</div>								
							<table class="table table-bordered" id="repTb">
								
								 <colgroup>
								 	<col width=5%>
						            <col width=*>
						            <col width=*>
						            <col width=*>
						            
						        </colgroup>
							
								<tr class="table-success">
									<th></th>
									<th>번호</th>
									<th>아이디</th>
									<th>내용</th>
									<th>작성일</th>
								</tr>
								
								<!-- 반복 시작 -->
								<c:forEach items="${lists }" var="row" varStatus="loop">	
								<tr>
									<td>
									<input type="checkbox" name="rno" value="${row.rno }"/>
									</td>
									<td>${row.virtualNum }</td>
									<td>${row.id }</td>
									<td>${row.contents }</td>
									<td>${row.writeDate }</td>
								</tr>
								</c:forEach>
								<!-- 반복 끝 -->
							</table>
							
							</form>
							</div>
							
					<div>		
					<table border="0" width="90%">
						<tr>
							<td align="center">
								${pagingImg}
							</td>
						</tr>
					</table>
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
