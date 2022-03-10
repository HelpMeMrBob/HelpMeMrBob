<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value = "${pageContext.request.contextPath}" />
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
<style>
#page {
	background-color: #ED6A5A;
	color: #FFFFFF;
	font-size: 16px;
	width: 35px;
	height: 35x;
	padding: 5px;
	text-align: center;
}
</style>

  <body>



    <!-- =================== SITE HEADER BEGINS ============================= -->

    <jsp:include page="/WEB-INF/views/include/header2.jsp" />

    <!-- =================== SITE HEADER ENDS ============================= -->



    <!-- =================== MAIN SECTION BEGINS ============================= -->

    <main>
		<!-- BANNER SECTION STARTS -->
      	<section class="category-community full-width"
      		style="height: 20rem; margin-top: -8rem; padding: 15rem 0 10rem;">
        	<div class="container">
	        	<div class="banner__content">
		            <h2 class="section-intro color-off-white-with-border bold">
						리뷰 게시판
					</h2>
          		</div><!-- .banner__content ends -->
        	</div><!-- .container ends -->
      	</section><!-- .banner ends -->
      	<!-- BANNER SECTION ENDS -->

<!-- /////////////////////여기가 리스트////////////////////// -->
      <!-- ALL RESULTS SECTION STARTS -->
	<section class="all-results all-results--causes mar-t-md-8">
	<div class="container">
	<div class="flex-md-12" align="right">
       	<button class="button--primary button--fill" type="submit" 
       			onclick="location.href='./reviewWrite.do';"
       			style="width: 100px; height: 50px; padding: 10px; font-size: 14px">
       		글쓰기
      	</button>
	</div><!-- .flex-* ends -->
		<div class="row ">
			<c:forEach begin="1" end="1" step="1" var="i">
			<c:forEach items="${ listRows }" var="row"  varStatus="loop">
			<%-- ${(row.idx!=0 && (row.idx % 3==0))?"</div><div class='row'>":"" } --%>
            <div class="col-4"
            	 style="margin-Top:20px">
				<a href="./reviewView.do?idx=${row.idx}&nowPage=${nowPage}">
					<div class="card cause" style="width: 100%; height: 100%;">
						<div class="card__header no-overlay">
							<img src="${ path }/resources/upload/${row.userfile1}"
								 class="card__image"
						 	     style="padding: 20px;">
	                	</div><!-- .card__header ends -->
	                	<div class="card__body">
							<h3 style="font-size: 18px; color: #585858; font-weight: bold">
								${ row.title }
							</h3>
							<table>
								<tr>
									<td>
										<img src="${ path }/resources/include_img/bob_logo1.png"
											 style="width: 20px; height: 20px; margin-bottom: 5px"/>
									</td>
									<td>
										<h3 style="font-size: 14px; color: #585858; padding-Left: 5px;
												   width: 100px">
											${ row.id }
										</h3>
									</td>
									<td style="width: *; text-align: right">
										<h3 style="font-size: 14px; color: #585858;
												   width: 250px; text-align: right">
											${ row.postdate }
										</h3>
									</td>
								</tr>
							</table>
							<!-- 얘 없으면 쪼그라들어요 -->	
							<img src="${ path }/resources/upload/bottomBar.png"
								 style="width:500px; padding: 0px; margin: 0px;" />
	                	</div><!-- .card__body ends -->
                	</div>
				</a>
			</div><!-- .card ends -->
            
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
				<li>
					${ pagingImg }
				</li>
			</ul>

			<!-- #####버튼들##### -->

			
        </div><!-- .container ends -->

      </div><!-- .inner-pages-navigation ends -->
	<!-- 컨텐츠와 Footer 사이의 간격을 띄우기 위한 div -->
  	<div class="mar-t-md-2" align="center"></div>
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