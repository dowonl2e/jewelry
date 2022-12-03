<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 등록</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">주문 등록</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal">
				<div class="table-responsive clearfix">
					<table class="table">
						<colgroup>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
						</colgroup>
						<tbody>
							<tr>
								<td rowspan="2" class="bg-light border-right text-center">관리매장<span class="important"> *</span></td>
								<td rowspan="2" class="bg-light border-right text-center">등록일<span class="important"> *</span></td>
								<td colspan="3" class="bg-light text-center">합 계</td>
							</tr>
							<tr>
								<td class="bg-light border-right text-center">입고</td>
								<td class="bg-light border-right text-center">출고</td>
								<td class="bg-light text-center">입고-출고</td>
							</tr>
							<tr class="border-bottom">
								<td class="text-center border-right mtb5">
									<select name="store_cd" id="store_cd" class="form-control form-data">
										<c:forEach var="stlist" items="${stlist}">
											<option value="${stlist.cdid}">${stlist.cdnm}</option>
										</c:forEach>
									</select>
								</td>
								<td class="text-center border-right">
									<input type="date" name="reg_dt" id="reg_dt" class="form-control form-data mtb5" value="${today}" maxlength="10"/>
								</td>
								<td class="text-center border-right">
									<input type="text" id="received_price" class="form-control mtb5" readonly="readonly"/>
								</td>
								<td class="text-center border-right">
									<input type="text" id="shipout_price" class="form-control mtb5" readonly="readonly"/>
								</td>
								<td class="text-center">
									<input type="text" id="rece_ship_total_price" class="form-control mtb5" readonly="readonly"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="table-responsive clearfix mt-3">
					<table class="table" style="min-width:150%; overflow-x:scroll;">
						<colgroup>
							<col width="3%"/>
							<col width="4%"/>
							<col width="7%"/>
							<col width="9%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="9%"/>
							<col width="6%"/>
							<col width="6%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col />
						</colgroup>
						<thead>
							<tr>
								<th class="text-center border-right">No</th> 
								<th class="text-center border-right">취소</th>
								<th class="text-center border-right">구분</th>
								<th class="text-center border-right">계정</th>
								<th class="text-center border-right">통장구분</th>
								<th class="text-center border-right">거래처</th>
								<th class="text-center border-right">내역</th>
								<th class="text-center border-right">재질</th>
								<th class="text-center border-right">중량(g)</th>
								<th class="text-center border-right">수량</th>
								<th class="text-center border-right">단가</th>
								<th class="text-center border-right">공급가</th>
								<th class="text-center">합계금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="idx" begin="0" end="4">
								<tr>
									<td class="text-center border-right">${idx+1}</td>
									<td class="text-center border-right">
										<a href="#" onclick="fncValueInit('${idx}'); return false;" class="btn btn-danger btn-circle btn-sm"><i class="fas fa-trash"></i></a>
									</td>
									<td class="text-center border-right">
										<select name="cash_type_cd_arr" id="cash_type_cd_${idx}" class="form-control form-multi cashtypecd mtb5" onchange="fncChangeRS(this.value, '${idx}');">
											<option value="">선택</option>
											<c:forEach var="rslist" items="${rslist}">
												<option value="${rslist.cdid}">${rslist.cdnm}</option>
											</c:forEach>
										</select>
									</td>
									<td class="text-center border-right">
										<select name="cash_type_cd2_arr" id="cash_type_cd2_${idx}" class="form-control form-multi mtb5">
											<option value="">선택</option>
										</select>
									</td>
									<td class="text-center border-right">
										<select name="bankbook_cd_arr" id="bankbook_cd_${idx}" class="form-control form-multi mtb5">
											<option value="">선택</option>
											<c:forEach var="btlist" items="${btlist}">
												<option value="${btlist.cdid}">${btlist.cdnm}</option>
											</c:forEach>
										</select>
									</td>
									<td class="text-center border-right">
										<input type="text" name="vender_nm_arr" id="vender_nm_${idx}" class="form-control form-multi mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="text" name="history_desc_arr" id="history_desc_${idx}" class="form-control form-multi mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<select name="material_cd_arr" id="material_cd_${idx}" class="form-control form-multi mtb5">
											<option value="">선택</option>
											<c:forEach var="smlist" items="${smlist}">
												<option value="${smlist.cdid}">${smlist.cdnm}</option>
											</c:forEach>
										</select>
									</td>
									<td class="text-center border-right">
										<input type="number" name="weight_gram_arr" id="weight_gram_${idx}" class="form-control form-multi mtb5" min="0"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="quantity_arr" id="quantity_${idx}" class="form-control form-multi mtb5" value="1" min="1"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="unit_price_arr" id="unit_price_${idx}" class="form-control form-multi unitprice smtb5"/>
									</td>
									<td class="text-center border-right">
										<input type="text" id="supply_price_${idx}" class="form-control supplyprice mtb5" readonly="readonly"/>
									</td>
									<td class="text-center border-right">
										<input type="text" id="total_price" class="form-control totalprice mtb5" readonly="readonly"/>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="btn_wrap text-center">
	        <a href="javascript: void(0);" onclick="fncSave(); return false;" class="btn btn-primary waves-effect waves-light mlr5">등록</a>
	        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
	    	</div>
			</form>
		</div>
	</div>
	
	<script>
		/*<![CDATA[*/
			$(document).ready(function(){
				$(".unitprice, .cashtypecd").on('change keyup', function() {
					var receivedPriceSum = 0;
					var shipOutPriceSum = 0;
					$(".unitprice").each(function(idx){
						if($(this).val() == ''){
							$(".supplyprice").eq(idx).val('');
							$(".totalprice").eq(idx).val('');
						}
						else {
							$(".supplyprice").eq(idx).val(priceWithComma($(this).val()));
							$(".totalprice").eq(idx).val(priceWithComma($(this).val()));
						}
						cashTypeCd = $(".cashtypecd").eq(idx).val();
						if(cashTypeCd == 'RS01'){
							receivedPriceSum += Number(checkNullValR($(".unitprice").eq(idx).val(),'0'));
						}
						if(cashTypeCd == 'RS02'){
							shipOutPriceSum += Number(checkNullValR($(".unitprice").eq(idx).val(),'0'));
						}
					});
					$("#received_price").val(receivedPriceSum == 0 ? '' : (receivedPriceSum+''));
					$("#shipout_price").val(shipOutPriceSum == 0 ? '' : (shipOutPriceSum+''));
					$("#rece_ship_total_price").val((receivedPriceSum-shipOutPriceSum)+'');
				});
			});
				
			function readURL(obj) {
			  if (obj.files && obj.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      document.getElementById('preview').src = e.target.result;
			    };
			    reader.readAsDataURL(obj.files[0]);
			  } else {
			    document.getElementById('preview').src = "";
			  }
			}

			function fncSave(){
				/* if( !isValid() ){
					return false;
				} */
				
				if($("#store_cd").val() == ''){
					alert('관리매장을 선택해주세요.');
					$("#store_cd").focus();
					return false;
				}
				if($("#reg_dt").val() == ''){
					alert('등록일을 입력해주세요.');
					$("#reg_dt").focus();
					return false;
				}
				
				if($("#cash_type_cd_0").val() == ''){
					alert('구분을 선택해주세요.');
					$("#cash_type_cd_0").focus();
					return false;
				}

				if($("#cash_type_cd2_0").val() == ''){
					alert('계정을 선택해주세요.');
					$("#cash_type_cd2_0").focus();
					return false;
				}

				if($("#bankbook_cd_0").val() == ''){
					alert('통장구분을 선택해주세요.');
					$("#bankbook_cd_0").focus();
					return false;
				}
				
				if(confirm('등록하시겠습니까?')){
					const fileField = document.querySelector('input[type="file"]');
					const form = document.getElementById('form');
					const writeForm = new FormData(form);
	
					const formData = new FormData();
					$(".form-data").each(function(){
						formData.append($(this).attr("name"), checkNullVal($(this).val()));
					});
					$(".form-multi").each(function(){
						formData.append($(this).attr("name")+'[]', checkNullVal($(this).val()));
					});
					
					fetch('/api/cash/write', {
						method: 'POST',
						body: formData
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
			
			function fncValueInit(idx){
				$("#cash_type_cd_"+idx).val('');
				$("#cash_type_cd2_"+idx).val('');
				$("#bankbook_cd_"+idx).val('');
				$("#vender_nm_"+idx).val('');
				$("#history_desc_"+idx).val('');
				$("#material_cd_"+idx).val('');
				$("#weight_gram_"+idx).val('');
				$("#quantity_"+idx).val('1');
				$("#unit_price_"+idx).val('');
				$("#supply_price_"+idx).val('');
				$("#total_price_"+idx).val('');
			}
			
			function fncCustomerListPop(){
				var url = "/customer/popup/list";
	      var name = "customerListPopup";
	      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
	      window.open(url, name, option);
			}
			
			function fncCatalogListPop(idx){
				var url = "/catalog/popup/list?openeridx="+idx;
	      var name = "catalogListPopup";
	      var option = "width = 1150, height = 800, top = 100, left = 200, location = no";
	      window.open(url, name, option);
			}

			function fncVenderListPop(idx){
				var url = "/vender/popup/list?openeridx="+idx;
	      var name = "venderListPopup";
	      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
	      window.open(url, name, option);
			}
			
			function fncChangeRS(val, idx){
				$("#cash_type_cd2_"+idx).children().remove();
				var html = '<option value="">선택</option>';
				if(val != ''){
					<c:forEach var="rs2" items="${rslist2}">
					  if('${fn:substring(rs2.cdid,0,4)}' == val){
						  html += '<option value="${rs2.cdid}">${rs2.cdnm}</option>';
					  }
					</c:forEach>
				}
				$("#cash_type_cd2_"+idx).append(html);	
			}
			
			function fncClose(){
				self.close();
			}
		/*]]>*/
	    </script>
</body>
</html>