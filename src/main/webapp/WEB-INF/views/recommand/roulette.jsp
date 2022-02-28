<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />

<style>
	#menu {
		border: 6px solid #ed6a5a; 
		width: 400px; 
		height: 50px;
		text-align: center;
		font-size: 2rem;
		color: #ed6a5a; 
		font-weight: bold;
		margin-bottom: 5px;
	}
	#start {
		border: 4px solid #ed6a5a; 
		width: 100px;
		height: 30px;
		text-align: center;
		font-size: 1.5rem; 
		color: white; 
		font-weight: bold;
		background-color: #ed6a5a
	}
	#goInfo {
		all: unset;
		width: 200px; 
		height: 30px; 
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
		<div class="mar-t-md-2" align="center">
			<form action="./restaurant.do" onsubmit="return resultValidate(this);">
				<div>
					<input type="text" name="menu" id="menu" placeholder="메뉴 개수를 선택해 주세요." 
						value="" readonly>
				</div>
				<table>
					<tr>
						<td>
							<select class="form-select" name="numOfMenu" id="numOfMenu" onchange="setCount(this.value);">
				   				<option value="0">--메뉴 개수 선택--</option>
				   				<option value="10">10개</option>
				   				<option value="15">15개</option>
				   				<option value="20">20개</option>
				   				<option value="30">30개</option>
				   				<option value="40">나만의 선호목록</option>
				   			</select>
			   			</td>
						<td>
							<button type="button" name="start" id="start" href="#" onClick="resetWheel(); return false;">
								뽑기
							</button>
						</td>
						<td>
							<button type="submit" id="goInfo">근처 식당보기</button>
						</td>
					</tr>
				</table>
			</form>
			
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="438" height="582" class="the_wheel" align="center" valign="center">
                        <canvas id="canvas" width="434" height="434">
                            <p style="{color: white}" align="center">Sorry, your browser doesn't support canvas. Please try another.</p>
                        </canvas>
                    </td>
                </tr>
            </table>
        </div>
        <script>
        	function showRoulette() {
        		// Create new wheel object specifying the parameters at creation time.
                theWheel = new Winwheel({
                    'numSegments'  : count,     // Specify number of segments.
                    'outerRadius'  : 212,   // Set outer radius so wheel fits inside the background.
                    'textFontSize' : 15,    // Set font size as desired.
                    'segments'     :        // Define segments including colour and text.
                    [
                       	
                   		{'fillStyle' : '#ed6a5a', 'text' : '곱창'},
    	                {'fillStyle' : '#ed6a5a', 'text' : '샌드위치'},
    	                {'fillStyle' : '#ed6a5a', 'text' : '탕수육'},
    	                {'fillStyle' : '#ed6a5a', 'text' : '닭강정'},
    	                {'fillStyle' : '#ed6a5a', 'text' : '잔치국수'},
    	                {'fillStyle' : '#ed6a5a', 'text' : '오야코동(닭고기 계란 덮밥)'},
    	                {'fillStyle' : '#ed6a5a', 'text' : '닭발'},
    	                {'fillStyle' : '#ed6a5a', 'text' : '뼈해장국'},
    	                {'fillStyle' : '#ed6a5a', 'text' : '김치볶음밥'},
    	                {'fillStyle' : '#ed6a5a', 'text' : '피자'},
    	          
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
        	
        	let theWheel = null;
        	let count = null;
        	function setCount(flag) {
    			count = flag;
    			showRoulette();
        	}
            
           // Vars used by the code in this page to do power controls.
           let wheelPower    = 0;
           let wheelSpinning = false;
           
       	
	       	function numOfMenu(cnt) {
	       		count  = cnt;
	       		console.log(count);
	       	}

           // -------------------------------------------------------
           // Function to handle the onClick on the power buttons.
           // -------------------------------------------------------
           function powerSelected(powerLevel)
           {
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

           // -------------------------------------------------------
           // Click handler for spin button.
           // -------------------------------------------------------
           function startSpin()
           {
               // Ensure that spinning can't be clicked again while already running.
               if (wheelSpinning == false) {
                   // Begin the spin animation by calling startAnimation on the wheel object.
                   theWheel.startAnimation();

                   // Set to true so that power can't be changed and spin button re-enabled during
                   // the current animation. The user will have to reset before spinning again.
                   wheelSpinning = true;
               }
           }

           // -------------------------------------------------------
           // Function for reset button.
           // -------------------------------------------------------
           function resetWheel()
           {
               theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
               theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
               theWheel.draw();                // Call draw to render changes to the wheel.

               /* document.getElementById('pw1').className = "";  // Remove all colours from the power level indicators.
               document.getElementById('pw2').className = "";
               document.getElementById('pw3').className = ""; */

               wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
               
               startSpin();
           }

        // 결과를 display에 띄운다.
        function showDisplay(indicatedSegment) {
            document.getElementById("menu").value = indicatedSegment.text;
        }
        </script>

    </main><!-- main ends -->

    <!-- =================== MAIN SECTION ENDS ============================= -->


    <!-- SCROLL BACK TO TOP BEGINS -->
    <div class="scroll-to-top"><i class="ri-arrow-up-line"></i></div>
    <!-- SCROLL BACK TO TOP ENDS -->

    <!-- =================== ALL MODALS ============================= -->

    <jsp:include page="/WEB-INF/views/include/search.jsp" />

    <!-- =================== ALL MODALS END ============================= -->


    <!-- =================== SITE FOOTER BEGINS ============================= -->

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />

    <!-- =================== SITE FOOTER ENDS ============================= -->

	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />

  </body>

</html>