<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

 <body>
  <script type = "text/javascript">
	var isValidate = function(frm){
	var isOk = false;
	for(var i = 0; i<frm.sticker.length;i++){
		if(frm.sticker[i].checked == true){
			isOk = true;
			break;
		}
	}
	
	if(isOk != true){
		alert('구매하실 스티커를 선택해주세요.');
		return false;
	}
	
	var confirmed = confirm("정말로 구매하시겠습니까?");
	if(confirmed){
		var form = document.buyFrm;
		form.method="post"; 
		form.action="./buyProcess.do";
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
      <div class="staffs-single__content">
          <div class="container">
            <div class="row">
              <div class="flex-lg-7">
						<h2>꾸미기 상점입니다.</h2>
						<br/><br/><br/>
						<!-- vs를 이용해서 동적으로 테이블을 출력함 -->
						<form name="buyFrm" method="get" onsubmit="return isValidate(this);">
							<table class="table table-bordered" >
								<tr>
								<c:forEach items="${fileMap}" var="file" varStatus="vs">
								<c:if test="${vs.index%3==0}"></tr></c:if>
									 <td>		
											&nbsp;&nbsp;
											<img src="./resources/upload/${file.key}" style="width:110px; height:110px; align:center;">
											<br/><br/><label for="${file.key}" style="algin:center;"> ${file.key}</label>
											<br/><br/>
											<input type="radio" id="iceflake" name="sticker" value="${file.key}"style="algin:center;">
									 </td>   
								</c:forEach>
								</tr>
							</table>
							<button type="submit" class="btn btn-danger" >구매하기</button>
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