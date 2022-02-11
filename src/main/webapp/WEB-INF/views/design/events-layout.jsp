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
              <h1>Events</h1>
            </div><!-- .section-heading ends -->

            <div class="breadcrumb">
              <div class="breadcrumb__home--link"><a href="index.html">Home</a></div>
              <span>/</span>
              <div class="breadcrumb__current--page-link">Events</div>
            </div><!-- .breadcrumb ends -->

          </div><!-- .banner__content ends -->

        </div><!-- .container ends -->

      </section><!-- .banner ends -->
      <!-- BANNER SECTION ENDS -->


      <!-- INNER PAGES HEADER STARTS -->
      <div class="inner-pages-header default-section-spacing">

        <div class="container">

          <div class="section-heading text-center-sm">
            <span class="section-intro">Events</span>
            <h2>Our events</h2>
          </div><!-- .section-heading ends -->

          <div class="row align-items-center">

            <div class="flex-sm-8">
              <p>Showing 6 out of 22 events</p>
            </div><!-- .flex-* ends -->

            <div class="flex-sm-4 display-flex justify-content-end">
              <span class="filter-button button button--primary button--outline" data-filter="filter">Filter</span>
            </div>

          </div><!-- .row ends -->

          <!-- All filters. See _sidebar.scss for styling -->
          <div class="filtering" id="filter">

            <h3 class="mar-b-sm-2">Or choose a date or enter a location</h3>

            <form class="form filter-form">

              <div class="form__group form__icon mar-b-sm-2">
                <input type="text" class="form__input datepicker" placeholder="Choose a date">
                <i class="ri-calendar-line"></i>
              </div>

              <div class="form__group form__icon mar-b-sm-2">
                <input type="text" class="form__input" placeholder="Enter city, state, or zip code">
                <i class="ri-map-pin-line"></i>
              </div>

              <button class="button button--primary button--fill" type="submit">Search</button>

            </form><!-- .form ends -->

          </div><!-- .filtering ends -->

        </div><!-- .container ends -->


      </div><!-- .inner-pages-header ends -->
      <!-- INNER PAGES HEADER ENDS -->


      <!-- ALL RESULTS SECTION STARTS -->
      <section class="all-results all-results--events">

        <div class="container">

          <div class="row">

            <div class="flex-md-6 flex-lg-4">

              <div class="card events">

                <div class="card__body">

                  <div class="label uppercase">Free</div>

                  <div class="event__details mar-t-sm-2 mar-b-sm-2">

                    <div class="icon-text">
                      <span class="icon"><i class="ri-calendar-line"></i></span>
                      <span class="text">02/28/2020</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-time-line"></i></span>
                      <span class="text">11:45 AM - 12:45PM</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-map-pin-line"></i></span>
                      <span class="text">123 Jay St, Albany, NY 12203</span>
                    </div><!-- .icon-text ends -->

                  </div><!-- .event__details ends -->

                  <h3 class="event__tile">Prayer gathering</h3>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="events-single.html" class="button button--primary button--fill">Learn more</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->

            </div><!-- .flex-* ends -->

            <div class="flex-md-6 flex-lg-4">

              <div class="card events">

                <div class="card__body">

                  <div class="label uppercase">Free</div>

                  <div class="event__details mar-t-sm-2 mar-b-sm-2">

                    <div class="icon-text">
                      <span class="icon"><i class="ri-calendar-line"></i></span>
                      <span class="text">04/28/2020</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-time-line"></i></span>
                      <span class="text">11:45 AM - 12:45PM</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-map-pin-line"></i></span>
                      <span class="text">123 Jay St, Albany, NY 12203</span>
                    </div><!-- .icon-text ends -->

                  </div><!-- .event__details ends -->

                  <h3 class="event__tile">Homeless shelter outreach</h3>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="events-single.html" class="button button--primary button--fill">Learn more</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->

            </div><!-- .flex-* ends -->

            <div class="flex-md-6 flex-lg-4 mar-t-md-2 mar-t-lg-0">

              <div class="card events">

                <div class="card__body">

                  <div class="label uppercase">Free</div>

                  <div class="event__details mar-t-sm-2 mar-b-sm-2">

                    <div class="icon-text">
                      <span class="icon"><i class="ri-calendar-line"></i></span>
                      <span class="text">06/28/2020</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-time-line"></i></span>
                      <span class="text">11:45 AM - 12:45PM</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-map-pin-line"></i></span>
                      <span class="text">123 Jay St, Albany, NY 12203</span>
                    </div><!-- .icon-text ends -->

                  </div><!-- .event__details ends -->

                  <h3 class="event__tile">Scholarship fundraiser</h3>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="events-single.html" class="button button--primary button--fill">Learn more</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->

            </div><!-- .flex-* ends -->

            <div class="flex-md-6 flex-lg-4 mar-t-md-2">

              <div class="card events">

                <div class="card__body">

                  <div class="label uppercase">Free</div>

                  <div class="event__details mar-t-sm-2 mar-b-sm-2">

                    <div class="icon-text">
                      <span class="icon"><i class="ri-calendar-line"></i></span>
                      <span class="text">06/28/2020</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-time-line"></i></span>
                      <span class="text">11:45 AM - 12:45PM</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-map-pin-line"></i></span>
                      <span class="text">123 Jay St, Albany, NY 12203</span>
                    </div><!-- .icon-text ends -->

                  </div><!-- .event__details ends -->

                  <h3 class="event__tile">Cleaning parks</h3>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="events-single.html" class="button button--primary button--fill">Learn more</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->

            </div><!-- .flex-* ends -->

            <div class="flex-md-6 flex-lg-4 mar-t-md-2">

              <div class="card events">

                <div class="card__body">

                  <div class="label uppercase">Free</div>

                  <div class="event__details mar-t-sm-2 mar-b-sm-2">

                    <div class="icon-text">
                      <span class="icon"><i class="ri-calendar-line"></i></span>
                      <span class="text">06/28/2020</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-time-line"></i></span>
                      <span class="text">11:45 AM - 12:45PM</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-map-pin-line"></i></span>
                      <span class="text">123 Jay St, Albany, NY 12203</span>
                    </div><!-- .icon-text ends -->

                  </div><!-- .event__details ends -->

                  <h3 class="event__tile">Church anniversary</h3>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="events-single.html" class="button button--primary button--fill">Learn more</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->

            </div><!-- .flex-* ends -->

            <div class="flex-md-6 flex-lg-4 mar-t-md-2">

              <div class="card events">

                <div class="card__body">

                  <div class="label uppercase">Free</div>

                  <div class="event__details mar-t-sm-2 mar-b-sm-2">

                    <div class="icon-text">
                      <span class="icon"><i class="ri-calendar-line"></i></span>
                      <span class="text">06/28/2020</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-time-line"></i></span>
                      <span class="text">11:45 AM - 12:45PM</span>
                    </div><!-- .icon-text ends -->

                    <div class="icon-text">
                      <span class="icon"><i class="ri-map-pin-line"></i></span>
                      <span class="text">123 Jay St, Albany, NY 12203</span>
                    </div><!-- .icon-text ends -->

                  </div><!-- .event__details ends -->

                  <h3 class="event__tile">New Year night revival service</h3>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="events-single.html" class="button button--primary button--fill">Learn more</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->

            </div><!-- .flex-* ends -->

          </div><!-- .row ends -->

        </div><!-- .container ends -->

      </section><!-- .all-results -->
      <!-- ALL RESULTS SECTION ENDS -->

      <div class="inner-pages-navigation pad-t-sm-4 pad-b-sm-4">

        <div class="container">

          <div class="pagination">
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
          </div><!-- .pagination ends -->

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