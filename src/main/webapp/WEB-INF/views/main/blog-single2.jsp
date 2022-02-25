<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
<!-- ajax cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"></head>
<script>
function deleteRow(idx){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="delete.do?idx="+idx;
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
////////////ajax보류////////////////
/* function like_func(){
	  var idx = $('#idx').val();
	  var id = $('#id').val();
	  console.log("idx, id : " + idx +","+ id);
	   $.ajax({
		    url: "./like.do",
		    type: "GET",
		    cache: false,
		    dataType: "json",
		    data: 'idx=' +idx+ '&id=' +id,
		    success: function(data) {
		      if(data.lno == 0){
		        like_img = "♡";
		      } else {
		        like_img = "♥";
		      }
		      $('#lno').html(data.lno);
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		  });
} */
</script>
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
				<p>${viewRow.id}</p>
                <p>${viewRow.postdate }</p>
				<p>${viewRow.visitCnt }</p>
				<p><img src="resources/upload/${viewRow.userfile1}" /></p>
				<p><img src="resources/upload/${viewRow.userfile2}" /></p>
				<p><img src="resources/upload/${viewRow.userfile3}" /></p>
				<p><img src="resources/upload/${viewRow.userfile4}" /></p>
				<p><img src="resources/upload/${viewRow.userfile5}" /></p>
				
				<c:forEach items="${viewRow }" var="row"  varStatus="loop">
					<p><img src="resources/upload/${viewRow.userfile1}" /></p>
				</c:forEach>
				
				<h3>${lno}</h3>
<!-- ////////좋아요버튼/////// -->
<form name="writeFrm" method="post" 
          action="./like.do" class="form contact__form"
          onsubmit="return checkValidate(this);">
 <input type="hidden" name="idx" value="${viewRow.idx }" />
<input type="hidden" name="id" value="${sessionScope.siteUserInfo.id}" /> 
<div class="single-page__share pad-b-sm-2">
  <div class="display-flex align-items-center"><div class="social">
  <!-- ${row.id } -->
	<button class="transparent button button--primary button--outline share-button" type="submit" name="submit">♡</button>
   </div></div><!-- .display-flex ends -->
</div><!-- .single-page__share ends -->
</form>
<!-- ////////좋아요버튼/////// -->
            </div><!-- .flex-* ends -->

          </div><!-- .row ends -->

        </div><!-- .container ends -->

        <!-- See _singles.scss for styling -->
        
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
					<c:if test="${sessionScope.siteUserInfo.id eq row.id}">
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
                  <input type="text" id="fname" class="form__input" name="name" value="${sessionScope.siteUserInfo.name }">
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

              </div><!-- .flex-* ends -->

            </div><!-- .row ends -->

          </form><!-- .form ends -->
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
	
    <!-- SCROLL BACK TO TOP BEGINS -->
    <div class="scroll-to-top"><i class="ri-arrow-up-line"></i></div>
    <!-- SCROLL BACK TO TOP ENDS -->
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

        </div><!-- .container ends -->

      </section><!-- .contact ends -->

	<!-- =================== 댓글창e ============================= -->
	
	

    <!-- =================== ALL MODALS ============================= -->

    <jsp:include page="/WEB-INF/views/include/search.jsp" />

    <!-- =================== ALL MODALS END ============================= -->


    <!-- =================== SITE FOOTER BEGINS ============================= -->

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />

    <!-- =================== SITE FOOTER ENDS ============================= -->
    
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />

  </body>

</html>