<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.2.1.min.js"
	type="application/javascript"></script>
<script>
	var phoneStart = [ '010', '011', '016', '017', '018', '019', '02', '031',
			'032', '033', '041', '042', '043', '044', '051', '052', '053',
			'054', '055', '061', '062', '063', '064', '070', '080', '0130',
			'0303', '0502', '0503', '0504', '0505', '0506', '0507', '050',
			'012', '059' ];

	window.onload = function() {
		$('#phoneStart').append(
				'<option selected="selected" value="'+phoneStart[0]+'">'
						+ phoneStart[0] + '</option>');
		for (i = 1; i < phoneStart.length; i++) {
			$('#phoneStart').append(
					'<option value="'+phoneStart[i]+'">' + phoneStart[i]
							+ '</option>');
		}
		$('#phoneStartUser').append(
				'<option selected="selected" value="'+phoneStart[0]+'">'
						+ phoneStart[0] + '</option>');
		for (i = 1; i < phoneStart.length; i++) {
			$('#phoneStartUser').append(
					'<option value="'+phoneStart[i]+'">' + phoneStart[i]
							+ '</option>');
		}

		function inputValue() {

		}

	}
	function div_OnOff(v, id) {

		// 라디오 버튼 value 값 조건 비교
		if (v == "1") {
			document.getElementById("nameInputUser").value = '${mem.memName }';
			document.getElementById("phone1User").value = '${mem.memHp}'
					.substring(4, 8);
			document.getElementById("phone2User").value = '${mem.memHp}'
					.substring(9, 13);
			document.getElementById("userZipNum").value = '${mem.memZip }';
			document.getElementById("userZip1").value = '${mem.memAdd1 }';
			document.getElementById("userZip2").value = '${mem.memAdd2 }';
		} else {
			document.getElementById("nameInputUser").value = '';
			document.getElementById("phone1User").value = '';
			document.getElementById("phone2User").value = '';
			document.getElementById("userZipNum").value = '';
			document.getElementById("userZip1").value = '';
			document.getElementById("userZip2").value = '';
		}
	}

	//주소 찾기 api
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					//document.getElementsByName("memAdd2")[0].value = extraAddr;

				} else {
					//document.getElementsByName("memAdd2")[0].value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementsByName('memZip')[0].value = data.zonecode;
				document.getElementsByName("memAdd1")[0].value = addr;
				// 커서를 상세주소 필드로 이동한다.
				//document.getElementById("sample6_detailAddress").focus();	//일단 비활성화
			}
		}).open();
	}
