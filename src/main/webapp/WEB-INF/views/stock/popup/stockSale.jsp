<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>재고 판매</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">재고 판매</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal">
				<div class="table-responsive clearfix">
					<table class="table">
						<colgroup>
							<col />
							<col width="14%"/>
							<col width="14%"/>
							<col width="14%"/>
							<col width="14%"/>
							<col width="14%"/>
							<col width="14%"/>
						</colgroup>
						<tbody>
							<tr>
								<th colspan="7" class="bg-light text-center">구매 고객</th>
							</tr>
							<tr>
								<td class="bg-light border-right text-center">고객명<span class="important"> *</span></td>
								<td colspan="3">
									<div class="input-group-append">
										<input type="hidden" name="customer_no" id="customer_no" class="form-control form-data mtb5"/>
										<input type="text" name="customer_nm" id="customer_nm" class="form-control form-data mtb5" readonly="readonly"/>
										<i class="fas fa-search fa-sm ml5 mt15" onclick="fncCustomerListPop(); return false;"></i>
									</div>
								</td>
								<td class="bg-light border-right text-center">연락처<span class="important"> *</span></td>
								<td colspan="3">
									<input type="text" name="customer_cel" id="customer_cel" class="form-control form-data mtb5" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<th colspan="7" class="bg-light text-center">매출 정보</th>
							</tr>
							<tr>
								<td class="bg-light border-right text-center">매출금액<span class="important"> *</span></td>
								<td colspan="6" class="text-center">
					        <input type="number" name="sale_price" id="sale_price" class="form-control form-data mtb5"/>
								</td>
							</tr>
							<tr>
								<th colspan="7">결재(받은) 금액</th>
							</tr>
							<tr class="border-bottom">
								<td class="bg-light border-right text-center">구분</td>
								<td class="bg-light border-right text-center">카드</td>
								<td class="bg-light border-right text-center">현금</td>
								<td class="bg-light border-right text-center">고금</td>
								<td class="bg-light border-right text-center">기타</td>
								<td class="bg-light border-right text-center">포인</td>
								<td class="bg-light text-center">합계</td>
							</tr>
							<tr>
								<td class="text-center border-right">
									<select name="rec_pay_type_cd" id="rec_pay_type_cd" class="form-control form-data mtb5">
										<c:forEach var="pt" items="${ptlist}">
											<option value="${pt.cdid}">${pt.cdnm}</option>
										</c:forEach>
									</select>
								</td>
								<td class="text-center border-right">
					        <input type="number" name="card_price" id="card_price" class="form-control cardprice form-data mtb5"/>
								</td>
								<td class="text-center border-right">
					        <input type="number" name="cash_price" id="cash_price" class="form-control cashprice form-data mtb5"/>
								</td>
								<td class="text-center border-right">
					        <input type="number" name="maint_price" id="maint_price" class="form-control maintprice form-data mtb5"/>
								</td>
								<td class="text-center border-right">
					        <input type="number" name="etc_price" id="etc_price" class="form-control etcprice form-data mtb5"/>
								</td>
								<td class="text-center border-right">
					        <input type="number" name="pnt_price" id="pnt_price" class="form-control pntprice form-data mtb5"/>
								</td>
								<td class="text-center" id="total_sale_price_td"></td>
							</tr>
							<tr class="border-bottom">
								<td class="bg-light border-right text-center">적립 포인트</td>
								<td colspan="6" class="text-center">
					        <input type="number" name="accu_pnt" id="accu_pnt" class="form-control form-data mtb5"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="btn_wrap text-center">
	        <a href="javascript: void(0);" onclick="fncSave(); return false;" class="btn btn-primary waves-effect waves-light mlr5">저장</a>
	        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
	    	</div>
			</form>
		</div>
	</div>
	
	<script>
		/*<![CDATA[*/
			$(document).ready(function(){
				
				$(".cardprice, .cashprice, .maintprice, .etcprice, .pntprice").on('change keyup', function() {
					$(".cardprice").each(function(idx){
						cardPrice = Number($(".cardprice").eq(idx).val() == '' ? 0 : $(".cardprice").eq(idx).val());
						cashPrice = Number($(".cashprice").eq(idx).val() == '' ? 0 : $(".cashprice").eq(idx).val());
						maintPrice = Number($(".maintprice").eq(idx).val() == '' ? 0 : $(".maintprice").eq(idx).val());
						etcPrice = Number($(".etcprice").eq(idx).val() == '' ? 0 : $(".etcprice").eq(idx).val());
						pntPrice = Number($(".pntprice").eq(idx).val() == '' ? 0 : $(".pntprice").eq(idx).val());
						
						totalSalePriceTd = cardPrice+cashPrice+maintPrice+etcPrice+pntPrice;

						$("#total_sale_price_td").text((totalSalePriceTd == 0 ? '' : totalSalePriceTd));
					});
				});
			});
		
			function fncSave(){
			  if($("#sale_price").val() == ''){
				  alert('매출금액을 입력해주세요.');
				  $("#sale_price").focus();
			  }
			  
				if(confirm('판매하시겠습니까?')){
					var stocksno = '${param.stocksno}';
					var stock_no_arr = stocksno.split(',');
					const form = document.getElementById('form');
					const writeForm = new FormData(form);
	
					const formData = new FormData();
					$(".form-data").each(function(){
						formData.append($(this).attr("name"), checkNullVal($(this).val()));
					});
					
					for(var i = 0 ; i < stock_no_arr.length ; i++){
						formData.append('stock_no_arr[]',stock_no_arr[i]);
					}
					
					fetch('/api/stock/stocks/sale', {
						method: 'PATCH',
						body: formData
					}).then(response => {
						if(!response.ok){
							throw new Error('Request Failed...');
						}
						alert('판매 되었습니다.');
						window.opener.findAll();
						fncClose();
					}).catch(error => {
						alert('오류가 발생하였습니다.');
					});
				}
			}

			function fncCustomerListPop(){
				var url = "/customer/popup/list";
	      var name = "customerListPopup";
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