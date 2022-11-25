<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>재고 조회</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">재고 조회</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal">
				<div class="table-responsive clearfix">
					<table class="table border-bottom">
						<colgroup>
							<col width="20%"/>
							<col />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td rowspan="4" class="text-center border-right">
									<label for="file" id="file-label"><img id="stock_img" width="350px" height="300px"/></label>
								</td>
								<td class="bg-light border-right text-center">등록일</td>
								<td class="bg-light border-right text-center">현 재고구분</td>
							</tr>
							<tr>
								<td class="text-center border-right" id="reg_dt_td"></td>
								<td class="text-center border-right mtb5" id="stock_type_cd_td"></td>
							</tr>
							<tr>
								<td class="bg-light border-right text-center">입고매장</td>
								<td class="bg-light text-center">실질 구매 순금시세(g)</td>
							</tr>
							<tr class="border-bottom">
								<td class="text-center border-right" id="store_cd_td"></td>
								<td class="text-center" id="real_pch_gold_price_td"></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="table-responsive clearfix mt-3">
					<table class="table border-bottom" style="min-width:180%; overflow-x:scroll;">
						<colgroup>
							<col width="2%"/>
							<col width="4.5%"/>
							<col width="4.5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col />
							<col width="3.5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="4%"/>
							<col width="5%"/>
						</colgroup>
						<thead>
							<tr>
								<th rowspan="2" class="text-center border-right">No</th> 
								<th rowspan="2" class="text-center border-right">모델<br/>번호</th>
								<th rowspan="2" class="text-center border-right">매입처</th>
								<th rowspan="2" class="text-center border-right">재질</th>
								<th rowspan="2" class="text-center border-right">색상</th>
								<th colspan="2" class="text-center border-right">스톤</th>
								<th rowspan="2" class="text-center border-right">사이즈</th>
								<th rowspan="2" class="text-center border-right">기타설명</th>
								<th rowspan="2" class="text-center border-right">수량</th>
								<th colspan="2" class="text-center border-right">개당중량(g)</th>
								<th colspan="4" class="text-center border-right">개당구매가(공임)</th>
								<th colspan="2" class="text-center border-right">개당구매가(금값포함)</th>
								<th rowspan="2" class="text-center border-right">배수</th>
								<th rowspan="2" class="text-center">소비자가<br/>(TAG가)</th>
							</tr>
							<tr>
								<th class="text-center border-right">메인</th>
								<th class="text-center border-right">보조</th>
								<th class="text-center border-right">중량</th>
								<th class="text-center border-right">순금</th>
								<th class="text-center border-right">기본</th>
								<th class="text-center border-right">추가</th>
								<th class="text-center border-right">메인</th>
								<th class="text-center border-right">보조</th>
								<th class="text-center border-right">실질</th>
								<th class="text-center border-right">기준</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="text-center border-right">1</td>
								<td class="text-center border-right" id="model_id_td"></td>
								<td class="text-center border-right" id="vender_nm_td"></td>
								<td class="text-center border-right" id="material_cd_td"></td>
								<td class="text-center border-right" id="color_cd_td"></td>
								<td class="text-center border-right" id="main_stone_type_td"></td>
								<td class="text-center border-right" id="sub_stone_type_td"></td>
								<td class="text-center border-right" id="size_td"></td>
								<td class="text-center border-right" id="stock_desc_td"></td>
								<td class="text-center border-right" id="quantity_td"></td>
								<td class="text-center border-right" id="per_weight_gram_td"></td>
								<td class="text-center border-right" id="per_weight_gold_td"></td>
								<td class="text-center border-right" id="per_price_basic_td"></td>
								<td class="text-center border-right" id="per_price_add_td"></td>
								<td class="text-center border-right" id="per_price_main_td"></td>
								<td class="text-center border-right" id="per_price_sub_td"></td>
								<td class="text-center border-right" id="per_price_gold_real_td"></td>
								<td class="text-center border-right" id="per_price_gold_stdd_td"></td>
								<td class="text-center border-right" id="multiple_cnt_td"></td>
								<td class="text-center border-right" id="consumer_price_td"></td>
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
			var cdmapper = {
				<c:forEach var="code" items="${cdmapper}" varStatus="loop">
				  ${code.cdid}: '${code.cdnm}' ${not loop.last ? ',' : ''}
				</c:forEach>
			};

			window.onload = () => {
				find();
	  	}
			
			function find() {
				
				const stockno = '${stockno}';
				if ( !stockno ) {
		    	return false;
		    }
				
				fetch(`/api/stock/${stockno}`).then(response => {
		    	if (!response.ok) {
						throw new Error('Request failed...');
			    }
		    	return response.json();
		
		   	}).then(json => {
		   		var filelist = json.filelist;
		   		var filepath = '';
		   		var filenm = '';
		   		
		   		if(filelist != null && filelist.length > 0){
			   		for(var i = 0 ; i < filelist.length ; i++){
			   			if(filelist[i].fileord == 1){
			   				filepath = checkNullVal(filelist[i].filepath);
			   				filenm = checkNullVal(filelist[i].filenm);
			   			}
			   		}
		   		}
		   		document.getElementById('stock_img').src = '/file/image/display?filePath='+filepath+'&fileName='+filenm;
		   		document.getElementById('reg_dt_td').innerHTML = checkSubstringNullVal(json.regdt,0,10);
		   		document.getElementById('store_cd_td').innerHTML = checkNullVal(cdmapper[json.storecd]);
		   		document.getElementById('stock_type_cd_td').innerHTML = checkNullVal(cdmapper[json.stocktypecd]);

		   		document.getElementById('real_pch_gold_price_td').innerHTML = priceWithComma(json.realpchgoldprice);
		   		
		   		document.getElementById('model_id_td').innerHTML = checkNullVal(json.modelid);
		   		document.getElementById('vender_nm_td').innerHTML = checkNullVal(json.vendernm);
		   		
		   		document.getElementById('material_cd_td').innerHTML = checkNullVal(cdmapper[json.materialcd]);
		   		document.getElementById('color_cd_td').innerHTML = checkNullVal(cdmapper[json.colorcd]);
		   		document.getElementById('quantity_td').innerHTML = checkNullVal(json.quantity);
		   		document.getElementById('main_stone_type_td').innerHTML = checkNullVal(json.mainstonetype);
		   		document.getElementById('sub_stone_type_td').innerHTML = checkNullVal(json.substonetype);
		   		document.getElementById('size_td').innerHTML = checkNullVal(json.size);
		   		document.getElementById('stock_desc_td').innerHTML = checkNullVal(json.stockdesc);
		   		document.getElementById('quantity_td').innerHTML = checkNullVal(json.quantity);

		   		document.getElementById('per_weight_gram_td').innerHTML = checkNullVal(json.perweightgram);
		   		
		   		materialCd = checkNullVal(json.materialcd);
		   		weight = 0;
		   		if(materialCd == 'SM01') weight = 0.6435;
					else if(materialCd == 'SM02') weight = 0.825;
					else if(materialCd == 'SM03') weight = 1;

		   		perWeightGram = Number(checkNullValR(json.perweightgram,'0'));
	
		   		//재질중량(g) 순금 계산
		   		perGoldWeight = perWeightGram * weight;
		   		
		   		document.getElementById('per_weight_gold_td').innerHTML = (perGoldWeight == 0 || perGoldWeight == 0.0 ? '' : (perGoldWeight+''));
		   		
		   		document.getElementById('per_price_basic_td').innerHTML = priceWithComma(json.perpricebasic);
		   		document.getElementById('per_price_add_td').innerHTML = priceWithComma(json.perpriceadd);
		   		document.getElementById('per_price_main_td').innerHTML = priceWithComma(json.perpricemain);
		   		document.getElementById('per_price_sub_td').innerHTML = priceWithComma(json.perpricesub);

		   		perPriceBasic = Number(checkNullValR(json.perpricebasic,'0'));
		   		perPriceAdd = Number(checkNullValR(json.perpriceadd,'0'));
		   		perPriceMain = Number(checkNullValR(json.perpricemain,'0'));
		   		perPriceSub = Number(checkNullValR(json.perpricesub,'0'));
		   		
		   		//개당구매가(공임) 합산
		   		perPriceGoldStdd = (perPriceBasic + perPriceAdd + perPriceMain + perPriceSub);

		   		perPriceGoldReal = 0;
		   		realPchGoldPrice = Number(checkNullValR(json.realpchgoldprice,'0'));
					
		   		perPriceGoldReal = realPchGoldPrice*perGoldWeight;
		   		perPriceGoldReal += perPriceGoldStdd;
					
		   		document.getElementById('per_price_gold_real_td').innerHTML = priceWithComma(perPriceGoldReal);
		   		
		   		document.getElementById('per_price_gold_stdd_td').innerHTML = (perPriceGoldStdd == 0 || perPriceGoldStdd == 0.0 ? '' : priceWithComma(perPriceGoldStdd));
		   		
		   		document.getElementById('multiple_cnt_td').innerHTML = checkNullVal(json.multiplecnt);

		   		multipleCnt = Number(checkNullValR(json.multiplecnt,'1'));
					comsumerPrice = perPriceGoldStdd * multipleCnt;
		   		document.getElementById('consumer_price_td').innerHTML = (comsumerPrice == 0 || comsumerPrice == 0.0 ? '' : priceWithComma(comsumerPrice));
 
		   	}).catch(error => {
		    	alert('재고 정보를 찾을 수 없습니다.');
		    	fncParentRefresh();
		    	fncClose();
		   	});
			}

			/**
			 * 수정하기
			 */
			function goModify() {
		    location.href = '/stock/popup/modify/${stockno}';
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