<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<style>
	#menu {
		border: 6px solid #ed6a5a; 
		width: 400px;
		height: 50px;
		text-align: center;
		font-size: 2rem;
		color: #ed6a5a; 
		font-weight: bold;
		cursor:default;
		margin-bottom: 10px;
	}
	#changeMenu, #UnchangeMenu {
		border: 2px solid #ed6a5a; 
		width: 150px;
		height: 40px;
		text-align: center;
		font-size: 1.2rem; 
		color: white; 
		font-weight: bold;
		background-color: #ed6a5a;
		margin-bottom: 10px;
		border-radius: 10px;
		display: none;
	}
	#goInfo {
		border: 2px solid white;
		all: unset;
		width: 200px; 
		height: 40px; 
		text-align: center;
		font-size: 1.2rem; 
		color: white;
		font-weight: bold; 
		background-color: #0a151f;
		cursor: pointer;
		margin-bottom: 10px;
		border-radius: 10px;
	}
	#menuCount, #addOption, #notMember {
		display: inline-block;
		width: auto;
		height: 40px;
		font-size: 1.2rem; 
		cursor: pointer;
		margin-bottom: 10px;
		margin-right: 5px;
	}
	#expandR {
		
	}
</style>
<body>
	<!-- =================== SITE HEADER BEGINS ============================= -->
	
	<jsp:include page="/WEB-INF/views/include/header2.jsp" />
	
	<!-- =================== SITE HEADER ENDS ============================= -->
	
	<!-- =================== MAIN SECTION BEGINS ============================= -->
	<main>
		
		<!-- 랜덤 룰렛 STARTS -->
    	<section class="ministries text-center-sm default-section-spacing mar-t-md-2">
        	<div class="ministries__content">
			    <div class="container">
				    <div class="row">
			            <div class="flex-md-5"><!-- 룰렛 -->
			            	<form action="./restaurant.do">
				            	<div>
				            		<input type="text" name="menu" id="menu" placeholder="메뉴 개수를 선택해 주세요." 
										value="" readonly>
									<button type="submit" id="goInfo" style="visibility: hidden;">근처 식당보기</button>
				            	</div>
				            	<div>
			            			<a>
										<select class="form-select" name="menuCount" id="menuCount"
											onchange="setCount(this.value);" style="background-color: #eaada6;">
							   				<option value="0">메뉴 개수 선택</option>
							   				<option value="10">10개</option>
							   				<option value="15">15개</option>
							   				<option value="20">20개</option>
							   				<option value="30">30개</option>
							   			</select>
							   			<c:choose>
											<c:when test="${ not empty sessionScope.siteUserInfo }">
												<select class="form-select" name="addOption" id="addOption"
													onchange="setOption(this.value);">
									   				<option value="0">추가 옵션 선택</option>
									   				<option value="-1">&nbsp;&nbsp;&nbsp;----- 무작위 뽑기 -----</option>
									   				<option value="100">랜덤</option>
									   				<option value="-2">&nbsp;&nbsp;&nbsp;&nbsp;---------- 탭 ----------</option>
									   				<option value="1">탭1</option>
									   				<option value="-3">&nbsp;&nbsp;&nbsp;----- 선호도 반영 -----</option>
									   				<option value="10">선호 메뉴</option>
									   			</select>
										  	</c:when>
										  	<c:otherwise>
												<select class="form-select" name="notMember" id="notMember"
													onchange="askLogin(this);">
									   				<option value="0">추가 옵션 선택</option>
									   				<option value="0">&nbsp;&nbsp;&nbsp;&nbsp;---------- 탭 ----------</option>
									   				<option value="1">탭1</option>
									   				<option value="0">&nbsp;&nbsp;&nbsp;----- 선호도 반영 -----</option>
									   				<option value="100">선호 메뉴</option>
									   			</select>
											</c:otherwise>
										</c:choose>
							   			
						   			</a>
						   			<div>
							   			<button type="button" name="changeMenu" id="changeMenu" href="#"
											onClick="resetMenu(); return false;">
											메뉴 바꾸기
										</button>
										<button type="button" name="UnchangeMenu" id="UnchangeMenu" href="#"
											onClick="playWheel(); return false;">
											메뉴 그대로 뽑기
										</button>
									</div>
								</div>
							</form>
			            </div><!-- .flex-* ends -->
			            <div class="flex-md-2"><!-- 디스플레이 -->
							<table cellpadding="0" cellspacing="0" border="0">
						        <tr id="expandR">
						            <td width="438" height="582" class="the_wheel" align="center" valign="center" >
						                <canvas id="canvas" width="434" height="434">
						                   <p style="{color: white}" align="center">이 브라우저에서는 지원하지 않습니다.</p>
						               </canvas>
						           </td>
						       </tr>
						   	</table>
			            </div><!-- .flex-* ends -->
			        </div>
		        </div>
	        </div>
	    </section><!-- .welcome ends -->
	    <script>
			// 룰렛 객체를 저장할 변수
	    	let theWheel = null;
			
		    /* 룰렛 객체생성 */
	    	function showRoulette() {
		    	
		    	console.log("3. -------showRoulette() 함수 호출됨-------");
		    	// 세션 스토리지에서 값을 가져옴
	    		let menuCount = sessionStorage.getItem("menuCount");
	    		let addOption = sessionStorage.getItem("addOption");
	    		
	    		// JsonArray를 위한 배열생성
	    		let menuArr = [];
	    		// JsonObject를 위한 객체생성
	    		let menu = null;
	    		// 최종 결과 목록을 담을 배열
	    		let resultList = null;
	    		
	    		// 회원 - 로그인 상태 (회원은 추가옵션 필수선택이기 때문)
	    		if (sessionStorage.getItem("addOption") != null) {
	    			
		    		console.log("sessionStorage :: resultList :: "+ sessionStorage.getItem("resultList"))
		    		
		    		// 컨트롤러에서 전달받은 값을 담을 배열
		    		let arr = null;
	    			
		    		// resultList값이 있을때만 실행 (최초 실행시 오류발생 방지)
		    		if (sessionStorage.getItem("resultList") != null) {
			    		// 컨트롤러에서 전달받은 값을 배열에 담는다.
		        		arr = sessionStorage.getItem("resultList").split(",");
			    		console.log("arr : "+ arr[0]);
		    		}
					
		    		// 추가옵션 값이 1 또는 10 일때...
					if ( (sessionStorage.getItem("addOption")==1)
						|| (sessionStorage.getItem("addOption")==10) ) {
						for (let i=0; i<arr.length; i++) {
							menu = new Object();
							menu.fillStyle = '#ed6a5a';
							menu.text = arr[i];
				          	
							menuArr.push(menu);
						}
			    		// 룰렛에 나오는 최종목록 : JSONArray를 그대로 담는다.
			    		resultList = menuArr;
					}
					else if(sessionStorage.getItem("addOption")==100) {// 추가옵션 값이 100 일때...
						<c:forEach items="${ allData }" var="all">
							menuArr.push({'fillStyle' : '#ed6a5a', 'text' : '${all.food}'})
			            </c:forEach>
						// 룰렛에 나오는 최종목록 : JSONArray를 그대로 담는다.
						resultList = menuArr;
					}
	    		}
	    		// 비회원 (추가옵션 선택 못하기 때문)
				else {
					<c:forEach items="${ allData }" var="all">
						menuArr.push({'fillStyle' : '#ed6a5a', 'text' : '${all.food}'})
		            </c:forEach>
					// 룰렛에 나오는 최종목록 : JSONArray를 그대로 담는다.
					resultList = menuArr;
				}
				
	    		console.log("---resultList-----------------------------------------------------")
				console.log(resultList);
				
	    		console.log("4. ----------룰렛 객체 생성----------");
				console.log("룰렛 객체 생성 전 sessionStorage:: menuCount :: "+ menuCount);
				console.log("룰렛 객체 생성 전 sessionStorage:: addOption :: "+ addOption);
				
				theWheel = new Winwheel({
	                'numSegments'  : menuCount,// 표현할 메뉴 개수
	                'outerRadius'  : 212,		// 배경으로 있는 룰렛 이미지와 반지름을 맞추기 위한 설정
	                'textFontSize' : 15,		// 글자 크기
	                'segments'     : resultList,// 위에서 처리한 JSONArray를 가져옴
	                'animation' :  				// 사용할 애니메이션 지정
	                {
	                    'type'     : 'spinToStop',		// 룰렛 타입
	                    'duration' : 5,					// 지속시간(초)
	                    'spins'    : 8,					// 총 회전 수
	                    'callbackFinished' : showDisplay 	// 콜백완료시 호출되는 메소드
	                }
	            });
	            console.log("룰렛 객체 생성 후 sessionStorage:: menuCount :: "+ menuCount);
	            console.log("룰렛 객체 생성 후 sessionStorage:: addOption :: "+ addOption);
	    	}
	    	/* 룰렛 결과를 display에 띄운다. */
		    function showDisplay(indicatedSegment) {
		        document.getElementById("menu").value = indicatedSegment.text;
		    	document.getElementById("goInfo").style.visibility = "visible";
		    }
			
			
	    	/* 사용자가 메뉴개수를 선택하면 호출되는 함수 */
	    	function setCount(value) {
	    		
	    		// 세션 스토리지에 menuCount값을 저장
		    	sessionStorage.setItem("menuCount", value);
	    		console.log("menuCount value : "+ value);
	    		
	    		// '메뉴 개수 선택' 옵션을 선택한 경우 : 1.알림 / 2.배경색(#eaada6) 변경 / 3.버튼 숨김
	    		if (value == 0) {
	    			alert("매뉴 개수를 선택해주세요.");
	    			document.getElementById("menu").placeholder="메뉴 개수를 선택해 주세요.";
	    			document.getElementById("menuCount").style="background-color: #eaada6;";
	    			document.getElementById("changeMenu").style.display = "none";
			    	document.getElementById("UnchangeMenu").style.display = "none";
	    		}
	    		// 올바르게 선택한 경우
	    		else {
	    			// 1-1. 배경색을 흰색으로 변경
					document.getElementById("menuCount").style="background-color: white;";
					// 1-2. 좌측상단의 디스플레이 화면의 placeholder값을 변경
					document.getElementById("menu").placeholder="두근두근";
					
					// **비회원** 2.룰렛과 버튼을 보여줌
					if( ${ empty sessionScope.siteUserInfo } ) {
						showRoulette();
						document.getElementById("changeMenu").style.display = "inline";
				    	document.getElementById("UnchangeMenu").style.display = "inline";	
					}
					// **회원(로그인)**
					else {// addOption은 고정된 채로 menuCount만 변경하는 경우
						// addOption값이 100이면 비회원과 동일
			    		if( sessionStorage.getItem("addOption") == 100 ) {
			    			showRoulette();
							document.getElementById("changeMenu").style.display = "inline";
					    	document.getElementById("UnchangeMenu").style.display = "inline";
			    		}
			    		// 추가옵션 값이 (1 또는 10) 일 때...
			    		else if( sessionStorage.getItem("addOption") == 1 ){
			    			console.log("-- addOption : 1 고정 / 메뉴개수만 바꾼뒤 setOption(1) 호출")
				    		setOption(sessionStorage.getItem("addOption"));
			    		}
			    		else if( sessionStorage.getItem("addOption") == 10 ){
			    			console.log("-- addOption : 10 고정 / 메뉴개수만 바꾼뒤 setOption(10) 호출")
			    			setOption(sessionStorage.getItem("addOption"));
			    		}
					}// addOption 선택안하면 룰렛과 버튼 안보여줌
	    		}
	    	}
			
			
		   	/**회원(로그인)** 상태일 때만 추가옵션 선택가능 */
			<c:if test="${ not empty sessionScope.siteUserInfo }">
				
				/* 사용자가 추가옵션을 선택하면 호출되는 함수 */
		    	function setOption(value) {
					
		    		// 세션 스토리지에 addOption값을 저장
			    	sessionStorage.setItem("addOption", value);
		    		console.log("addOption value : "+ value);
		    		
			    	if (value <= 0) {
		    			alert("추가 옵션을 선택해주세요.");
		    			document.getElementById("changeMenu").style.display = "none";
				    	document.getElementById("UnchangeMenu").style.display = "none";
		    		}
			    	else {
			    		// 추가옵션 값이 1 또는 10 이면 callAjax()함수 호출
			    		if (value==1 || value==10) {
				    		callAjax();
			    		}
			    		else if(value==100) {// 추가옵션 값이 100이면 비회원과 동일
			    			showRoulette();
							document.getElementById("changeMenu").style.display = "inline";
					    	document.getElementById("UnchangeMenu").style.display = "inline";
			    		}
			    	}
				}
				
				/* ajax를 통해 컨트롤러에 요청하는 함수 */
		    	function callAjax() {
		    		let menuCount = sessionStorage.getItem("menuCount");
		    		let addOption = sessionStorage.getItem("addOption");
		    		
		    		console.log("1. ----------ajax 호출----------");
		    		console.log("menuCount : "+ menuCount);
		    		console.log("addOption : "+ addOption);
		    		// ajax사용
			    	$.ajax({
			            type : 'get',// 전송방식
			            url : './addOption.do',// 요청URL
			            data : {
			            	'menuCount' : menuCount,
			            	'addOption' : addOption
		            	},// 파라미터
		            	dataType : "json",// 콜백데이터 타입
			            contentType : "text/html;charset:utf-8",
			            success : addOptionSuc,// 요청에 성공했을때 호출되는 콜백함수
			            error : addOptionFail// 요청에 실패했을때 호출되는 콜백함수
			        });
		    	}
		    	// './addOption.do'요청에 성공했을때 호출되는 콜백함수
				function addOptionSuc(resData){
					console.log("2. -------[addOption.do] 요청성공-------");
					console.log(resData.arr);
					sessionStorage.setItem("resultList", resData.arr);
					console.log("-------------------------------------");
					
					// 룰렛과 버튼을 보여준다.
					showRoulette();
					document.getElementById("changeMenu").style.display = "inline";
			    	document.getElementById("UnchangeMenu").style.display = "inline";
				}
				// './addOption.do'요청에 실패했을때 호출되는 콜백함수
				function addOptionFail(errData){
				    console.log(errData.status +":"+ errData.statusText);
				}
	        </c:if>
			
		    
		    /* 비회원 - 사용 원하면 로그인 하도록 유도 */
		    function askLogin(flag) {
		    	let result = confirm("회원전용 옵션입니다. 로그인 하시겠습니까?");
	    		flag.value = 0;// '추가 옵션 선택' 그대로 보이도록 설정
	    		
		    	if(result) {// 확인버튼 누르면 로그인 페이지로 이동
		    		location.replace("./login.do");
		    	}
		    	else {// 취소버튼 누르면 
		    		document.getElementById("UnchangeMenu").focus();
		    	}
		    }
		    
		    
			// 룰렛 회전 관련 설정을 위한 변수
		    let wheelSpinning = false;
	    	/* 룰렛 회전 */
		    function startSpin() {
		        // 이미 회전하고 있을때 계속 클릭할 수 있는지
		        if (wheelSpinning == false) {
		            // 룰렛 객체의 startAnimation() 호출. 회전 애니메이션을 실행함
		            theWheel.startAnimation();
					
		            wheelSpinning = true;
		        }
		    }
	    	
		    /* 룰렛 돌리기 */
		    function playWheel() {
		        theWheel.stopAnimation(false);	// 룰렛 애니메이션을 멈춤
		        theWheel.rotationAngle = 0;     // 룰렛 각도를 0도로 다시 설정
		        theWheel.draw();                // 룰렛에 변경사항을 렌더링 하기위해 호출
		        wheelSpinning = false;          // 룰렛 '뽑기' 버튼 클릭가능
		        
		        startSpin();
		    }
			
		    
		    /* 룰렛 메뉴변경 */
		    function resetMenu() {
		    	// 다른 메뉴를 가져오기 위해 새로고침
		    	location.reload();
		    }
		    
		    /* 페이지 로드시 호출되는 함수 */
		    document.addEventListener('DOMContentLoaded', function() {
		    	// 셀렉트박스는 기본적으로 최상단의 옵션이 선택되어져 있다.
		    	$("#menuCount").val("0").prop("selected", true);
		    	$("#addOption").val("0").prop("selected", true);
		    	
		    	// menuCount가 0보다 크면...
		    	if (sessionStorage.getItem("menuCount") > 0) {
		    		
		    		// sessionStorage에 저장되어있는 값으로 선택되게 함
		    		$("#menuCount").val(sessionStorage.getItem("menuCount")).prop("selected", true);
			    	// 메뉴 개수가 지정되어있으므로 배경색 흰색으로 변경
			    	document.getElementById("menuCount").style="background-color: white;";
			    	
			    	// addOption이 0보다 크면...
			    	if (sessionStorage.getItem("addOption") > 0) {
				    	// sessionStorage에 저장되어있는 값으로 선택되게 함
				    	$("#addOption").val(sessionStorage.getItem("addOption")).prop("selected", true);
			    	}
			    	// **비회원**
			    	else {// 메뉴개수만 설정되면 룰렛과 버튼을 보여줌
			    		showRoulette();
						document.getElementById("changeMenu").style.display = "inline";
				    	document.getElementById("UnchangeMenu").style.display = "inline";
			    	}
			    	// **회원(로그인)**
					if( ${ not empty sessionScope.siteUserInfo } ) {
						// addOption값을 담아서 setOption() 함수 호출
				    	setOption(sessionStorage.getItem("addOption"));
					}
		    	}
		    });
    	</script>
	
	</main><!-- main ends -->
	
	<!-- =================== MAIN SECTION ENDS ============================= -->
	
	<!-- =================== ALL MODALS ============================= -->
	
	<jsp:include page="/WEB-INF/views/include/search.jsp" />
	
	<!-- =================== ALL MODALS END ============================= -->
	
	
	<!-- =================== SITE FOOTER BEGINS ============================= -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
	<!-- =================== SITE FOOTER ENDS ============================= -->
	
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />

</body>

</html>