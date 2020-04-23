<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>유저레시피 글 수정</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/recipe.css"/> 
  	<script type="text/javascript">
  		var fn_frm_submit = function (e) {
				e.preventDefault(); //이벤트 전파 방지(기본 서브밋 방지)
				// 폼 검증
 				var f = document.forms['frm_free'];
 				f.action = "userModify";
 				f.submit();
			}
  		
  		var fn_btn_delte_click = function(e){
				e.preventDefault(); //이벤트 전파 방지(기본 서브밋 방지)
				// 폼 검증
				var f = document.forms['frm_free'];
				f.action = "userDelete";
				f.submit();
			}
  		
  		window.onload=function(){
				document.forms['frm_free'].addEventListener("submit", fn_frm_submit);
				document.getElementById("id_btn_delete").addEventListener("click", fn_btn_delte_click);
			}
  		
  		var i = 1;
  		var j = 3;
 
  		
  	</script>
  </head>
<body>
<%@include file="/WEB-INF/inc/top_menu.jsp" %>
<div class="container">
	<div class="page-header">
		<h3>게시글 수정</h3>
	</div>
	
<div class="row">
	<form action="userModify" method="post" enctype="multipart/form-data">
<table class="table table-striped table table-bordered">
	<colgroup>
		<col width="20%" />
		<col />
	</colgroup>
	<tr>
		<th>제목</th>
		<td><input type="text" name="ufTitle" value="${board.ufTitle}" class="form-control">
		<input type="hidden" name="ufNum" value="${board.ufNum}" class="form-control">
		<input type="hidden" name="ufId" value="${board.ufId}" class="form-control">
		</td>
	</tr>
	<tr>
				<th>분류</th>
				<td>
					<input type="hidden" name="ufCategory" value="" id="id_cat" >
					<select  id="id_cat_code"  name="ufCatecode" required="required" class="form-control"  onchange="f_cat()">			
						<option value="">-- 선택하세요--</option>
						<c:forEach items="${catList}" var="vo">
							<option value="${vo.commCd}">${vo.commNm}</option>
						</c:forEach>
					</select>	
				</td>
	</tr>
		<tr>
		<th>재료</th>
		<td><input type="text" name="ufMater" value="${board.ufMater}" class="form-control"></td>
	</tr>
		<tr>
		<th>YouTube 링크</th>
		<c:if test="${not empty board.ufLink }">
		<td><input type="text" name="ufLink" class="form-control" value="${board.ufLink}" ></td>
		</c:if>
		<c:if test="${empty board.ufLink }">
		<td><input type="text" name="ufLink" value="" class="form-control"></td>
		</c:if>
	</tr>
	
	
 
	<tr>
				<th>조리순서<br>
				<input type="button" value="열 추가" onclick="add_textbox()"> <br>
				<input type="button" value="마지막열 삭제" onclick="del_textbox()">
				<h6>최대 15열까지 등록 가능합니다</h6>
				</th>
			<td id="text_space">
					<c:set var="recNum" value="0" />
					 <c:forEach items="${board.ufRecipeList }" var="recStr">
								<c:set var="recNum" value="${recNum + 1}" />
								<c:if test="${not empty recStr }">
								<table id="textt_space${recNum }">
									<tr>
										<th>조리순서 <br>
										<input type="button" value="삭제"
											onclick="del_thistextbox(this)">
										</th>
										<td>
										 <textarea rows="3" name="ufRecipe${recNum }" class="form-control ckeditor" style="width: 720px; height: 125px; resize: none;">${recStr }</textarea>
										 <script type="text/javascript">
										 	i++;
										 </script>
										</td>
									</tr>
									
		</table>
								</c:if>
							</c:forEach>
						</td>
	</tr>

	<tr>
		<th>대표 이미지</th>
		<td><input type="file" name="ufImg1File">
		<input type="hidden" name="ufImg1" value="${board.ufImg1 }"></td>
	</tr>
	
		<tr>
				<th>중간과정 사진 <br>				
				<input type="button" value="사진 추가" onclick="add_photobox()"><br>
				<input type="button" value="마지막열 삭제" onclick="del_photobox()"><br>
				<h6>최대 6장까지 등록 가능합니다</h6>
				</th>
				<td id="photo_space">
				<c:set var="imgNum" value="2"  />
				<c:forEach items="${board.ufImgList }" var="imgStr">
				<c:set var="imgNum" value="${imgNum + 1}"  />
		 		<c:if test="${not empty imgStr }">
        <table id="photoo_space${imgNum }">
          <th>사진 <br>
          <input type="button" value="삭제" onclick="del_thisphotobox(this)">
          </th>
          <td>
					<input type="file" name="ufImg${imgNum }File">
					<input type="text" name="ufImg${imgNum }" value="${imgStr }">
          </td>
					</table>
					<script type="text/javascript">
					j++;
					</script>
		 		</c:if>
		</c:forEach>
		</td>
			</tr>
	

				<tr>
		<td colspan="2">
			<div class="pull-left">
				<a href="userMain" class="btn btn-sm btn-default">게시목록</a>
			</div>
			<div class="pull-right">
				<button type="submit" class="btn btn-sm btn-warning">수정하기</button>
				<button type="button" id="id_btn_delete" 
					class="btn btn-sm btn-danger">글 삭제</button>
			</div>
		</td>
	</tr>	
