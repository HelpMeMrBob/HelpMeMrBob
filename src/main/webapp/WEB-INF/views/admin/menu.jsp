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
    	.div1 { width: 45%;}
    	#food { border: 0; border-bottom: #000000 1px solid; width: 400px; }
    	#addBtn { border: 0; background-color:transparent;}
    	#xbtn { border: 0; background-color:transparent; }
    </style>
    <script type="text/javascript">
    
     //Ajax로 비동기 삭제 
   	 function deleteValue(value) {
	   	
	 	 var url = "foodDelete.do";
	 	  
	 	   $.ajax({
	 	       url: url
	 	       , type: 'post'
	 	       , dataType: 'text'
	 	       , data:  {
    	    	   idx : value
    	       }
	 	   });
	 	}
   	 
   	//유효성 체크
   	function checkValidate(f){
		if(f.food.value==""){
			alert("추가할 음식명을 입력하세요");
			f.food.focus();
			return false;
		}
		if(f.file.value==""){
			alert("음식에 대한 이미지를 첨부합니다.");
			f.file.focus();
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
                        <h1 class="mt-4">메뉴 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">룰렛 및 월드컵의 음식 항목들을 관리합니다.</li>
                        </ol>
							
							<div class="div1">
							<form action="foodAction.do" enctype="multipart/form-data" method="post"
								onsubmit="return checkValidate(this);">
							<table class="table table-borderless" id="addTb">
								<colgroup>
						            <col width=*>
						            <col width=5%>
						        </colgroup>
								<tr>
									<td>
									<select name="Lgroup" id="Lgroup">
										<option value="noodle">noodle</option>
										<option value="rice">rice</option>
										<option value="soup">soup</option>
										<option value="meat">meat</option>
										<option value="seafood">seafood</option>
										<option value="etc">etc</option>
									</select>
									<strong>추가할 항목 입력</strong> : <input type="text" name="food" id="food" />	
									</td>
									<td>
									<button type="submit" id="addbtn"><i class="bi bi-plus-circle-fill"></i></button>
									</td>
								</tr>
								<tr>
									<td>
									<input type="file" id="file" name="file" />
									</td>
								</tr>
							</table>
							</form>
							</div>
							
							<div class="row">
							<form name="foodFrm" method="POST" >
							<table class="table table-bordered" id="foodTb">
								
								 <colgroup>
								 	<col width=5%>
						            <col width=*>
						            <col width=5%>
						        </colgroup>
							
								<tr class="table-success">
									<th>번호</th>
									<th>메뉴</th>
									<th>삭제</th>
								</tr>
								
								<!-- 반복 시작 -->
								<c:forEach items="${lists }" var="row" varStatus="loop">	
								<tr>
									<td>${row.virtualNum }</td>
									<td>${row.food }</td>
									<td align="center">
									<button type="submit" id="xbtn" onclick="deleteValue(${row.idx });">
									<i class="bi bi-x-circle"></i>
									</button>
									</td>
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
