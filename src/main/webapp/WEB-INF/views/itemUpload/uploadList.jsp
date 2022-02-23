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
    <body class="sb-nav-fixed">
        <jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">관리자 전용 페이지</h1>
                        <br/><br/><br/>
                        <h2>아이템 등록 결과(성공)</h2>
                        <ol class="breadcrumb mb-4">
                           <c:forEach items="${fileMap }" var="file" varStatus="vs">		
								<li>
									파일명 : ${file.key }
									&nbsp;&nbsp;
									<!--  
									fileName : 서버에 저장된 파일명
									oriFileName : 원본 파일명
									-->
									<!-- 
										다운로드시 원본파일명으로 변경하려면 기존파일명을 DB에
										저장해야 하므로, 여기서는 "임시파일명"으로 변경한다.  
									-->
								</li>
								<br/>
							</c:forEach>	
                        </ol>		                        
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
