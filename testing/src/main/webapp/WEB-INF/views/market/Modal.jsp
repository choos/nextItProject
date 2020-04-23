<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp" %> 
<title>Modal</title>


</head>
<body>
<%@include file="/WEB-INF/inc/top_menu.jsp" %> 

<div class="container">
				<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
 
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="modal-title" class="modal-title"></h4>
            </div>
            <div class="modal-body">
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
										<!-- <tr>
											<td></td>
											<td>
												<div class="pull-right">
													<button type="submit" id="submitbutton"
														class="btn btn-sm btn-default"
														onclick="javascript: form.action='/reply/replyRegist';">등록</button>
												</div>
											</td>

										</tr> -->
									</table>
            </div>
            <div class="modal-footer">
                <button id="modalSubmit" type="button" class="btn btn-success">Submit</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
				
</div>

</body>
</html>