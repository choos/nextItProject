<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<%@include file="/WEB-INF/inc/top_menu.jsp"%>
<title>0kal 주문/배송 조회</title>
</head>
<style type="text/css">
#deliveryColl.collTitle {
	margin-bottom: 16px;
}

#deliveryColl.select_box {
	border: 1px solid #7f9db7;
	width: 135px;
	height: 20px;
	font-size: 12px;
}

#deliveryColl.inp_txt {
	width: 140px;
	height: 14px;
	padding: 4px 0 3px 2px;
	border-top: 1px solid #ababab;
	border-left: 1px solid #ababab;
	border-bottom: 1px solid #ccc;
	border-right: 1px solid #ccc;
	font-size: 12px;
	line-height: 14px;
}

#deliveryColl.wrap_inquiry {
	padding-bottom: 15px;
	border: 1px solid #e8e8e8;
	background: #f9f9f9;
}

#deliveryColl.wrap_inquiry.box_search {
	width: 701px;
	padding: 13px 0 0 15px;
	border-top: 1px solid #fcfcfc;
	border-left: 1px solid #fcfcfc;
}

#deliveryColl.wrap_inquiry.info_delivery .tit {
	float: left;
	padding-right: 4px;
	font-size: 12px;
	font-weight: bold;
	line-height: 22px;
	color: #000;
	clear: both;
}

#deliveryColl.wrap_inquiry.info_delivery .cont {
	float: left;
	width: 154px;
}

#deliveryColl.wrap_inquiry.inp_txt {
	float: left;
	width: 140px;
	margin-right: 5px;
}

#deliveryColl.wrap_inquiry.btn_inquiry {
	display: block;
	overflow: hidden;
	float: left;
	width: 41px;
	height: 23px;
	padding: 0;
	border: 0;
	background:
		url(http://i1.search.daumcdn.net/s/search_all/2011/btn/btn_delivery.gif)
		no-repeat 0 0;
	font-size: 0;
	line-height: 0;
	text-indent: -999em;
	cursor: pointer;
}

#deliveryColl.wrap_inquiry.delivery_num.cont {
	width: 190px;
}

