<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 결제 등록</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">거래처 결제 등록</h6>
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
								<th rowspan="2" class="border-right">관리매장<span class="important"> *</span></th>
								<th class="border-right">등록일<span class="important"> *</span></th>
								<th>매장<span class="important"> *</span></th>
							</tr>
							<tr>
								<td class="border-right"><input type="date" name="reg_dt" id="reg_dt" class="form-control form-data mtb5" maxlength="10"/></td>
								<td>
									<select id="store_cd" class="form-control">
				            <c:forEach var="stlist" items="${stlist}">
				            	<option value="${stlist.cdid}">${stlist.cdnm}</option>
				            </c:forEach>
					        </select>
								</td>
							</tr>
							<tr>
								<th class="border-right">제조사<span class="important"> *</span></th>
								<td colspan="2">
									<input type="hidden" name="vender_no" id="vender_no_0" class="form-data"/>
									<div class="input-group-append">
										<input type="text" name="vender_nm" id="vender_nm_0" class="form-control mtb5 beadcnt" readonly="readonly"/>
										<i class="fas fa-search fa-sm ml5 mt15" onclick="fncVenderListPop('0'); return false;"></i>
									</div>
								</td>
							</tr>
							<tr>
								<th rowspan="2" class="border-right">결제 예정</th>
								<th class="border-right">순금 결제 중량</th>
								<th>공임 결제 금액</th>
							</tr>
							<tr>
								<td class="border-right"><input type="number" name="expt_gold_gram" id="expt_gold_gram" class="form-control form-data mtb5"/></td>
								<td><input type="number" name="expt_pay_price" id="expt_pay_price" class="form-control form-data mtb5"/></td>
							</tr>
							<tr>
								<th rowspan="2" class="border-right">결제 진행</th>
								<th class="border-right">순금 결제 중량</th>
								<th>공임 결제 금액</th>
							</tr>
							<tr>
								<td class="border-right"><input type="number" name="prg_gold_gram" id="prg_gold_gram" class="form-control form-data mtb5" value="0"/></td>
								<td><input type="number" name="prg_pay_price" id="prg_pay_price" class="form-control form-data mtb5" value="0"/></td>
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
								<td colspan="2"><textarea name="pay_etc" id="pay_etc" class="form-control form-data mtb5" maxlength="600"></textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap text-center">
		        <a href="javascript: void(0);" onclick="fncSave(); return false;" class="btn btn-primary waves-effect waves-light mlr5">등록</a>
		        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
		    	</div>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		/*<![CDATA[*/
			$(document).ready(function(){
				$("#expt_gold_gram, #prg_gold_gram").on('change keyup', function() {
					exptGoldGram = checkNullValR($("#expt_gold_gram").val(),'0');
					exptGoldGramIdx = exptGoldGram.indexOf('.');
					exptGoldGramLen = (exptGoldGramIdx > 0) ? exptGoldGram.length - (exptGoldGramIdx+1) : 0;
					
					calGoldGram = Number(checkNullValR($("#expt_gold_gram").val(),'0')) - Number(checkNullValR($("#prg_gold_gram").val(),'0'));
					$("#cal_gold_gram_td").html(calGoldGram == 0.0 ? '0' : calGoldGram.toFixed(exptGoldGramLen));
				});
				$("#expt_pay_price, #prg_pay_price").on('change keyup', function() {
					calPayPrice = Number(checkNullValR($("#expt_pay_price").val(),'0')) - Number(checkNullValR($("#prg_pay_price").val(),'0'));
					$("#cal_pay_price_td").html(priceWithComma(calPayPrice));
				});
			});
		
			function fncSave(){
				
				if($("#reg_dt").val() == ''){
					alert('등록일을 입력해주세요.');
					$("#reg_dt").focus();
					return false;
				}
				
				if($("#vender_no_0").val() == ''){
					alert('거래처를 선택해주세요.');
					$("#vender_nm_0").focus(); 
					return false;
				}
	
				if(confirm('저장하시겠습니까?')){
					const form = document.getElementById('form');
					const params = {
							vender_no : form.vender_no_0.value,
							reg_dt : form.reg_dt.value,
							store_cd : form.store_cd.value,
							expt_gold_gram : form.expt_gold_gram.value,
							expt_pay_price : form.expt_pay_price.value,
							prg_gold_gram : form.prg_gold_gram.value,
							prg_pay_price : form.prg_pay_price.value,
							pay_etc : form.pay_etc.value
					};
					
					fetch('/api/vender/pay/write', {
						method: 'POST',
						headers: {
							'Content-Type': 'application/json',
						},
						body: JSON.stringify(params)
					}).then(response => {
						if(!response.ok){
							throw new Error('Request Failed...');
						}
						alert('저장되었습니다.');
						window.opener.findAll();
						fncClose();
					}).catch(error => {
						alert('오류가 발생하였습니다.');
					});
				}
			}
			
			function fncVenderListPop(idx){
				var url = "/vender/popup/list?openeridx="+idx;
	      var name = "venderListPopup";
	      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
	      window.open(url, name, option);
			}
			
			function fncClose(){
				self.close();
			}
		/*]]>*/
	    </script>
</body>
</html>