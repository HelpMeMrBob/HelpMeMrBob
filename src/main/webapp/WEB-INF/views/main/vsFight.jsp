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
	<div style="width: 100%; margin-Left: 20%; margin-Right: 20%; margin-Top:5%;">
		
		
	<div style="width: 100%; margin-Top:1%;">
	
      <%-- <h3>${count1},${count2}</h3> --%>
		<table style="width: 60%; color: #000000; font-size: 14px;
					border: none; padding: 10px; ">
			<tr>
				<td colspan="2" style="width: 50%; padding-bottom: 0px">
					<input style="background-color: #ED6A5A; border: 1px solid #ED6A5A;
								  border-right: 1px solid #DFDFDF; width: 100%; height: 50px;
								  text-align: center; margin-top: 10px;
								  color: #FFFFFF; font-size: 16px; font-weight: bold;"
								  value="${topic}" readonly></input>
				</td>
					</tr>
			<tr>
			<%-- ${viewRow.sfile1 } 이거 안됨--%>
			<td style="width: 50%; padding: 20px; padding-top: 5px;
						   border: 1px solid #DFDFDF; vertical-align: top;">
						   <img src="./resources/vsUpload/${sFile1}" style="max-width:500px;" />
						   </td>
			<td style="width: 50%; padding: 20px; padding-top: 5px;
						   border: 1px solid #DFDFDF; vertical-align: top;">
						   <img src="./resources/vsUpload/${sFile2}" style="max-width:500px;" />
						   </td>
			</tr>
			
					
					<tr>
				<td style="width: 50%; padding: 20px; padding-top: 5px;
						   border: 1px solid #DFDFDF; vertical-align: top;">
						   
						   <div class="progress">
    <div class="progress-bar bg-danger progress-bar-striped" style="width:${count1}%"></div>
  </div>
						   
	<label for="fname" class="form__label"><span class="color-danger">*</span>최신댓글 15개만 불러옵니다.</label>
						   <c:forEach items="${lists }" var="row">		
						<div class="border mt-2 mb-2">
							<div class="media">
								<div class="media-body">
									<h4 class="media-heading">작성자:${row.id }</h4>
									<p>${row.contents }</p>
								</div>
								<div class="media-right">
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
						   border: 1px solid #DFDFDF; vertical-align: top;">
<!--─────────────────────────────────── 오른쪽댓글받아요 ─────────────────────────────────────-->
<!--────────────────────────────────── 오른쪽댓글받아요 ───────────────────────────────────-->						   
						   <div class="progress">
    <div class="progress-bar bg-danger progress-bar-striped" style="width:${count2}%"></div>
  </div>
						   
	<label for="fname" class="form__label"><span class="color-danger">*</span>최신댓글 15개만 불러옵니다.</label>					   
						   <c:forEach items="${lists2 }" var="row">		
						<div class="border mt-2 mb-2">
							<div class="media">
								<div class="media-body">
									<h4 class="media-heading">작성자:${row.id }</h4>
									<p>${row.contents }</p>
								</div>
								<div class="media-right">
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
                  <input type="text" id="fname" class="form__input" name="name" placeholder="아이디"
                  value="${sessionScope.siteUserInfo.name }" readonly>
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
			
              <div class="flex-md-12 mar-b-md-2">

                <div class="form__group">
                  <textarea name="contents" id="message-2" class="form__textarea form__input"
                    placeholder="댓글을 입력하세요..."></textarea>
                </div><!-- .form__group ends -->

              </div><!-- .flex-* ends -->

				<div class="flex-md-12">

                <button class="button--primary button--fill" type="submit" name="submit">1댓글쓰기</button>

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
                  <input type="text" id="fname" class="form__input" name="name" placeholder="아이디"
                  value="${sessionScope.siteUserInfo.name }" readonly>
                </div><!-- .form__group ends -->
				
              </div><!-- .flex-* ends -->
			
              <div class="flex-md-12 mar-b-md-2">

                <div class="form__group">
                  <textarea name="contents" id="message-2" class="form__textarea form__input"
                    placeholder="댓글을 입력하세요..."></textarea>
                </div><!-- .form__group ends -->

              </div><!-- .flex-* ends -->

				<div class="flex-md-12">

                <button class="button--primary button--fill" type="submit" name="submit">2댓글쓰기</button>

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