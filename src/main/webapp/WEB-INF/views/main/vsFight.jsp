<%@page import="member.model.ParameterDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
<!-- 부트CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!--────────────────────────────────── SITE HEADER BEGINS ─────────────────────────────────── -->
<jsp:include page="/WEB-INF/views/include/header2.jsp" />
<!--─────────────────────────────────── SITE HEADER ENDS ─────────────────────────────────────-->
<!--────────────────────────────────── MAIN SECTION BEGINS ───────────────────────────────────-->
<script>
function deleteRow1(rno){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="Fightdelete1.do?rno="+rno;
	}
}

function deleteRow2(rno){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="Fightdelete2.do?rno="+rno;
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
	<main>
		<!-- BANNER SECTION STARTS -->
      	<section class="category-community full-width"
      		style="height: 20rem; margin-top: -8rem; padding: 15rem 0 10rem;">
        	<div class="container">
	        	<div class="banner__content">
		            <h2 class="section-intro color-off-white-with-border bold">
						음식 토론
					</h2>
          		</div><!-- .banner__content ends -->
        	</div><!-- .container ends -->
      	</section><!-- .banner ends -->
      	<!-- BANNER SECTION ENDS -->
		
		<section class="all-results all-results--causes mar-t-md-8">
			<div class="container">
			<div class="flex-md-10">
	      <%-- <h3>${count1},${count2}</h3> --%>
			<table style="width: 60%; color: #000000; font-size: 14px;
						border: 2px solid #ED6A5A; padding: 10px; margin-left: 23rem;">
				<tr>
					<td colspan="2" style="width: 50%; padding-bottom: 0px">
						<input class="pad-t-sm-2 pad-b-sm-2""
							style="background-color: #ED6A5A; border: 1px solid #ED6A5A;
									  border-right: 2px solid #ED6A5A; width: 100%; height: 50px;
									  text-align: center;
									  color: #FFFFFF; font-size: 2rem; font-weight: bold;"
									  value="${topic}" readonly></input>
					</td>
						</tr>
				<tr>
				<%-- ${viewRow.sfile1 } 이거 안됨--%>
				<td style="width: 50%; padding: 20px; padding-top: 5px;
							   border-left: 2px solid #ED6A5A; border-right: 2px solid #ED6A5A;
							   vertical-align: top;">
							   <img src="./resources/vsUpload/${sFile1}" style="max-width:300px;" />
							   </td>
				<td style="width: 50%; padding: 20px; padding-top: 5px;
							   border-left: 2px solid #ED6A5A; border-right: 2px solid #ED6A5A;
							   vertical-align: top;">
							   <img src="./resources/vsUpload/${sFile2}" style="max-width:300px;" />
							   </td>
				</tr>
				
						
						<tr>
					<td style="width: 50%; padding: 20px; padding-top: 5px;
							   vertical-align: top; border-right: 2px solid #ED6A5A;">
							   
							   <div class="progress">
	    <div class="progress-bar bg-danger progress-bar-striped" style="width:${count1}%"></div>
	  </div>
							   
		<label for="fname" class="form__label" style="color: #ed6a5a;">* 최신댓글 15개만 불러옵니다.</label>
							   <c:forEach items="${lists }" var="row">		
							<div class="mt-4 mb-2">
								<div class="media">
									<div class="media-body" style="border-top: 1px solid lightgray;">
										<h4 class="media-heading" style="font-weight: bold; padding-top: 10px;">${row.id }</h4>
										<p style="padding-bottom: 10px;">${row.contents }</p>
									</div>
									<div class="media-right" style="text-align: right; border-bottom: 1px solid lightgray; padding-bottom: 10px;">
										<!-- 작성자 본인에게만 수정/삭제 버튼 보임 처리 -->
										<c:if test="${sessionScope.siteUserInfo.id eq row.id}">
											<button class="btn btn-primary" 
											onclick="location.href='fightModify.do?rno=${row.rno}&idx=${idx}';">
											수정</button>
											
											<!-- 삭제 버튼을 누를 경우 idx값을 JS의 함수로 전달한다. -->
											<button class="btn btn-danger" 
											onclick="javascript:deleteRow1(${row.rno});">
											삭제</button>
										</c:if>
									</div>
								</div>
							</div>
							</c:forEach>
							<!-- 댓글페이징 -->
							<%-- <ul class="pagination justify-content-center">
								${pagingImg }
							</ul> --%>
							   
					</td>
					<td style="width: 50%; padding: 20px; padding-top: 5px;
							   vertical-align: top;">
	<!--─────────────────────────────────── 오른쪽댓글받아요 ─────────────────────────────────────-->
	<!--────────────────────────────────── 오른쪽댓글받아요 ───────────────────────────────────-->						   
							   <div class="progress">
	    <div class="progress-bar bg-danger progress-bar-striped" style="width:${count2}%"></div>
	  </div>
							   
		<label for="fname" class="form__label" style="color: #ed6a5a;">* 최신댓글 15개만 불러옵니다.</label>					   
							   <c:forEach items="${lists2 }" var="row">		
							<div class="mt-4 mb-2">
								<div class="media">
									<div class="media-body" style="border-top: 1px solid lightgray;">
										<h4 class="media-heading" style="font-weight: bold; padding-top: 10px;">${row.id }</h4>
										<p style="padding-bottom: 10px;">${row.contents }</p>
									</div>
									<div class="media-right" style="text-align: right; border-bottom: 1px solid lightgray; padding-bottom: 10px;">
										<!-- 작성자 본인에게만 수정/삭제 버튼 보임 처리 -->
										<c:if test="${sessionScope.siteUserInfo.id eq row.id}">
											<button class="btn btn-primary" 
											onclick="location.href='fightModify.do?rno=${row.rno}&idx=${idx}';">
											수정</button>
											
											<button class="btn btn-danger" 
											onclick="javascript:deleteRow2(${row.rno});">
											삭제</button>
										</c:if>
									</div>
								</div>
							</div>
							</c:forEach>
							<!-- 댓글페이징 -->
							<%-- <ul class="pagination justify-content-center">
								${pagingImg2}
							</ul> --%>
	<!--─────────────────────────────────── 오른쪽댓글받아요 ─────────────────────────────────────-->
	<!--────────────────────────────────── 오른쪽댓글받아요 ───────────────────────────────────-->	   
					</td>
				</tr>
				<tr>
				<td >
							   
							   
				<!-- 댓글 입력form -->
				<form name="writeFrm" method="post" 
				onsubmit="return writeValidate(this);"
				action="<c:url value="/FightWrite1.do" />" 
				class="form contact__form">
				<input type="hidden" name="idx" value="${idx}" />
				<%-- <input type="hidden" name="idx" value="${viewRow.rno }" /> --%>
				
	            <div class="row">
	            
	            <div class="flex-md-6">
					
	                <div class="form__group">
	                  <input type="hidden" id="fname" class="form__input" name="name" placeholder="아이디"
	                  value="${sessionScope.siteUserInfo.name }" readonly>
	                </div><!-- .form__group ends -->
					
	              </div><!-- .flex-* ends -->
				
	              <div class="flex-md-12 mar-b-md-2">
					
	                <div class="form__group">
	                  <textarea name="contents" id="message-2" class="form__textarea form__input"
	                    placeholder="댓글을 입력하세요."></textarea>
	                </div><!-- .form__group ends -->
	
	              </div><!-- .flex-* ends -->
	
					<div class="flex-md-12">
	
	                <button class="button--primary button--fill" type="submit" name="submit"
	                	style="margin-left: 80px; margin-bottom: 10px;">댓글등록</button>
	
	              </div><!-- .flex-* ends -->
	
	            </div><!-- .row ends -->
	
	          </form><!-- .form ends -->
				
				</td>
				
				
				<td >
	<!--─────────────────────────────────── 오른쪽댓글받아요 ─────────────────────────────────────-->
	<form name="writeFrm" method="post" 
				onsubmit="return writeValidate(this);"
				action="<c:url value="/FightWrite2.do" />" 
				class="form contact__form">
				<input type="hidden" name="idx" value="${idx}" />
				<%-- <input type="hidden" name="idx" value="${viewRow.rno }" /> --%>
				
	            <div class="row">
	            
	            <div class="flex-md-6">
					
	                <div class="form__group">
	                  <input type="hidden" id="fname" class="form__input" name="name" placeholder="아이디"
	                  value="${sessionScope.siteUserInfo.name }" readonly>
	                </div><!-- .form__group ends -->
					
	              </div><!-- .flex-* ends -->
				
	              <div class="flex-md-12 mar-b-md-2">
	
	                <div class="form__group">
	                  <textarea name="contents" id="message-2" class="form__textarea form__input"
	                    placeholder="댓글을 입력하세요."></textarea>
	                </div><!-- .form__group ends -->
	
	              </div><!-- .flex-* ends -->
	
					<div class="flex-md-12">
	
	                <button class="button--primary button--fill" type="submit" name="submit"
	                	style="margin-left: 80px; margin-bottom: 10px;">댓글등록</button>
	
	              </div><!-- .flex-* ends -->
	
	            </div><!-- .row ends -->
	
	          </form><!-- .form ends -->
	<!--────────────────────────────────── 오른쪽댓글받아요 ───────────────────────────────────-->
				</td>
				</tr>
				<!-- 푸파페이징  -->
				
			</table>
			</div>
		</div>
		<!-- 컨텐츠와 Footer 사이의 간격을 띄우기 위한 div -->
	  	<div class="mar-t-md-8" align="center"></div>
	</section>
		<!-- 보류 -->
		<%-- <div class="inner-pages-navigation pad-t-sm-4 pad-b-sm-4">

        	<div class="container">
			<ul class="pagination justify-content-center">
							${pagingImg }
			</ul>
			</div>
			</div> --%>

		
	
<!--──────────────────────────────────── MAIN SECTION END ────────────────────────────────────-->
 	</main>
<jsp:include page="/WEB-INF/views/include/search.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!--──────────────────────────────────── SITE FOOTER ENDS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
</body>
</html>