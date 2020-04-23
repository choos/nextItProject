<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>title</title>
<style type="text/css">
body {
	background-image:
		url("${pageContext.request.contextPath}/resources/image/93608.jpg");
	background-size: cover
}

#testCSS {
	min-height: 100%;
	position: relative;
	padding: 80px;
	padding-bottom: 50%; /* footer height */
	margin: 0 auto -221px;
	text-align: center;
}

img {
	width: 50px;
	height: 50px;
}

.foodlist {
	display: inline-block;
}

html, body {
	height: 100%;
}

#careMianImg {
	height: 150px;
	width: 700px;
}

.userSele {
	height: 150px;
	border: 3px solid;
	border-color: #B7F0B1;
}
</style>
</head>
<script type="text/javascript">
$(document).ready(function() {
	
	/* 음식의 카테고리 클릭 시 카테고리에 관련된 음식리스트가 append됨 */
	$(".foodlist").on("click", function() {
		food=$(this).data("code")
		goFood(food);
	});
		
function goFood(food) {
	params = "food="+food
	$.ajax({
		type:"post"
		,url:'<c:url value="/food/foodList"/>'
		,dataType: 'json'
		,data: params
		,success: function(food) {
			if (food.result) {
				$area = $("#idFoodViewArea");
				$(".foodView").remove();
				$.each(food.data, function(i, index) {
					str ='';
					str +='<div class="foodView" style="display: inline-block;" data-name="'+index.foodName+'">';
					str +='<input type="hidden" class="foodNo" data-no="'+index.foodNo+'">'
					str +='<a href="#" class="foodCode" data-code="'+index.foodCategory+'">';
					str +='<img src="${pageContext.request.contextPath}/resources/image/'+index.foodCategory+'.png"><br>';
					str +='<strong>'+index.foodName+'</strong>';
					str +='</a>';
					str +='</div>';
					$area.append(str);
				})//$each
			}else {
				alert(data.msg);
			}
		}
		,error: function(req, st, err) {
			alert(req);
			alert(st);
			alert(err);
		}
	});
}

	/*#idFoodViewArea에 있는 음식 이름 클릭 시 row div에 음식 이름 추가하기  */
	$("#idFoodViewArea").on("click",".foodView" ,function() {
		code = $(this).children(".foodCode").data("code");/*음식 코드  */
		num = $(this).children(".foodNo").data("no");/*음식이름코드  */
		food = $(this).data("name");/* 음식이름 */
		andFood(food , code , num);
	});
	
	/*.userSele에 있는 이름 클릭 시 음식이름 삭제됨  */
 	$(".userSele").on("click",".foodNum" ,function() {
 		name = $(this).children(".foodName").data("name");/*음식이름 */
 		num = $(this).data("num");/*음식이름코드 */
		foodDel(num , name);
	});
	
		var myFoodList = [];/*중복된 음식이름 확인*/
	function andFood(food , code , num) {
		$myArea = $(".userSele");/* append 할 div */
		if(myFoodList.indexOf(food) == -1){
			myFoodList.push(food);
			str =''
			str +='<div class="foodNum" id="'+num+'" data-num="'+num+'" style="display: inline-block;">';
			str +='<a href="#" class="foodName" data-name="'+food+'">';
			str +='<img src="${pageContext.request.contextPath}/resources/image/'+code+'.png"><br>';
			str +='<strong>'+food+'</strong>';
			str +='</a>';
			str +='</div>';
			str +='<input type="hidden" value="'+food+'" class="'+num+'" name="inpFood">'
			$myArea.append(str);
		}
	}
	
	function foodDel(num , name) {
		$("#"+num).remove();/*div삭제  */
		$("."+num).remove();/*input 삭제  */
		for (var i = 0; i < myFoodList.length; i++) {/*중복방지 리스트에서 삭제한 값 제거 */
			if(myFoodList[i] == name){
				myFoodList.splice(i,1);
			}
		}
		console.log("myFoodList",myFoodList);
	}	
	
	/* 레시피 조회하기 */
	var myArry = "";
	$("#getRecipe").on("click", function() {
		$("[name='inpFood']").each(function(i) {
			if (i==0) {
				 myArry+=$("[name='inpFood']")[i].value;
			}else {
				 myArry+=","+$("[name='inpFood']")[i].value;
			}
		});
		console.log("myArry",myArry);
		
 		$('[name="foodNameList"]').val(myArry); 
		$('#fm_food').submit();  
	});
});//ready
</script>
<%@include file="/WEB-INF/inc/top_menu.jsp"%>
<body>
	<div class="container contents-wrap" id="testCSS">
		<div class="myTop">
			<img id="careMianImg" alt="" src="/resources/image/caremain2.png" class="img-responsive center-block">
		</div>
		<div class="myBottom">
			<!--음식 카테고리  -->
			
			<a href="#" class="foodlist"  data-code="A001">
			<h3><span class="label label-info">견과류</span></h3></a>
			
			<a href="#" class="foodlist"  data-code="A002">
			<h3><span class="label label-info">가공식품</span></h3></a>
			
			<a href="#" class="foodlist" data-code="A003" >
			<h3><span class="label label-info">가루</span></h3></a>
			
			<a href="#" class="foodlist" data-code="A004" >
			<h3><span class="label label-info">기름</span></h3></a>
			
			<a href="#" class="foodlist" data-code="A005">
			<h3><span class="label label-info">버섯</span></h3></a>
			
			<a href="#" class="foodlist" data-code="A006">
			<h3><span class="label label-info">야채/채소</span></h3></a>
			
			<a href="#" class="foodlist" data-code="A007" >
			<h3><span class="label label-info">열매</span></h3></a>
			
			<a href="#" class="foodlist" data-code="A008">
			<h3><span class="label label-info">유제품</span></h3></a>
			
			<a href="#" class="foodlist" data-code="A009">
			<h3><span class="label label-info">육류</span></h3></a>
			
			<a href="#" class="foodlist" data-code="A010">
			<h3><span class="label label-info">조미료</span></h3></a>
			
			<a href="#" class="foodlist" data-code="A011" >
			<h3><span class="label label-info">해산물</span></h3></a>
			
			<a href="#" class="foodlist" data-code="A012">
			<h3><span class="label label-info">향신료</span></h3></a>
			
		</div>
		
		<div id="idFoodViewArea">
		<!-- 카테고리리스트에서 받아온 foodList 넣기 -->
		
		</div>

		<div class="userSele" >
		<!-- idFoodViewAreaa에서 넘어온 foodName 넣기-->
		<form id="fm_food" action="careFridgeView">
			<input type="hidden" name="foodNameList" value="">
		</form>
		</div>
		<a id="getRecipe" class="btn btn-success">레시피찾기</a>

			
</div>
	<!--foot  -->
<%@include file="/WEB-INF/inc/foot1.jsp"%>
</body>
</html>