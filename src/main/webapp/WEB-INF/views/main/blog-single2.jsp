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
      <section class="banner single-banner-blog text-center-sm full-width">

        <div class="container">

          <div class="banner__content">

            <div class="section-heading printable">
              <span class="section-intro">Jesus is Lord</span>
              <h1>Being a Christian in today's society</h1>
            </div><!-- .section-heading ends -->

            <div class="breadcrumb justify-content-center">
              <div class="breadcrumb__home--link"><a href="index.html">Home</a></div>
              <span>/</span>
              <div class="breadcrumb__home--link"><a href="blog-layout.html">Blog</a></div>
              <span>/</span>
              <div class="breadcrumb__current--page-link">Being a Christian in today's society</div>
            </div><!-- .breadcrumb ends -->

          </div><!-- .banner__content ends -->

        </div><!-- .container ends -->

      </section><!-- .banner ends -->
      <!-- BANNER SECTION ENDS -->


      <!-- SINGLE PAGE SECTION STARTS -->
      <section class="single-page single-sermon single-sermon--text default-section-spacing">

        <div class="container">

          <div class="row">

            <div class="flex-md-8 flex-lg-9">

              <div class="single-full-text printable">
                <!-- See _singles.scss for styling -->

                <div class="text-block mar-b-sm-4">
                	<!-- 제목 -->
                  <h2 class="mar-b-sm-2">${viewRow.title }</h2>
                  <!-- 내용 -->
                  <p>${viewRow.contents }</p>
                </div><!-- .text-block ends -->

                

                

                

              <div class="single-page__share pad-b-sm-2">

                <div class="display-flex align-items-center">

                  <div class="bold leading text">Share</div>

                  <div class="social">
                    <a href="" class="transparent button button--primary button--outline share-button"><i
                        class="ri-facebook-line"></i></a>
                  </div><!-- .social ends -->

                  <div class="social">
                    <a href="" class="transparent button button--primary button--outline share-button"><i
                        class="ri-linkedin-line"></i></a>
                  </div><!-- .social ends -->

                  <div class="social">
                    <a href="" class="transparent button button--primary button--outline share-button"><i
                        class="ri-twitter-line"></i></a>
                  </div><!-- .social ends -->

                  <div class="social">
                    <a href="" class="transparent button button--primary button--outline share-button"><i
                        class="ri-instagram-line"></i></a>
                  </div><!-- .social ends -->

                </div><!-- .display-flex ends -->

              </div><!-- .single-page__share ends -->

            </div><!-- .flex-* ends -->

            <div class="flex-md-4 flex-lg-3">

              <div class="sidebar">

                <div class="sidebar__widget text-center-sm mar-b-sm-2">

                  <h3 class="widget__title">Author</h3>

                  <div class="author-box">
                    <!-- See _author.scss for styling -->

                    <div class="author-box__image avatar avatar--large mar-b-sm-06"><img src="./resources/images/avatar-10.png"
                        alt=""></div>
                        <!-- /////////사용자아이디////////// -->
                    <p class="leading bold mar-b-sm-06">${viewRow.id}</p>
                    <p class="mar-b-sm-06">22 posts</p>
                    <a href="staffs-single.html" class="bold mar-b-sm-2">View profile</a>

                    <div class="author-social display-flex justify-align-center">

                      <div class="social">
                        <a href="" class="transparent button button--primary button--outline share-button"><i
                            class="ri-facebook-line"></i></a>
                      </div><!-- .social ends -->

                      <div class="social">
                        <a href="" class="transparent button button--primary button--outline share-button"><i
                            class="ri-linkedin-line"></i></a>
                      </div><!-- .social ends -->

                      <div class="social">
                        <a href="" class="transparent button button--primary button--outline share-button"><i
                            class="ri-twitter-line"></i></a>
                      </div><!-- .social ends -->

                    </div><!-- .author-social ends -->

                  </div><!-- .author-box ends -->

                </div><!-- .sidebar__widget ends -->

                <div class="sidebar__widget mar-b-sm-2">

                  <h3 class="widget__title">작성정보</h3>

                  <div class="icon-text">
                    <span class="icon"><i class="ri-calendar-line"></i></span>
                    <span class="text bold">${viewRow.postdate }</span>
                  </div>

                  <div class="icon-text">
                    <span class="icon"><i class="ri-eye-line"></i></span>
                    <span class="text bold">${viewRow.visitCnt }</span>
                  </div>

                  <div class="icon-text">
                    <span class="icon"><i class="ri-time-line"></i></span>
                    <span class="text bold">45:15</span>
                  </div>

                  <div class="icon-text mar-b-sm-2">
                    <span class="icon"><i class="ri-briefcase-line"></i></span>
                    <span class="text bold">Faith &amp; Kingdom</span>
                  </div>

                </div><!-- .sidebar__widget ends -->

                <div class="sidebar__widget mar-b-sm-2">

                  <h3 class="widget__title">Recent posts</h3>

                  <div class="display-flex mar-b-sm-2">

                    <div class="post-thumbnail"><img src="./resources/images/bible-sm.jpg" alt=""></div>

                    <div class="post-details">
                      <p class="bold mar-b-sm-06"><a href="">Jesus is the Way, Truth, and Life</a></p>

                      <div class="icon-text">
                        <span class="icon"><i class="ri-calendar-line"></i></span>
                        <span class="text bold">02/28/2020</span>
                      </div>

                      <div class="icon-text">
                        <span class="icon"><i class="ri-eye-line"></i></span>
                        <span class="text bold">323</span>
                      </div>

                      <div class="icon-text">
                        <span class="icon"><i class="ri-time-line"></i></span>
                        <span class="text bold">45:15</span>
                      </div>
                    </div>

                  </div><!-- .display-flex ends -->

                  <div class="display-flex mar-b-sm-2">

                    <div class="post-thumbnail"><img src="./resources/images/podcast-thumb-2.jpg" alt=""></div>

                    <div class="post-details">
                      <p class="bold mar-b-sm-06"><a href="">Jesus is the Way, Truth, and Life</a></p>

                      <div class="icon-text">
                        <span class="icon"><i class="ri-calendar-line"></i></span>
                        <span class="text bold">02/28/2020</span>
                      </div>

                      <div class="icon-text">
                        <span class="icon"><i class="ri-eye-line"></i></span>
                        <span class="text bold">323</span>
                      </div>

                      <div class="icon-text">
                        <span class="icon"><i class="ri-time-line"></i></span>
                        <span class="text bold">45:15</span>
                      </div>
                    </div>

                  </div><!-- .display-flex ends -->

                  <h3 class="widget__title">Popular posts</h3>

                  <div class="display-flex">

                    <div class="post-thumbnail"><img src="./resources/images/bible-sm.jpg" alt=""></div>

                    <div class="post-details">
                      <p class="bold mar-b-sm-06"><a href="">Jesus is the Way, Truth, and Life</a></p>

                      <div class="icon-text">
                        <span class="icon"><i class="ri-calendar-line"></i></span>
                        <span class="text bold">02/28/2020</span>
                      </div>

                      <div class="icon-text">
                        <span class="icon"><i class="ri-eye-line"></i></span>
                        <span class="text bold">323</span>
                      </div>

                      <div class="icon-text">
                        <span class="icon"><i class="ri-time-line"></i></span>
                        <span class="text bold">45:15</span>
                      </div>
                    </div>

                  </div><!-- .display-flex ends -->

                </div><!-- .sidebar__widget ends -->

              </div><!-- .sidebar ends -->

            </div><!-- .flex-* ends -->

          </div><!-- .row ends -->

        </div><!-- .container ends -->

        <!-- See _singles.scss for styling -->
        
        <!-- #####버튼들##### -->
        <div class="flex-md-12">
            <button class="button--primary button--fill" type="submit" 
            onclick="location.href='./reviewId.do?idx=${viewRow.idx}&mode=edit&nowPage=${nowPage }';">
			수정하기</button>
			<button class="button--primary button--fill" type="submit" 
			onclick="location.href='./reviewId.do?idx=${viewRow.idx}&mode=delete&nowPage=${nowPage }';">
			삭제하기</button>
       		<button class="button--primary button--fill" type="submit" onclick="location.href='./reviewList.do';">List</button>
       </div><!-- .flex-* ends -->
        
        
        
        
        
        
        <div class="single-page__navigation background-off-white mar-t-sm-4 mar-t-md-0 pad-t-sm-2 pad-b-sm-2">

          <div class="container">

            <div class="display-flex justify-content-between align-items-center">

              <div class="previous display-flex align-items-center">
                <span class="arrow"><a href="" class="button button--outline button--primary share-button"><i
                      class="ri-arrow-left-s-line"></i></a></span>
                <span>Previous post</span>
              </div><!-- .previous ends -->

              <div class="next display-flex align-items-center">
                <span>Next post</span>
                <span class="arrow"><a href="" class="button button--outline button--primary share-button"><i
                      class="ri-arrow-right-s-line"></i></a></span>
              </div><!-- .next ends -->

            </div><!-- .display-flex ends -->

          </div><!-- .container ends -->

        </div><!-- .single-page__navigation ends -->

      </section><!-- .single-page ends -->
      <!-- SINGLE PAGE SECTION ENDS -->


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