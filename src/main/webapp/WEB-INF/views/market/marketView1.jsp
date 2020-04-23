<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>상품 상세보기</title>


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/like.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<!-- <script type="text/javascript" src="/resources/css/like.js"></script>
 -->
<script>window.name = 'openerWin';</script>
<style type="text/css">
#mainBody {
	padding: 60px 20px;
	text-align: center;
}

#markViewMaincon {
	padding: 110px 20px;
	border: 2px solid blue;
}

.col-lg-5 {
	margin: 0 20px;
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

.front img {
	width: 250px;
	height: 250px;
}

#homeImg {
	width: 50px;
	height: 50px;
}

.bs-docs-header {
	background-image:
		url("${pageContext.request.contextPath}/resources/image/93600.jpg");
	background-size: cover;
	/* 	opacity: 0.5; */
}

.bs-docs-section {
	text-align: center;
}

.itemImg {
	width: 400px;
	height: 400px;
}

.itemInfoBox {
	padding: 450px 20px;
}

/* 바로구매 버튼 스타일  */
.rightnow {
	display: inline-block;
}

.main_btn {
	display: inline-block;
	background-color: #FF8C00;
	height: 50px;
	width: 100px;
	color: white;
	font-size: 18px;
}

.icon_btn {
	display: inline-block;
	background-color: #9acd32;
	height: 50px;
	width: 100px;
	color: white;
	font-size: 18px;
}

/*  장바구니 버튼 스타일 */
.cart {
	display: inline-block;
	padding-left: 10px;
}

/*  추천 버튼 스타일 */
.like-content {
	display: inline-block;
	position: absolute;
	padding-left: 10px;
	height: 100px;
	width: 800px;
}

.card_area {
	padding-top: 30px;
}
</style>



