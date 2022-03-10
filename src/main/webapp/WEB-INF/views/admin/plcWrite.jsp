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
    	
    	#place, #plcNum, #operTime, #address_kakao, #address_detail, #menu, #price { border: none; }
    	
    	#addBtn { border: 0; background-color:transparent; }
    	#xBtn { border: 0; background-color:transparent; }
    	#addBtn2 { border: 0; background-color:transparent; }
    	#xBtn2 { border: 0; background-color:transparent; }
    </style>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	//카카오 지도 API 이용하여 주소 입력
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
	
	//유효성 검사
    function checkValidate(f){
		if(f.place.value==""){
			alert("식당 이름을 입력하세요");
			f.place.focus();
			return false;
		}
		if(f.address_kakao.value==""){
			alert("클릭해서 주소 찾기");
			f.address_kakao.focus();
			return false;
		}
		if(f.address_detail.value==""){
			alert("상세 주소를 입력하세요");
			f.address_detail.focus();
			return false;
		}
		if(f.plcNum.value==""){
			alert("식당의 전화번호를 입력하세요");
			f.plcNum.focus();
			return false;
		}
		if(f.operTime.value==""){
			alert("식당 운영 시간을 입력하세요");
			f.operTime.focus();
			return false;
		}
	}
	
	//메뉴 input태그 추가 부분
    const add_textbox = () => {
        const box = document.getElementById("box");
        const newP = document.createElement('p');
        newP.innerHTML = "<input type='text' id='menu' name='menu'> <button type='button' id='xBtn' onclick='remove(this)'><i class='bi bi-patch-minus'></i></button>";
        box.appendChild(newP);
    }
    const remove = (obj) => {
        document.getElementById('box').removeChild(obj.parentNode);
    }
    
    //가격 input태그 추가 부분
    const add_textbox2 = () => {
        const box = document.getElementById("box2");
        const newP = document.createElement('p');
        newP.innerHTML = "<input type='text' id='price' name='price'> <button type='button' id='xBtn2' onclick='remove2(this)'><i class='bi bi-patch-minus'></i></button>";
        box.appendChild(newP);
    }
    const remove2 = (obj) => {
        document.getElementById('box2').removeChild(obj.parentNode);
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
							action="plcAction.do" onsubmit="return checkValidate(this);"> 
							
							<table class="table table-bordered" id="vsTb">
								
								 <colgroup>
								 	<col width=10%>
						            <col width=*>
					 	        </colgroup>
							
								<tr>
									<th class="table-primary">식당명</th>
									<td>
									<input type="text" name="place" id="place" style="width:1000px;"/>
									</td>
								</tr>
								<tr>
									<th class="table-primary" >주소</th>
									<td>
									<input type="text" id="address_kakao" name="address" style="width:1000px;" readonly />
									</td>
								</tr>
								<tr>
						            <th class="table-primary">상세 주소</th>
						            <td><input type="text" name="address_detail" id="address_detail" style="width:1000px;"/></td>
						        </tr>
								<tr>
									<th class="table-primary">전화번호</th>
									<td>
									<input type="text" name="plcNum" id="plcNum" style="width:1000px;"/>
									</td>
								</tr>
								<!-- 메뉴 추가 부분 -->
								<tr>
									<th class="table-primary">메뉴</th> 
									<td>
									<div id="box">
				                       <input type="text" id="menu" name="menu">
				                       <button type="button" onclick="add_textbox()" id="addBtn"><i class="bi bi-patch-plus-fill"></i></button>
				                   	</div>
									</td>
								</tr>
								<!-- 가격 추가 부분 -->	
								<tr>
									<th class="table-primary">가격</th>
									<td>
									<div id="box2">
				                       <input type="text" id="price" name="price">
				                       <button type="button" onclick="add_textbox2()" id="addBtn2"><i class="bi bi-patch-plus-fill"></i></button>
				                   	</div>
									</td>
								</tr>
								<tr>
									<th class="table-primary">운영 시각</th>
									<td>
									<input type="text" name="operTime" id="operTime" style="width:1000px;"/>
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
