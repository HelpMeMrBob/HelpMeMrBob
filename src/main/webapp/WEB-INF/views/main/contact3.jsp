<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
	
  <body class="video-bg-homepage">
<script type="text/javascript">
	function checkValidate(f){
		if(f.id.value==""){
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.tag.value==""){
			alert("태그를 입력하세요");
			f.tag.focus();
			return false;
		}
		if(f.title.value==""){
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if(f.contents.value==""){
			alert("내용을 입력하세요");
			f.contents.focus();
			return false;
		}
	}
</script>
	
	
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
              <h1>Contact</h1>
            </div><!-- .section-heading ends -->
			
            <div class="breadcrumb">
              <div class="breadcrumb__home--link"><a href="index.html">Home</a></div>
              <span>/</span>
              <div class="breadcrumb__current--page-link">Contact</div>
            </div><!-- .breadcrumb ends -->
			
          </div><!-- .banner__content ends -->
			
        </div><!-- .container ends -->
		
      </section><!-- .banner ends -->
      <!-- BANNER SECTION ENDS -->
		
      <!-- CONTACT FORM STARTS -->
      <section class="contact default-section-spacing">
		
        <div class="container">
			
          <form name="writeFrm" method="post" 
          action="./editAction.do" class="form contact__form"
          onsubmit="return checkValidate(this);">
			
	<input type="hidden" name="idx" value="${viewRow.idx }" />
	<input type="hidden" name="nowPage" value="${param.nowPage }" />
	<input type="hidden" name="pass" value="${viewRow.id }" />
            
            <div class="row">
				
              <div class="flex-md-6">
				
                <div class="form__group">
                  <label for="fname" class="form__label">아이디 <span class="color-danger">*</span></label>
                  <input type="text" id="fname" class="form__input" name="id" value="${viewRow.id}">
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
				
              <div class="flex-md-6 mar-b-md-2">
				
                <div class="form__group">
                  <label for="email-2" class="form__label">태그 <span
                      class="color-danger">*</span></label>
                  <input type="text" id="email-2" class="form__input" name="tag"
                    value="${viewRow.tag}">
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
				
              <div class="flex-md-12 mar-b-md-2">
				
                <div class="form__group">
                  <label for="subject" class="form__label">제목 <span class="color-danger">*</span></label>
                  <input type="text" id="subject" class="form__input" name="title" value="${viewRow.title }"/>
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
				
              <div class="flex-md-12 mar-b-md-2">
				
                <div class="form__group">
                  <label for="message-2" class="form__label">내용 <span class="color-danger">*</span></label>
                  <textarea name="contents" id="message-2" class="form__textarea form__input">
                  ${viewRow.contents }</textarea>
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
				
              <div class="flex-md-12">
				
                <button class="button--primary button--fill" type="submit" name="submit">작성완료</button>
				<button class="button--primary button--fill" type="submit" onclick="location.href='./reviewList.do';">List</button>
              </div><!-- .flex-* ends -->
				
				
            </div><!-- .row ends -->
			
          </form><!-- .form ends -->
			
        </div><!-- .container ends -->
		
      </section><!-- .contact ends -->
      <!-- CONTACT FORM ENDS -->
	
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