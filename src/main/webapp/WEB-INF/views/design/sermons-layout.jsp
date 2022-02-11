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
              <h1>Sermons</h1>
            </div><!-- .section-heading ends -->

            <div class="breadcrumb">
              <div class="breadcrumb__home--link"><a href="index.html">Home</a></div>
              <span>/</span>
              <div class="breadcrumb__current--page-link">Sermons</div>
            </div><!-- .breadcrumb ends -->

          </div><!-- .banner__content ends -->

        </div><!-- .container ends -->

      </section><!-- .banner ends -->
      <!-- BANNER SECTION ENDS -->


      <!-- INNER PAGES HEADER STARTS -->
      <div class="inner-pages-header default-section-spacing">

        <div class="container">

          <div class="section-heading text-center-sm">
            <span class="section-intro">Sermons</span>
            <h2>Our sermons</h2>
          </div><!-- .section-heading ends -->

          <div class="row align-items-center">

            <div class="flex-sm-8">
              <p>Showing 6 out of 22 sermons</p>
            </div><!-- .flex-* ends -->

            <div class="flex-sm-4 display-flex justify-content-end">
              <span class="filter-button button button--primary button--outline" data-filter="filter">Filter</span>
            </div>

          </div><!-- .row ends -->

          <!-- All filters. See _sidebar.scss for styling -->
          <div class="filtering" id="filter">

            <div class="first-half mar-b-sm-4">

              <h3 class="mar-b-sm-2">Filter by type</h3>

              <div class="row">

                <div class="flex-sm-6">

                  <div class="form__group">
                    <input type="radio" name="type" class="form__radio" id="all" checked>
                    <label for="all" class="form__label form__label--radio">All</label>
                  </div><!-- .form__group ends -->

                </div><!-- .flex-* ends -->

                <div class="flex-sm-6">

                  <div class="form__group">
                    <input type="radio" name="type" class="form__radio" id="text">
                    <label for="text" class="form__label form__label--radio">Text</label>
                  </div><!-- .form__group ends -->

                </div><!-- .flex-* ends -->

                <div class="flex-sm-6 mar-t-sm-2">

                  <div class="form__group">
                    <input type="radio" name="type" class="form__radio" id="audio">
                    <label for="audio" class="form__label form__label--radio">Audio</label>
                  </div><!-- .form__group ends -->

                </div><!-- .flex-* ends -->

                <div class="flex-sm-6 mar-t-sm-2">

                  <div class="form__group">
                    <input type="radio" name="type" class="form__radio" id="video">
                    <label for="video" class="form__label form__label--radio">Video</label>
                  </div><!-- .form__group ends -->

                </div><!-- .flex-* ends -->

              </div><!-- .row ens -->

            </div><!-- .first-half ends -->

            <div class="second-half">
              <h3 class="mar-b-sm-2">Or choose a date or enter a keyword</h3>

              <form class="form filter-form">

                <div class="form__group form__icon mar-b-sm-2">
                  <input type="text" class="form__input datepicker" placeholder="Choose a date">
                  <i class="ri-calendar-line"></i>
                </div>

                <div class="form__group mar-b-sm-2">
                  <input type="text" class="form__input" placeholder="Enter a keyword">
                </div>

                <button class="button button--primary button--fill" type="submit">Search</button>

              </form><!-- .form ends -->

            </div><!-- .second-half ends -->

          </div><!-- .filtering ends -->

        </div><!-- .container ends -->


      </div><!-- .inner-pages-header ends -->
      <!-- INNER PAGES HEADER ENDS -->


      <!-- ALL RESULTS SECTION STARTS -->
      <section class="all-results all-results--sermons">

        <div class="container">

          <div class="row">

            <div class="flex-md-6 flex-lg-4">

              <div class="card sermon">

                <div class="card__header">

                  <img src="./resources/images/church-bldg-md.jpg" alt="Church building" class="card__image">

                  <div class="card__details">

                    <div class="label uppercase"><i class="ri-headphone-line"></i></div>

                    <div class="avatar-name mar-t-sm-2">
                      <div class="avatar avatar--small">
                        <img src="./resources/images/avatar-2.png" alt="">
                      </div>
                      <div class="name">Pastor John G. Green</div>
                    </div><!-- .avatar-name -->

                    <div class="sermon__details mar-t-sm-2">

                      <div class="icon-text">
                        <span class="icon"><i class="ri-calendar-line"></i></span>
                        <span class="text">02/28/2020</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-eye-line"></i></span>
                        <span class="text">232</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-time-line"></i></span>
                        <span class="text">33:45</span>
                      </div><!-- .icon-text ends -->

                    </div><!-- .sermon__details ends -->

                  </div><!-- .card__details ends -->

                </div><!-- .card__header ends -->

                <div class="card__body">

                  <h3 class="sermon__tile mar-b-sm-2">The church before vs. church now</h3>
                  <p class="excerpt">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Deserunt impedit
                    cupiditate officiis commodi, autem ratione perspiciatis. Delectus, sed? Modi, repudiandae! Laborum
                    reiciendis facere impedit suscipit tempora quasi commodi vitae deleniti harum voluptates dolores,
                    earum sequi...</p>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="sermons-single.html" class="button button--primary button--fill">Listen now</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right-sm">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->

            </div><!-- .flex-* ends -->

            <div class="flex-md-6 flex-lg-4">

              <div class="card sermon">

                <div class="card__header">

                  <img src="./resources/images/sermon-2.jpg" alt="A man sitting down" class="card__image">

                  <div class="card__details">

                    <div class="label uppercase"><i class="ri-file-list-line"></i></div>

                    <div class="avatar-name mar-t-sm-2">
                      <div class="avatar avatar--small">
                        <img src="./resources/images/avatar-2.png" alt="">
                      </div>
                      <div class="name">Pastor John G. Green</div>
                    </div><!-- .avatar-name -->

                    <div class="sermon__details mar-t-sm-2">

                      <div class="icon-text">
                        <span class="icon"><i class="ri-calendar-line"></i></span>
                        <span class="text">02/28/2020</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-eye-line"></i></span>
                        <span class="text">232</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-time-line"></i></span>
                        <span class="text">10:45 of reading</span>
                      </div><!-- .icon-text ends -->

                    </div><!-- .sermon__details ends -->

                  </div><!-- .card__details ends -->

                </div><!-- .card__header ends -->

                <div class="card__body">

                  <h3 class="sermon__tile mar-b-sm-2">The suffering &amp; sacrifice of Christ</h3>
                  <p class="excerpt">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Deserunt impedit
                    cupiditate officiis commodi, autem ratione perspiciatis. Delectus, sed? Modi, repudiandae! Laborum
                    reiciendis facere impedit suscipit tempora quasi commodi vitae deleniti harum voluptates dolores,
                    earum sequi...</p>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="sermons-single.html" class="button button--primary button--fill">Read more</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right-sm">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->

            </div><!-- .flex-* ends -->

            <div class="flex-md-6 flex-lg-4 mar-t-md-2 mar-t-lg-0">

              <div class="card sermon">

                <div class="card__header">

                  <img src="./resources/images/sermon-1.jpg" alt="A woman holding Bible" class="card__image">

                  <div class="card__details">

                    <div class="label uppercase"><i class="ri-video-line"></i></div>

                    <div class="avatar-name mar-t-sm-2">
                      <div class="avatar avatar--small">
                        <img src="./resources/images/avatar-2.png" alt="">
                      </div>
                      <div class="name">Pastor John G. Green</div>
                    </div><!-- .avatar-name -->

                    <div class="sermon__details mar-t-sm-2">

                      <div class="icon-text">
                        <span class="icon"><i class="ri-calendar-line"></i></span>
                        <span class="text">02/28/2020</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-eye-line"></i></span>
                        <span class="text">232</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-time-line"></i></span>
                        <span class="text">43:15</span>
                      </div><!-- .icon-text ends -->

                    </div><!-- .sermon__details ends -->

                  </div><!-- .card__details -->

                </div><!-- .card__header ends -->

                <div class="card__body">

                  <h3 class="sermon__tile mar-b-sm-2">It is important to put kingdom over culture</h3>
                  <p class="excerpt">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Deserunt impedit
                    cupiditate officiis commodi, autem ratione perspiciatis. Delectus, sed? Modi, repudiandae! Laborum
                    reiciendis facere impedit suscipit tempora quasi commodi vitae deleniti harum voluptates dolores,
                    earum sequi...</p>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="sermons-single.html" class="button button--primary button--fill">Watch now</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right-sm">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->

            </div><!-- .flex-* ends -->

            <div class="flex-md-6 flex-lg-4 mar-t-md-2">

              <div class="card sermon">

                <div class="card__header">

                  <img src="./resources/images/sermon-2.jpg" alt="A man sitting down" class="card__image">

                  <div class="card__details">

                    <div class="label uppercase"><i class="ri-file-list-line"></i></div>

                    <div class="avatar-name mar-t-sm-2">
                      <div class="avatar avatar--small">
                        <img src="./resources/images/avatar-2.png" alt="">
                      </div>
                      <div class="name">Pastor John G. Green</div>
                    </div><!-- .avatar-name -->

                    <div class="sermon__details mar-t-sm-2">

                      <div class="icon-text">
                        <span class="icon"><i class="ri-calendar-line"></i></span>
                        <span class="text">02/28/2020</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-eye-line"></i></span>
                        <span class="text">232</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-time-line"></i></span>
                        <span class="text">10:45 of reading</span>
                      </div><!-- .icon-text ends -->

                    </div><!-- .sermon__details ends -->

                  </div><!-- .card__details ends -->

                </div><!-- .card__header ends -->

                <div class="card__body">

                  <h3 class="sermon__tile mar-b-sm-2">The suffering &amp; sacrifice of Christ</h3>
                  <p class="excerpt">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Deserunt impedit
                    cupiditate officiis commodi, autem ratione perspiciatis. Delectus, sed? Modi, repudiandae! Laborum
                    reiciendis facere impedit suscipit tempora quasi commodi vitae deleniti harum voluptates dolores,
                    earum sequi...</p>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="sermons-single.html" class="button button--primary button--fill">Read more</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right-sm">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->

            </div><!-- .flex-* ends -->

            <div class="flex-md-6 flex-lg-4 mar-t-md-2">

              <div class="card sermon">

                <div class="card__header">

                  <img src="./resources/images/sermon-1.jpg" alt="A woman holding Bible" class="card__image">

                  <div class="card__details">

                    <div class="label uppercase"><i class="ri-video-line"></i></div>

                    <div class="avatar-name mar-t-sm-2">
                      <div class="avatar avatar--small">
                        <img src="./resources/images/avatar-2.png" alt="">
                      </div>
                      <div class="name">Pastor John G. Green</div>
                    </div><!-- .avatar-name -->

                    <div class="sermon__details mar-t-sm-2">

                      <div class="icon-text">
                        <span class="icon"><i class="ri-calendar-line"></i></span>
                        <span class="text">02/28/2020</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-eye-line"></i></span>
                        <span class="text">232</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-time-line"></i></span>
                        <span class="text">43:15</span>
                      </div><!-- .icon-text ends -->

                    </div><!-- .sermon__details ends -->

                  </div><!-- .card__details -->

                </div><!-- .card__header ends -->

                <div class="card__body">

                  <h3 class="sermon__tile mar-b-sm-2">It is important to put kingdom over culture</h3>
                  <p class="excerpt">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Deserunt impedit
                    cupiditate officiis commodi, autem ratione perspiciatis. Delectus, sed? Modi, repudiandae! Laborum
                    reiciendis facere impedit suscipit tempora quasi commodi vitae deleniti harum voluptates dolores,
                    earum sequi...</p>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="sermons-single.html" class="button button--primary button--fill">Watch now</a>
                  </div><!-- .card__cta ends -->

                  <div class="card__share text-right-sm">
                    <button class="transparent button button--primary button--outline share-button"><i
                        class="ri-share-line"></i></button>
                  </div><!-- .card__share ends -->

                </div><!-- .card__footer ends -->

              </div><!-- .card ends -->

            </div><!-- .flex-* ends -->

            <div class="flex-md-6 flex-lg-4 mar-t-md-2">

              <div class="card sermon">

                <div class="card__header">

                  <img src="./resources/images/church-bldg-md.jpg" alt="Church building" class="card__image">

                  <div class="card__details">

                    <div class="label uppercase"><i class="ri-headphone-line"></i></div>

                    <div class="avatar-name mar-t-sm-2">
                      <div class="avatar avatar--small">
                        <img src="./resources/images/avatar-2.png" alt="">
                      </div>
                      <div class="name">Pastor John G. Green</div>
                    </div><!-- .avatar-name -->

                    <div class="sermon__details mar-t-sm-2">

                      <div class="icon-text">
                        <span class="icon"><i class="ri-calendar-line"></i></span>
                        <span class="text">02/28/2020</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-eye-line"></i></span>
                        <span class="text">232</span>
                      </div><!-- .icon-text ends -->

                      <div class="icon-text">
                        <span class="icon"><i class="ri-time-line"></i></span>
                        <span class="text">33:45</span>
                      </div><!-- .icon-text ends -->

                    </div><!-- .sermon__details ends -->

                  </div><!-- .card__details ends -->

                </div><!-- .card__header ends -->

                <div class="card__body">

                  <h3 class="sermon__tile mar-b-sm-2">The church before vs. church now</h3>
                  <p class="excerpt">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Deserunt impedit
                    cupiditate officiis commodi, autem ratione perspiciatis. Delectus, sed? Modi, repudiandae! Laborum
                    reiciendis facere impedit suscipit tempora quasi commodi vitae deleniti harum voluptates dolores,
                    earum sequi...</p>

                </div><!-- .card__body ends -->

                <div class="card__footer">

                  <div class="card__cta">
                    <a href="sermons-single.html" class="button button--primary button--fill">Listen now</a>
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