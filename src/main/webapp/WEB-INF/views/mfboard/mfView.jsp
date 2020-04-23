<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp" %> 

<title>레시피 상세보기</title>

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/css/like.css">
<!-- <link rel="stylesheet" href="/resources/css/like.css"> -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
#mainBody {
	padding: 60px 20px;
	text-align: center;
}

.imgDiv {
	display: inline-block;
}

.imgDiv img {
	width: 50px;
	height: 50px;
}
.imgDiv span {
	display: block;
}
.front img{
	width: 250px;
	height: 250px;
}
.content p {
	color: fa8072;
} 
.endBar{
	text-align: center;
	margin-left: 5%;
	width: 90%;
	background: darkkhaki;
	line-height: 1;
	position :relative;
	border : 4px solid orange
}

.cont_mater {
		 width:60%;
    background: beige;
    border-radius: 10px;
    padding: 24px 45px 2px;
    margin-top: 24px;
    margin-left: 70px;
    font-size: 18px;
    color: black;
    text-align: left;
}

#inner_container {
		margin-top: 50px;
		padding: 15px 20px 100px;
		text-align: center;
		
}

#homeImg{
width: 50px;
height:50px;
}

.bs-docs-header{
	background-image: url("${pageContext.request.contextPath}/resources/image/93600.jpg");
	background-size: cover;
/* 	opacity: 0.5; */
}

.bs-docs-section{
	text-align: center;
}

.carousel-item active {
	display: inline-block;
}

.itemInfoBox {
	display: inline-block;
}

.mater{
	  width:895;
		height:297;
}

.text_recipe {
		  width:85% ;   
		/* vertical-align: top; */ 
		padding-top: 20px; 
	/* 	padding-bottom:  30px; */
}

.like-content {
  display: inline-block;
  width : 90%;
  font-size: 18px;
  border-top: 10px dashed #eee;
  margin-bottom:30px;
  margin-top: 30px;
  text-align: center;
}

.user_info2 {
	display: inline-block;
}
.good {
	display: inline-block;
}

#main_container {
			position: relative;
		  border: 3px solid #D8D8D8; 
					padding: 50px 20px;
					text-align: center;
					border-radius: 60px 60px 60px 60px;
					width: 1000px;
}

</style>

</head>
<body>