<title>상품 상세 보기</title>

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
				<a href="mm?sCategory="> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/ALL.png">
					<span>전체</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mm?sCategory=간식/안주"> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/beer.png">
					<span>간식/안주</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mm?sCategory=식사"> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/rice.png">
					<span>식사</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mm?sCategory=디저트"> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/strawberry-cake.png">
					<span>디저트</span>
				</a>
			</div>
			<!-- 이미지 자식 div -->
		</div>
		<!-- body 부모 dib  -->
		<!-- 검색창 -->
		<div class="bs-docs-section">
			<span> <img id="homeImg" alt=""
				src="${pageContext.request.contextPath}/resources/image/로고2.png">
				0Kcal
			</span> <input style="size: 200px;" class="searchWord" type="text">
			<input class="search" type="button" value="상품 검색">
		</div>
	</div>
	<!-- bs-docs-header -->



	<div class="container" id="mycon" style="padding-top: 100px;">

		<!--================Single Product Area =================-->
		<div class="product_image_area">
			<div class="container">

				<div class="row s_product_inner">
					<div>
						<form method="get" name="form">
							<div class="col-lg-6" style="text-align: center;">
								<div class="s_product_img" style="display: inline-block;">
									<div id="carouselExampleIndicators" class="carousel slide"
										data-ride="carousel">
										<ol class="carousel-indicators">
										</ol>
										<div class="carousel-inner">
											<div class="carousel-item active" style="text-align: center;">
												<!-- 상품 메인 사진 -->
												<img class="itemImg" src="${market.sMainImg}" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-5" style="display: inline-block;">
								<div class="s_product_text">
									<!-- 상품명 부분 -->
									<h1>${market.sTitle}</h1>
									<h2>
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${market.sPrice}" />
										원
									</h2>

									<ul class="list">
										<li>
											<!-- 카테고리 부분 -->
											<h3 style="color: green;">Category : ${market.sCategory}</h3>
										</li>
										<br>
										<li>
											<!-- 재고량 부분 -->
											<h4>
												<span style="color: green;">재고량 : </span>${market.sInven} 개
											</h4>
										</li>
									</ul>
									<!-- 간단한 설명 -->
									<p>${market.sInfo}</p>
									<!------------- 주문 수량 부분 ------------->
									<div class="product_count">
										<span><b>주문 수량:</b></span>
										<!-- 주문 수량 부분 -->
										<input type="text" name="qty" id="sst" maxlength="12"
											value="1" title="Quantity:" class="input-text qty" /> <input
											type="hidden" name="sCode" value='${market.sCode}' />
										<button
											onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
											class="increase items-count" type="button">
											<i class="fa fa-chevron-up" aria-hidden="true"></i>
										</button>
										<button
											onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
											class="reduced items-count" type="button">
											<i class="fa fa-chevron-down" aria-hidden="true"></i>
										</button>
									</div>
									<!------------- 주문 수량 부분 끝 ------------->

									<div class="card_area">

										<!-- 회원이면 구매, 장바구니 페이지로 회원이 아니면 로그인 페이지로 -->
										<c:choose>
											<c:when test="${sessionScope.USER_INFO ne null}">
												<div class="rightnow">
													<!-- <button class="main_btn" type="submit">바로 구매</button> -->
													<button type="submit" class="main_btn"
														onclick="javascript: form.action='/purchase/purchasePage';">바로
														구매</button>
												</div>
											</c:when>
											<c:otherwise>
												<div class="rightnow">
													<!-- <button class="main_btn" type="submit">바로 구매</button> -->
													<button type="submit" class="main_btn"
														onclick="javascript: form.action='<%=request.getContextPath()%>/login/login';">바로
														구매</button>
												</div>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${sessionScope.USER_INFO ne null}">
												<div class="cart">
													<button class="icon_btn" type="submit"
														onclick="javascript: form.action='/shoppingCart/insertCart';">
														<i class="fa fa-shopping-cart" aria-hidden="true">
															장바구니</i>
													</button>
												</div>
											</c:when>
											<c:otherwise>
												<div class="cart">
													<button class="icon_btn" type="submit"
														onclick="javascript: form.action='<%=request.getContextPath()%>/login/login';">
														<i class="fa fa-shopping-cart" aria-hidden="true">
															장바구니</i>
													</button>
												</div>
											</c:otherwise>
										</c:choose>
										<!-- // 회원이면 구매, 장바구니 페이지로 회원이 아니면 로그인 페이지로 -->

										<div class="like-content">
											<c:if test="${sessionScope.USER_INFO ne null}">
												<button type="button" id="like_update"
													class="btn-secondary like-review">
													<i class="fa fa-heart" aria-hidden="true"></i>추천 
													<span	class="rec_count" style="color: white;">${market.sLove}</span>
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

									<!-- //card_area -->
								</div>

							</div>
						</form>
					</div>
					<br>
					<br>
					<br>
					<br>



					<div class="itemInfoBox">
						<hr>
						<h2>
							<span><b>리뷰 & 댓글</b></span>
						</h2>
						<br>
						<br>
						<c:if test="${not empty a}">
					<%-- 	 <c:if test="${sessionScope.USER_INFO ne null}"> --%>
							<div class="reviewBox" style="text-align: left: 10px;">
								<form method="post" enctype="multipart/form-data">
									<table class="table table-border">
										<colgroup>
											<col width="10%" />
											<col />
										</colgroup>
										<tr style="display: none;">
											<th>상품코드</th>
											<td><input type="hidden" id="sCode" name="sCode"
												value="${market.sCode}"></td>
										</tr>
										<tr>
											<th>별점</th>
											<td>
												<div class="QnADate">
													<select name="srLove" id="srLove">
														<option value="">당신의 점수는 ?</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th>구매수량</th>
											<td><input id="srPQuantity" type="hidden"
												name="srPQuantity" value="${purchase}">${purchase}</td>
										</tr>
										<tr>
											<th>Review</th>
											<td><textarea id="review" name="srContent" rows="10"
													style="width: 100%;" required="required"></textarea></td>
										</tr>
										<tr>
										 <th>첨부파일</th>
										 <td>
										 	<input type="file" name="reviewImgFile">
											<!-- <input type="text" name="reviewImg"> -->
										 </td>
										</tr>
										<tr>
											<td></td>
											<td>
												<div class="pull-right">
													<button type="submit" id="submitbutton"
														class="btn btn-sm btn-default"
														onclick="javascript: form.action='/reply/replyRegist';">등록</button>
												</div>
											</td>

										</tr>
									</table>
								</form>
							</div>
					<%-- 	</c:if> --%>
					</c:if>	

						<div class="review" style="text-align: center;">
							<table class="table table-hover" style="width: 1126px;">

								<colgroup>
									<col width="5%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="35%" />
									<col width="20%" />
									<col width="20%" />
									

								</colgroup>
								<tr>
									<th style="text-align: center;">번호</th>
									<th style="text-align: center;">ID</th>
									<th style="text-align: center;">별점</th>
									<th style="text-align: center;">등록일</th>
									<th style="text-align: center;">구매수량</th>
									<th style="text-align: center;">Review</th>
									<th style="text-align: center;">Photo Review</th>
									<th style="text-align: center;"></th>
								</tr>
								<c:forEach items="${marketReview}" var="vo" varStatus="st">
									<%-- <c:if test="${sessionScope.USER_INFO eq ${vo.srMemId}}">  --%>
									<tr id="rcontent" data-sr_num = "${vo.srNum}" data-s_code="${market.sCode}">
										<td style="text-align: center; vertical-align: middle;">${vo.srNum}</td>
										<td style="text-align: center; vertical-align: middle;">${vo.srMemId}</td>
										<td style="text-align: center; vertical-align: middle;">
											<c:forEach var="i" begin="1" end="${vo.srLove}">
												<img class=""
													src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"
													style="width: 10px; height: 10px; vertical-align: middle;" />
											</c:forEach>
										</td>
									<c:if test="${null ne vo.srModDate}">
										<td style="text-align: center; vertical-align: middle;">${vo.srModDate}</td>
									</c:if>
									<c:if test="${null eq vo.srModDate}">
										<td style="text-align: center; vertical-align: middle;">${vo.srRegDate}</td>
									</c:if>
										<td style="text-align: center; vertical-align: middle;">${vo.srPQuantity}</td>
										<td style="text-align: center; vertical-align: middle;">${vo.srContent}</td>
										<td><a href="javascript:void(0);"
											onclick="window.open('${vo.srContentImg}','window_name','width=500, height=500, left=730px,top=300px toolbar=no, , scrollbars=no, resizable=yes')">
												<img src="<%=request.getContextPath()%>${vo.srContentImg}"
												style="width: 70px; height: 70px; vertical-align: middle;" />
										</a></td>
									<c:if test="${sessionScope.USER_INFO.userId eq vo.srMemId}">
										<td>								
											<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal${st.count}">
											  수정
											</button>
