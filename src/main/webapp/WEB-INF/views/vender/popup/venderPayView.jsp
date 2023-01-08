<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 결제 조회</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">거래처 결제 조회</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal">
				<div class="table-responsive clearfix">
					<table class="table">
						<colgroup>
							<col width="20%;"/>
							<col width="40%;"/>
							<col width="40%;"/>
						</colgroup>
						<tbody class="border-bottom">
							<tr>
								<th rowspan="2" class="border-right">관리매장</th>
								<th class="border-right">등록일</th>
								<th>매장</th>
							</tr>
							<tr>
								<td class="border-right" id="reg_dt_td"></td>
								<td id="store_cd_td"></td>
							</tr>
							<tr>
								<th class="border-right">제조사</th>
								<td colspan="2" id="vender_nm_td"></td>
							</tr>
							<tr>
								<th rowspan="2" class="border-right">결제 예정</th>
								<th class="border-right">순금 결제 중량</th>
								<th>공임 결제 금액</th>
							</tr>
							<tr>
								<td class="text-center border-right" id="expt_gold_gram_td"></td>
								<td class="text-center" id="expt_pay_price_td"></td>
							</tr>
							<tr>
								<th rowspan="2" class="border-right">결제 진행</th>
								<th class="border-right">순금 결제 중량</th>
								<th>공임 결제 금액</th>
							</tr>
							<tr>
								<td class="text-center border-right" id="prg_gold_gram_td"></td>
								<td class="text-center" id="prg_pay_price_td"></td>
							</tr>
							<tr>
								<th rowspan="2" class="border-right">결제 후 미수</th>
								<th class="border-right">순금 결제 미수</th>
								<th>공임 결제 미수</th>
							</tr>
							<tr>
								<td class="text-center border-right" id="cal_gold_gram_td">0</td>
								<td class="text-center" id="cal_pay_price_td">0</td>
							</tr>
							<tr>
								<th class="border-right">비고</th>
								<td colspan="2" id="pay_etc_td"></td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap text-center">
						<c:if test ="${sessionScope.MODIFY_AUTH eq 'Y'}">
		        	<a href="javascript: void(0);" onclick="goModify(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
		       	</c:if>
		        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
		    	</div>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		/*<![CDATA[*/
			var codemap = {
					<c:forEach var="code" items="${cdmapper}" varStatus="loop">
				    ${code.cdid}: '${code.cdnm}' ${not loop.last ? ',' : ''}
					</c:forEach>
			};
		
			window.onload = () => {
				find();
	  	}
			
			function find() {
				
				const payNo = '${payNo}';
				if ( !payNo ) {
		    	return false;
		    }
				
				fetch(`/api/vender/pay/${payNo}`).then(response => {  //response에 VenderVO가 있다?
		    	if (!response.ok) {
						throw new Error('Request failed...');
			    }
		    	return response.json();
		
		   	}).then(json => {
		   		document.getElementById('reg_dt_td').innerHTML = checkSubstringNullVal(json.regDt,0,10);
		   		document.getElementById('store_cd_td').innerHTML = checkNullVal(codemap[checkNullVal(json.storeCd)]);
		   		document.getElementById('vender_nm_td').innerHTML = checkNullVal(json.venderNm);
		   		document.getElementById('expt_gold_gram_td').innerHTML = checkNullValR(json.exptGoldGram,'0')+'g';
		   		document.getElementById('expt_pay_price_td').innerHTML = priceWithComma(checkNullValR(json.exptPayPrice,'0'));
		   		document.getElementById('prg_gold_gram_td').innerHTML = checkNullValR(json.prgGoldGram,'0')+'g';
		   		document.getElementById('prg_pay_price_td').innerHTML = priceWithComma(checkNullValR(json.prgPayPrice,'0'));
		   		document.getElementById('pay_etc_td').innerHTML = checkNullVal(json.payEtc);
		   		
		   		exptGoldGram = checkNullValR(json.exptGoldGram,'0');
					exptGoldGramIdx = exptGoldGram.indexOf('.');
					exptGoldGramLen = (exptGoldGramIdx > 0) ? exptGoldGram.length - (exptGoldGramIdx+1) : 0;
					
					calGoldGram = Number(exptGoldGram) - Number(checkNullValR(json.prgGoldGram,'0'));
					document.getElementById('cal_gold_gram_td').innerHTML = (calGoldGram == 0.0 ? '0' : calGoldGram.toFixed(exptGoldGramLen))+'g';
					
					calPayPrice = Number(checkNullValR(json.exptPayPrice,'0')) - Number(checkNullValR(json.prgPayPrice,'0'));
					document.getElementById('cal_pay_price_td').innerHTML = priceWithComma(calPayPrice);
					
		   	}).catch(error => {
		    	alert('거래처 결제 정보를 찾을 수 없습니다.');
		    	fncClose();
		   	});
			}
			
			/**
			 * 수정하기
			 */
			function goModify() {
		    location.href = '/vender/pay/popup/modify/${payNo}';
			}
			
			function fncClose(){
				self.close();
			}
		/*]]>*/
	    </script>
</body>
</html>