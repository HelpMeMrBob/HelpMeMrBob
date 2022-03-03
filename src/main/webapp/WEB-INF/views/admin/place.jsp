<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    	#searchFrm { border : none ;}
    	#searchBtn { border : none ; background-color:transparent;}
    	#searchWord { border: 0; border-bottom: #000000 1px solid; width: 400px; }
    </style>
    
    <body class="sb-nav-fixed">
        <jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">식당 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">식당 정보를 관리합니다.</li>
                        </ol>
                       		<!-- 검색폼 -->
                       		<div class="row1">
                       		<form method="get">
							<table name="searchFrm" id="searchFrm">
							<tr>
								<td>
									<select name="searchColumn">
										<option value="place">식당명</option>
										<option value="menu">음식명</option>
									</select>
									<input type="text" name="searchWord" id="searchWord" />
									<button type="submit" id="searchBtn"><i class="bi bi-search"></i></button>
								</td>
							</tr>	
							</table>	
							</form>
							</div>
							
							<!-- 내용 출력 부분 -->							
							<div class="row">
							<form action="" name="plcFrm" >
							
							<div class="col-lg-12 text-lg-end mb-1">
							<button type="button" class="btn btn-primary" id="write" 
								onclick="location.href='plcWrite.do';">식당 등록</button>
							</div>
														
							<!-- 반복 시작 -->

							<c:forEach items="${lists }" var="row" varStatus="loop">	
							
							<table class="table table-bordered" id="infomTb" >
							<colgroup>
								<col width=10%/>
								<col width=40%/>
								<col width=40%/>
								<col width=10%/>
							</colgroup>
								
							<tr>
							
								<tr>
									<td>식당</td>
									<td colspan="2">${row.place }</td>
									<td rowspan="5" style="margin: auto; text-align:center;">
									<button type="button" class="btn btn-secondary btn-sm" 
										onclick="location.href='./plcEdit.do?idx=${row.idx}';">수정</button>
									<button type="button" class="btn btn-dark btn-sm" 
										onclick="location.href='./plcDelete.do?idx=${row.idx}';">삭제</button>
									</td>
								</tr>
								<tr>
									<td colspan="1">메뉴 및 가격</td>

									<td>${fn:replace(row.menu, '@', '<br>')}</td>
									<td>${fn:replace(row.price, '@', '<br>')}</td>
								</tr>
								<tr>
									<td>주소</td>
									<td colspan="2">${row.address }</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td colspan="2">${row.plcNum }</td>
								</tr>
								<tr>
									<td>운영시간</td>
									<td colspan="2">${row.operTime }</td>
								</tr>					
							</table>
							</c:forEach>
							<!-- 반복 끝 -->
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