<!-- 											<button name="delete" type="button"  onclick="location.href='/reply/replyRemove'"
															class="btn btn-sm btn-danger" >
											삭제
											</button> -->
											<a href="#"  class="btn btn-info btn-sm">삭제</a>
										</td>
									</c:if>
									</tr>
									
									
									<%-- </c:if> --%>
								</c:forEach>
							</table>
					<!---------------------------- Modal------------------------------>
							 <!-- Modal -->
					<c:forEach items="${marketReview}" var="vo" varStatus="st">
						<input type="hidden" value="${st.count}">
						<%-- ${vo.srMemId eq sessionScope.USER_INFO.userId} --%>
						<c:if test="${vo.srMemId eq sessionScope.USER_INFO.userId}">
							<div class="modal fade" id="myModal${st.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
								
							    <div class="modal-content">
							 <!-- form -->
							    <form method="post"  action="/reply/replyModify"  enctype="multipart/form-data">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" style="text-align: center;" id="myModalLabel">리뷰&댓글</h4>
							      </div>
							      <div class="modal-body">
												<div class="reviewBox" style="text-align: left: 10px;">
													
														<table class="table table-border">
													
															<colgroup>
																<col width="15%" />
																<col />
															</colgroup>
															<tr style="display: none;">
																<th>상품코드</th>
																<td><input type="hidden" id="sCode" name="sCode"
																	value="${market.sCode}"></td>
															</tr>
															<tr style="display: none;">
																<th>글 번호</th>
																<td><input type="hidden" id="srNum" name="srNum"
																	value="${vo.srNum}"></td>
															</tr>
															<tr>
																<th>별점</th>
																<td>
																	<div class="QnADate">
																		<select name="srLove" id="srLove">
																			<option value="">당신의 점수는 ?</option>
																			<option value="1">1</option>
																			<option value="2">2</option>
																			<option value="3">3</option>
																			<option value="4">4</option>
																			<option value="5">5</option>
																		</select>
																	</div>
																</td>
															</tr>
															<tr>
																<th>구매수량</th>
																<td><input id="srPQuantity" type="hidden"
																	name="srPQuantity" value="${vo.srPQuantity}">${vo.srPQuantity}</td>
															</tr>
															<tr>
																<th>Review</th>
																<td><textarea id="review" name="srContent" rows="10"
																		style="width: 100%;" required="required">${vo.srContent}</textarea></td>
															</tr>
															<tr>
															 <th>첨부파일</th>
															 <td>
															 	<input type="file" name="reviewImgFile">
																 <input type="hidden" name="reviewImg" value="${vo.srContentImg}"> 
															 </td>
															</tr>
															<tr>
																<td></td>
																<!-- <td>
																	<div class="pull-right">
																		<button type="submit" id="submitbutton"
																			class="btn btn-sm btn-default"
																			onclick="javascript: form.action='/reply/replyRegist';">등록</button>
																	</div>
																</td> -->
					
															</tr>
														</table>	
												</div>
							      </div> <!-- modal-body -->
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							        <button type="submit" id="submitbutton"	class="btn btn-sm btn-default">수정</button>
							      </div>
							    </form>
							  <!-- //form -->
							    </div>
							  </div>
							</div>
						</c:if>
					</c:forEach>
					<!----------------------------// Modal------------------------------>

						</div>
						

						<hr>
						<br>
						<br>
						<div class="infoview" style="text-align: center;">
							<img src="${market.sImg1}"> <img src="${market.sImg2}">
							<img src="${market.sImg3}"> <br>
							<br>
							<br>
							<br>
							<hr>
							<h2>
								<span><b>상품정보</b></span>
							</h2>
							<br>
							<br>
							<div class="infoBox" style="text-align: center;">
								<div class="info">
									${market.sContent1}<br>
									<br>
									<br> ${market.sContent2}<br>
									<br>
									<br> ${market.sContent3}<br>
									<br>
									<br> ${market.sContent4}<br>
									<br>
									<br> ${market.sContent5}<br>
									<br>
									<br> ${market.sContent6}<br>
									<br>
									<br> ${market.sContent7}<br>
									<br>
									<br> ${market.sContent8}<br>
									<br>
									<br> ${market.sContent9}<br>
									<br>
									<br> ${market.sContent10}
								</div>

								<br>
								<hr>
							</div>
						</div>
					</div>
					<!-- </form> -->
				</div>
			</div>
		</div>

	</div>