<%@include file="/WEB-INF/inc/top_menu.jsp"%>
	<!--메뉴바  -->
	<div class="bs-docs-header">
		<div class="container" id="mainBody">
			<div>
				<span>메뉴</span>
			</div>
			<div class="imgDiv">
				<a href="mfMain"> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/ALL.png">
					<span>전체</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mfMain?mfCategory=간식/안주"> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/beer.png">
					<span>간식/안주</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mfMain?mfCategory=식사"> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/rice.png">
					<span>식사</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mfMain?mfCategory=디저"> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/strawberry-cake.png">
					<span>디저트</span>
				</a>
			</div>
			<!-- 이미지 자식 div -->
		</div>
		<!-- body 부모 dib  -->
		<!-- 검색창 -->
	<div class="bs-docs-section">
			<span>
				<img id="homeImg" alt="" src="${pageContext.request.contextPath}/resources/image/로고2.png">
			0Kcal
			</span>
			<input style="size: 200px;" class="searchWord" type="text">
			<input class="search" type="button" value="상품 검색">
	</div>
	</div>
	<!-- bs-docs-header -->
	<br><br>
	<!-- 메인 바디 시작  -->
	<div class="container" id="main_container">
			<div class="conainter-fluid" id="inner_container">
			
					<div class="user_info2">
						<br>
					 <h4>
					 	<b>글번호</b> : ${boardinfo.mfNum} &nbsp; &nbsp;
						<b>작성일</b> : ${boardinfo.mfRegDate}&nbsp; &nbsp;
						<%-- <c:if test="${not empty board.ufModDate }">
							수정일 : ${ board.ufModDate}
						</c:if> --%>
						<b>조회수</b> : ${boardinfo.mfHit} &nbsp; &nbsp;
						<b>Category</b> : ${boardinfo.mfCategory}
					</h4> 
			    </div>

				 <br><br>
				
			    <div class="centeredcrop">
						<!-- 상품 메인 사진 -->
							<img alt="" src="${pageContext.request.contextPath}/resources/image/MF/${boardinfo.mfNum}.jpg"
							 style="width: 400px; height: 400px;">	
					</div>
			</div>
			
			<div class="view2_summary" style="text-align: center;">
            <h1>${boardinfo.mfName}</h1>
 			</div> 
 			<input type="hidden" id="mfCode" name="mfCode"
												value="${boardinfo.mfCode}">
 			<div class="endBar">
			</div>
			
			<div class="mater"  style="text-align: center; padding-left: 175px;">
				<!-- 재료부분-->
				<div class="cont_mater">
			   <dl>
			    <dt>[ 재료 ]</dt>
			    <dd>${boardinfo.mfMater}</dd>
			    <dd>mfCode
		    		<c:if test="${not empty boardinfo.mfSCode}">
		    			${boardinfo.mfSCode}	    		
						</c:if>
 					</dd>
			   </dl>
			  </div>
			</div>
			<div class="like-content"></div>
			<br>
			
			<!-- 동영상 -->
			<div class="view_movie" style="text-align: center;">
								${boardinfo.mfLink}
			</div>
			<!-- // 동영상 -->
			
		  <div class="like-content"></div>
			<div class="view_recipe" style="border: black; text-align: left;">
			 <div class="view_recipe_img" style="  background-image:url('/resources/image/mfview.png'); background-size : cover">
				<div class="view_title" style="font-size: 20px; font-weight: bold; padding-top: 450px;">
						&nbsp;&nbsp;<b>조리순서</b>
				</div>
				
				<div style=" border: 1px solid black; padding-left: 17px; font-size: 17px; 
							border-radius: 9px; background-color: white; " >
									
						<div class="infoview" style="text-align: left: 10px;">
						  	<div class="text_recipe">
									${boardinfo.mfRecipe1}
								</div>
								<div class="text_recipe">							 		
									${boardinfo.mfRecipe2}
							 	</div>
					     <div class="text_recipe">
							 		${boardinfo.mfRecipe3}
							 	</div>
						   <div class="text_recipe">
							 		<c:if test="${not empty boardinfo.mfRecipe4}">
							 			${boardinfo.mfRecipe4}
							 		</c:if>							 	
							 	</div>
							 	<div class="text_recipe">
							 		<c:if test="${not empty boardinfo.mfRecipe5}">
							 			${boardinfo.mfRecipe5}
							 		</c:if>							 	
							 	</div>
							 	<div class="text_recipe">
							 		<c:if test="${not empty boardinfo.mfRecipe6}">
							 			${boardinfo.mfRecipe6}
							 		</c:if>							 	
							 	</div>
							 	<div class="text_recipe">
							 		<c:if test="${not empty boardinfo.mfRecipe7}">
							 			${boardinfo.mfRecipe7}
							 		</c:if>							 	
							 	</div>
							 	<div class="text_recipe">
							 		<c:if test="${not empty boardinfo.mfRecipe8}">
							 			${boardinfo.mfRecipe8}
							 		</c:if>							 	
							 	</div>
							 	<div class="text_recipe">
							 		<c:if test="${not empty boardinfo.mfRecipe9}">
							 			${boardinfo.mfRecipe9}
							 		</c:if>							 	
							 	</div>
							 	<div class="text_recipe">
							 		<c:if test="${not empty boardinfo.mfRecipe10}">
							 			${boardinfo.mfRecipe10}
							 		</c:if>							 	
							 	</div>
							 	
							<br>
			
							</div>
						</div>
					</div>
						<br><br><br>
						
						<!-- 추천 부분 -->
						<div class="love" style="text-align: center;">
							<img src="${pageContext.request.contextPath}/resources/image/-.png"
									 style="width: 200px; height: 200px;">
								    <h2>레시피가 마음에 들었다면?</h2>
								    
											<div class="good">
											 <c:if test="${sessionScope.USER_INFO ne null}">
													<button type="button" id="like_update"
													 class="btn-secondary like-review">
														<i class="fa fa-heart" aria-hidden="true"></i>추천
														<span	class="rec_count" style="color: white;">${boardinfo.mfLove}</span>
													</button>
											 </c:if>
											 <c:if test="${sessionScope.USER_INFO eq null}">
												<h4>
													추천은
													<button class="btn btn-primary btn-sm" type="button"
														onclick="location.href='<%=request.getContextPath()%>/login/login'">로그인</button>
													후 사용 가능합니다.
												</h4>
											</c:if>
											</div>
					</div>
								<!-- <div>아이콘 제작자 <a href="https://www.flaticon.com/kr/authors/freepik" title="Freepik">Freepik</a> 
										 from<a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a>
								</div> -->
						</div>			
				</div>
		




</body>
<script>
	var check = "${check}";
	var code = document.getElementsByName("mfCode")[0].value;
$(function(){
    $(document).one('click', '.like-love', function(e) {
        $(this).html('<i class="fa fa-heart" aria-hidden="true"></i>완료!');
        $(this).children('.fa-heart').addClass('animate-like');
    });
	    $("#like_update").click(function() {
		console.log("눎");
		if (confirm("해당 레시피를 추천하시겠습니까?")) {
			if (Number(check) > 0){
				alert("이미 추천을 완료하였습니다.");
			}
			else{
				var love = true;
				location.replace("mfView?mfCode=" + code + "&love=" + love);
			}
			
		}
	});
});

</script>
<br><br>
<%@include file="/WEB-INF/inc/foot1.jsp"%>
</html>