<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>유저레시피 등록</title>
</head>
<body>
<div style="height: 50px; position: relative; "></div>

<!-- 		<script src="//cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script> -->

	<%@include file="/WEB-INF/inc/top_menu.jsp" %>
	<div class="container">
		<div class="page-header">
			<h3>유저레시피 등록</h3>
		</div>
		<div class="row" >
		<form action="userRegist" method="post" enctype="multipart/form-data">
		<input type="text" name="dup_key" value="${dup_key}">
		<table class="table table-striped table-bordered ">
			<colgroup>
				<col width="20%" />
				<col/>
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" name="ufTitle" value="" class="form-control"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="ufId" value="${member.userId }" class="form-control" required="required" readonly="readonly"></td>
			</tr>
			<tr>
				<th>분류</th>
				<td>
				
					<input type="text" name="ufCategory" value="" id="id_cat" >
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
				<td><input type="text" name="ufMater" value="" class="form-control"></td>
			</tr>
			<tr>
				<th>YouTube 링크</th>
				<td><input type="text" name="ufLink" value="" class="form-control"></td>
			</tr>
			<tr>
				<th>조리순서<br>
				<input type="button" value="열 추가" onclick="add_textbox()"> <br>
				<input type="button" value="마지막열 삭제" onclick="del_textbox()">
				<h6>최대 15열까지 등록 가능합니다</h6>
				</th>
			<td id="text_space">
				
				<!--  여기에 textarea 들어가고있음 -->
			</td>
			</tr>
			<tr>
				<th>대표 이미지 
				</th>
				<td>
							<input type="file" name="ufImg1File" size=40>
			</td>


					</tr>
			<tr>
				<th>중간과정 사진 <br>				
				<input type="button" value="사진 추가" onclick="add_photobox()"><br>
				<input type="button" value="마지막열 삭제" onclick="del_photobox()"><br>
				<h6>최대 6장까지 등록 가능합니다</h6>
				</th>
				<td id="photo_space">

				</td>
			</tr>

			<tr>
				<td colspan="2">
						<div class="pull-left">
							<a href="userMain" class="btn btn-sm btn-default">목록으로</a>
						</div>
						<div class="pull-right">
							<button type="submit" class="btn btn-sm btn-primary">저장하기</button>
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
var catNm  =  $("#id_cat_code option:selected").text();


 cat.value = catNm; 	


}





var i = 1;
var j = 3;
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
}
</script>
</html>