</body>
<script>

$(document).ready(function() {
	

	var check = "${check}";
	var code = document.getElementsByName("sCode")[0].value;
$(function(){
    $(document).one('click', '.like-love', function(e) {
        $(this).html('<i class="fa fa-heart" aria-hidden="true"></i>완료!');
        $(this).children('.fa-heart').addClass('animate-like');
    });
	    $("#like_update").click(function() {
		console.log("눎");
		if (confirm("해당 상품을 추천하시겠습니까?")) {
			if (Number(check) > 0){
				alert("이미 추천을 완료하였습니다.");
			}
			else{
				var love = true;
				location.replace("marketView1?sCode=" + code + "&love=" + love);
			}
			
		}
	});
});


$('.btn-info').on('click', function(){
    
    $this = $(this)
    console.log($this)
    res = confirm("댓글을 삭제하시겠습니까?")
    if(res){
				re = $this.closest('tr').data('sr_num');
				co = $this.closest('tr').data('s_code');
				params = {'srNum': re, 'sCode': co}
				console.log('params', params);
				
			$.ajax({
				type : "POST",
				url : '<c:url value="/reply/replyRemove" />',
				dataType : "json",
				data : params,
				success : function(data) {
							$this.closest('tr').remove();
				},
				error : function(req, st, err) {
					alert("Error 발생");
				}
				
			}); 	// ajax
	}
	
	});   	


})
	
	

</script>
<%@include file="/WEB-INF/inc/foot1.jsp"%>
</html>