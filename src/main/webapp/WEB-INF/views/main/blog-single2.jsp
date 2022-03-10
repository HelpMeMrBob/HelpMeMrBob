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
                  	${ viewRow.title }
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
			<td	style="width: 10%; height: 10%; text-align: right; padding-Right: 20px;">
				<input type="text" value="좋아요" readonly
					   style="font-size: 16px; witdh: 3px; height: 30px; text-align: right;
						      color: #ED6A5A; border: none; padding-right: 20px"/>
			</td>
			<td	style="width: 10%; height: 10%; text-align: left; padding-Left: 20px;">
				<input type="text" value="스크랩" readonly
					   style="font-size: 16px; witdh: 3px; height: 30px; text-align: left;
						      color: #ED6A5A; border: none; padding-left: 20px"/>
			</td>
		</tr>
		<tr>
			<td	style="width: 10%; height: 10%; text-align: right; padding-Right: 30px;">
				<c:choose>
					<c:when test="${ likeResult eq 1 and viewRow.idx eq idx }">
						<form name="writeFrm" method="post" action="./like.do"
						      onsubmit="return checkValidate(this);">
						<input type="hidden" name="idx" value="${viewRow.idx }" />
						<input type="hidden" name="id" value="${sessionScope.siteUserInfo.id}" /> 
						<button type="submit" name="submit"
								style="font-size: 16px; witdh: 30px; height: 60px;
									   background-color: #FFFFFF; color: #ED6A5A;
									   border: 1px solid #ED6A5A; padding: 20px;
										   border-radius: 30px"
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
									   border: 1px solid #ED6A5A; padding: 20px;
										   border-radius: 30px"
								onMouseOver="this.style.backgroundColor='#ED6A5A';
											 this.style.color='#FFFFFF'"
								onMouseOut="this.style.backgroundColor='#FFFFFF'
											this.style.color='#ED6A5A'">
							🤍
							</button>
					</form>                    	
					</c:otherwise>
				</c:choose>
				<br/>
			</td>
			<td	style="width: 10%; height: 10%; text-align: left; padding-Left: 30px">
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
										   border: 1px solid #ED6A5A; padding: 20px;
										   border-radius: 30px"
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
										   border: 1px solid #ED6A5A; padding: 20px;
										   border-radius: 30px"
									onMouseOver="this.style.backgroundColor='#ED6A5A';
												 this.style.color='#FFFFFF'"
									onMouseOut="this.style.backgroundColor='#FFFFFF'
												this.style.color='#ED6A5A'">
								⚪
							</button>
						</form>
                	</c:otherwise>
				</c:choose>
				<br/>
			</td>
		</tr>
		
		<c:if test="${sessionScope.siteUserInfo.id eq viewRow.id}">
		<table style="width: 60%; text-align: center;">
		<tr>
			<td style="width: 20%; text-align: right">
				<form name="writeFrm" method="post"
					  action="./reviewEdit.do">
					<input type="hidden" name="idx" value="${viewRow.idx}" />
					<input type="hidden" name="id" value="${viewRow.id}" />
					<input type="hidden" name="nowPage" value="${param.nowPage }" />
					<button type="submit" name="submit"
							style="font-size: 14px; witdh: 100px; height: 50px;
					  			   background-color: #ED6A5A; color: #FFFFFF;
								   border: 1px solid #ED6A5A; padding: 20px">
										수정하기
					</button>
				</form>
				<br/><br/>
			</td>
			<td style="width: 5%">
		   		<form name="writeFrm" method="post"
		   			  action="./deleteAction.do">
				<input type="hidden" name="idx" value="${viewRow.idx}" />
				<input type="hidden" name="id" value="${viewRow.id}" />
				<input type="hidden" name="nowPage" value="${param.nowPage }" />
				<button type="submit"
						style="font-size: 14px; witdh: 100px; height: 50px;
				  			   background-color: #10212F; color: #FFFFFF;
							   border: 1px solid #10212F; padding: 20px">
					삭제하기
				</button>
			</form>
			<br/><br/>
			</td>
			<td style="width: 20%; text-align: left">
		   		<form name="writeFrm" method="post"
		   			  action="./deleteAction.do">
				<button type="button"
						style="font-size: 14px; witdh: 100px; height: 50px; padding: 15px;
							   padding-Left: 20px; padding-Right: 20px;
							   padding-Bottom: 30px;
				  			   background-color: #10212F; color: #FFFFFF;
							   border: 1px solid #10212F;"
						onclick="location.href='./reviewList.do'">
					목록보기
				</button>
			</form>
			<br/><br/>
			</td>
		</tr>
		</table>
		</c:if>
		
		<table style="width: 60%; text-align: center;">
		<tr style="margin-Top: 20px">
			<td colspan="3" style="width: 50%; height: 30px; border-Top: 1px Solid #DFDFDF;
							 	   padding-Top: 10px; margin-Top: 30px;">
				  <h3 style="font-weight: bold; color: #888888; text-align: center;">
                  	Comment
                  </h3>
			</td>
		</tr>
		<c:forEach items="${ lists }" var="row">
		<tr style="margin-Top: 20px">
			<td style="width: 10%; height: 20px; border: none; text-align: center;
					   border-right: 1px solid #DFDFDF">
				<img src="${ path }/resources/include_img/bob_logo1.png"
					 style="width: 30px; height: 30px; display: block; margin: 0px auto;">
				<input type="text" value="${ row.id }" readonly
					   style="font-size: 14px; text-align: center; width: 100px; height: 30px;
					   		  border: none"/>
				
			</td>
			<td style="width: 70%; height: 40px; border: none; text-align: left;
					   padding-Left: 20px;">
				<p>${row.contents }</p>
			</td>
			<td style="width: 20%; height: 40px; text-align: right; padding-right: 20px;
					   margin-Bottom: 10px">
			<c:choose>
			<c:when test="${ sessionScope.siteUserInfo.id eq row.id }">
						<button style="width: 50px; height: 30px; background-color: #ED6A5A;
									   color: #FFFFFF;" 
						onclick="location.href='modify.do?idx=${row.idx}';">
						수정</button>	
						<!-- 삭제 버튼을 누를 경우 idx값을 JS의 함수로 전달한다. -->
						<button  style="width: 50px; height: 30px; background-color: #10212F;
									   color: #FFFFFF;"
								 onclick="deleteRow(${row.idx});">
						삭제</button>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		</c:forEach>
   		</table>
   		
   	<div>
   		<form name="writeFrm" method="post" onsubmit="return writeValidate(this);"
			  action="./replyWrite.do" >
		<table style="width: 60%; text-align: center; border-Top: 1px solid #DFDFDF;
					  margin-Top: 50px">
		<tr style="margin-Top: 20px">
			<td colspan="3" style="width: 50%; height: 30px; border-Top: 1px Solid #DFDFDF;
							 	   padding-Top: 10px; margin-Top: 30px;">
				<input type="hidden" name="idx" value="${viewRow.idx }" />
			    <h3 style="font-weight: bold; color: #888888; text-align: center;">
                 	Write Comment
                </h3>
			</td>
		</tr>
		<tr>
			<td style="width: 10%; height: 20px; border: none; text-align: center;
					   border-right: 1px solid #DFDFDF">
				<img src="${ path }/resources/include_img/bob_logo1.png"
					 style="width: 30px; height: 30px; display: block; margin: 0px auto;">
				<input type="text" name="name" value="${ sessionScope.siteUserInfo.name }" readonly
					   style="font-size: 14px; text-align: center; width: 100px; height: 30px;
					   		  border: none"/>
				
			</td>
			<td style="width: 70%; height: 40px; border: none; text-align: left;
					   ">
				<textarea name="contents" placeholder="댓글을 입력하세요"
					   style="font-size: 14px; text-align: left; width: 100%; height: 30px;
					   		  border: none; padding-Left: 20px"></textarea>
			</td>
			<td style="width: 20%; height: 40px; text-align: right; padding-right: 20px;
					   margin-Bottom: 10px">
				<button style="width: 105px; height: 30px; background-color: #ED6A5A;
							   color: #FFFFFF; font-size: 14px; padding: 0px" 
						type="submit" id="submit">
				작성완료</button>
			</td>
		</tr>
   		</table>
   		</form>
   		
   		<table style="width: 60%; text-align: right; border: none; margin-Top: 30px;
   					  margin-Bottom: 50px; margin-Right: 40px">
   		<tr>
   			<td style="width: 100%; height: 30px; padding-Right: 20px">
				<button type="button"
						style="font-size: 14px; witdh: 200px; height: 100px; padding: 23px;
				  			   background-color: #10212F; color: #FFFFFF;
							   border: 1px solid #10212F;"
						onclick="location.href='./reviewList.do'">
					목록보기
				</button>
			</td>
		</tr>
   		</table>
   	</div>
	</div>






	<!-- SCROLL BACK TO TOP BEGINS -->
    <div class="scroll-to-top"><i class="ri-arrow-up-line"></i></div>


        <!-- See _singles.scss for styling -->
        </div>
      </section><!-- .single-page ends -->
      <!-- SINGLE PAGE SECTION ENDS -->

    </main><!-- main ends -->


                
				
				<!-- .flex-* ends -->


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