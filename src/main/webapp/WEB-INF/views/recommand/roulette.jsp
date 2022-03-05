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
	#numOfMenu, #addOption, #notMember {
		display: inline-block;
		width: auto;
		height: 40px;
		font-size: 1.2rem; 
		cursor: pointer;
		margin-bottom: 10px;
		margin-right: 5px;
	}
</style>
<body>
	<!-- =================== SITE HEADER BEGINS ============================= -->
	
	<jsp:include page="/WEB-INF/views/include/header2.jsp" />
	
	<!-- =================== SITE HEADER ENDS ============================= -->
	
	<!-- =================== MAIN SECTION BEGINS ============================= -->
	<main>
		
		<!-- 랜덤 룰렛 STARTS -->
    	<section class="ministries text-center-sm default-section-spacing">
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
										<select class="form-select" name="numOfMenu" id="numOfMenu"
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
									   				<option value="10">맛있는 음식</option>
									   			</select>
										  	</c:when>
										  	<c:otherwise>
												<select class="form-select" name="notMember" id="notMember"
													onchange="askLogin(this);">
									   				<option value="0">추가 옵션 선택</option>
									   				<option value="0">&nbsp;&nbsp;&nbsp;&nbsp;---------- 탭 ----------</option>
									   				<option value="1">탭1</option>
									   				<option value="0">&nbsp;&nbsp;&nbsp;----- 선호도 반영 -----</option>
									   				<option value="100">맛있는 음식</option>
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
						        <tr>
						            <td width="438" height="582" class="the_wheel" align="center" valign="center">
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
	    <!-- 랜덤 룰렛 ENDS -->
		<div class="mar-t-md-2" align="center">
			
		    
	    </div>
	    <script>
		// 룰렛 객체를 저장할 변수
    	let theWheel = null;
    	// 사용자가 선택한 메뉴개수를 저장할 변수
    	let menuCount = 0;
    	// 룰렛에 출력할 선호도 적용한 메뉴목록을 저장할 배열 생성
		let favList = [];
    	
	    /* 룰렛 객체생성 */
    	function showRoulette() {
	    	
	    	if(addOption == 10) {
	    		// ajax사용
		    	$.ajax({
		            type : 'get',// 전송방식
		            url : './addOption10.do',// 요청URL
		            contentType : "text/html;charset:utf-8",
		            success : addOption10Suc,// 요청에 성공했을때 호출되는 콜백함수
		            error : addOption10Fail// 요청에 실패했을때 호출되는 콜백함수
		        });
	    	}
           	console.log('${allData}');
            theWheel = new Winwheel({
                'numSegments'  : menuCount,     // Specify number of segments.
                'outerRadius'  : 212,   // Set outer radius so wheel fits inside the background.
                'textFontSize' : 15,    // Set font size as desired.
                'segments'     : [
                	<c:choose>
						<c:when test="${sessionStorage.getItem('addOption')==10}">
							<c:forEach items="${ favList }" var="fav" varStatus="index">
				                {'fillStyle' : '#ed6a5a', 'text' : '${fav.arr[index.index]}'},
			                </c:forEach>
		                </c:when>
					  	<c:otherwise>
						  	<c:forEach items="${ allData }" var="all">
				                {'fillStyle' : '#ed6a5a', 'text' : '${all.food}'},
			                </c:forEach>
						</c:otherwise>
					</c:choose>
                ],
                'animation' :           // Specify the animation to use.
                {
                    'type'     : 'spinToStop',
                    'duration' : 5,     // Duration in seconds.
                    'spins'    : 8,     // Number of complete spins.
                    'callbackFinished' : showDisplay
                }
            });
    	}
    	//요청에 성공했을때 호출되는 콜백함수
		function addOption10Suc(resData){
			console.log("맛있는 음식 요청성공");
			
/* 			// 룰렛과 버튼을 보여준다.
			showRoulette();
			document.getElementById("changeMenu").style.display = "inline";
	    	document.getElementById("UnchangeMenu").style.display = "inline";
 */		}
		// 요청에 실패했을때 호출되는 콜백함수
		function addOption10Fail(errData){
		    console.log(errData.status +":"+ errData.statusText);
		}


    	/* 사용자가 메뉴개수를 선택하면 호출되는 함수 */
    	function setCount() {
    		if (document.getElementById("numOfMenu").value != 0) {
				// 선택이 되면 배경색을 흰색으로 변경
				document.getElementById("numOfMenu").style="background-color: white;";
				
	    		// ajax사용
		    	$.ajax({
		            type : 'get',// 전송방식
		            url : './numOfMenuData.do',// 요청URL
		            data : {
		            	menuCount : $('#numOfMenu').val(),
		            	
	            	},// 파라미터
		            contentType : "text/html;charset:utf-8",
		            dataType : "json",// 콜백데이터 타입
		            success : numOfMenuDataSuc,// 요청에 성공했을때 호출되는 콜백함수
		            error : numOfMenuDataFail// 요청에 실패했을때 호출되는 콜백함수
		        });
	    		console.log("ajax요청함")
    		}
    	}
		//요청에 성공했을때 호출되는 콜백함수
		function numOfMenuDataSuc(resData){
			console.log("요청성공 menuCount : "+ resData.menuCount);
			menuCount = resData.menuCount;
			// 세션 스토리지에 menuCount값을 저장
	    	sessionStorage.setItem("menuCount", menuCount);
			
			// 비회원은 메뉴 개수만 선택하면 뽑기 버튼을 보여줌
			if( ${ empty sessionScope.siteUserInfo } ) {
				// 룰렛과 버튼 보여주기
				showRoulette();
				document.getElementById("changeMenu").style.display = "inline";
		    	document.getElementById("UnchangeMenu").style.display = "inline";	
			}
		}
		// 요청에 실패했을때 호출되는 콜백함수
		function numOfMenuDataFail(errData){
		    console.log(errData.status +":"+ errData.statusText);
		}


	    /* 메뉴개수 카운트 */
	    /*
    	function numOfMenu(cnt) {
    		menuCount  = cnt;
    		console.log(menuCount);
    	}
	     */

	  	// 회원전용 옵션 번호를 저장할 변수
    	let addOption = 0;
   		// 로그인 상태일 때...
		/* 
			1. 회원의 대분류 선호도 값 저장할 변수 & 선호도 배열 생성
			2. 모든 선호도 값의 합
	    	3. 대분류 메뉴를 각각 배열에 저장
    	*/
		<c:if test="${ not empty sessionScope.siteUserInfo }">
			/* 사용자가 추가옵션을 선택하면 호출되는 함수 */
	    	function setOption(value) {
	    		// ajax사용
		    	$.ajax({
		            type : 'get',// 전송방식
		            url : './addOptionData.do',// 요청URL
		            data : {
		            	addOption : $('#addOption').val(),
	            	},// 파라미터
		            contentType : "text/html;charset:utf-8",
		            dataType : "json",// 콜백데이터 타입
		            success : addOptionDataSuc,// 요청에 성공했을때 호출되는 콜백함수
		            error : addOptionDataFail// 요청에 실패했을때 호출되는 콜백함수
		        });
			}
			//요청에 성공했을때 호출되는 콜백함수
			function addOptionDataSuc(resData){
				console.log("요청성공 addOption : "+ resData.addOption);
				addOption = resData.addOption;
				// 세션 스토리지에 menuCount값을 저장
		    	sessionStorage.setItem("addOption", addOption);
				
				// 룰렛과 버튼을 보여준다.
				showRoulette();
				document.getElementById("changeMenu").style.display = "inline";
		    	document.getElementById("UnchangeMenu").style.display = "inline";
			}
			// 요청에 실패했을때 호출되는 콜백함수
			function addOptionDataFail(errData){
			    console.log(errData.status +":"+ errData.statusText);
			}
        </c:if>
    	/* 
		    let prenoodle = ${ fav.prenoodle };
		    let prerice = ${ fav.prerice };
		    let presoup = ${ fav.presoup };
		    let premeat = ${ fav.premeat };
		    let preseafood = ${ fav.preseafood };
		    let preetc = ${ fav.preetc };
		    
		    let noodleList = [
		    	<c:forEach items="${ noodleList }" var="noodleMenu">
                	'${noodleMenu}',
               	</c:forEach>
              	]
		    let riceList = [
		    	<c:forEach items="${ riceList }" var="riceMenu">
                	'${riceMenu}',
               	</c:forEach>
              	]
		    let soupList = [
		    	<c:forEach items="${ soupList }" var="soupMenu">
                	'${soupMenu}',
               	</c:forEach>
              	]
		    let meatList = [
		    	<c:forEach items="${ meatList }" var="meatMenu">
                	'${meatMenu}',
               	</c:forEach>
              	]
		    let seafoodList = [
		    	<c:forEach items="${ seafoodList }" var="seafoodMenu">
                	'${seafoodMenu}',
               	</c:forEach>
              	]
		    let etcList = [
		    	<c:forEach items="${ etcList }" var="etcMenu">
                	'${etcMenu}',
               	</c:forEach>
              	]
		    
		    console.log("------- [회원 대분류별 선호도 값] -------");
		    console.log("------------ 정렬 before --------------");
		    let favCategory = [
		    	{ name : "noodleList", val : prenoodle, arr : noodleList},
		    	{ name : "riceList", val : prerice, arr : riceList},
		    	{ name : "soupList", val : presoup, arr : soupList},
		    	{ name : "meatList", val : premeat, arr : meatList},
		    	{ name : "seafoodList", val : preseafood, arr : seafoodList},
		    	{ name : "etcList", val : preetc, arr : etcList}
		    ]
		    favCategory.forEach(function(value) {
		    	console.log(value);
		    	console.log(value.arr);
		    });
		    
		    console.log("------------ 정렬 after --------------");
		    let descVal = null;
		    descVal = favCategory.sort(function (a, b) {
		    	return b.val - a.val;
		    });
		    descVal.forEach(function(value) {
		    	console.log(value);
		    	console.log(value.arr);
		    });
		    
		    console.log("------------ 선호도 값 총합 --------------");
		    let totalFav = 0;
		    for (let i=0; i<favCategory.length; i++) {
		    	totalFav += favCategory[i].val;
		    }
		    console.log("totalFav : "+ totalFav);
		 */
		 
		/* 대분류별 메뉴를 가져옴  */
		/* 
		function selectCateMenu () {
			
			// descVal을 얕은복사해서 사용
			let cateMenu = []
			let copy = Object.assign(cateMenu, '${descFav}')
			
			// 총 menuCount 개수만큼 가져와야함.
       		while (favList.length < menuCount) {
	       		// 중복없이 랜덤으로 값 추출
       			var ranArr = copy[0].arr.splice(Math.floor(Math.random() * copy[0].arr.length), 1)[0]
				favList.push(ranArr)
       		}
			console.log(favList);
		}
		 */
		
		
	    
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
	    let wheelPower    = 0;
	    let wheelSpinning = false;
	    
    	/* 룰렛 회전 */
	    function startSpin() {
	        // Ensure that spinning can't be clicked again while already running.
	        if (wheelSpinning == false) {
	            // Begin the spin animation by calling startAnimation on the wheel object.
	            theWheel.startAnimation();
	
	            // Set to true so that power can't be changed and spin button re-enabled during
	            // the current animation. The user will have to reset before spinning again.
	            wheelSpinning = true;
	        }
	    }
    	
	    /* 룰렛 돌리기 */
	    function playWheel() {
	        theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
	        theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
	        theWheel.draw();                // Call draw to render changes to the wheel.
	
	        /* document.getElementById('pw1').className = "";  // Remove all colours from the power level indicators.
	        document.getElementById('pw2').className = "";
	        document.getElementById('pw3').className = ""; */
	
	        wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
	        
	        startSpin();
	    }
	    
	    /* 룰렛 메뉴변경 */
	    function resetMenu() {
	    	// 다른 메뉴를 가져오기 위해 새로고침
	    	location.reload();
	    }
	    
	    
	    // 페이지 로드 후에 값을 가져온다.
	    document.addEventListener('DOMContentLoaded', function() {
	    	// 셀렉트박스는 기본적으로 최상단의 옵션이 선택되어져 있다.
	    	$("#numOfMenu").val("0").prop("selected", true);
	    	$("#addOption").val("0").prop("selected", true);
	    	
    		// sessionStorage에 menuCount가 있으면 해당 값을 선택한 상태로 보여줌
	    	if (sessionStorage.getItem("menuCount") != null) {
		    	$("#numOfMenu").val(sessionStorage.getItem("menuCount")).prop("selected", true);
		    	// 전역변수에 값 저장
		    	menuCount = sessionStorage.getItem("menuCount");
		    	// 메뉴 개수가 지정되어있으므로 배경색 흰색으로 변경
		    	document.getElementById("numOfMenu").style="background-color: white;";
		    	
		    	// sessionStorage에 addOption이 있으면 해당 값을 선택한 상태로 보여줌
		    	if (sessionStorage.getItem("addOption") != null) {
			    	// addOption 셀렉트박스가 '메뉴 바꾸고 뽑기' 버튼을 누르기 이전의 메뉴 개수를 선택한다.
			    	$("#addOption").val(sessionStorage.getItem("addOption")).prop("selected", true);
			    	
			    	// 전역변수에 값 저장
			    	addOption = sessionStorage.getItem("addOption");
			    	
			    	// 룰렛과 버튼 보여주기
					showRoulette();
					document.getElementById("changeMenu").style.display = "inline";
			    	document.getElementById("UnchangeMenu").style.display = "inline";
		    	}
		    	// 비회원은 룰렛과 뽑기 버튼을 보여줌
				if( ${ empty sessionScope.siteUserInfo } ) {
					// 룰렛과 버튼 보여주기
					showRoulette();
					document.getElementById("changeMenu").style.display = "inline";
			    	document.getElementById("UnchangeMenu").style.display = "inline";	
				}
	    	}
	    });

	    
	    /* 룰렛 결과를 display에 띄운다. */
	    function showDisplay(indicatedSegment) {
	        document.getElementById("menu").value = indicatedSegment.text;
	    	document.getElementById("goInfo").style.visibility = "visible";
	    }
	    
	    /* 룰렛 회전 강도 설정 */
	    /*
	    function powerSelected(powerLevel) {
	        // Ensure that power can't be changed while wheel is spinning.
	        if (wheelSpinning == false) {
	            // Reset all to grey incase this is not the first time the user has selected the power.
	            document.getElementById('pw1').className = "";
	            document.getElementById('pw2').className = "";
	            document.getElementById('pw3').className = "";
	
	            // Now light up all cells below-and-including the one selected by changing the class.
	            if (powerLevel >= 1) {
	                document.getElementById('pw1').className = "pw1";
	            }
	
	            if (powerLevel >= 2) {
	                document.getElementById('pw2').className = "pw2";
	            }
	
	            if (powerLevel >= 3) {
	                document.getElementById('pw3').className = "pw3";
	            }
	
            // Set wheelPower var used when spin button is clicked.
            wheelPower = powerLevel;

            // Light up the spin button by changing it's source image and adding a clickable class to it.
            document.getElementById('spin_button').src = "./resources/recommand/spin_on.png";
            document.getElementById('spin_button').className = "clickable";
        	}
       	}
	    */
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