<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>금/현금 조회</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">금/현금 조회</h6>
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
								<td rowspan="2" class="bg-light border-right text-center">관리매장</td>
								<td rowspan="2" class="bg-light border-right text-center">등록일</td>
								<td colspan="3" class="bg-light text-center">합 계</td>
							</tr>
							<tr>
								<td class="bg-light border-right text-center">입고</td>
								<td class="bg-light border-right text-center">출고</td>
								<td class="bg-light text-center">입고-출고</td>
							</tr>
							<tr class="border-bottom">
								<td class="text-center border-right mtb5" id="store_cd_td"></td>
								<td class="text-center border-right" id="reg_dt_td"></td>
								<td class="text-center border-right" id="received_price_td"></td>
								<td class="text-center border-right" id="shipout_price_td"></td>
								<td class="text-center" id="rece_ship_total_price_td"></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="table-responsive clearfix mt-3">
					<table class="table" style="min-width:150%; overflow-x:scroll;">
						<colgroup>
							<col width="3%"/>
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
						<tbody id="list">
							<tr class="border-bottom">
								<td class="text-center border-right">1</td>
								<td class="text-center border-right" id="cash_type_cd_td"></td>
								<td class="text-center border-right" id="cash_type_cd2_td"></td>
								<td class="text-center border-right" id="bankbook_cd_td"></td>
								<td class="text-center border-right" id="vender_nm_td"></td>
								<td class="text-center border-right" id="history_desc_td"></td>
								<td class="text-center border-right" id="material_cd_td"></td>
								<td class="text-center border-right" id="weight_gram_td"></td>
								<td class="text-center border-right" id="quantity_td"></td>
								<td class="text-center border-right" id="unit_price_td"></td>
								<td class="text-center border-right" id="supply_price_td"></td>
								<td class="text-center border-right" id="total_price_td"></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn_wrap text-center">
	        <a href="javascript: void(0);" onclick="goModify(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
	        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
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
			var codemap2 = {
				<c:forEach var="code" items="${cdmapper2}" varStatus="loop">
				  ${code.cdid}: '${code.cdnm}' ${not loop.last ? ',' : ''}
				</c:forEach>
			};
			window.onload = () => {
				find();
	  	}
			
			function find() {
				
				const cashno = '${cashno}';
				if ( !cashno ) {
		    	return false;
		    }
				
				fetch(`/api/cash/${cashno}`).then(response => {
		    	if (!response.ok) {
						throw new Error('Request failed...');
			    }
		    	return response.json();
		
		   	}).then(json => {
		   		document.getElementById('store_cd_td').innerHTML = checkNullVal(codemap[json.storecd]);
		   		document.getElementById('reg_dt_td').innerHTML = checkSubstringNullVal(json.regdt,0,10);
		   		document.getElementById('cash_type_cd_td').innerHTML = checkNullVal(codemap[json.cashtypecd]);
		   		document.getElementById('cash_type_cd2_td').innerHTML = checkNullVal(codemap2[json.cashtypecd2]);
		   		document.getElementById('bankbook_cd_td').innerHTML = checkNullVal(codemap[json.bankbookcd]);
		   		document.getElementById('vender_nm_td').innerHTML = checkNullVal(json.vendernm);
		   		document.getElementById('history_desc_td').innerHTML = checkNullVal(json.historydesc);
		   		document.getElementById('material_cd_td').innerHTML = checkNullVal(codemap[json.materialcd]);
		   		document.getElementById('weight_gram_td').innerHTML = checkNullVal(json.weightgram);
		   		document.getElementById('quantity_td').innerHTML = checkNullVal(json.quantity);
		   		document.getElementById('unit_price_td').innerHTML = priceWithComma(json.unitprice);
		   		document.getElementById('supply_price_td').innerHTML = priceWithComma(json.unitprice);
		   		document.getElementById('total_price_td').innerHTML = priceWithComma(json.unitprice);
					
		   		typePrice = checkNullValR(json.unitprice,'0');
					if(checkNullVal(json.cashtypecd) == 'RS01'){
						document.getElementById('received_price_td').innerHTML = (typePrice == '0' ? '' : priceWithComma(typePrice));
						document.getElementById('rece_ship_total_price_td').innerHTML = (typePrice == '0' ? '' : priceWithComma(typePrice));
					}
					else if(checkNullVal(json.cashtypecd) == 'RS02'){
						document.getElementById('shipout_price_td').innerHTML = (typePrice == '0' ? '' : priceWithComma(typePrice));
						document.getElementById('rece_ship_total_price_td').innerHTML = (typePrice == '0' ? '' : ('-'+priceWithComma(typePrice)));
					}
		   	}).catch(error => {
		    	alert('금/현금 정보를 찾을 수 없습니다.');
		    	fncParentRefresh();
		    	fncClose();''
		   	});
			}

			/**
			 * 수정하기
			 */
			function goModify() {
		    location.href = '/cash/popup/modify/${cashno}';
			}
			
			function fncParentRefresh(){
				window.opener.findAll();
			}
			
			function fncClose(){
				self.close();
			}
		/*]]>*/
	    </script>
</body>
</html>