</table>
	</form>
	</div>
</div>
</body>
<%@include file="/WEB-INF/inc/foot1.jsp"%>
<script type="text/javascript">
function f_cat() {
	
	var cat = document.getElementById("id_cat");
	var catCode = document.getElementById("id_cat_code");
	 var  catNm  =  $("#id_cat_code option:selected").text();


	 cat.value = catNm; 	


	}

var v_text_space = document.getElementById("text_space")
var v_photo_space = document.getElementById("photo_space")

/* textarea 추가 버튼 함수 */
function add_textbox(){
	if(i<16){
		this.node = document.createElement("table")
		this.node.id = 'textt_space'+i+''
		this.node.innerHTML = '<th>조리순서 <br>\
		<input type="button" value="삭제" onclick="del_thistextbox(this)">\
		</th><br>\
		<td>\
		<textarea rows="3" name="ufRecipe'+i+'" class="form-control ckeditor" style="width:720px; height:125px; resize: none;"  ></textarea>\
		</td>'
		v_text_space.appendChild(this.node)
	i++;}
 else {
			alert("레시피 정보는 최대 15열 까지 등록 가능합니다")
		}
	f_recprename();
}

/* 마지막 textarea 삭제 버튼*/
function del_textbox(){
	if(i>1){
		i--;
	$("table[id^=textt_space]:last").remove();
	 
	} else{
		alert("삭제할 영역이 없습니다.")
	}
	f_recprename();
}

/* 선택적 textarea 삭제 버튼*/
function del_thistextbox(obj){
	var tr = $(obj).parent().parent().parent().parent();
	 
    //라인 삭제
    tr.remove();
	 
    f_recprename();
    i--;

}

/*레시피 행삭제후 리네임 함수*/
function f_recprename(){
	
	$("table[name^=textt_space]").each(function(idx,el){
	    $(el).attr("name", "textt_space" + (idx + 1))
	})
	
	$("table[id^=textt_space]").each(function(idx,el){
	    $(el).attr("id", "textt_space" + (idx + 1))
	})
	
	
	$("textarea[name^=ufRe]").each(function(idx,el){
	    $(el).attr("name", "ufRecipe" + (idx + 1))
	})
	}

/*  사진추가 버튼 함수 */
function add_photobox(){
	if(j<9){
		this.node = document.createElement("table")
		this.node.id = 'photoo_space'+j+''
		this.node.innerHTML = '		<th>사진 <br>\
		<input type="button" value="삭제" onclick="del_thisphotobox(this)">\
		</th>\
		<td>\
		<input type="file" name="ufImg'+j+'File" >\
		</td>'
		v_photo_space.appendChild(this.node);
	j++;}
 else {
			alert("사진업로드는 최대 6개까지 가능합니다.");
		}
	f_imgrename();
}

/* 마지막 inputfile 삭제 버튼*/
function del_photobox(){
	if(j>3){
		j--;
		$("table[id^=photoo_space]:last").remove();
	 
	} else{
		alert("삭제할 영역이 없습니다.");
	}
	f_imgrename();
}

/* 선택적 input 삭제 버튼*/
function del_thisphotobox(obj){
	var tr = $(obj).parent().parent().parent().parent();
	 
    //라인 삭제
  tr.remove();
	 
    //이름 재설정
	f_imgrename();
	j--;
}
/* input 행삭제후 리네임 함수*/

function f_imgrename(){
	$("table[id^=photoo_space]").each(function(idx,el){
	    $(el).attr("id", "photoo_space" + (idx + 3))
	    $(el).find("input[type=file]").attr("name", "ufImg" + (idx + 3) + "File");
	    $(el).find("input[type=text]").attr("name", "ufImg" + (idx + 3));
	})
	
// 	$("input[name^=ufImg]").each(function(idx,el){
// 		if (el.name.indexOf("File") > 0) {
// 	    $(el).attr("name", "ufImg" + (idx + 2) + "File")
// 		}
// 	})
	
// 	$("input[name^=ufImg]").each(function(idx,el){
// 		if (el.name.indexOf("File") = 0) {
// 	    $(el).attr("name", "ufImg" + (idx))
// 		}
// 	})
	
}

</script>
</html>