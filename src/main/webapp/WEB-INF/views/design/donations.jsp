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
      <section class="banner full-width">

        <div class="container">

          <div class="banner__content">

            <div class="section-heading">
              <span class="section-intro">Jesus is Lord</span>
              <h1>Donations</h1>
            </div><!-- .section-heading ends -->

            <div class="breadcrumb">
              <div class="breadcrumb__home--link"><a href="index.html">Home</a></div>
              <span>/</span>
              <div class="breadcrumb__current--page-link">Donations</div>
            </div><!-- .breadcrumb ends -->

          </div><!-- .banner__content ends -->

        </div><!-- .container ends -->

      </section><!-- .banner ends -->
      <!-- BANNER SECTION ENDS -->


      <!-- WAYS TO HELP SECTION STARTS -->
      <section class="ways-to-help default-section-spacing text-center-sm">

        <div class="container">

          <div class="section-heading mar-b-sm-2">
            <span class="section-intro">Donation</span>
            <h2>Different ways you can donate to help</h2>
          </div><!-- .section-heading ends -->

          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum dolorum adipisci sed quidem id molestiae.
            Nihil necessitatibus sapiente tempore animi corporis officiis, consequuntur enim repudiandae.</p>

          <div class="ways-to-help__content mar-t-sm-2 mar-t-lg-8 mar-b-lg-4">

            <div class="row">

              <div class="flex-md-6 flex-lg-4">

                <div class="card custom-height">

                  <div class="card__header">

                    <img src="./resources/images/donation-2.jpg" alt="" class="card__image">

                    <div class="card__details color-off-white text-center-sm">

                      <h3 class="mar-b-sm-2">Causes</h3>

                      <div class="details mar-b-sm-4">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum nisi tempora rem sint
                          cupiditate perferendis!</p>
                      </div>

                      <a href="causes-layout.html" class="button button--primary button--fill">View causes</a>

                    </div><!-- .card__details ends -->

                  </div><!-- .card__header ends -->

                </div><!-- .card ends -->

              </div><!-- .flex-* ends -->

              <div class="flex-md-12 flex-lg-4 order">

                <div class="card custom-height scale">

                  <div class="card__header">

                    <img src="./resources/images/standing-girl.jpg" alt="" class="card__image">

                    <div class="card__details color-off-white text-center-sm">

                      <h3 class="mar-b-sm-2">Subscription</h3>

                      <div class="details mar-b-sm-4">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum nisi tempora rem sint
                          cupiditate perferendis!
                        </p>
                      </div>

                      <a href="#subscription" class="button button--primary button--fill">View plans</a>

                    </div><!-- .card__details ends -->

                  </div><!-- .card__header ends -->

                </div><!-- .card ends -->

              </div><!-- .flex-* ends -->

              <div class="flex-md-6 flex-lg-4">

                <div class="card custom-height">

                  <div class="card__header">

                    <img src="./resources/images/donation-1.jpg" alt="" class="card__image">

                    <div class="card__details color-off-white text-center-sm">

                      <h3 class="mar-b-sm-2">In-person donation</h3>

                      <div class="details mar-b-sm-4">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum nisi tempora rem sint
                          cupiditate perferendis!
                        </p>
                      </div>

                      <a href="" class="button button--primary button--fill">Learn more</a>

                    </div><!-- .card__details ends -->

                  </div><!-- .card__header ends -->

                </div><!-- .card ends -->

              </div><!-- .flex-* ends -->

            </div><!-- .row ends -->

          </div><!-- .ways-to-help__content ends -->

        </div><!-- .container ends -->

      </section><!-- .ways-to-help ends -->
      <!-- WAYS TO HELP SECTION ENDS -->


      <!-- SUBSCRIPTION SECTION STARTS -->
      <div class="subscription default-section-spacing background-off-white text-center-sm" id="subscription">

        <div class="container">

          <div class="section-heading mar-b-sm-2">
            <span class="section-intro">Subscription</span>
            <h2>Partner with us as a way to support</h2>
          </div><!-- .section-heading ends -->

          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum dolorum adipisci sed quidem id molestiae.
            Nihil necessitatibus sapiente tempore animi corporis officiis, consequuntur enim repudiandae.</p>

          <div class="subscription__content mar-t-sm-2 mar-t-lg-8 mar-b-lg-4">

            <div class="row">

              <div class="flex-md-6 flex-lg-4">

                <div class="card pricing custom-height">

                  <div class="pricing__header">
                    <div class="section-intro">One-time</div>
                    <div class="pricing__name">One-time donation</div>
                    <div class="pricing__amount">Any amount</div>
                  </div><!-- .pricing__header ends -->

                  <div class="pricing__body">

                    <span class="color-primary mar-b-sm-2">Includes</span>

                    <ul>
                      <li>Homeless shelter outreach</li>
                      <li>Food for homeless people</li>
                      <li>Clothes for the homeless people</li>
                    </ul>

                    <span class="color-primary uppercase mar-t-sm-2">And many more</span>

                  </div><!-- .pricing__body ends -->

                  <div class="pricing__footer">
                    <a href="" class="button button--primary button--fill">Donate today</a>
                  </div><!-- .pricing__footer ends -->

                </div><!-- .card ends -->

              </div><!-- .flex-* ends -->

              <div class="flex-md-12 flex-lg-4 order">

                <div class="card pricing custom-height scale">

                  <div class="pricing__header">
                    <div class="section-intro">6-month</div>
                    <div class="pricing__name">6-months donation plan</div>
                    <div class="pricing__amount">$85/mo</div>
                  </div><!-- .pricing__header ends -->

                  <div class="pricing__body">

                    <span class="color-primary mar-b-sm-2">Includes</span>

                    <ul>
                      <li>Homeless shelter outreach</li>
                      <li>Food for homeless people</li>
                      <li>Clothes for the homeless people</li>
                    </ul>

                    <span class="color-primary uppercase mar-t-sm-2">And many more</span>

                  </div><!-- .pricing__body ends -->

                  <div class="pricing__footer">
                    <a href="" class="button button--primary button--fill">Donate <span class="bold space">$510</span>
                      today</a>
                  </div><!-- .pricing__footer ends -->

                </div><!-- .card ends -->

              </div><!-- .flex-* ends -->

              <div class="flex-md-6 flex-lg-4">

                <div class="card pricing custom-height">

                  <div class="pricing__header">
                    <div class="section-intro">Month-to-month</div>
                    <div class="pricing__name">Month-to-month donation plan</div>
                    <div class="pricing__amount">$75/mo</div>
                  </div><!-- .pricing__header ends -->

                  <div class="pricing__body">

                    <span class="color-primary mar-b-sm-2">Includes</span>

                    <ul>
                      <li>Homeless shelter outreach</li>
                      <li>Food for homeless people</li>
                      <li>Clothes for the homeless people</li>
                    </ul>

                    <span class="color-primary uppercase mar-t-sm-2">And many more</span>

                  </div><!-- .pricing__body ends -->

                  <div class="pricing__footer">
                    <a href="" class="button button--primary button--fill">Donate <span class="bold space">$75</span>
                      today</a>
                  </div><!-- .pricing__footer ends -->

                </div><!-- .card ends -->

              </div><!-- .flex-* ends -->

            </div><!-- .row ends -->

          </div><!-- .subscription__content ends -->

        </div><!-- .container ends -->

      </div><!-- .subscription ends -->
      <!-- SUBSCRIPTION SECTION ENDS -->

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