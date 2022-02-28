<%@page import="member.model.ParameterDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />
<!--────────────────────────────────── SITE HEADER BEGINS ─────────────────────────────────── -->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<!--─────────────────────────────────── SITE HEADER ENDS ─────────────────────────────────────-->
<!--────────────────────────────────── MAIN SECTION BEGINS ───────────────────────────────────-->
	<main>
	<div style="width: 100%; margin-Left: 20%; margin-Right: 20%; margin-Top:5%;">
		
		
	<div style="width: 100%; margin-Top:1%;">
		<table style="width: 60%; color: #000000; font-size: 14px;
					border: none; padding: 10px; ">
			<%-- <%
				ParameterDTO parameterDTO = new ParameterDTO();
				
				int level = parameterDTO.getLev();
				int experience = parameterDTO.getExp();
			%> --%>
			<tr>
			<td><img src="resources/upload/patbung.jpg" /></td>
			<td><img src="resources/upload/shubung.jpg" /></td>
			</tr>
			<tr>
				<td style="width: 50%; padding-bottom: 0px">
					<input style="background-color: #ED6A5A; border: 1px solid #ED6A5A;
								  border-right: 1px solid #DFDFDF; width: 100%; height: 50px;
								  text-align: center; margin-top: 10px;
								  color: #FFFFFF; font-size: 16px; font-weight: bold;"
								  value="팥붕" readonly></input>
				</td>
				<td style="width: 50%; padding-bottom: 0px">
					<input style="background-color: #ED6A5A; border: 1px solid #ED6A5A;
								  border-right: 1px solid #DFDFDF; width: 100%; height: 50px;
								  text-align: center; margin-top: 10px; 
								  color: #FFFFFF; font-size: 16px; font-weight: bold;"
								  value="슈붕" readonly></input>
						</td>
					</tr>
					<tr>
				<td style="width: 50%; padding: 20px; padding-top: 5px;
						   border: 1px solid #DFDFDF; vertical-align: top;">
				</td>
				<td style="width: 50%; padding: 20px; padding-top: 5px;
						   border: 1px solid #DFDFDF; vertical-align: top;">
					<c:forEach items="${lists }" var="row">		
						<div class="border mt-2 mb-2">
							<div class="media">
								<div class="media-body">
									<h4 class="media-heading">작성자:${row.id }</h4>
									<p>${row.contents }</p>
								</div>
							</div>
						</div>
						</c:forEach>
						<!-- 댓글페이징 -->
						<ul class="pagination justify-content-center">
							${pagingImg }
						</ul>
					
				</td>
			</tr>
		</table>
	</div>
	</div>
	

		
	
<!--──────────────────────────────────── MAIN SECTION END ────────────────────────────────────-->
 	</main>
<jsp:include page="/WEB-INF/views/include/search.jsp" />
<!--──────────────────────────────────── SITE FOOTER ENDS ────────────────────────────────────-->
<jsp:include page="/WEB-INF/views/include/jquery.jsp" />
</body>
</html>