</script>
<body>
	<div class="container" style="margin-top: 130px;">
		<%@include file="/WEB-INF/inc/side_bar.jsp"%>
		<div class="page"
			style="display: inline-block; width: 800px; margin-left: 150px;">
			<div class="page-header">
				<h1>주문/결제</h1>
			</div>
			<div class="row">
				<div class="col-sm-3 form-inline" style="margin-bottom: 5px;">
					<div style="display: none" id="information">
						<c:forEach items="${market}" var="market" varStatus="st">
							<input type="hidden" value="${market.sTitle }"
								id="${st.count}title">
							<input type="hidden" value="${market.sCode }"
								id="${st.count}code">
							<input type="hidden" value="${market.sPrice }"
								id="${st.count}price">
							<input type="hidden" value="${market.sInven }"
								id="${st.count}qty">
							<input type="hidden" value="${market.sMainImg }"
								id="${st.count}IMG">
							<div id="sumForTotal">
								<input type="hidden"
									value="${market.sPrice * market.sInven + 3000}"
									id="${st.count}sumPrice">
							</div>
							<c:if test="${st.last}">

								<div id="totals">
									<input type="hidden" value="" id="totalPrice">
								</div>
								<div>
									<input type="hidden" id="lastIndex" value="${st.count}">
								</div>
							</c:if>
						</c:forEach>
						<input type="hidden" value="${mem.memMileage }" id="saveMile">
						<script>
							var total = 0;
							var last = document.getElementById("lastIndex").value;
							for (var i = 1; i <= last; i++) {
								var name = "";
								name += i;
								name += "sumPrice";
								total += (document.getElementById(name).value) * 1;
							}
							document.getElementById("totalPrice").value = total;
						</script>
					</div>
				</div>
			</div>
			<table class="table table-hover ">
				<colgroup>
					<col width="60%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th class="text-center">상품 정보</th>
					<th class="text-center">배송비</th>
					<th class="text-center">수량</th>
					<th class="text-center">금액</th>
				</tr>
				<c:forEach items="${market}" var="market" varStatus="st">
					<tr>
						<td class="" style="vertical-align: middle; padding-left: 50px"><img
							src="${market.sMainImg}" width="100px" height="100px"
							style="margin: 10px;" border="0"> ${market.sTitle}</td>
						<td class="text-center" style="vertical-align: middle;">3,000원</td>
						<td class="text-center" style="vertical-align: middle;">${market.sInven}개</td>
						<td class="text-center" style="vertical-align: middle;">${market.sPrice * market.sInven}원<br />
							+ 3000원
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="1">
						<h4>
							<span class="">배송지 정보</span>
						</h4> <input type="hidden" class="" value="여기는 기본 주소 들어갈 자리">
						<ul class="radioButtonListDelivery">
							<li><input type="radio" name="deliveryDefault"
								id="defaultAdd" checked="checked" class="" value="1"
								onclick="div_OnOff(this.value,'getAdd');"> <label
								for="defaultAdd">기본 배송지</label> <input type="radio"
								style="margin-left: 15px;" name="deliveryDefault"
								id="defaultAdd" value="2" class=""
								onclick="div_OnOff(this.value,'getAdd');"> <label
								for="defaultAdd">추가 배송지</label></li>
						</ul>

						<div id="userInformationUser">
							<div id="getAdd">
								<div id="deliverNameUser">
									<div id="deliverNameTextUser"
										style="width: 110px; height: 25px; display: inline-block; margin: 5px;">
										<strong>수령인</strong>
									</div>
									<input type="text" title="수령인" placeholder="30자 이내로 입력하세요"
										style="margin: 5px;" maxlength="30" class=""
										id="nameInputUser" value="${mem.memName }">
								</div>
							</div>
							<div id="contectNumUser">
								<div id="contectNumTextUser"
									style="width: 110px; height: 25px; display: inline-block; margin: 5px;">
									<strong>연락처</strong>
								</div>
								<div id="contectNumPhone"
									style="display: inline-block; margin: 5px;">
									<c:set var="TextValue" value="${mem.memHp}" />
									<select name="phoneStartUser" id="phoneStartUser"
										onchange="setDD('start', 'form1');">
									</select> - <input type="text" title="전화번호1" maxlength="4" class=""
										value="${fn:substring(TextValue,4,8) }"
										style="width: 60px; height: 20px;" id="phone1User"> -
									<input type="text" title="전화번호2"
										style="width: 60px; height: 20px;" maxlength="4" class=""
										value="${fn:substring(TextValue,9,13) }" id="phone2User">
								</div>
							</div>
							<div id="contectAddUser">
								<div id="contectAddTextUser"
									style="width: 110px; height: 25px; display: inline-block; margin: 5px;">
									<strong>배송지주소</strong>
								</div>
								<div id="contectAddUser"
									style="display: inline-block; vertical-align: top; margin-top: 3px;">
									<table>
										<tr>
											<td colspan="3"><input type="text" name="memZip"
												id="userZipNum" style="margin: 5px;" value="${mem.memZip}"
												placeholder=""> <input type="button" class=""
												onclick="sample6_execDaumPostcode()"
												style="width: 60px; height: 24px;" value="우편번호"></td>
										</tr>
										<tr>
											<td><input type="text" name="memAdd1" id="userZip1"
												value="${mem.memAdd1 }" style="margin: 5px;" placeholder="">
												<input type="text" name="memAdd2" value="${mem.memAdd2 }"
												id="userZip2" placeholder="상세주소 입력"></td>
										</tr>
									</table>
								</div>
							</div>
							<div id="contectMemoUser">
								<div id="contectMemoTextUser"
									style="width: 110px; height: 25px; display: inline-block; margin: 5px;">
									<strong>배송자 메모</strong>
								</div>
								<div
									style="display: inline-block; margin-top: 3px; margin: 5px;">
									<input type="text" name="wantMemo" list="wantMemo"
										id="userMemo">
									<datalist id="wantMemoUser">
										<option value="배송 전에 미리 연락 바랍니다.">
										<option value="부재시 경비실에 맡겨 주세요.">
										<option value="부재시 연락 바랍니다.">
									</datalist>
								</div>
							</div>
						</div>
					</td>
					<td colspan="3" style="vertical-align: top;">
						<div style="margin-top: 10px;">
							<table style="border: 0px">
								<tr>
									<td><h4>
											<span class="">주문자 정보</span>
										</h4></td>
								</tr>
								<tr>
									<td class="justify">주문자 :</td>
									<td>${mem.memName}</td>
								</tr>
								<tr>
									<td>전화번호 :</td>
									<td>${mem.memHp}</td>
								</tr>
								<tr>
									<td>이메일 :</td>
									<td>${mem.memMail}</td>
								</tr>
							</table>

						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<h4>
							<span class="" style="display: inline;">마일리지 사용</span>
						</h4> <b>구매 시 1% 즉시적립!</b>

						<div>
							<table style="margin: 5px;" class="table table-hover">
								<tr>
									<td rowspan="3">마일리지 사용</td>
									<td>총 가격</td>
									<td style="text-align: right;" id="mileTotalPrice"></td>

									<td></td>
								</tr>
								<tr>
									<td>사용 가능한 마일리지</td>
									<td style="text-align: right;" id="nowMile"></td>
								</tr>
								<tr>
									<td>사용할 마일리지</td>
									<td style="text-align: right;"><input type="text"
										id="usingMileage" style="text-align: right;" value="0"></td>
									<td><input type="button" onclick="useMileage()"
										value="마일리지 사용"></td>
								</tr>
								<tr>
									<td>사용 후 가격</td>
									<td style="text-align: right;" colspan="2">
										<div style="display: inline-block;" id="afterUseMileage">
										</div>
									</td>
									<td></td>
								</tr>
								<tr>
									<td rowspan="2">적립되는 마일리지</td>
									<td>적립 마일리지</td>
									<td style="text-align: right;" id="insertMile"></td>
									<td></td>
								</tr>
								<tr>
									<td>적립 후 마일리지</td>
									<td style="text-align: right;">
										<div id="afterAccumulate"></div>
									</td>
									<td></td>
								</tr>
								<%--  --%>
							</table>

						</div> <!--  -->
					<td colspan="2"><b> <span class="" style="margin: 10px;">
								<br /> 결제금액
						</span>
					</b>
						<table class="table table-default">
							<tr>
								<td colspan="2">
									<div id="totalPrice"></div> <input type="hidden" value=""
									id="payAmount">
								</td>
							</tr>
							<tr>
								<td>상품금액</td>
								<td id="priceNqty"></td>
							</tr>
							<tr>
								<td>배송비</td>
								<td>3,000원</td>
							</tr>
							<tr>
								<td>사용 마일리지</td>
								<td id="usedMileage">0</td>
							</tr>
							<tr>
								<td><h4>최종 금액</h4></td>
								<td><div id="finalPrice"></div></td>
							</tr>
						</table></td>
				</tr>

				<!--  -->
				<tr>
					<td colspan="2">
						<div id="payMent" style="display: inline-block;"></div> <input
						type="button" class="btn btn-default" value="결제하기"
						onclick="fn_buy();">
						<div id="afterPayMent" style="display: inline-block;">
							<form action="purchaseEnd" id="dataForm" method="POST">
								<c:forEach items="${market}" var="market" varStatus="st">
									<input type="hidden" name="sCode" id="sCode"
										value="${market.sCode}">
									<!-- /고정 코드 -->
									<input type="hidden" name="quanty" id="quanty"
										value="${market.sInven}">
									<!-- /고정 갯수 -->
								</c:forEach>
								<input type="hidden" name="PMId" id="memId" value="${mem.memId}">
								<!-- /고정 아이디 -->
								<input type="hidden" name="PDelivery" id="courier"
									value="CJ대한통운">
								<!-- /고정 택배사 -->
								<input type="hidden" name="PArriveName" id="arriveName"
									value="${mem.memName}">
								<!-- /변동 주문자 -->
								<input type="hidden" name="PArriveHP" id="arriveHp"
									value="${mem.memHp}">
								<!-- 변동 번호 -->
								<input type="hidden" name="PArriveZip" id="arriveZip"
									value="${mem.memZip}">
								<!-- 변동 우편번호 -->
								<input type="hidden" name="PArriveAdd1" id="arriveAdd1"
									value="${mem.memAdd1}">
								<!-- 변동 주소1 -->
								<input type="hidden" name="PArriveAdd2" id="arriveAdd2"
									value="${mem.memAdd2}">
								<!-- 변동 주소2 -->
								<input type="hidden" name="PMemo" id="memo" value="">
								<!-- 변동 메모 -->
								<input type="hidden" name="lastMileage" id="lastMileage"
									value="">
								<!-- 변동 추가된 마일리지 -->
								<input type="hidden" name="PAddMileage" id="addMileage" value="">
								<!-- 변동 추가되는 마일리지 -->
								<input type="hidden" name="PPayMoney" id="lastPay" value="">
								<!-- 변동 최종 결재금액 -->
								<input type="button" class="btn btn-default"
									onclick="changeMemInfo()" id="submitPayBtn" value="결제 후 창">
							</form>
						</div> <input type="hidden" id="forBootPayName" value=""> <script>
							var total = document.getElementById("totalPrice").value;
							document.getElementById("mileTotalPrice").innerHTML = Number(total);
							document.getElementById("finalPrice").innerHTML = total;
							document.getElementById("afterUseMileage").innerHTML = Number(total);
							document.getElementById("insertMile").innerHTML = (Number(total) * 0.01);
							document.getElementById("priceNqty").innerHTML = total - 3000;
							document.getElementById("nowMile").innerHTML = document
									.getElementById("saveMile").value;
							document.getElementById("afterAccumulate").innerHTML = Number(document
									.getElementById("saveMile").value)
									+ (Number(total) * 0.01);
							document.getElementById("lastPay").value = total;
							document.getElementById("addMileage").value = (Number(total) * 0.01);
							document.getElementById("lastMileage").value = Number(document
									.getElementById("saveMile").value)
									+ (Number(total) * 0.01);

							function useMileage() {
								var usingMiles = document
										.getElementById("usingMileage").value; // 사용할 마일리지
								var nowMiles = document
										.getElementById("saveMile").value; // 현재 보유하고 있는 마일리지
								var total = document
										.getElementById("totalPrice").value; // 총 가격
								console.log(nowMiles);
								console.log(usingMiles);
								if (Number(usingMiles) > Number(nowMiles)) {
									alert("보유하고 있는 마일리지보다 많습니다!");
								} else {
									document.getElementById("afterUseMileage").innerHTML = Number(total)
											- usingMiles;
									document.getElementById("priceNqty").innerHTML = Number(total)
											- usingMiles - 3000;
									document.getElementById("finalPrice").innerHTML = Number(total)
											- usingMiles;
									document.getElementById("usedMileage").innerHTML = usingMiles;
									document.getElementById("lastPay").value = Number(total)
											- usingMiles;
									document.getElementById("afterAccumulate").innerHTML = Number(document
											.getElementById("saveMile").value)
											+ (Number(total) * 0.01)
											- usingMiles;

									document.getElementById("lastMileage").value = Number(document
											.getElementById("saveMile").value)
											+ (Number(total) * 0.01)
											- usingMiles;
									//데이터 넘기기 처리
									afterMiles = document
											.getElementById("afterUseMileage").outerText;
									document.getElementById("addMileage").value = (Number(total) * 0.01);
									document.getElementById("lastMileage").value = afterMiles;
								}
							}
							if (Number(document.getElementById("lastIndex").value) == 1) {
								document.getElementById("forBootPayName").value = (document
										.getElementById("1title").value)
							} else {
								document.getElementById("forBootPayName").value = (document
										.getElementById("1title").value
										+ " 외 "
										+ (Number(document
												.getElementById("lastIndex").value) - 1) + "개");
							}
							function changeMemInfo(e) {
								/* e.preventDefault(); */// 서브밋 전 펑션 이벤트를 처리하기 위해서 추가
								document.getElementById("arriveName").value = document
										.getElementById("nameInputUser").value;
								document.getElementById("arriveHp").value = document
										.getElementById("phoneStartUser").value
										+ document.getElementById("phone1User").value
										+ document.getElementById("phone2User").value;
								document.getElementById("arriveZip").value = document
										.getElementById("userZipNum").value;
								document.getElementById("arriveAdd1").value = document
										.getElementById("userZip1").value;
								document.getElementById("arriveAdd2").value = document
										.getElementById("userZip2").value;
								document.getElementById("memo").value = document
										.getElementById("userMemo").value;
								document.getElementById('dataForm').submit();
							}
						</script>
					</td>
					<td colspan="2"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script>
	function fn_buy() {

		BootPay.request({
			price : document.getElementById("lastPay").value, //실제 결제되는 가격
			application_id : "5e85606102f57e0036d63a76",
			name : document.getElementById("forBootPayName").value, //결제창에서 보여질 이름
			pg : '',
			method : '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window : 0, // 부트페이 정보 동의 창 보이기 여부
			items : [ {
				item_name : document.getElementById("forBootPayName").value, //상품명
				qty : 1, //수량
				unique : '123', //해당 상품을 구분짓는 primary key
				price : 1000, //상품 단가
				cat1 : 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
				cat2 : '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
				cat3 : '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
			} ],
			user_info : {
				username : '사용자 이름',
				email : '사용자 이메일',
				addr : '사용자 주소',
				phone : '010-1234-4567'
			},
			order_id : '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params : {
				callback1 : '그대로 콜백받을 변수 1',
				callback2 : '그대로 콜백받을 변수 2',
				customvar1234 : '변수명도 마음대로'
			},
			account_expire_at : '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra : {
				start_at : '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
				end_at : '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
				vbank_result : 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
				quota : '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
			}
		}).error(function(data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function(data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).ready(function(data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			console.log(data);
		}).confirm(function(data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function(data) {
			// 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
			console.log(data);
		}).done(function(data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			console.log(data);
		});
	}
</script>
<%@include file="/WEB-INF/inc/foot1.jsp"%>
</html>





