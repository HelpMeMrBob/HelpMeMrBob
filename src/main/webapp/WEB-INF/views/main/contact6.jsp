<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
	
  <body class="video-bg-homepage">
<script type="text/javascript">
	function checkValidate(f){
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
		/* if(f.userfile1.value==""){
			alert("썸네일 이미지를 첨부하세요");
			f.userfile1.focus();
			return false;
		} */
	}
</script>
	
	
    <!-- =================== SITE HEADER BEGINS ============================= -->
	
    <jsp:include page="/WEB-INF/views/include/header2.jsp" />
	
    <!-- =================== SITE HEADER ENDS ============================= -->
	
	
    <!-- =================== MAIN SECTION BEGINS ============================= -->
	
    <main>
	
      <!-- CONTACT FORM STARTS -->
      <section class="contact default-section-spacing">
		
        <div class="container">
			
          <!-- <form name="writeFrm" method="post" 
          action="./writeAction.do" class="form contact__form"
          onsubmit="return checkValidate(this);"> -->	
          <form name="writeFrm" method="post" 
          action="reviewEditAction.do" class="form contact__form"
          onsubmit="return checkValidate(this);"
          enctype="multipart/form-data">	
			<input type="hidden" name="id" value="${sessionScope.siteUserInfo.id}" />
			<input type="hidden" name="idx" value="${viewRow.idx }" />
			<input type="hidden" name="nowPage" value="${param.nowPage }" />
			<input type="hidden" name="pass" value="${viewRow.id }" />
			<input type="hidden" name="editFile1" value="${viewRow.userfile1}">
			<input type="hidden" name="editFile2" value="${viewRow.userfile2}">
			<input type="hidden" name="editFile3" value="${viewRow.userfile3}">
			<input type="hidden" name="editFile4" value="${viewRow.userfile4}">
			<input type="hidden" name="editFile5" value="${viewRow.userfile5}">
			
			
			
            <div class="row">
				
              <div class="flex-md-6">
				
				
              </div><!-- .flex-* ends -->
				
              <div class="flex-md-12 mar-b-md-2">
				
                <div class="form__group">
                  <label for="subject" class="form__label">제목 <span class="color-danger">*</span></label>
                  <input type="text" id="subject" class="form__input" name="title" value="${viewRow.title }">
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
				
              <div class="flex-md-12 mar-b-md-2">
				
                <div class="form__group">
                  <label for="message-2" class="form__label">내용 <span class="color-danger">*</span></label>
                  <textarea name="contents" id="message-2" class="form__textarea form__input">${viewRow.contents }</textarea>
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
              
              <div class="flex-md-12 mar-b-md-2">
				
                <div class="form__group">
                  <label for="subject" class="form__label">태그 <span class="color-danger">*</span></label>
                  <input type="text" id="subject" class="form__input" name="tag" value="${viewRow.tag}">
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
              
              <div class="flex-md-12 mar-b-md-2">
				
                <div class="form__group">
                  <label for="subject" class="form__label">첨부파일1(썸네일이미지) <span class="color-danger">*</span></label>
                  <input type="file" id="subject" class="form__input" name="userfile1" value="${viewRow.userfile1}">
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
              
                <div class="flex-md-12 mar-b-md-2">
				
                <div class="form__group">
                  <label for="subject" class="form__label">첨부파일2 <span class="color-danger">*</span></label>
                  <input type="file" id="subject" class="form__input" name="userfile2" value="${viewRow.userfile2}">
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
              
                <div class="flex-md-12 mar-b-md-2">
				
                <div class="form__group">
                  <label for="subject" class="form__label">첨부파일3 <span class="color-danger">*</span></label>
                  <input type="file" id="subject" class="form__input" name="userfile3" value="${viewRow.userfile3}">
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
              
                <div class="flex-md-12 mar-b-md-2">
				
                <div class="form__group">
                  <label for="subject" class="form__label">첨부파일4 <span class="color-danger">*</span></label>
                  <input type="file" id="subject" class="form__input" name="userfile4" value="${viewRow.userfile4}">
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
              
                <div class="flex-md-12 mar-b-md-2">
				
                <div class="form__group">
                  <label for="subject" class="form__label">첨부파일5 <span class="color-danger">*</span></label>
                  <input type="file" id="subject" class="form__input" name="userfile5" value="${viewRow.userfile5}">
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
				
              <div class="flex-md-12">
				
                <button class="button--primary button--fill" type="submit" name="submit">작성완료</button>
                <button class="button--primary button--fill" type="submit" onclick="location.href='./reviewList.do';">목록보기</button>
				
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