<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />

  <body>



    <!-- =================== SITE HEADER BEGINS ============================= -->

    <jsp:include page="/WEB-INF/views/include/header2.jsp" />

    <!-- =================== SITE HEADER ENDS ============================= -->



    <!-- =================== MAIN SECTION BEGINS ============================= -->

    <main>

      <!-- BANNER SECTION STARTS -->
      <section class="banner single-banner-causes full-width">

        <div class="container">

          <div class="banner__content">

            <div class="section-heading">
              <span class="section-intro">Jesus is Lord</span>
              <h1>Clean water and food in Syria</h1>
            </div><!-- .section-heading ends -->

            <div class="breadcrumb">
              <div class="breadcrumb__home--link"><a href="index.html">Home</a></div>
              <span>/</span>
              <div class="breadcrumb__home--link"><a href="causes-layout.html">Causes</a></div>
              <span>/</span>
              <div class="breadcrumb__current--page-link">Clean water and food in Syria</div>
            </div><!-- .breadcrumb ends -->

          </div><!-- .banner__content ends -->

        </div><!-- .container ends -->

      </section><!-- .banner ends -->
      <!-- BANNER SECTION ENDS -->


      <!-- SINGLE PAGE SECTION STARTS -->
      <section class="single-page single-cause default-section-spacing">

        <div class="container">

          <div class="cause-progress pad-b-sm-4">

            <div class="section-heading">
              <span class="section-intro">Progress</span>
              <h2>Our progress</h2>
            </div><!-- .section-heading ends -->

            <div class="progress">

              <div class="progress__bar" data-current="52058" data-end="135000">
                <div class="fill"></div>
              </div><!-- .progress__bar ends -->

              <div class="progress__context mar-t-sm-2">
                <span class="current"></span>
                <span class="end"></span>
              </div><!-- .progress__context ends -->

            </div><!-- .progress ends -->

          </div><!-- .cause-progress ends -->

          <div class="donors pad-b-sm-4">

            <div class="section-heading">
              <span class="section-intro">Donors</span>
              <h2>Some of our donors</h2>
            </div><!-- .section-heading ends -->

            <div class="donors-pictures display-flex">

              <div class="donor">
                <div class="avatar avatar--medium">
                  <img src="./resources/images/avatar-4.png" alt="">
                </div>
              </div><!-- .donor ends -->

              <div class="donor">
                <div class="avatar avatar--medium">
                  <img src="./resources/images/user-3.jpg" alt="">
                </div>
              </div><!-- .donor ends -->

              <div class="donor">
                <div class="avatar avatar--medium">
                  <img src="./resources/images/avatar-9.png" alt="">
                </div>
              </div><!-- .donor ends -->

              <div class="donor">
                <div class="avatar avatar--medium">
                  <img src="./resources/images/avatar-8.png" alt="">
                </div>
              </div><!-- .donor ends -->

              <div class="donor">
                <div class="avatar avatar--medium">
                  <img src="./resources/images/avatar-7.png" alt="">
                </div>
              </div><!-- .donor ends -->

              <div class="donor">
                <div class="avatar avatar--medium">
                  <img src="./resources/images/avatar-6.png" alt="">
                </div>
              </div><!-- .donor ends -->

            </div><!-- .donors-pictures ends -->

          </div><!-- .donors ends -->

          <div class="description pad-b-sm-4">

            <div class="section-heading">
              <span class="section-intro">Description</span>
              <h2>Description</h2>
            </div><!-- .section-heading ends -->

            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur voluptatum id eius odit doloribus
              reiciendis ipsa, amet voluptas? Nulla corrupti neque harum quibusdam expedita voluptatem quo eum
              temporibus similique, mollitia quisquam aut, cumque iusto. Cupiditate!</p>
            <p>Expedita voluptas laborum soluta accusantium possimus dolor vel unde, commodi nam est ipsa asperiores
              rerum incidunt quas omnis obcaecati consectetur, nisi assumenda, libero neque quasi reprehenderit iste!
            </p>

          </div><!-- .description ends -->

        </div><!-- .container ends -->

        <div class="single-page__share background-off-white pad-t-sm-2 pad-b-sm-2">

          <div class="container">

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

          </div><!-- .container ends -->

        </div><!-- .single-page__share ends -->

      </section><!-- .single-page ends -->
      <!-- SINGLE PAGE SECTION ENDS -->


      <!-- DONATION FORM SECTION STARTS -->
      <section class="donation-form default-section-spacing pad-t-sm-0">

        <div class="container">

          <div class="section-heading text-center-sm">
            <span class="section-intro">Donate</span>
            <h2>Donation form</h2>
          </div><!-- .section-heading ends -->

          <div class="row justify-content-center">

            <div class="flex-lg-8">

              <form class="form form--donation">

                <div class="donations__amount mar-b-sm-2">
                  <h3 class="mar-b-sm-2">1. Choose an amount</h3>

                  <div class="row">

                    <div class="flex-sm-6 flex-lg-4 mar-b-sm-2">

                      <div class="form__group">
                        <input type="radio" name="donation-amount" class="form__radio" id="50">
                        <label for="50" class="form__label form__label--radio">$50</label>
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-sm-6 flex-lg-4 mar-b-sm-2">

                      <div class="form__group">
                        <input type="radio" name="donation-amount" class="form__radio" id="100">
                        <label for="100" class="form__label form__label--radio">$100</label>
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-sm-6 flex-lg-4">

                      <div class="form__group">
                        <input type="radio" name="donation-amount" class="form__radio" id="150">
                        <label for="150" class="form__label form__label--radio">$150</label>
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-sm-6 flex-lg-4">

                      <div class="form__group">
                        <input type="radio" name="donation-amount" class="form__radio" id="200" checked>
                        <label for="200" class="form__label form__label--radio">$200</label>
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-sm-12 flex-lg-4 flex-md-6 mar-t-sm-2 mar-t-lg-0">

                      <div class="form__group">
                        <input type="radio" name="donation-amount" class="form__radio" id="250">
                        <label for="250" class="form__label form__label--radio">$250</label>
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-sm-12 flex-lg-4 flex-md-6 mar-t-sm-2 mar-t-lg-0">

                      <div class="form__group">
                        <label for="custom" class="form__label form__label--custom"><span><i
                              class="ri-money-dollar-circle-line"></i></span></label>
                        <input type="text" name="donation-amount" class="form__input custom-amount" id="custom"
                          placeholder="Enter a custom amount">
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                  </div><!-- .row ends -->

                </div><!-- .donations__amount ends -->

                <div class="payment__options mar-b-sm-2">
                  <h3 class="mar-b-sm-2">2. Payment options</h3>

                  <div class="row">

                    <div class="flex-sm-6 flex-lg-4 mar-b-sm-2 mar-b-lg-0">

                      <div class="form__group">
                        <input type="radio" name="payment-option" class="form__radio" id="paypal">
                        <label for="paypal" class="form__label form__label--radio">PayPal</label>
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-sm-6 flex-lg-4 mar-b-sm-2 mar-b-lg-0">

                      <div class="form__group">
                        <input type="radio" name="payment-option" class="form__radio" id="credit-card" checked>
                        <label for="credit-card" class="form__label form__label--radio">Credit/Debit card</label>
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-sm-12 flex-lg-4">

                      <div class="form__group">
                        <input type="radio" name="payment-option" class="form__radio" id="bank-transfer">
                        <label for="bank-transfer" class="form__label form__label--radio">Bank transfer</label>
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                  </div><!-- .row ends -->

                </div><!-- .payment__options ends -->

                <div class="personal__info mar-b-sm-2">
                  <h3 class="mar-b-sm-2">3. Personal info</h3>

                  <div class="row">

                    <div class="flex-md-6">

                      <div class="form__group">
                        <input type="text" class="form__input" placeholder="Enter your name (required)">
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-md-6">

                      <div class="form__group">
                        <input type="email" class="form__input" placeholder="Enter your email address (required)">
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-md-12 mar-t-md-2">

                      <div class="form__group">
                        <input type="text" class="form__input" placeholder="Enter your phone number (optional)">
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                  </div><!-- .row ends -->

                </div><!-- .personal__info ends -->

                <div class="payment__details mar-b-sm-2">
                  <h3 class="mar-b-sm-2">4. Payment details</h3>

                  <div class="row">

                    <div class="flex-md-6 mar-b-sm-2">

                      <div class="form__group">
                        <input type="text" class="form__input" placeholder="Enter name on card">
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-md-6 mar-b-sm-2">

                      <div class="form__group">
                        <input type="text" class="form__input" placeholder="Enter card number">
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-md-6">

                      <div class="form__group">
                        <input type="text" class="form__input" placeholder="Enter card expiration date (MM/YY)">
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                    <div class="flex-md-6">

                      <div class="form__group">
                        <input type="text" class="form__input" placeholder="Enter card CCV">
                      </div><!-- .form__group ends -->

                    </div><!-- .flex-* ends -->

                  </div><!-- .row ends -->

                </div><!-- .payment__details ends -->

                <div class="total mar-b-sm-2">
                  <h3>Total: $200</h3>
                </div>

                <button type="submit" class="button--primary button--fill">Complete your donation</button>

              </form><!-- .form ends -->

            </div><!-- .flex-* ends -->

          </div><!-- .row ends -->

        </div><!-- .container ends -->

      </section><!-- .donation-form ends -->
      <!-- DONATION FORM SECTION ENDS -->


      <!-- RECOMMENDED STARTS -->
      <section class="recommended background-off-white default-section-spacing">

        <div class="container">

          <div class="section-heading">
            <span class="section-intro">Recommended</span>
            <h2>Other causes to support</h2>
          </div><!-- .section-heading ends -->

          <div class="row">

            <div class="flex-md-6 flex-lg-4">

              <div class="card cause">

                <div class="card__header no-overlay">

                  <img src="./resources/images/causes-3.jpg" alt="" class="card__image">

                </div><!-- .card__header ends -->

                <div class="card__body">

                  <h3 class="cause__tile mar-b-sm-2">Education for children</h3>

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

            </div><!-- .flex-* ends -->

            <div class="flex-md-6 flex-lg-4">

              <div class="card cause">

                <div class="card__header no-overlay">

                  <img src="./resources/images/cause-1.jpg" alt="" class="card__image">

                </div><!-- .card__header ends -->

                <div class="card__body">

                  <h3 class="cause__tile mar-b-sm-2">Clean water &amp; food in Syria</h3>

                  <div class="progress">

                    <div class="progress__context mar-b-sm-06">
                      <span class="current"></span>
                      <span class="end"></span>
                    </div><!-- .progress__context ends -->

                    <div class="progress__bar" data-current="52058" data-end="135000">
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

            </div><!-- .flex-* ends -->

            <div class="flex-md-12 flex-lg-4 mar-t-md-2 mar-t-lg-0">

              <div class="card cause">

                <div class="card__header no-overlay">

                  <img src="./resources/images/causes-2.jpg" alt="" class="card__image">

                </div><!-- .card__header ends -->

                <div class="card__body">

                  <h3 class="cause__tile mar-b-sm-2">Shelters for the homeless</h3>

                  <div class="progress">

                    <div class="progress__context mar-b-sm-06">
                      <span class="current"></span>
                      <span class="end"></span>
                    </div><!-- .progress__context ends -->

                    <div class="progress__bar" data-current="32058" data-end="105000">
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

            </div><!-- .flex-* ends -->

          </div><!-- .row ends -->

        </div><!-- .container ends -->

      </section><!-- .recommended ends -->
      <!-- RECOMMENDED ENDS -->

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