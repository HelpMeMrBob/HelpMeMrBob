<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value = "${pageContext.request.contextPath}" />

<header class="header light-text" data-onscroll-classes="fixed-header animate-header">

  <nav class="bottom-nav" style="background-color : #0a151f;">

    <div class="container">

      <div class="header__nav">

        <div class="header__logo brand--logo">
          <a href="./">
          	<img id="bob_logo2" src="${path}/resources/images/bob_logo2.png">
          </a>
        </div>

        <div class="header__mobile--opener hide-on-lg">
          <button class="header__mobile--icon" aria-expanded="false" aria-controls="mobile-menu"
            data-toggle="mobile-menu">
            <span class="line"></span>
            <span class="line"></span>
            <span class="line"></span>
          </button>
        </div>

        <ul class="header__navitems show-on-lg" id="mobile-menu">

          <!-- Contains donation button for mobile and tablet devices -->
          <li class="header__extra">
            <div class="cta">
              <a href="donations.html" class="button button-block-sm button--primary button--fill">로그인</a>
            </div>
          </li><!-- .header__extra ends -->
<!-- 홈은 따로 쓰지말고 좌측상단의 로고 클릭하면 홈으로 이동하게 만들께요.
          <li class="header__list active"><a href=""></a></li>.header__list ends
 -->
        <li class="header__list">
          	<a href="./roulette.do" class="dropdown-link caret">메뉴추천</a>
          	<div class="header__submenu">
	            <ul>
		            <li class="header__list"><a href="./roulette.do">룰렛</a></li>
		            <li class="header__list"><a href="./worldcup.do">음식 월드컵</a></li>
	            </ul>
            </div><!-- .header__submenu ends -->
       	</li><!-- .header__list ends -->
		&nbsp;&nbsp;&nbsp;
          <li class="header__list">
            <a href="./infomation.do" class="dropdown-link caret">지도</a>

            <div class="header__submenu">
              <ul>

                <li class="header__list"><a href="./infomation.do">밥 지도</a></li>
                <!-- <li class="header__list"><a href="ministries-single.html">2</a></li> -->

              </ul>
            </div><!-- .header__submenu ends -->
          </li><!-- .header__list ends -->
		&nbsp;&nbsp;&nbsp;
          <li class="header__list">
            <a href="" class="dropdown-link caret">커뮤니티</a>

            <div class="header__submenu">
              <ul>

                <li class="header__list"><a href="sermons-layout.html">리뷰 게시판</a></li>
                <li class="header__list"><a href="sermons-single.html">푸드 캘린더</a></li>
                <li class="header__list"><a href="sermons-single.html">음식 토론</a></li>

              </ul>

            </div><!-- .header__submenu ends -->
          </li><!-- .header__list ends -->
		&nbsp;&nbsp;&nbsp;
          <li class="header__list">
            <a href="" class="dropdown-link caret">밥알상점</a>

            <div class="header__submenu">
              <ul>

                <li class="header__list"><a href="./displayEmoticon.do">아이템 구매하기</a></li>
                <li class="header__list"><a href="./payDisplay.do">밥알 충전하기</a></li>

              </ul>
            </div><!-- .header__submenu ends -->
          </li><!-- .header__list ends -->
          
          
<!-- 필요한 경우 주석해제해서 사용
          <li class="header__list">
            <a href="" class="dropdown-link caret">Causes</a>

            <div class="header__submenu">
              <ul>

                <li class="header__list"><a href="causes-layout.html">Causes layout</a></li>
                <li class="header__list"><a href="causes-single.html">Causes single</a></li>

              </ul>
            </div>.header__submenu ends
          </li>.header__list ends

          <li class="header__list">
            <a href="" class="dropdown-link caret">Pages</a>

            <div class="header__submenu">
              <ul>

                <li class="header__list"><a href="donations.html">Donations</a></li>
                <li class="header__list"><a href="thankyou-donations.html">Thank you (Donations)</a></li>

                <li class="header__list"><a href="coming-soon.html">Coming soon</a></li>
                <li class="header__list"><a href="staffs-single.html">Staffs single</a></li>

              </ul>
            </div>.header__submenu ends
          </li>.header__list ends

          <li class="header__list">
            <a href="" class="dropdown-link caret">Blog</a>

            <div class="header__submenu">
              <ul>

                <li class="header__list"><a href="blog-layout.html">Blog list</a></li>
                <li class="header__list"><a href="blog-single.html">Blog single</a></li>

              </ul>
            </div>.header__submenu ends
          </li>.header__list ends

          <!-- .header__list ends -->
        </ul><!-- .header__navitems ends -->

        <!-- Contains Search button and donation button -->
        <div class="header__extra desktop-version">
          <div class="search"> 
            <div class="search-icon">
              <button class="modal-button" data-modal-target="site-search"><i class="ri-search-line"></i></button>
            </div>
          </div>

	      <div class="cta hide-on-sm show-on-lg" style="">
			<c:choose>
				<c:when test="${ not empty sessionScope.siteUserInfo }">
					<table>
						<tr>
							<td>
								<button onclick="location.href='./mypage.do';"
										style="background-color: #ED6A5A; color: #F5F5F5;
										       width: 150px; height: 70px; font-size: 16px;
										       border: none; border-right: 5px solid #0F202E">
									<strong>마이페이지</strong>
								</button>
							</td>
							<td>
								<button onclick="location.href='./logout.do';"
										style="background-color: #ED6A5A; color: #F5F5F5;
											   width: 150px ; height: 70px; font-size: 16px;
											   border: none; border-left: 3px solid #0f202e">
									<strong>로그아웃</strong>
								</button>
							</td>
						</tr>
					</table>
				</c:when>
				<c:otherwise><!-- 로그인 되지 않았을때 ──────────────────────────────────────-->
					<table>
						<tr>
							<td>
								<button onclick="location.href='./login.do';"
										  style="background-color: #ED6A5A; color: #F5F5F5;
												 width: 150px; height: 70px; font-size: 16px;
												 border: none; border-right: 3px solid #0a151f">
									<strong>로그인</strong>
								</button>
							</td>
							<td>
								<button onclick="location.href='./memberRegister.do';"
										style="background-color: #ED6A5A; color: #F5F5F5;
											   width: 150px; height: 70px; font-size: 16px;
											   border: none; border-left: 3px solid #0a151f">
									<strong>회원가입</strong>
								</button>
							</td>
						</tr>
					</table>
				</c:otherwise>
			</c:choose>
          </div>
          
        </div><!-- .header__extra ends -->

      </div><!-- .header__nav ends -->

    </div><!-- .container -->

  </nav><!-- .bottom-nav ends -->
</header><!-- .header ends -->