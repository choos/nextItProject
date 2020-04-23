<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp" %> 
<title>title</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/> 


<!-- <script language="javascript" type="text/javascript">
       function form_check(){
             if(document.form.name.value == ""){
                           alert("이름을 입력하세요.");
                           document.form.name.focus();
                           return false;
             }
             if(document.form.title.value == ""){
                           alert("제목을 입력하세요.");
                           document.form.title.focus();
                           return false;
             }
             if(document.form.content.value == ""){
                           alert("내용을 입력하세요.");
                           document.form.content.focus();
                           return false;
             }           
             if(document.form.passwd.value == ""){
                           alert("비밀번호를  입력하세요.");
                           document.form.passwd.focus();
                           return false;
             }
      
       document.form.submit();
       }
 

function addFileForm(){
 

  var tb1 = document.getElementById("file_table");
  if(9 >= tb1.rows.length) {
   var idx = getObj().parentElement.rowIndex + 1;
   var trow= tb1.insertRow(idx);
   var uploadOBJ="<input name='attatch' type='file' class='TEXT_FORM' id='f_id'><a OnClick='javascript:addFileForm();'> 추가</a>  <a OnClick='javascript:deleteRow();'>삭제</a> ";
   trow.insertCell(0).innerHTML = uploadOBJ;
  } else {
   alert("문서파일은 10개 이상 접수할 수  없습니다.");
   return;
  }
 }
 

 function getObj()
 {
     var obj = event.srcElement
     while (obj.tagName !='TD') //TD가 나올때까지의 Object추출
     {
         obj = obj.parentElement
     }
     return obj
 }
 
 function deleteRow(){
  var tb1 = document.getElementById("file_table");
 

  var idx = getObj().parentElement.rowIndex;
 

  if(tb1.rows.length-1 !=0){
   var tRow = tb1.deleteRow(idx);
  }else{
    document.getElementById('f_id').select();
       document.selection.clear();
  }
 }
</script> -->


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

</head>
<body>
<%@include file="/WEB-INF/inc/top_menu.jsp" %> 
<div class="bs-docs-header">
		<div class="container" id="mainBody">
		 <!-- <form action="/market/marketView1" method="get"> -->

			<div>
			<span>메뉴</span>
			</div>
			<div class="imgDiv">
				<a href="mm">
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
			<input style="size: 200px;" class="searchWord" type="text">
			<input class="search" type="button" value="상품 검색">
	</div>
	</div><!-- bs-docs-header -->
	
	
	
	<div class="container" id="mycon" style="padding-top: 100px;" >
	
			<table class="table table-border">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="45%" />
					<col />
				</colgroup>
				<tr>
					<th>상품코드</th>
					<td><input type="hidden" id="sRSCode" name="sRSCode" value=""></td>
					<th>별점</th>
					<td><input id="grade" type="text" name="grade" value=""
						required="required"></td>
				</tr>
				<tr>
					<th>구매수량</th>
					<td colspan="3"><input id="purchaseNumber" type="text" name="purchaseNumber" value="" required="required"> 
				  </td>
				</tr>
				<tr>
					<th>Review</th>
					<td colspan="3"><input id="review" type="text" name="review" value=""
						 required="required"></td>
				</tr>
				<tr>
					<td>Photo Review</td>
				<!-- 	<td>
						<table id="file_table">
							<tr>
								<td>
								  <input name="attatch" type="file" class="TEXT_FORM" id="f_id">
								  <a OnClick="javascript:addFileForm();"> 추가</a>  
								  <a OnClick="javascript:deleteRow();">삭제</a>
               </td>
              </tr>
						</table>
					</td> -->
				</tr>
				<tr>
					<td></td>
					<td><button type="submit" id="submitbutton" class="btn btn-sm btn-default">등록</button></td>
					<!-- <td><input type="submit" name="Submit" value="쓰기"
						onclick="form_check();"> <input type="button"
						name="Submit2" value="취소" onclick="history.back();"></td> -->
				</tr>

		</table>
		<form action="" method="post">
			<input type="hidden"  id="hsRSCode">
			<input type="hidden"  id="hgrade">
			<input type="hidden"  id="hpurchaseNumber">
			<input type="hidden"  id="hreview">	
			<button type="submit" id="submitbutton" class="btn btn-sm btn-default">등록</button>	
		</form>
	
<script language="javascript" type="text/javascript">

document.getElementById("submitbutton").onclick = function valuepass(e){

	e.preventDefault();
	document.getElementById("sRSCode").value = document.getElementById("hsRSCode").value
	document.getElementById("grade").value = document.getElementById("hgrade").value
	document.getElementById("purchaseNumber").value = document.getElementById("hpurchaseNumber").value
	document.getElementById("review").value = document.getElementById("hreview").value

}
</script> 
		
				
</div>

</body>
</html>