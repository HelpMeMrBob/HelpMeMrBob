<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />

<style>
img {
	margin-bottom: 30px;
}
</style>

  <body class="regular-homepage">

    <!-- =================== SITE HEADER BEGINS ============================= -->
    
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

    <!-- =================== SITE HEADER ENDS ============================= -->


    <!-- =================== MAIN SECTION BEGINS ============================= -->

    <main>
		
		
		<!-- 메뉴추천 카테고리 구분 STARTS -->
		<section class="category-menu pad-t-sm-6 pad-t-lg-8 pad-b-sm-6 pad-b-lg-8 mar-t-md-8">
			<div class="container">
				<div class="row text-left-sm align-items-center">
					<div class="flex-lg-9">
						<h2 class="section-intro color-off-white-with-border bold">
							메뉴추천
				  		</h2>
					</div>
				</div><!-- .row ends -->
			</div><!-- .container ends -->
		</section><!-- .podcast-cta ends -->
		<!-- 메뉴추천 카테고리 구분 ENDS -->
		
	    <!-- 랜덤 룰렛 STARTS -->
    	<section class="ministries text-center-sm default-section-spacing">
        	<div class="ministries__content">
			    <div class="container">
				    <div class="row">
			            <div class="flex-md-5">
			                <img src="./resources/main_img/rouletteResult.png" style="width: 500px;">
			            </div><!-- .flex-* ends -->
			            <div class="flex-md-6">
			            	<div class="text-block mar-b-sm-4">
							<!-- See _typography.scss for styling -->
							<blockquote class="blockquote text-center-sm">
								<h3 class="mar-b-sm-2 italic bold">룰렛</h3>
								<h5 class="bold"><br>
									메뉴개수와 추가옵션을 설정하여<br>
									사용자의 선호도를 반영한 목록과<br>
									나만의 리스트를 반영한 룰렛을 구성할 수 있습니다.
									<br><br><br>
									마음에 드는 메뉴가 선정되면<br>
									근처 식당보기 버튼을 눌러서 식당정보를 확인 해보세요.
								</h5>
							</blockquote><!-- .blockquote ends -->
			                </div><!-- .text-block ends -->
			                <button onclick="location.href='./roulette.do';"
									style="background-color: #ED6A5A; color: #F5F5F5;
									width: 150px; height: 50px; font-size: 16px; border: none;">
								<strong>바로가기</strong>
							</button>
			            </div><!-- .flex-* ends -->
			        </div>
		        </div>
	        </div>
	    </section><!-- .welcome ends -->
	    <!-- 랜덤 룰렛 ENDS -->
	    
	    <!-- SEPARATOR STARTS -->
		<div class="separator background-primary"></div>
		<!-- SEPARATOR ENDS --
	    
	    <!-- 토너먼트 STARTS -->
    	<section class="ministries text-center-sm default-section-spacing">
        	<div class="ministries__content">
			    <div class="container">
				    <div class="row">
				    	<div class="flex-md-6">
			            	<div class="text-block mar-b-sm-4">
							<!-- See _typography.scss for styling -->
							<blockquote class="blockquote text-center-sm">
							  <h3 class="mar-b-sm-2 italic bold">음식 월드컵</h3>
							  <h5 class="bold"><br>
							  	토너먼트 형식으로 음식을 선택하여,<br>
							  	제일 좋아하는 음식이 무엇인지 알아보세요.
							  </h5>
							</blockquote><!-- .blockquote ends -->
			                </div><!-- .text-block ends -->
			                <button onclick="location.href='./worldcup.do';"
									style="background-color: #ED6A5A; color: #F5F5F5;
									width: 150px; height: 50px; font-size: 16px; border: none;">
								<strong>바로가기</strong>
							</button>
			            </div><!-- .flex-* ends -->
			            <div class="flex-md-5">
			                <img src="./resources/main_img/worldcup.png" style="width: 500px;">
			            </div><!-- .flex-* ends -->
			        </div>
		        </div>
	        </div>
	    </section><!-- .welcome ends -->
	    <!-- 토너먼트 ENDS -->
	    
	    
		<!-- 지도 카테고리 구분 STARTS -->
		<section class="category-map pad-t-sm-6 pad-t-lg-8 pad-b-sm-6 pad-b-lg-8 mar-t-md-8">
			<div class="container">
				<div class="row text-center-sm text-left-lg align-items-center">
					<div class="flex-lg-9">
						<h2 class="section-intro color-off-white-with-border bold">
							지도
				  		</h2>
					</div>
				</div><!-- .row ends -->
			</div><!-- .container ends -->
		</section><!-- .podcast-cta ends -->
		<!-- 지도 카테고리 구분 ENDS -->
		
	    <!-- 지도 STARTS -->
    	<section class="ministries text-center-sm default-section-spacing">
        	<div class="ministries__content">
			    <div class="container">
				    <div class="row">
			            <div class="flex-md-5">
			                <img src="./resources/main_img/bobMap.png" style="width: 500px;">
			            </div><!-- .flex-* ends -->
			            <div class="flex-md-6">
			            	<div class="text-block mar-b-sm-4">
							<!-- See _typography.scss for styling -->
							<blockquote class="blockquote text-center-sm">
							  <h2 class="mar-b-sm-2 italic bold">밥 지도</h2>
							  <h5 class="bold"><br>
							  '지도' 탭에서 메뉴를 검색하면<br>
							  해당 메뉴를 판매하는 식당의 목록과 위치를 확인할 수 있습니다.
							  <br><br><br>
							  식당 이름 또는 마커를 클릭하면<br>
							  리뷰 글 목록이 포함된 상세정보를 볼 수 있습니다.
							  <br><br><br>
							  '즐겨찾기' 탭에서 즐겨찾기 한 식당 목록을 한 눈에 볼 수 있습니다.
							  
							  </h5>
							</blockquote><!-- .blockquote ends -->
			                </div><!-- .text-block ends -->
			                <button onclick="location.href='./infomation.do';"
									style="background-color: #ED6A5A; color: #F5F5F5;
									width: 150px; height: 50px; font-size: 16px; border: none;">
								<strong>바로가기</strong>
							</button>
			            </div><!-- .flex-* ends -->
			        </div>
		        </div>
	        </div>
	    </section><!-- .welcome ends -->
	    <!-- 지도 ENDS -->
		
		
		<!-- 커뮤니티 카테고리 구분 STARTS -->
		<section class="category-community pad-t-sm-6 pad-t-lg-8 pad-b-sm-6 pad-b-lg-8 mar-t-md-8">
			<div class="container">
				<div class="row text-center-sm text-left-lg align-items-center">
					<div class="flex-lg-9">
						<h2 class="section-intro color-off-white-with-border bold">
							커뮤니티
				  		</h2>
					</div>
				</div><!-- .row ends -->
			</div><!-- .container ends -->
		</section><!-- .podcast-cta ends -->
		<!-- 커뮤니티 카테고리 구분 ENDS -->
		
	    <!-- 리뷰 게시판 STARTS -->
    	<section class="ministries text-center-sm default-section-spacing">
        	<div class="ministries__content">
			    <div class="container">
				    <div class="row">
			            <div class="flex-md-5">
			                <img src="./resources/main_img/reviewBoardList.png" style="width: 500px;">
			            </div><!-- .flex-* ends -->
			            <div class="flex-md-6">
			            	<div class="text-block mar-b-sm-4">
							<!-- See _typography.scss for styling -->
							<blockquote class="blockquote text-center-sm">
							  <h2 class="mar-b-sm-2 italic bold">리뷰 게시판</h2>
							  <h5 class="bold"><br>
							  리뷰를 작성해서 경험치를 올리면<br>
							  '나의 음식 목록'의 탭을 잠금해제 할 수 있습니다.
							  <br><br><br>
							  다른 사용자의 글을 '좋아요'한 뒤에 '스크랩'으로 보관 하고<br>
							  마이페이지에서 관리할 수 있습니다.
							  <br><br><br>
							  댓글을 통해 서로 의견을 나누어 보세요.
							  </h5>
							</blockquote><!-- .blockquote ends -->
			                </div><!-- .text-block ends -->
			                <button onclick="location.href='./reviewList.do';"
									style="background-color: #ED6A5A; color: #F5F5F5;
									width: 150px; height: 50px; font-size: 16px; border: none;">
								<strong>바로가기</strong>
							</button>
			            </div><!-- .flex-* ends -->
			        </div>
		        </div>
	        </div>
	    </section><!-- .welcome ends -->
	    <!-- 리뷰 게시판 ENDS -->
		
		<!-- SEPARATOR STARTS -->
		<div class="separator background-primary"></div>
		<!-- SEPARATOR ENDS -->
		
		
		<!-- 음식 토론 STARTS -->
    	<section class="ministries text-center-sm default-section-spacing">
        	<div class="ministries__content">
			    <div class="container">
				    <div class="row">
			            <div class="flex-md-5">
			                <img src="./resources/main_img/vsBoard.png" style="width: 500px;">
			            </div><!-- .flex-* ends -->
			            <div class="flex-md-6">
			            	<div class="text-block mar-b-sm-4">
							<!-- See _typography.scss for styling -->
							<blockquote class="blockquote text-center-sm">
							  <h2 class="mar-b-sm-2 italic bold">음식 토론</h2>
							  <h5 class="bold"><br>
							  첨예하게 대립하는 토론 주제에 대해<br>
							  댓글을 통해 토론해 보세요.
							  <br><br><br>
							  더 높은 공감을 받고있는 의견이 무엇인지<br>
							  실시간으로 확인할 수 있습니다.
							  </h5>
							</blockquote><!-- .blockquote ends -->
			                </div><!-- .text-block ends -->
			                <button onclick="location.href='./VSFight.do';"
									style="background-color: #ED6A5A; color: #F5F5F5;
									width: 150px; height: 50px; font-size: 16px; border: none;">
								<strong>바로가기</strong>
							</button>
			            </div><!-- .flex-* ends -->
			        </div>
		        </div>
	        </div>
	    </section><!-- .welcome ends -->
	    <!-- 음식 토론 ENDS -->
		
		<!-- 포인트샵 카테고리 구분 STARTS -->
		<section class="category-pointshop pad-t-sm-6 pad-t-lg-8 pad-b-sm-6 pad-b-lg-8 mar-t-md-8">
			<div class="container">
				<div class="row text-center-sm text-left-lg align-items-center">
					<div class="flex-lg-9">
						<h2 class="section-intro color-off-white-with-border bold">
							포인트 샵
				  		</h2>
					</div>
				</div><!-- .row ends -->
			</div><!-- .container ends -->
		</section><!-- .podcast-cta ends -->
		<!-- 포인트샵 카테고리 구분 ENDS -->
		
	    <!-- 밥알 상점 STARTS -->
    	<section class="ministries text-center-sm default-section-spacing">
        	<div class="ministries__content">
			    <div class="container">
				    <div class="row">
			            <div class="flex-md-5">
			                <img src="./resources/main_img/roulette.png" style="width: 500px;">
			            </div><!-- .flex-* ends -->
			            <div class="flex-md-6">
			            	<div class="text-block mar-b-sm-4">
							<!-- See _typography.scss for styling -->
							<blockquote class="blockquote text-center-sm">
							  <h2 class="mar-b-sm-2 italic bold">밥알 상점</h2>
							  <h5 class="bold">밥알 상점에 대한 설명을 블라블라</h5>
							</blockquote><!-- .blockquote ends -->
			                </div><!-- .text-block ends -->
			                <button onclick="location.href='./shop.do';"
									style="background-color: #ED6A5A; color: #F5F5F5;
									width: 150px; height: 50px; font-size: 16px; border: none;">
								<strong>바로가기</strong>
							</button>
			            </div><!-- .flex-* ends -->
			        </div>
		        </div>
	        </div>
	    </section><!-- .welcome ends -->
	    <!-- 밥알 상점 ENDS -->
		
		
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