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
      <section class="banner full-width">

       

      </section><!-- .banner ends -->
      <!-- BANNER SECTION ENDS -->

	
      <!-- STAFFS SINGLE SECTION STARTS -->
      <section class="staffs-single default-section-spacing">
      <div class="staffs-single__content" style="margin: 0 auto;">
          <div class="container">
            <div class="row">
              <div class="flex-lg-6" style="margin-top:120px;">
						<h2>밥알 충전하기</h2>
						<br/><br/><br/>
						<!-- vs를 이용해서 동적으로 테이블을 출력함 -->
						<form name="buyFrm" method="get" onsubmit="return isValidate(this);">
							<table class="table table-bordered" style="width:520px; margin-bottom:100px;">
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
						<button id="apibtn" type="submit" class="btn btn-danger" style="width:250px; height:35px; margin-left:270px">충전하기</button>
					</form>
					</div>
				</div>
			</div>
		</div>
      </section><!-- .staffs-single ends -->
      <!-- STAFFS SINGLE SECTION ENDS -->


      <!-- STAFF POSTS SECTION STARTS -->
      <section class="staff-posts default-section-spacing background-off-white">

     
      </section><!-- .staff-posts ends -->
      <!-- STAFF POSTS SECTION ENDS -->
	

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