<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>상품판매 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/recipe.css"/> 
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
</style>
<!-- 정적인 자원이 원격지(다른 컴퓨터)에 있는 경우
	이 경우는 좀 번거롭지만 정적인	자원의 경로 앞에
	원격지의 주소를 일일이 붙여주는 수 밖에 없다. -->
 <%@include file="/WEB-INF/inc/top_menu.jsp"%> 
</head>

<body>
<!--메뉴바  -->
	<div class="bs-docs-header">
		<div class="container" id="mainBody">
		 <!-- <form action="/market/marketView1" method="get"> -->

			<div>
			<span>메뉴</span>
			</div>
			<div class="imgDiv">
				<a href="mm?sCategory=">
				<img alt=""	src="${pageContext.request.contextPath}/resources/image/ALL.png">
				<span>전체</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mm?sCategory=간식/안주">
				<img alt=""	src="${pageContext.request.contextPath}/resources/image/beer.png">
				<span>간식/안주</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mm?sCategory=식사">
				<img alt="" src="${pageContext.request.contextPath}/resources/image/rice.png">
				<span>식사</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mm?sCategory=디저트">
				<img alt="" src="${pageContext.request.contextPath}/resources/image/strawberry-cake.png">
				<span>디저트</span>
				</a>
			</div>
			 <!-- 이미지 자식 div -->
			<!-- </form> -->
		</div>	<!-- body 부모 dib  -->
		<!-- 검색창 -->
	<div class="bs-docs-section">
			<span>
				<img id="homeImg" alt="" src="${pageContext.request.contextPath}/resources/image/로고2.png">
			0Kcal
			</span>
			<form name="frm_search" action="mm" method="get"
				class="form-horizontal">
					<input style="size: 200px;" name="searchWord" class="searchWord"
					 type="text" value="${searchVO.searchWord}">
					<input class="search" type="submit" value="검색">
			</form>
	</div>
	</div><!-- bs-docs-header -->
	
	
	
	<div class="container" id="mycon" style="padding-top: 100px;" >
			 <div id="wrapper">

            <!-- Main -->
                <div id="main">
                    <div class="inner">
                    		<div style="text-align: center;">
                    			<img class="img-responsive"  alt="" src="${pageContext.request.contextPath}/resources/image/marketboard.png">		       
                    		</div>
                        <section class="tiles">
                          <c:forEach items="${market}" var="vo" varStatus="st">
                            <article class="style1">
                                <span class="image">
                                    <img src="${vo.sMainImg}"/>
                                </span>
                                <a href="<%=request.getContextPath()%>/market/marketView1?sCode=${vo.sCode}">
                                    <div class="content">
                                        <h3>${vo.sTitle}</h3>
                                      <h4><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.sPrice}"/>원</h4>
                                        <p><b>${vo.sCategory}</b></p>
                                        <p><b>추천수 : ${vo.sLove}</b></p>
                                        											
                                    </div>
                                </a>
                            </article>
                         </c:forEach>
                       </section>
                    </div>
                </div>
            </div>

	</div> 
	<!-- //class="container" id="mycon"  -->

</body>
<%@include file="/WEB-INF/inc/foot1.jsp"%>
</html>