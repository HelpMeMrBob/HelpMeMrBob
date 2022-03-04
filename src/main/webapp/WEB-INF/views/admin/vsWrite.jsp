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
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <style>
    	.row { width: 90% ;}
    	
    	#topic{ border: none; }
    </style>
    <script>
    
    	//유효성 검사
	   function checkValidate(f){
		if(f.topic.value==""){
			alert("이번 주제를 입력해주세요.");
			f.topic.focus();
			return false;
		}
		if(f.file1.value==""){
			alert("사진 두장을 첨부해야합니다.");
			
			return false;
		}
		if(f.file2.value==""){
			alert("사진 두장을 첨부해야합니다.");
			
			return false;
		}
	}
    </script>
    <body class="sb-nav-fixed">
        <jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">투표 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">VS투표를 등록합니다.</li>
                        </ol>
							<div class="row">
							<form id="vsFrm" name="vsFrm" method="post" 
							action="uploadAction.do" enctype="multipart/form-data" onsubmit="return checkValidate(this);"> 
							
							<table class="table table-bordered" id="vsTb">
								
								 <colgroup>
								 	<col width=10%>
						            <col width=*>
						            
					 	        </colgroup>
							
								<tr>
									<th class="table-primary">주제</th>
									<td>
									<input type="text" name="topic" id="topic" style="width:1000px;"/>
									</td>
								</tr>
								<tr>
									<th class="table-primary">아이템 1</th>
									<td>
								 	<input type="file" name="file1" id="file1"/>
									</td>
								</tr>
								<tr>
									<th class="table-primary">아이템 2</th>
									<td>
									<input type="file" name="file2" id="file2"/>
									</td>
								</tr>				
							</table>
							<div class="col-lg-6 text-lg-end mb-1">
							<button type="submit" class="btn btn-dark" >등록</button>
							</div>
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
