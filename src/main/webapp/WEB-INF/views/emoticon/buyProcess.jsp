<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

 <body>
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
      <section class="staffs-single default-section-spacing mar-t-md-8">
      <div class="staffs-single__content">
          <div class="container">
            <div class="row">
              <div class="flex-lg-7">
						<h1>구매결과 페이지</h1>
						<br/><br/><br/>
						<!-- vs를 이용해서 동적으로 테이블을 출력함 -->
						
						<h2>구매스티커<h2><br/>
						<img src="./resources/upload2/${pdto.sticker}" style="width:140px; height:140px; align:center;">
						<br/>
						<h4>구매 아이디: ${pdto.id}</h4>
						잔여포인트: ${pdto.point}
						<br/>				
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