#deliveryColl.wrap_inquiry .refer {
	float: left;
	margin: 6px 0 0 6px;
	font: normal 11px '돋움', dotum;
	color: #777;
	line-height: 13px;
}
/* 관련정보 */
#deliveryColl.list_relation {
	margin: 12px 0 0 0;
	clear: both;
}
</style>
<script type="text/javascript">
	var stratYear;
	var stratMonth;
	var stratDate;
	var endYear;
	var endMonth;
	var endDate;

	var dateUtil = function() {
		this.startObject = null;
		this.endObject = null;
		this.args = null;
	}

	dateUtil.prototype.formatLen = function(str) {
		return str = ("" + str).length < 2 ? "0" + str : str;
	}

	dateUtil.prototype.formatDate = function(dateObject) {
		return dateObject.getFullYear()
				+ String(this.formatLen(dateObject.getMonth() + 1))
				+ String(this.formatLen(dateObject.getDate()));
	}

	dateUtil.prototype.toDay = function() {
		return this.formatDate(new Date());
	}

	dateUtil.prototype.calDate = function() {
		var year = this.args.year == null ? 0 : Number(this.args.year);
		var month = this.args.month == null ? 0 : Number(this.args.month);
		var day = this.args.day == null ? 0 : Number(this.args.day);
		var result = new Date();

		result.setYear(result.getFullYear() + year);
		result.setMonth(result.getMonth() + month);
		result.setDate(result.getDate() + day);
		return this.formatDate(result);
	}

	dateUtil.prototype.setDate = function(startObject, endObject, args) {
		this.startObject = startObject;
		this.endObject = endObject;
		this.args = args;

		document.getElementById(this.startObject).value = this.calDate();
		document.getElementById(this.endObject).value = this.toDay()

		// 연, 월,  일로 쪼개는 작업
		console.log(this.calDate());
		startYear = Number(this.calDate().substring(0, 4));
		startMonth = Number(this.calDate().substring(4, 6));
		startDate = Number(this.calDate().substring(6, 9));

		endYear = Number(this.toDay().substring(0, 4));
		endMonth = Number(this.toDay().substring(4, 6));
		endDate = Number(this.toDay().substring(6, 9));

		//날짜 비워주기
		$("select[name='startYY'] option").remove();
		$("select[name='endYY'] option").remove();
		// 날짜 옵션들 배치
		for (var i = 0; i < 10; i++) {
			if (endYear - i == startYear) {
				$('#startYY').append(
						'<option selected="selected" value="'+startYear+'">'
								+ startYear + '</option>');
			} else {
				$('#startYY').append(
						'<option value="' + (endYear - i) + '">'
								+ (endYear - i) + '</option>');
			}
			if (endYear - i == endYear) {
				$('#endYY').append(
						'<option selected="selected" value="'+endYear+'">'
								+ endYear + '</option>');
			} else {
				$('#endYY').append(
						'<option value="' + (endYear - i) + '">'
								+ (endYear - i) + '</option>');
			}
		}

		$("select[name='startMM'] option").remove();
		$("select[name='endMM'] option").remove();

		for (var i = 1; i <= 12; i++) {
			if (startMonth == i) {
				$('#startMM').append(
						'<option selected="selected" value="'+startMonth+'">'
								+ startMonth + '</option>');
			} else {
				$('#startMM')
						.append('<option value="'+i+'">' + i + '</option>');
			}
			if (i == endMonth) {
				$('#endMM').append(
						'<option selected="selected" value="'+endMonth+'">'
								+ endMonth + '</option>');
			} else {
				$('#endMM').append('<option value="'+i+'">' + i + '</option>');
			}
		}

		var lastDay = (new Date(startYear, startMonth, 0)).getDate();

		$("select[name='startDD'] option").remove();
		$("select[name='endDD'] option").remove();

		for (var i = 1; i <= lastDay; i++) {
			if (startDate == i) {
				$('#startDD').append(
						'<option selected="selected" value="'+startDate+'">'
								+ startDate + '</option>');
			} else {
				$('#startDD')
						.append('<option value="'+i+'">' + i + '</option>');
			}
			if (i == endDate) {
				$('#endDD').append(
						'<option selected="selected" value="'+endDate+'">'
								+ endDate + '</option>');
			} else {
				$('#endDD').append('<option value="'+i+'">' + i + '</option>');
			}
		}

		var searchDay = {
			startYY : document.getElementById('startYY'),
			startMM : document.getElementById('startMM'),
			startDD : document.getElementById('startDD'),
			endYY : document.getElementById('endYY'),
			endMM : document.getElementById('endMM'),
			endDD : document.getElementById('endDD')
		}
		document.getElementById('search').onclick = function() {
			searchDay.submit();
		}
	}

	//실행될때 오늘 날짜로 자동 배치
	window.onload = function() {
		dateUtilObj.setDate('startDate', 'endDate', {});
	}

	var dateUtilObj = new dateUtil();
