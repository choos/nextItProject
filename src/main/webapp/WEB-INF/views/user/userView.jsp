<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="ko">
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

.user_info2 {
	display: inline-block;
	}

#contents_area{
		margin-top: 50px;
		padding: 15px 20px 100px;
		text-align: center;
		
}
.portrait{
		border: 3px solid black;
	}
.mater{
		width:895;
		height:297;
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

#btn-area{
	margin-top: 70px;
	margin-bottom: -85px;
	width: 920px;
	text-align: right; 
}

.view_movie {
    margin: 0 50px;
    padding: 20px 0 40px 0;
}
.view_recipe{
	margin: 0 50px;
    padding: 20px 0 40px 0;
}

.endBar{
	text-align: center;
	margin-left: 5%;
	width: 90%;
	background: darkkhaki;
	line-height: 1;
	position :relative;
	border : 4px solid
}
.text_recipe{
	display: inline-block;
}

.like-content {
  display: inline-block;
  width : 90%;
  font-size: 18px;
  border-top: 10px dashed;
  margin-bottom:30px;
  margin-top: 30px;
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

.good {
	display: inline-block;
}

/* #main_container {
			position: relative;
		  border: 3px solid #D8D8D8; 
					padding: 50px 20px;
					text-align: center;
					border-radius: 60px 60px 60px 60px;
					width: 1000px;
} */


</style>


<head>
	<%@include file="/WEB-INF/inc/common_header.jsp" %>
	
	<title></title>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/css/like.css">
	<!-- <script type="text/javascript" src="/resources/css/like.js"></script> -->
</head>
<body>
<%@include file="/WEB-INF/inc/top_menu.jsp" %>

	<!--메뉴바  -->
	<div class="bs-docs-header">
		<div class="container" id="mainBody">
			<div>
			<span>메뉴</span>
			</div>
			<div class="imgDiv">
				<a href="userMain">
				<img alt=""	src="${pageContext.request.contextPath}/resources/image/ALL.png">
				<span>전체</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="userSearch?ufCategory=간식/안주">
				<img alt=""	src="${pageContext.request.contextPath}/resources/image/beer.png">
				<span>간식/안주</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="userSearch?ufCategory=식사">
				<img alt="" src="${pageContext.request.contextPath}/resources/image/rice.png">
				<span>식사</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="userSearch?ufCategory=디저트">
				<img alt="" src="${pageContext.request.contextPath}/resources/image/strawberry-cake.png">
				<span>디저트</span>
				</a>
			</div>
						<!-- 이미지 자식 div -->
		</div>
		<!-- body 부모 div  -->
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


<div class="container" style="
																			border: 1px solid black;
   																		padding: 50px 20px;
    																	text-align: center;
    																	width: 1000px;">
<div id="btn-area">
<div class="pull-left">
	<a href="userMain" class="btn btn-sm btn-default">목록</a>
</div>
<c:if test="${user.userId eq board.ufId}">
<div class="pull-left">
	<a href="userEdit?ufCode=${board.ufCode}" class="btn btn-sm btn-default">수정</a>
</div>
<div class="pull-left">
	<a href="userDelete?ufCode=${board.ufCode}" class="btn btn-sm btn-default">삭제</a>
</div>
</c:if>
</div>
<!-- 전체 틀 -->
	<div id="contents_area">
		<div class="user_info2">
			<br>
			<h4>
			<b>글번호</b> : ${board.ufNum }<br>
			<b>작성일</b> : ${board.ufRegDate}
			<c:if test="${not empty board.ufModDate }">
			<b>수정일</b> : ${ board.ufModDate} <!-- UF_MOD_DATE -->
			</c:if>
			<br>
			<b>조회수</b> : ${board.ufHit }
			<br>
			<b>Category</b> : ${board.ufCategory}
			<br>
			 <b>작성자</b> : ${board.ufId}
			</h4>
	     </div>
	     
	     <br><br>
	     
		<div class="view2_pic">
	    		<div class="centeredcrop">
	    		<c:if test="${not empty board.ufImg1 }">
	    				<c:if test=""></c:if>
	    			<img id="main_thumbs" src="<%=request.getContextPath() %>${board.ufImg1 }"
	    						alt="이미지오류"  width="500px" height="350px" >
					</c:if>
					<c:if test="${empty board.ufImg1 }">
						<img class="text_recipe" src="<%=request.getContextPath() %>/resources/image/noIMG.jpg" alt="이미지 오류"						
							style="width: 500px; height: 333px;">
					</c:if>
	    		</div>

        </div>
	</div>
	
	<div class="view2_summary">
            <h3>${board.ufTitle}<!-- UF_TITLE --></h3>
 </div> 
<div class="endBar">
</div>

<div class="mater">
<!-- 재료부분-->
	<div class="cont_mater">
    <dl>
    <dt>[재료]</dt>
    <dd>${board.ufMater }</dd>
    </dl>
  </div>

</div>




  <div class="like-content"></div>
			<c:if test="${not empty board.ufLink}">
			
					<div class="view_movie" style="text-align: left;">
  				<h3>동영상</h3>
					<div class="movie_area" style="text-align: center;">
					<div class="iframe_wrap">
					${board.ufLink}
					</div>
					</div>
					</div>
					</c:if>
					
	<div class="view_recipe" style="text-align: left;">
	<div class="view_recipe_img" style="  background-image:url('/resources/image/유저레시피1.jpg'); background-size : cover; width: 858px; height: 1245px;">
		<div class="view_title" style="font-size: 20px; font-weight: bold; padding-top: 20px; background-color: white;">
			&nbsp;&nbsp;<b>조리순서</b>
		</div>

		<div style=" padding-left: 17px; font-size: 17px; 
							background-color: white;" >
		
		<c:if test="${not empty board.ufRecipe1}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe1}
			</div>
		</c:if>
		
		<c:if test="${not empty board.ufRecipe2}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe2}
			</div>
		</c:if>

		<c:if test="${not empty board.ufRecipe3}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe3}
			</div>
		</c:if>

		<c:if test="${not empty board.ufRecipe4}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe4}
			</div>
		</c:if>

		<c:if test="${not empty board.ufRecipe5}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe5}
			</div>
		</c:if>

		<c:if test="${not empty board.ufRecipe6}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe6}
			</div>
		</c:if>		
	
	<c:if test="${not empty board.ufRecipe7}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe7}
			</div>
			<div class="text_recipe" style="padding: 20px; max-width: 300px;">
				</div>
		</c:if>
		
		<c:if test="${not empty board.ufRecipe8}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe8}
			</div>
			<div class="text_recipe" style="padding: 20px; max-width: 300px;">
				</div>
		</c:if>
		
		<c:if test="${not empty board.ufRecipe9}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe9}
			</div>
			<div class="text_recipe" style="padding: 20px; max-width: 300px;">
				</div>
		</c:if>
		
		<c:if test="${not empty board.ufRecipe10}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe10}
			</div>
			<div class="text_recipe" style="padding: 20px; max-width: 300px;">
				</div>
		</c:if>
		
		<c:if test="${not empty board.ufRecipe11}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe11}
			</div>
			<div class="text_recipe" style="padding: 20px; max-width: 300px;">
				</div>
		</c:if>
		
			<c:if test="${not empty board.ufRecipe12}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe12}
			</div>
			<div class="text_recipe" style="padding: 20px; max-width: 300px;">
				</div>
		</c:if>

		<c:if test="${not empty board.ufRecipe13}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe13}
			</div>
			<div class="text_recipe" style="padding: 20px; max-width: 300px;">
				</div>
		</c:if>


		<c:if test="${not empty board.ufRecipe14}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe14}
			</div>
			<div class="text_recipe" style="padding: 20px; max-width: 300px;">
				</div>
		</c:if>		
		

		<c:if test="${not empty board.ufRecipe15}">
			<div class="text_recipe" style="width:75% ; vertical-align: top; padding-top: 20px; padding-bottom:  30px;">
				${board.ufRecipe15}
			</div>
			<div class="text_recipe" style="padding: 20px; max-width: 300px;">
				</div>
		</c:if>
				</div>
		<div style="padding-bottom: 850px; border: 6px white;"></div>
		</div>
</div>		
				
				

<div class="like-content"></div>

	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel"
		style="width: 600px; height: 400px; display: inline-block; text-align: center;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
		<div class="photo_title" style="font-size: 20px; font-weight: bold;">
			<b>조리과정 사진</b>
		</div>
		
			<div class="carousel-inner" role="listbox" >
				<div class="item active"style="text-align: center;">
				<c:if test="${not empty board.ufImg3 }">
						<img src="<%=request.getContextPath() %>${board.ufImg3}" alt="이미지 오류"						
							style="width: 600px; height: 400px;">
						</c:if>
						<c:if test="${empty board.ufImg3 }">
						<img src="<%=request.getContextPath() %>/resources/image/noIMG.jpg" alt="이미지 오류"						
							style="width: 600px; height: 333px;">
						</c:if>
					<div class="carousel-caption"></div>
				</div>
				<c:if test="${not empty board.ufImg4 }">
					<div class="item">
						<img src="<%=request.getContextPath() %>${board.ufImg4}" alt="UF_IMG i+2"
							style="width: 600px; height: 400px;">
					</div>
				</c:if>
				<c:if test="${not empty board.ufImg5 }">
					<div class="item">
						<img src="<%=request.getContextPath() %>${board.ufImg5}" alt="UF_IMG i+2"
							style="width: 600px; height: 400px;">
					</div>
				</c:if>
				<c:if test="${not empty board.ufImg6 }">
					<div class="item">
						<img src="<%=request.getContextPath() %>${board.ufImg6}" alt="UF_IMG i+2"
							style="width: 600px; height: 400px;">
					</div>
				</c:if>
				<c:if test="${not empty board.ufImg7 }">
					<div class="item">
						<img src="<%=request.getContextPath() %>${board.ufImg7}" alt="UF_IMG i+2"
							style="width: 600px; height: 400px;">
					</div>
				</c:if>
				<c:if test="${not empty board.ufImg8 }">
					<div class="item">
						<img src="<%=request.getContextPath() %>${board.ufImg8}" alt="UF_IMG i+2"
							style="width: 600px; height: 400px;">
					</div>
				</c:if>
			</div>
			

			<!-- 사진 컨트롤러 -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>



						<div class="love" style="text-align: center;">
							<img src="${pageContext.request.contextPath}/resources/image/-.png"
									 style="width: 200px; height: 200px;">
								    <h2>레시피가 마음에 들었다면?</h2>
								    
											<div class="good">
											 <c:if test="${sessionScope.USER_INFO ne null}">
													<button type="button" id="like_update"
													 class="btn-secondary like-review">
														<i class="fa fa-heart" aria-hidden="true"></i>추천
														<span	class="rec_count" style="color: white;">${board.ufLove}</span>
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
	 <input type="hidden" id="ufCode" name="ufCode" value="${board.ufCode }" >

	</div>
</div>
</body>

<script>
	var check = "${check}";
	var ufcode = document.getElementsByName("ufCode")[0].value;
$(function(){
    $(document).one('click', '.like-love', function(e) {
        $(this).html('<i class="fa fa-heart" aria-hidden="true"></i>완료!');
        $(this).children('.fa-heart').addClass('animate-like');
    });
	    $("#like_update").click(function() {
		if (confirm("해당 레시피를을 추천하시겠습니까?")) {
			if (Number(check) > 0){
				alert("이미 추천을 완료하였습니다.");
			}
			else{
				var love = true;
				location.replace("userViewL?ufCode=" + ufcode + "&love=" + love);
			}
			
		}
	});
});

</script>

<br>
<br>
<%@include file="/WEB-INF/inc/foot1.jsp" %>
</html>

