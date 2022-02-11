<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />

  <body>



    <!-- =================== SITE HEADER BEGINS ============================= -->

    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <!-- =================== SITE HEADER ENDS ============================= -->



    <!-- =================== MAIN SECTION BEGINS ============================= -->

    <main>

      <!-- BANNER SECTION STARTS -->
      <section class="banner banner--thankyou full-width text-center-sm">

        <div class="container">

          <div class="banner__content">

            <div class="section-heading">
              <span class="section-intro">Jesus is Lord</span>
              <h1 class="special">Thank you</h1>
            </div><!-- .section-heading ends -->

          </div><!-- .banner__content ends -->

        </div><!-- .container ends -->

      </section><!-- .banner ends -->
      <!-- BANNER SECTION ENDS -->


      <div class="thank-you-donations default-section-spacing text-center-sm printable">

        <div class="container">

          <h1 class="mar-b-sm-4">
            <span class="regular-weight">Your donation ID</span>
            <span>235790012</span>
          </h1>

          <h2 class="regular-weight mar-b-sm-2">Thank you very much for your donation.</h2>
          <h2 class="regular-weight mar-b-sm-2">Your donation of <span class="bold">$245.56</span> towards
            <span class="bold">Clean water and food in Syria</span> is received.
          </h2>
          <h2 class="regular-weight">An email with a receipt is sent to the email you provided: <span
              class="bold">donor@example.com</span>
          </h2>

        </div><!-- .container ends -->

      </div><!-- .thank-you-donations ends -->

      <div class="text-center-sm pad-b-sm-4">
        <button class="button button--primary button--fill printable-button">Print</button>
      </div>

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