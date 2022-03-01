<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />

<style>
	#menu {
		border: 6px solid #ed6a5a; 
		height: 50px;
		text-align: center;
		font-size: 2rem;
		color: #ed6a5a; 
		font-weight: bold;
		margin-bottom: 5px;
		cursor:default
	}
	#play, #changeMenu, #UnchangeMenu {
		border: 2px solid #ed6a5a; 
		width: 150px;
		height: 40px;
		text-align: center;
		font-size: 1.5rem; 
		color: white; 
		font-weight: bold;
		background-color: #ed6a5a;
	}
	#goInfo {
		border: 2px solid white;
		all: unset;
		width: 200px; 
		height: 40px; 
		text-align: center;
		font-size: 1.5rem; 
		color: white;
		font-weight: bold; 
		background-color: #0a151f;
		cursor: pointer;
	}
</style>
<body>
	<!-- =================== SITE HEADER BEGINS ============================= -->
	
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<!-- =================== SITE HEADER ENDS ============================= -->
	
	<!-- =================== MAIN SECTION BEGINS ============================= -->
	<main>
		<script>
		function resultValidate(f) {
			if (f.menu.value == "")
			{
				alert("메뉴가 결정되어야 볼 수 있습니다.");
				f.numOfMenu.focus();
				return false;
			}
		}
		</script>
		<!-- 랜덤 룰렛 STARTS -->
    	<section class="ministries text-center-sm default-section-spacing">
        	<div class="ministries__content">
			    <div class="container">
				    <div class="row">
			            <div class="flex-md-5"><!-- 룰렛 -->
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
			            <div class="flex-md-6"><!-- 디스플레이 -->
			            	<form action="./restaurant.do" onsubmit="return resultValidate(this);">
								<div>
									<input type="text" name="menu" id="menu" placeholder="메뉴 개수를 선택해 주세요." 
										value="" readonly>
									<button type="submit" id="goInfo" style="display: none;">근처 식당보기</button>
								</div>
								<table>
									<tr>
										<td>
											<select class="form-select" name="numOfMenu" id="numOfMenu"
												onchange="setCount(this.value);" style="cursor: pointer;">
								   				<option value="0">--메뉴 개수 선택--</option>
								   				<option value="10">10개</option>
								   				<option value="15">15개</option>
								   				<option value="20">20개</option>
								   				<option value="30">30개</option>
								   				<option value="40">나만의 선호목록</option>
								   			</select>
							  			</td>
										<td>
											<button type="button" name="changeMenu" id="changeMenu" href="#"
												onClick="resetMenu(); return false;" style="display: none;">
												메뉴 바꾸고 뽑기
											</button>
											<button type="button" name="UnchangeMenu" id="UnchangeMenu" href="#"
												onClick="playWheel(); return false;" style="display: none;">
												메뉴 그대로 뽑기
											</button>
										</td>
									</tr>
								</table>
							</form>
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
    	let menuCount = null;
    	// 룰렛 회전 강도 설정을 위한 변수
	    let wheelPower    = 0;
	    let wheelSpinning = false;
	    
	    // 룰렛 객체생성
    	function showRoulette() {
    		// Create new wheel object specifying the parameters at creation time.
            theWheel = new Winwheel({
                'numSegments'  : menuCount,     // Specify number of segments.
                'outerRadius'  : 212,   // Set outer radius so wheel fits inside the background.
                'textFontSize' : 15,    // Set font size as desired.
                'segments'     :        // Define segments including colour and text.
                [
                	// allData를 선택한 메뉴개수 만큼 가져옴
                	<c:forEach items="${ allData }" var="row">
		                {'fillStyle' : '#ed6a5a', 'text' : '${row.food}'},
	                </c:forEach>
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
    	// 사용자가 선택한 메뉴개수 저장 & 룰렛 객체 생성 함수 호출
    	function setCount(flag) {
			menuCount = flag;
			showRoulette();
			document.getElementById("changeMenu").style.display = "inline";
	    	document.getElementById("UnchangeMenu").style.display = "inline";
    	}
	    // 메뉴개수 카운트
    	function numOfMenu(cnt) {
    		menuCount  = cnt;
    		console.log(menuCount);
    	}
    	// 룰렛 회전
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
	    // 룰렛 돌리기
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
	    // 룰렛 메뉴변경
	    function resetMenu() {
	    	// 다른 메뉴를 가져오기 위해 새로고침
	    	location.reload();
	    }
	    // 룰렛 결과를 display에 띄운다.
	    function showDisplay(indicatedSegment) {
	        document.getElementById("menu").value = indicatedSegment.text;
//	    	document.getElementById("play").style.display = "none";
	    	document.getElementById("goInfo").style.display = "inline";
	    }
	    // 룰렛 회전 강도 설정
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