<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/globalHeader.jsp" />   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
<script type = "text/javascript">
	$(function(){
			console.log("hello");
			//url은 kakapay2지만, 이모티콘 폴더 밑이라서 mapping 경로가 달라진다.
			$.ajax({
				url:'kakaopay2' ,
				dataType : 'json',
				success:function(data){
					//alert("ajax 통신완료");
					//alert(data.tid);
					var box = data.next_redirect_pc_url;
					window.open(box);
				},
				error: function(error){
					alert(error);
				}
			});	
	});
</script>


    <!-- =================== SITE HEADER BEGINS ============================= -->

    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <!-- =================== SITE HEADER ENDS ============================= -->



    <!-- =================== MAIN SECTION BEGINS ============================= -->

    <main>
	
      <!-- STAFFS SINGLE SECTION STARTS -->
      <section class="staffs-single default-section-spacing">
      <div class="staffs-single__content">
          <div class="container">
            <div class="row">
              <div class="flex-lg-7">
              		<h1>결제 진행중 입니다.</h1>
						<br/><br/><br/>
						<!-- vs를 이용해서 동적으로 테이블을 출력함 -->
						
					</div>
				</div>
			</div>
		</div>
      </section><!-- .staffs-single ends -->
      <!-- STAFFS SINGLE SECTION ENDS -->


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