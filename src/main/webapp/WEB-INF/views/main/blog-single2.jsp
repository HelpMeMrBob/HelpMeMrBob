<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value = "${ pageContext.request.contextPath }" />
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

    <jsp:include page="/WEB-INF/views/include/header2.jsp" />

    <!-- =================== SITE HEADER ENDS ============================= -->
    
    <!-- =================== MAIN SECTION BEGINS ============================= -->
	
	
	<main>
	<section class="category-pointshop pad-t-sm-6 pad-t-lg-8 pad-b-sm-6 pad-b-lg-8 mar-t-md-8">
		<div class="container">
			<div class="banner__content">
				<h2 class="section-intro color-off-white-with-border bold">
					리뷰게시판
				</h2>
			</div>
        </div>
	</section><!-- .banner ends -->
	
   	<div style="width: 100%; margin-Left: 20%; margin-Right: 20%; margin-Top:5%;
   			    text-align: center;">
   		<table style="width: 60%; text-align: center;">
   		<tr>
			<td colspan="2" style="width: 50%;">
                  <h2 style="font-weight: bold; color: #484848">
                  	${viewRow.title }
                  </h2>
			</td>
		</tr>
		<tr style="margin-Bottom: 1%">
			<td colspan="2" style="width: 50%; height: 30px; padding-Bottom:10px ;margin-Bottom: 20px;
					   border-Bottom: 1px Solid #DFDFDF">
				<span class="icon"><i class="ri-calendar-line"></i></span>
                <span class="text">${viewRow.postdate }</span>
                &nbsp;&nbsp;
                <span class="icon"><i class="ri-eye-line"></i></span>
                <span class="text">${viewRow.visitCnt }</span>
                &nbsp;&nbsp;
                <span class="text bold" style="color: #ED6A5A">by </span>
				<span class="text">${viewRow.id}</span>
			</td>
		</tr>
		<tr>
			<td colspan="2" >
				<c:if test="${ not empty viewRow.userfile1 }">
					<img src="${ path }/resources/upload/${ viewRow.userfile1 }"
						 style="display: block; margin: 0px auto; width: 300px; height: 300px;
						 		margin-Top: 10px; margin-Bottom: 30px"/>
				</c:if>
				<c:if test="${ not empty viewRow.userfile2 }">
					<img src="${ path }/resources/upload/${ viewRow.userfile2 }"
						 style="display: block; margin: 0px auto;" />
				</c:if>
				<c:if test="${ not empty viewRow.userfile3 }">
					<img src="${ path }/resources/upload/${ viewRow.userfile3 }"
						 style="display: block; margin: 0px auto;"/>
				</c:if>
				<c:if test="${ not empty viewRow.userfile4 }">
					<img src="${ path }/resources/upload/${ viewRow.userfile4 }" 
						 style="display: block; margin: 0px auto;"/>
				</c:if>
				<c:if test="${ not empty viewRow.userfile5 }">
					<img src="${ path }/resources/upload/${ viewRow.userfile5 }" 
						 style="display: block; margin: 0px auto;"/>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p style="color: #484848; font-size: 16px; margin-Bottom: 50px">
					${ viewRow.contents }
				</p>
			</td>
		</tr>
		<tr>
			<td	style="width: 10%; height: 10%; text-align: right; padding-Right: 10px;">
				<input type="text" value="좋아요" readonly
					   style="font-size: 16px; witdh: 3px; height: 30px; text-align: right;
						      color: #ED6A5A; border: none; padding-right: 55px"/>
			</td>
			<td	style="width: 10%; height: 10%; text-align: left; padding-Left: 10px;">
				<input type="text" value="스크랩" readonly
					   style="font-size: 16px; witdh: 3px; height: 30px; text-align: left;
						      color: #ED6A5A; border: none; padding-left: 55px"/>
			</td>
		</tr>
		<tr>
			<td	style="width: 10%; height: 10%; text-align: right; padding-Right: 5px;
					   margin-Bottom: 100px">
				<c:choose>
					<c:when test="${ likeResult eq 1 and viewRow.idx eq idx }">
						<form name="writeFrm" method="post" action="./like.do"
						      onsubmit="return checkValidate(this);">
						<input type="hidden" name="idx" value="${viewRow.idx }" />
						<input type="hidden" name="id" value="${sessionScope.siteUserInfo.id}" /> 
						<button type="submit" name="submit"
								style="font-size: 24px; witdh: 30px; height: 60px;
									   background-color: #FFFFFF; color: #ED6A5A;
									   border: 1px solid #ED6A5A;"
								onMouseOver="this.style.backgroundColor='#ED6A5A';
											 this.style.color='#FFFFFF'"
								onMouseOut="this.style.backgroundColor='#FFFFFF'
											this.style.color='#ED6A5A'">❤
						</button>
						</form>
					</c:when>
					<c:otherwise>
					<form name="writeFrm" method="post" action="./like.do"
					      onsubmit="return checkValidate(this);">
						<input type="hidden" name="idx" value="${viewRow.idx }" />
						<input type="hidden" name="id" value="${sessionScope.siteUserInfo.id}" /> 
						<button type="submit" name="submit"
								style="font-size: 16px; witdh: 60px; height: 60px;
									   background-color: #FFFFFF; color: #ED6A5A;
									   border: 1px solid #ED6A5A;"
								onMouseOver="this.style.backgroundColor='#ED6A5A';
											 this.style.color='#FFFFFF'"
								onMouseOut="this.style.backgroundColor='#FFFFFF'
											this.style.color='#ED6A5A'">
							🤍
							</button>
					</form>                    	
					</c:otherwise>
				</c:choose>
				<br/><br/><br/>
			</td>
			<td	style="width: 10%; height: 10%; text-align: left; padding-Left: 5px">
				<c:choose>
                   	<c:when test="${ scrapResult eq 1 and viewRow.idx eq idx }">
						<form name="writeFrm" method="post" 
				        	action="./scrap.do" class="form contact__form"
				        	onsubmit="return checkValidate(this);">
							<input type="hidden" name="idx" value="${viewRow.idx }" />
							<input type="hidden" name="id" value="${sessionScope.siteUserInfo.id}" /> 
							<button type="submit" name="submit"
									style="font-size: 16px; witdh: 15px; height: 60px;
										   background-color: #FFFFFF; color: #ED6A5A;
										   border: 1px solid #ED6A5A;"
									onMouseOver="this.style.backgroundColor='#ED6A5A';
												 this.style.color='#FFFFFF'"
									onMouseOut="this.style.backgroundColor='#FFFFFF'
												this.style.color='#ED6A5A'">
							   🔴
							</button>
						</form>
                   	</c:when>
                   	<c:otherwise>
						<form name="writeFrm" method="post" action="./scrap.do"
				        	  onsubmit="return checkValidate(this);">
						<input type="hidden" name="idx" value="${viewRow.idx }" />
						<input type="hidden" name="id" value="${sessionScope.siteUserInfo.id}" /> 
							<button type="submit" name="submit"
									style="font-size: 16px; witdh: 60px; height: 60px;
										   background-color: #FFFFFF; color: #ED6A5A;
										   border: 1px solid #ED6A5A;"
									onMouseOver="this.style.backgroundColor='#ED6A5A';
												 this.style.color='#FFFFFF'"
									onMouseOut="this.style.backgroundColor='#FFFFFF'
												this.style.color='#ED6A5A'">
								⚪
							</button>
						</form>
                	</c:otherwise>
				</c:choose>
				<br/><br/><br/>
			</td>
		</tr>
		
		<table style="width: 60%; text-align: center;">
		<tr style="margin-Top: 20px">
			<td colspan="2" style="width: 50%; height: 30px; border-Top: 1px Solid #DFDFDF;
							 	   padding-Top: 10px; margin-Top: 30px;">
				  <h3 style="font-weight: bold; color: #888888;">
                  	Comment
                  </h3>
			</td>
		</tr>
		<tr>
			<td>
				<c:forEach items="${ lists }" var="row">
					<input type="text" value=${ row.name }(${ row.id }) readonly/>
					<h4 class="media-heading">작성자:${row.name }(${row.id })</h4>
					<p>${row.contents }</p>
				  
					<c:if test="${sessionScope.siteUserInfo.id eq row.id}">
						<button class="btn btn-primary" 
						onclick="location.href='modify.do?idx=${row.idx}';">
						수정</button>	
						<!-- 삭제 버튼을 누를 경우 idx값을 JS의 함수로 전달한다. -->
						<button class="btn btn-danger" 
						onclick="javascript:deleteRow(${row.idx});">
						삭제</button>
					</c:if>

				</c:forEach>
		</td>
		</tr>
   		</table>
	</div>






	<!-- SCROLL BACK TO TOP BEGINS -->
    <div class="scroll-to-top"><i class="ri-arrow-up-line"></i></div>
    <!-- SCROLL BACK TO TOP ENDS -->
          <!-- #####버튼들##### -->
    <div class="flex-md-12" align="right">
	    <c:if test="${sessionScope.siteUserInfo.id eq viewRow.id}">
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
                  <input type="text" id="fname" class="form__input" name="name" readonly value="${sessionScope.siteUserInfo.name }">
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

    <jsp:include page="/WEB-INF/views/include/search.jsp" />

    <!-- =================== ALL MODALS END ============================= -->


    <!-- =================== SITE FOOTER BEGINS ============================= -->

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />

    <!-- =================== SITE FOOTER ENDS ============================= -->
    
	<jsp:include page="/WEB-INF/views/include/jquery.jsp" />

  </body>

</html>