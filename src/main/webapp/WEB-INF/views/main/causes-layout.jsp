<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />

  <body>



    <!-- =================== SITE HEADER BEGINS ============================= -->

    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <!-- =================== SITE HEADER ENDS ============================= -->



    <!-- =================== MAIN SECTION BEGINS ============================= -->

    <main>

      <!-- BANNER SECTION STARTS -->
      <section class="banner full-width">

        <div class="container">

          <div class="banner__content">

            <div class="section-heading">
              <span class="section-intro">Jesus is Lord</span>
              <h1>Causes</h1>
            </div><!-- .section-heading ends -->

            <div class="breadcrumb">
              <div class="breadcrumb__home--link"><a href="index.html">Home</a></div>
              <span>/</span>
              <div class="breadcrumb__current--page-link">Causes</div>
            </div><!-- .breadcrumb ends -->

          </div><!-- .banner__content ends -->

        </div><!-- .container ends -->

      </section><!-- .banner ends -->
      <!-- BANNER SECTION ENDS -->


      <!-- INNER PAGES HEADER STARTS -->
      <div class="inner-pages-header default-section-spacing">

        <div class="container">

          <div class="section-heading text-center-sm">
            <span class="section-intro">Causes</span>
            <h2>Our causes</h2>
          </div><!-- .section-heading ends -->

          <p>Showing 6 out of 22 causes</p>

        </div><!-- .container ends -->


      </div><!-- .inner-pages-header ends -->
      
      
      
      
      

<!-- /////////////////////여기가 리스트////////////////////// -->
      <!-- ALL RESULTS SECTION STARTS -->
      	<section class="all-results all-results--causes">

        <div class="container">

          <div class="row">
			<c:forEach begin="1" end="1" step="1" var="i">
			<c:forEach items="${listRows }" var="row"  varStatus="loop">
			<%-- ${(row.idx!=0 && (row.idx % 3==0))?"</div><div class='row'>":"" } --%>
            ${(i!=0 && (i % 3==0))?"</div><div class='row'>":"" }
            
            <div class="col-4">
			
			<a href="./reviewView.do?idx=${row.idx}&nowPage=${nowPage}">
								
              <div class="card cause">

                <div class="card__header no-overlay">

                  <!-- <img src="./resources/images/causes-3.jpg" alt="" class="card__image"> -->

				<img src="./resources/upload/${row.userfile1}" alt="" class="card__image">
                </div><!-- .card__header ends -->

                <div class="card__body">

                  <h3 class="cause__tile mar-b-sm-2">${row.title} </h3>

                  <div class="progress">

                    <div class="progress__context mar-b-sm-06">
                      <span class="current"></span>
                      <span class="end"></span>
                    </div><!-- .progress__context ends -->

                    <div class="progress__bar" data-current="9020" data-end="12000">
                      <div class="fill"></div>
                    </div><!-- .progress__bar ends -->

                  </div><!-- .progress ends -->

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="causes-single.html" class="button button--primary button--fill">Donate now</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right-sm">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->
			
			</a>
			
            </div><!-- .flex-* ends -->
          </c:forEach>
      </c:forEach>
      
      </div><!-- .row ends -->

        </div><!-- .container ends -->

      </section><!-- .all-results -->
      <!-- ALL RESULTS SECTION ENDS -->
<!--//////////////////////////리스트끝///////////////////////////  -->
      <div class="inner-pages-navigation pad-t-sm-4 pad-b-sm-4">

        <div class="container">

			<!-- 예쁜페이징...난못해ㅎㅎㅎ -->
          <!-- <div class="pagination">
            <button
              class="pagination__arrow arrow-left transparent button--primary button--outline button share-button"><i
                class="ri-arrow-left-s-line"></i></button>

            <div class="pagination__numbers">
              <button class="number transparent button--primary button--outline button share-button">1</button>
              <button class="number transparent button--primary button--outline button share-button active">2</button>
              <button class="number transparent button--primary button--outline button share-button">3</button>
            </div>

            <button
              class="pagination__arrow arrow-right transparent button--primary button--outline button share-button"><i
                class="ri-arrow-right-s-line"></i></button>
          </div>.pagination ends -->
          
           	
			<ul class="pagination justify-content-center">
				${pagingImg }
			</ul>

			<!-- #####버튼들##### -->
			<div class="flex-md-12">
	           <button class="button--primary button--fill" type="submit" 
	           onclick="location.href='./reviewWrite.do';">
					글쓰기</button>
			</div><!-- .flex-* ends -->
			
        </div><!-- .container ends -->

      </div><!-- .inner-pages-navigation ends -->

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