</script>
<body>
	<div class="container" style="margin-top: 130px;">
		<%@include file="/WEB-INF/inc/side_bar.jsp"%>
		<div class="page"
			style="display: inline-block; width: 800px; margin-left: 150px;">
			<div class="page-header">
				<h1>주문/배송 조회</h1>
			</div>
			<div class="panel panel-default">
				<div class="panel-body">
					<form action="purchaseList" method="post" class="form-horizontal"
						name="frd_purchase" id="frd_purchase">
						<input type="hidden" id="userId" name="userId"
							value="${sessionScope.USER_INFO.userId}" />
						<div class="mytmall_srch_v3">
							<div class="btn_srh_area">
								<div>조회기간</div>
							</div>
							<fieldset>
								<legend>주문 현황 조회</legend>
								<table class="table">
									<tbody>
										<tr>
											<td>
												<div class="QnADate_set">
													<input type="hidden" id="startDate" name="startDate" /> <input
														type="hidden" id="endDate" name="endDate" />
													<button type="button" class="btn btn-default"
														id="btn_Today"
														onclick="dateUtilObj.setDate('startDate', 'endDate', {})">
														<span>오늘</span>
													</button>
													<button type="button" class="btn btn-default"
														id="btn_oneWeek"
														onclick="dateUtilObj.setDate('startDate', 'endDate', {day: -7})">
														<span>1주일</span>
													</button>
													<button type="button" class="btn btn-default"
														id="btn_oneMonth"
														onclick="dateUtilObj.setDate('startDate', 'endDate', {month: -1})">
														<span>1개월</span>
													</button>
													<button type="button" class="btn btn-default"
														id="btn_sixMonth"
														onclick="dateUtilObj.setDate('startDate', 'endDate', {month: -6})">
														<span>6개월</span>
													</button>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="QnADate">
													<select name="startYY" id="startYY"
														onchange="setDD('start', 'form1');">
													</select> <label for="startYY">년</label> <select name="startMM"
														id="startMM" onchange="setDD('start', 'form1');">
													</select> <label for="startMM">월</label> <select name="startDD"
														id="startDD">
													</select> <label for="startDD">일</label>&nbsp;~&nbsp; <select
														name="endYY" id="endYY" onchange="setDD('end', 'form1');">
													</select> <label for="endYY">년</label> <select name="endMM"
														id="endMM" onchange="setDD('end', 'form1');">
													</select> <label for="endMM">월</label> <select name="endDD"
														id="endDD">
													</select> <label for="endDD">일&nbsp;</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="QnAtxt">
													<label for="searchBarPrdNm">주문상품명을 입력</label> <input
														type="text" id="searchBarPrdNm" name="searchBarPrdNm"
														class="txtSrh form-control" style="margin-bottom: 8px">
													<button type="submit" id='search'
														class="btn btn-sm btn-success pull-right">조회하기</button>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</fieldset>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3 form-inline" style="margin-bottom: 5px;">
				</div>
			</div>
			<table class="table table-bordered ">
				<colgroup>
					<col width="20%" />
					<col width="45%" />
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th class="text-center">구매 일자</th>
					<th class="text-center">상품 정보</th>
					<th class="text-center">상품 금액</th>
					<th class="text-center">주문 상태</th>
					<th class="text-center">리뷰</th>
				</tr>
				<c:forEach items="${list}" var="vo" varStatus="st">
					<tr>
						<td class="text-center" style="vertical-align: middle;">${vo.PDay }<br />${vo.PCode}
						</td>
						<td>
							<table>
								<tr>
									<td><img src="${vo.PImage}" alt="${vo.PTitle}" width="70"
										height="70" style="margin: 10px;" border="0"></td>
									<td><a
										onClick="window.open('/purchase/purchaseDetail?code=${vo.PCode}','window_name','width=500,height=740,location=no,status=no,scrollbars=yes')">${vo.PTitle}</a>
								</tr>
							</table>
						</td>
						<td class="text-center" style="vertical-align: middle;">${vo.PPrice * vo.PQuantity + 3000}원</td>
						<td class="text-center" style="vertical-align: middle;"><input
							type="button" class="btn btn-sm btn-info"
							onClick="window.open('https://tracker.delivery/#/kr.epost/${vo.PDeliveryNum}','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');"
							value="배송조회"></td>
						<td class="text-center" style="vertical-align: middle;"><c:if
								test="${reviewYN[st.count-1]}">
								<input type="button" class="btn btn-sm btn-info"
									onClick="location.href='/market/marketView1?sCode=${vo.PSCode}'"
									value="리뷰 쓰러 가기">
							</c:if> <c:if test="${!reviewYN[st.count-1]}">
								<span>작성 완료!</span>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
<%@include file="/WEB-INF/inc/foot1.jsp"%>

</html>





