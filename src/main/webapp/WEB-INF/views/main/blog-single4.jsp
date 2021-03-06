<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value = "${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
<!-- ajax cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"></head>
<script>
function deleteRow(idx){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="Replydelete.do?idx="+idx;
	}
}
function writeValidate(f)
{
	if(f.content.value==""){
		alert("내용을 입력하세요");
		f.content.focus(); 
		return false;
	} 
}
</script>
  <body>



    <!-- =================== SITE HEADER BEGINS ============================= -->


    <!-- =================== SITE HEADER ENDS ============================= -->
    
    <!-- =================== MAIN SECTION BEGINS ============================= -->
	
	
    <main>
	
      <!-- SINGLE PAGE SECTION STARTS -->
      <section class="single-page single-sermon single-sermon--text default-section-spacing">
		<div class="container">
          <div class="row">

            <div class="flex-md-8 flex-lg-9">

              <div class="single-full-text printable">
                <!-- See _singles.scss for styling -->

                <div class="text-block mar-b-sm-4">
                  <h2>제목: ${viewRow.title }</h2>
                  <h5 class="mar-b-sm-2">내용: ${viewRow.contents} </h5>
                </div><!-- .text-block ends -->
				
				<c:if test="${not empty viewRow.userfile1}">
				<p><img src="${path}/resources/upload/${viewRow.userfile1}" /></p>
				</c:if>
				<c:if test="${not empty viewRow.userfile2}">
				<p><img src="${path}/resources/upload/${viewRow.userfile2}" /></p>
				</c:if>
				<c:if test="${not empty viewRow.userfile3}">
				<p><img src="${path}/resources/upload/${viewRow.userfile3}" /></p>
				</c:if>
				<c:if test="${not empty viewRow.userfile4}">
				<p><img src="${path}/resources/upload/${viewRow.userfile4}" /></p>
				</c:if>
				<c:if test="${not empty viewRow.userfile5}">
				<p><img src="${path}/resources/upload/${viewRow.userfile5}" /></p>
				</c:if>
				
			

				<div class="sidebar__widget mar-b-sm-2">

                  <h6 class="widget__title">작성정보</h6>

                  <div class="icon-text">
                    <span class="icon"><i class="ri-calendar-line"></i></span>
                    <span class="text bold">${viewRow.postdate }</span>
                  </div>

                  <div class="icon-text">
                    <span class="icon"><i class="ri-eye-line"></i></span>
                    <span class="text bold">${viewRow.visitCnt }</span>
                  </div>

                  <div class="icon-text">
                    <span class="icon">작성자:</span>
                    <span class="text bold">${viewRow.id}</span>
                  </div>
                  
                  <!-- ////////좋아요버튼/////// -->
                  <div class="icon-text mar-b-sm-2" style="margin-top: 10px;">
                    <span class="icon">
                    <c:choose>
                    	<c:when test="${ likeResult eq 1 and viewRow.idx eq idx }">
							<form name="writeFrm" method="post" 
					        	action="./like.do" class="form contact__form"
					        	onsubmit="return checkValidate(this);">
							 	<input type="hidden" name="idx" value="${viewRow.idx }" />
								<input type="hidden" name="id" value="${Android.id}" /> 
								<div class="single-page__share pad-b-sm-2">
							  	<div class="display-flex align-items-center"><div class="social">
							  	<!-- ${row.id } -->
								<button class="transparent button button--primary button--outline share-button" type="submit" name="submit">♥</button>
							   	</div></div><!-- .display-flex ends -->
							</div><!-- .single-page__share ends -->
							</form>
                    	</c:when>
                    	<c:otherwise>
							<form name="writeFrm" method="post" 
					        	action="./like.do" class="form contact__form"
					        	onsubmit="return checkValidate(this);">
							 	<input type="hidden" name="idx" value="${viewRow.idx }" />
								<input type="hidden" name="id" value="${Android.id}" /> 
								<div class="single-page__share pad-b-sm-2">
							  	<div class="display-flex align-items-center"><div class="social">
							  	<!-- ${row.id } -->
								<button class="transparent button button--primary button--outline share-button" type="submit" name="submit">♡</button>
							   	</div></div><!-- .display-flex ends -->
								</div><!-- .single-page__share ends -->
							</form>                    	
                    	</c:otherwise>
                    </c:choose>
                    <!-- ////////좋아요버튼/////// -->
					
					
                    <!-- //////////스크랩버튼////////// -->
					<!-- //////////스크랩한 게시글////////// -->
					<c:choose>
                    	<c:when test="${ scrapResult eq 1 and viewRow.idx eq idx }">
							<form name="writeFrm" method="post" 
					        	action="./scrap.do" class="form contact__form"
					        	onsubmit="return checkValidate(this);">
								<input type="hidden" name="idx" value="${viewRow.idx }" />
								<input type="hidden" name="id" value="${Android.id}" /> 
								<div class="single-page__share pad-b-sm-2">
									<div class="display-flex align-items-center">
										<div class="social">
											<button class="transparent button button--primary button--outline share-button" type="submit" name="submit">★</button>
									   	</div>
							   		</div><!-- .display-flex ends -->
								</div><!-- .single-page__share ends -->
							</form>
                    	</c:when>
                    	<c:otherwise>
							<form name="writeFrm" method="post" 
					        	action="./scrap.do" class="form contact__form"
					        	onsubmit="return checkValidate(this);">
							<input type="hidden" name="idx" value="${viewRow.idx }" />
							<input type="hidden" name="id" value="${Android.id}" /> 
							<div class="single-page__share pad-b-sm-2">
								<div class="display-flex align-items-center">
									<div class="social">
										<button class="transparent button button--primary button--outline share-button" type="submit" name="submit">☆</button>
									</div>
								</div><!-- .display-flex ends -->
							</div><!-- .single-page__share ends -->
							</form>
                    	</c:otherwise>
                    </c:choose>
					<!-- ////////스크랩버튼/////// -->
                    </span>
                  </div>
                </div><!-- .sidebar__widget ends -->
		
            </div><!-- .flex-* ends -->
          </div><!-- .row ends -->
        </div><!-- .container ends -->


	<!-- SCROLL BACK TO TOP BEGINS -->
    <div class="scroll-to-top"><i class="ri-arrow-up-line"></i></div>
    <!-- SCROLL BACK TO TOP ENDS -->
          <!-- #####버튼들##### -->
    <div class="flex-md-12" align="right">
	<%-- <button class="button--primary button--fill" type="submit" 
          onclick="location.href='./reviewId.do?idx=${viewRow.idx}&mode=edit&nowPage=${nowPage }';">
	수정하기원본</button>
	<button class="button--primary button--fill" type="submit" 
	onclick="location.href='./reviewId.do?idx=${viewRow.idx}&mode=delete&nowPage=${nowPage }';">
	삭제하기원본</button>
     		<button class="button--primary button--fill" type="submit" onclick="location.href='./reviewList.do';">List</button>--%>
	    <c:if test="${Android.id eq viewRow.id}">
	    <!-- //////삭제하기///// -->
	    <form name="writeFrm" method="post" class="form contact__form" action="./deleteAction.do">
			<input type="hidden" name="idx" value="${viewRow.idx}" />
			<input type="hidden" name="id" value="${viewRow.id}" />
			<input type="hidden" name="nowPage" value="${param.nowPage }" />
			<button class="button--primary button--fill" type="submit" name="submit">글 삭제하기</button>
		</form>
		
		<form name="writeFrm" method="post" class="form contact__form" action="./reviewEdit.do">
			<input type="hidden" name="idx" value="${viewRow.idx}" />
			<input type="hidden" name="id" value="${viewRow.id}" />
			<input type="hidden" name="nowPage" value="${param.nowPage }" />
			<button class="button--primary button--fill" type="submit" name="submit">글 수정하기</button>
		</form>
		</c:if>
	</div><!-- .flex-* ends -->


        <!-- See _singles.scss for styling -->
        </div>
      </section><!-- .single-page ends -->
      <!-- SINGLE PAGE SECTION ENDS -->

    </main><!-- main ends -->
    <!-- =================== MAIN SECTION ENDS ============================= -->

	<!-- =================== 댓글창s ============================= -->
 	
		<!-- =================== 댓글창뷰s ============================= -->
		<section class="single-page single-cause default-section-spacing">

        <div class="single-page__share background-off-white pad-t-sm-2 pad-b-sm-2">

          <div class="container">
		<h3 class="mar-b-sm-2">댓글창</h3>
		<c:forEach items="${lists }" var="row">		
		<div class="border mt-2 mb-2">
			<div class="media">
				<!-- 여기다가 회원 프사같은거 넣을수있어여 -->
				<!-- <div class="media-left mr-3">
					<img src="../images/img_avatar3.png" class="media-object" style="width:60px">
				</div> -->
				<div class="media-body">
					<h4 class="media-heading">작성자:${row.name }(${row.id })</h4>
					<p>${row.contents }</p>
				</div>	  
				<!--  수정,삭제버튼 -->
				<div class="media-right">
					<!-- 작성자 본인에게만 수정/삭제 버튼 보임 처리 -->
					<c:if test="${Android.id eq row.id}">
						<button class="btn btn-primary" 
						onclick="location.href='modify.do?idx=${row.idx}';">
						수정</button>
						
						<!-- 삭제 버튼을 누를 경우 idx값을 JS의 함수로 전달한다. -->
						<button class="btn btn-danger" 
						onclick="javascript:deleteRow(${row.idx});">
						삭제</button>
					</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- 댓글페이징 -->
	<ul class="pagination justify-content-center">
		${pagingImg }
	</ul>
	
	</div>
	</div>
	</section>
	
	<!-- =================== 댓글창뷰e ============================= -->	
		<section class="contact default-section-spacing">
        <div class="container">



		<form name="writeFrm" method="post" 
			onsubmit="return writeValidate(this);"
			action="<c:url value="/replyWrite.do" />" 
			class="form contact__form">
			<input type="hidden" name="idx" value="${viewRow.idx }" />
			
            <div class="row">
            
            <div class="flex-md-6">
				
                <div class="form__group">
                  <label for="fname" class="form__label">작성자 <span class="color-danger">*</span></label>
                  <input type="text" id="fname" class="form__input" name="name" readonly value="${Android.name }">
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
			
              <div class="flex-md-12 mar-b-md-2">

                <div class="form__group">
                  <textarea name="contents" id="message-2" class="form__textarea form__input"
                    placeholder="댓글을 입력하세요..."></textarea>
                </div><!-- .form__group ends -->

              </div><!-- .flex-* ends -->

				<div class="flex-md-12">

                <button class="button--primary button--fill" type="submit" name="submit">댓글쓰기</button>
				<a href='./reviewList.do' class="button button--primary button--fill">목록보기</a></div>
				<!-- .flex-* ends -->

            </div><!-- .row ends -->

          </form><!-- .form ends -->
          
	
    

        </div><!-- .container ends -->
        
        
	<!-- 컨텐츠와 Footer 사이의 간격을 띄우기 위한 div -->
	  <div class="mar-t-md-2" align="center"></div>
      </section><!-- .contact ends -->

	<!-- =================== 댓글창e ============================= -->
	
	

    <!-- =================== ALL MODALS ============================= -->


    <!-- =================== ALL MODALS END ============================= -->


    <!-- =================== SITE FOOTER BEGINS ============================= -->

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />

    <!-- =================== SITE FOOTER ENDS ============================= -->
    
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />

  </body>

</html>