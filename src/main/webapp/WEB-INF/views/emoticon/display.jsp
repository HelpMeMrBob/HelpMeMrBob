<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

 <body>
  <script type = "text/javascript">
	var isValidate = function(frm){
	var isOk = false;
	for(var i = 0; i<frm.sticker.length;i++){
		if(frm.sticker[i].checked == true){
			isOk = true;
			break;
		}
	}
	
	if(isOk != true){
		alert('구매하실 스티커를 선택해주세요.');
		return false;
	}
	
	var confirmed = confirm("정말로 구매하시겠습니까?");
	if(confirmed){
		var form = document.buyFrm;
		form.method="post"; 
		form.action="./buyProcess.do";
		form.submit(); 	
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

       

      </section><!-- .banner ends -->
      <!-- BANNER SECTION ENDS -->

	
      <!-- STAFFS SINGLE SECTION STARTS -->
      <section class="staffs-single default-section-spacing">
     
		<h1>스티커 출력하기1</h1>
		<form name="buyFrm" method="get" onsubmit="return isValidate(this);">
		<table class="table table-bordered" style="width:500px; height:500px;">
		<tr>
			<td >
				<img src="./resources/img/sticker1.jpg" style="width:100px; height:100px; align:center;">
				<br/><br/><label for="earth">지구</label>
				<input type="radio" id="earth" name="sticker" value="earth">
			</td>
			<td>
				<img src="./resources/img/sticker2.jpg" style="width:100px; height:100px;">
				<br/><br/><label for="sun">태양</label>
				<input type="radio" id="sun" name="sticker" value="sun">
			</td>
			<td>
				<img src="./resources/img/sticker6.jpg" style="width:100px; height:100px;">
				<br/><br/><label for="smile">표정</label>
				<input type="radio" id="smile" name="sticker" value="smile">
			</td>
		</tr>
		<tr>
			<td>
				<img src="./resources/img/sticker3.jpg"  style="width:100px; height:100px;" >
				<br/><br/><label for="redheart">빨간하트</label>
				<input type="radio" id="redheart" name="sticker" value="redheart">
			</td>
			<td>
				<img src="./resources/img/sticker4.jpg" style="width:100px; height:100px;">
				<br/><br/><label for="blueheart">파란하트</label>
				<input type="radio" id="blueheart" name="sticker" value="blueheart">
			</td>
			<td>
				<img src="./resources/img/sticker5.jpg" style="width:100px; height:100px;">
				<br/><br/><label for="iceflake">빙수</label>
				<input type="radio" id="iceflake" name="sticker" value="iceflake">
			</td>
		</tr>
		 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
		
	</table>
	<button type="submit" class="btn btn-danger" >구매하기</button>
</form>
        

      </section><!-- .staffs-single ends -->
      <!-- STAFFS SINGLE SECTION ENDS -->


      <!-- STAFF POSTS SECTION STARTS -->
      <section class="staff-posts default-section-spacing background-off-white">

     
      </section><!-- .staff-posts ends -->
      <!-- STAFF POSTS SECTION ENDS -->
	

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