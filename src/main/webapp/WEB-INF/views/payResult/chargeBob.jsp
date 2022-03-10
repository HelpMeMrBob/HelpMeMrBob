<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
<script type = "text/javascript">
var isValidate = function(frm){
	var isOk = false;
	for(var i = 0; i<frm.money.length;i++){
		if(frm.money[i].checked == true){
			isOk = true;
			break;
		}
	}
	
	if(isOk != true){
		alert('충전 금액을 선택해주세요.');
		return false;
	}
	
	var confirmed = confirm("정말로 충전하시겠습니까?");
	if(confirmed){
		var form = document.buyFrm;
		form.method="post"; 
		form.action="./chargeProcess.do";
		form.submit(); 	
	}
		
}
</script>


    <!-- =================== SITE HEADER BEGINS ============================= -->

    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <!-- =================== SITE HEADER ENDS ============================= -->



    <!-- =================== MAIN SECTION BEGINS ============================= -->

    <main>
	
      	<!-- BANNER SECTION STARTS -->
     	<section class="category-pointshop full-width"
     			style="height: 20rem; margin-top: -8rem; padding: 15rem 0 10rem;">
      		<div class="container">
       			<div class="banner__content">
		            <h2 class="section-intro color-off-white-with-border bold">
						밥알 충전소
					</h2>
       			</div><!-- .banner__content ends -->
      		</div><!-- .container ends -->
  		</section><!-- .banner ends -->
    	<!-- BANNER SECTION ENDS -->

		<!-- STAFFS SINGLE SECTION STARTS -->
      <div align="center">
      <section class="staffs-single default-section-spacing mar-t-md-8">
      <div class="staffs-single__content">
          <div class="container">
            <div class="row">
              <div class="">
						<br/><br/><br/>
						<!-- vs를 이용해서 동적으로 테이블을 출력함 -->
						<form name="buyFrm" method="get" onsubmit="return isValidate(this);">
							<table class="table table-bordered" style="width:520px; margin-bottom:100px; border: 2px solid #ed6a5a;">
								<tr>
									<td>
										<img src="./resources/img/1rice.png" style="width: 150px;height:100px;"alt="" />	
									</td>
									<td>										
										<img src="./resources/img/3rice.png" style="width: 150px;height:100px;"alt="" />
									</td>
									<td>
										<img src="./resources/img/5rice.png" style="width: 150px;height:100px;"alt="" />	
									</td>
								</tr>
								<tr>
									<td style="height:35px; text-align:center">1000원 <input type="radio" id="1000" name="money" value="1000">	</td>
									<td style="height:35px;text-align:center">3000원 <input type="radio" id="3000" name="money" value="3000"></td>
									<td style="height:35px;text-align:center">5000원 <input type="radio" id="5000" name="money" value="5000"></td>
								</tr>
							</table>
                     		<div class="flex-md-12" align="right">
					           	<button id="apibtn" type="submit" class="button--primary button--fill">충전하기</button>
							</div><!-- .flex-* ends -->
						</form>
					</div>
				</div>
			</div>
		</div>
      </section><!-- .staffs-single ends -->
      </div>
      <!-- STAFFS SINGLE SECTION ENDS -->
	<!-- 컨텐츠와 Footer 사이의 간격을 띄우기 위한 div -->
	<div class="mar-t-md-2" align="center"></div>
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