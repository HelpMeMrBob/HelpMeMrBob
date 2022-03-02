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
    	
    	#place, #plcNum, #operTime, #address_kakao, #address_detail, #menu, #price { border: none; }
    </style>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	window.onload = function(){
	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
	                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}
	</script>
    <body class="sb-nav-fixed">
        <jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">식당 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">새로운 식당 정보를 등록합니다.</li>
                        </ol>
							<div class="row">
							<form id="plcFrm" name="plcFrm" method="GET" 
							action="plcEditAction.do" > 
							
							<table class="table table-bordered" id="vsTb">
								
								 <colgroup>
								 	<col width=10%>
						            <col width=*>
						            
					 	        </colgroup>
							
								<tr>
									<th class="table-primary">식당명</th>
									<td>
									<input type="text" name="place" id="place" 
										value="${viewRow.place }" style="width:1000px;"/>
									</td>
								</tr>
								<tr>
									<th class="table-primary" >주소</th>
									<td>
									<input type="text" id="address_kakao" name="address" 
										value="${fn:split(viewRow.address, '@')[0]}" style="width:1000px;" readonly />
									</td>
								</tr>
								<tr>
						            <th class="table-primary">상세 주소</th>
						            <td><input type="text" name="address_detail" id="address_detail" 
						            	value="${fn:split(viewRow.address, '@')[1]}" style="width:1000px;"/></td>
						        </tr>
								<tr>
									<th class="table-primary">전화번호</th>
									<td>
									<input type="text" name="plcNum" id="plcNum" 
										value="${viewRow.plcNum }" style="width:1000px;"/>
									</td>
								</tr>
								<tr>
									<th class="table-primary">메뉴</th>
									<td>
									<textarea name="menu" id="menu" cols="100" rows="3">${viewRow.menu}</textarea>
									</td>
								</tr>	
								<tr>
									<th class="table-primary">가격</th>
									<td>
									<textarea name="price" id="price" cols="100" rows="3">${viewRow.price}</textarea>
									</td>
								</tr>
								<tr>
									<th class="table-primary">운영 시각</th>
									<td>
									<input type="text" name="operTime" id="operTime" 
										value="${viewRow.operTime }" style="width:1000px;"/>
									</td>
								</tr>				
								
							</table>
							<div class="col-lg-6 text-lg-end mb-1">
							<button type="submit" class="btn btn-dark" >수정</button>
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
