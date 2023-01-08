<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>재고 등록</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">재고 등록</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal">
				<div class="table-responsive clearfix">
					<table class="table border-bottom">
						<colgroup>
							<col width="20%"/>
							<col />
							<col />
							<col />
							<col />
							<col />
							<col />
							<col />
							<col />
							<col />
							<col />
							<col />
							<col />
							<col />
							<col />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td rowspan="8" class="text-center border-right">
									<label for="file"><img src="/img/no-image.png" id="preview" width="350px" height="300px"/></label>
									<input type="file" name="file" id="file" class="custom-file-input" style="display:none;"/>
								</td>
								<td colspan="7" class="bg-light border-right text-center">등록일<span class="important"> *</span></td>
								<td colspan="8" class="bg-light border-right text-center">현 재고구분<span class="important"> *</span></td>
							</tr>
							<tr>
								<td colspan="7" class="text-center border-right">
									<input type="date" name="reg_dt" id="reg_dt" class="form-control form-data mtb5" maxlength="10"/>
								</td>
								<td colspan="8" class="text-center border-right mtb5">
									<select name="stock_type_cd" id="stock_type_cd" class="form-control form-data">
										<c:forEach var="oclist" items="${oclist}">
											<option value="${oclist.cdid}">${oclist.cdnm}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="7" class="bg-light border-right text-center">입고매장<span class="important"> *</span></td>
								<td colspan="8" class="bg-light text-center">실질 구매 순금시세(g)</td>
							</tr>
							<tr class="border-bottom">
								<td colspan="7" class="text-center border-right">
									<select name="store_cd" id="store_cd" class="form-control form-data">
										<c:forEach var="stlist" items="${stlist}">
											<option value="${stlist.cdid}">${stlist.cdnm}</option>
										</c:forEach>
									</select>
								</td>
								<td colspan="8" class="text-center">
									<input type="number" name="real_pch_gold_price" id="real_pch_gold_price" class="form-control form-data mtb5"/>
								</td>
							</tr>
							<tr>
								<th class="bg-light text-center border-right small">등록일</th>
								<th class="bg-light text-center border-right small">모델</th>
								<th class="bg-light text-center border-right small">분류</th>
								<th class="bg-light text-center border-right small">재질</th>
								<th class="bg-light text-center border-right small">색상</th>
								<th class="bg-light text-center border-right small">메.스톤</th>
								<th class="bg-light text-center border-right small">보.스톤</th>
								<th class="bg-light text-center border-right small">사이즈</th>
								<th class="bg-light text-center border-right small">기타설명</th>
								<th class="bg-light text-center border-right small">중량</th>
								<th class="bg-light text-center border-right small">구매공임</th>
								<th class="bg-light text-center border-right small">구매원가</th>
								<th class="bg-light text-center border-right small">기준원가</th>
								<th class="bg-light text-center border-right small">배수</th>
								<th class="bg-light text-center border-right small">TAG가</th>
							</tr>
							<c:forEach var="idx" begin="0" end="2">
								<tr>
									<td class="text-center border-right small" id="prev_reg_dt_${idx}">${fn:substring(prevstocklist[idx].regdt,0,10)}</td>
									<td class="text-center border-right small" id="prev_model_id_${idx}">${prevstocklist[idx].modelid}</td>
									<td class="text-center border-right small" id="prev_stock_type_cd_${idx}">
										<c:forEach var="oc" items="${oclist}">
											<c:if test="${prevstocklist[idx].stocktypecd eq oc.cdid}">${oc.cdnm}</c:if>
										</c:forEach>
									</td>
									<td class="text-center border-right small" id="prev_material_cd_${idx}">
										<c:forEach var="sm" items="${smlist}">
											<c:if test="${prevstocklist[idx].materialcd eq sm.cdid}">${sm.cdnm}</c:if>
										</c:forEach>
									</td>
									<td class="text-center border-right small" id="prev_color_cd_${idx}">
										<c:forEach var="sc" items="${sclist}">
											<c:if test="${prevstocklist[idx].colorcd eq sc.cdid}">${sc.cdnm}</c:if>
										</c:forEach>
									</td>
									<td class="text-center border-right small" id="prev_main_stone_type_${idx}">${prevstocklist[idx].mainstonetype}</td>
									<td class="text-center border-right small" id="prev_sub_stone_type_${idx}">${prevstocklist[idx].substonetype}</td>
									<td class="text-center border-right small" id="prev_size_${idx}">${prevstocklist[idx].size}</td>
									<td class="text-center border-right small" id="prev_stock_desc_${idx}">${prevstocklist[idx].stockdesc}</td>
									<td class="text-center border-right small" id="prev_per_weight_gram_${idx}">${prevstocklist[idx].perweightgram}</td>
									<td class="text-center border-right small" id="prev_per_price_${idx}">
										<c:set var="prevPerPrice" value="${prevstocklist[idx].perpricemain}"/>
										<c:set var="prevPerPrice" value="${prevPerPrice+prevstocklist[idx].perpricesub}"/>
										<c:set var="prevPerPrice" value="${prevPerPrice+prevstocklist[idx].perpricebasic}"/>
										<c:set var="prevPerPrice" value="${prevPerPrice+prevstocklist[idx].perpriceadd}"/>
										<c:set var="prevPerPrice" value="${prevPerPrice eq 0 ? '' : (prevPerPrice+'')}"/>
										${prevPerPrice}
									</td>
									<td class="text-center border-right small" id="prev_per_price_gold_real_${idx}">
										<c:set var="weight" value="0"/>
										<c:if test="${prevstocklist[idx].materialcd eq 'SM01'}">
											<c:set var="weight" value="0.6435"/>
										</c:if>
										<c:if test="${prevstocklist[idx].materialcd eq 'SM02'}">
											<c:set var="weight" value="0.825"/>
										</c:if>
										<c:if test="${prevstocklist[idx].materialcd eq 'SM03'}">
											<c:set var="weight" value="1"/>
										</c:if>
										<c:set var="realPchGoldPrice" value="${prevstocklist[idx].realpchgoldprice*weight+prevPerPrice}"/>
										<c:set var="realPchGoldPrice" value="${realPchGoldPrice eq 0 ? '' : (realPchGoldPrice+'')}"/>
										${realPchGoldPrice}
									</td>
									<td class="text-center border-right small" id="prev_per_price_gold_stdd_${idx}">${prevPerPrice}</td>
									<td class="text-center border-right small" id="prev_multiple_cnt_${idx}">${prevstocklist[idx].multiplecnt}</td>
									<td class="text-center small" id="prev_consumer_price_${idx}">
										<c:set var="prevConsumerPrice" value="${prevPerPrice*prevstocklist[idx].multiplecnt}"/>
										<c:set var="prevConsumerPrice" value="${prevConsumerPrice eq 0 ? '' : (prevConsumerPrice+'')}"/>
										${prevConsumerPrice}
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<div class="table-responsive clearfix mt-3">
					<table class="table border-bottom" style="min-width:180%; overflow-x:scroll;">
						<colgroup>
							<col width="2%"/>
							<col width="3%"/>
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
								<th rowspan="2" class="text-center border-right">취소</th>
								<th rowspan="2" class="text-center border-right">모델<br/>번호<span class="important"> *</span></th>
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
							<c:forEach var="idx" begin="0" end="29">
								<tr>
									<td class="text-center border-right">${idx+1}</td>
									<td class="text-center border-right">
										<a href="#" onclick="fncValueInit('${idx}'); return false;" class="btn btn-danger btn-circle btn-sm"><i class="fas fa-trash"></i></a>
									</td>
									<td class="text-center border-right">
										<input type="hidden" name="catalog_no_arr" id="catalog_no_${idx}" class="form-data form-multi"/>
										<div class="input-group-append">
											<input type="text" name="model_id_arr" id="model_id_${idx}" class="form-control form-multi mtb5 beadcnt" readonly="readonly"/>
											<i class="fas fa-search fa-sm ml5 mt15" onclick="fncCatalogListPop('${idx}'); return false;"></i>
										</div>
									</td>
									<td class="text-center border-right">
										<input type="hidden" name="vender_no_arr" id="vender_no_${idx}" class="form-data form-multi"/>
										<div class="input-group-append">
											<input type="text" name="vender_nm_arr" id="vender_nm_${idx}" class="form-control form-multi mtb5 beadcnt" readonly="readonly"/>
											<i class="fas fa-search fa-sm ml5 mt15" onclick="fncVenderListPop('${idx}'); return false;"></i>
										</div>
									</td>
									<td class="text-center border-right">
										<select name="material_cd_arr" id="material_cd_${idx}" class="form-control materialcd form-multi mtb5">
											<option value="">선택</option>
											<c:forEach var="smlist" items="${smlist}">
												<option value="${smlist.cdid}">${smlist.cdnm}</option>
											</c:forEach>
										</select>
									</td>
									<td class="text-center border-right">
										<select name="color_cd_arr" id="color_cd_${idx}" class="form-control form-multi mtb5">
											<option value="">선택</option>
											<c:forEach var="sclist" items="${sclist}">
												<option value="${sclist.cdid}">${sclist.cdnm}</option>
											</c:forEach>
										</select>
									</td>
									<td class="text-center border-right">
										<input type="text" name="main_stone_type_arr" id="main_stone_type_${idx}" class="form-control form-multi mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="text" name="sub_stone_type_arr" id="sub_stone_type_${idx}" class="form-control form-multi mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="text" name="size_arr" id="size_${idx}" class="form-control form-multi mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="text" name="stock_desc_arr" id="stock_desc_${idx}" class="form-control form-multi mtb5" maxlength="500"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="quantity_arr" id="quantity_${idx}" class="form-control form-multi mtb5" value="1" min="1"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="per_weight_gram_arr" id="per_weight_gram_${idx}" class="form-control form-multi perweightgramm tb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="text" id="per_weight_gold_${idx}" class="form-control perweightgold mtb5" disabled="disabled"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="per_price_basic_arr" id="per_price_basic_${idx}" class="form-control form-multi perpricebasic mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="per_price_add_arr" id="per_price_add_${idx}" class="form-control form-multi perpriceadd mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="per_price_main_arr" id="per_price_main_${idx}" class="form-control form-multi perpricemain mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="per_price_sub_arr" id="per_price_sub_${idx}" class="form-control form-multi perpricesub mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="text" id="per_price_gold_real_${idx}" class="form-control form-multi perpricegoldreal mtb5" disabled="disabled"/>
									</td>
									<td class="text-center border-right">
										<input type="text" id="per_price_gold_stdd_${idx}" class="form-control perpricegoldstdd mtb5" disabled="disabled"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="multiple_cnt_arr" id="multiple_cnt_${idx}" class="form-control form-multi multiplecnt mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="number" id="consumer_price_${idx}" class="form-control consumerprice mtb5" disabled="disabled"/>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="btn_wrap text-center">
					<c:if test="${sessionScope.MODIFY_AUTH eq 'Y'}">
	        	<a href="javascript: void(0);" onclick="fncSave(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
	        </c:if>
	        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
	    	</div>
			</form>
		</div>
	</div>
	
	<script>
		/*<![CDATA[*/
			$(document).ready(function(){
				const inputElement = document.getElementById("file");
				inputElement.addEventListener("change", readURL, false);
				find();
				
				$("#real_pch_gold_price, .perpricebasic, .perpriceadd, .perpricemain, .perpricesub, .perweightgramm, .materialcd, .multiplecnt").on('change keyup', function() {
					$(".perweightgramm").each(function(idx){
						//실질 구매 순금시세----------------------------------------------------------------------------------------------------------------
						realPchGoldPriceSum = $("#real_pch_gold_price").val() == '' ? 0 : Number($("#real_pch_gold_price").val());
						//실질 구매 순금시세 끝--------------------------------------------------------------------------------------------------------------
						
						//개당 구매가 순금계산---------------------------------------------------------------------------------------------------------------
						weight = 0;
						goldWeight = 0;
						perWeightGram = $(".perweightgramm").eq(idx).val() == '' ? 0 : Number($(".perweightgramm").eq(idx).val());
						
						//재질별 중량 체크
						if($(".materialcd").eq(idx).val() == 'SM01') weight = 0.6435;
						else if($(".materialcd").eq(idx).val() == 'SM02') weight = 0.825;
						else if($(".materialcd").eq(idx).val() == 'SM03') weight = 1;
						else weight = 0;
						
						goldWeight = perWeightGram * weight;

						if(goldWeight == 0 || goldWeight == 0.0) $(".perweightgold").eq(idx).val('');
						else $(".perweightgold").eq(idx).val(goldWeight+'');
						//개당 구매가 순금계산 끝-------------------------------------------------------------------------------------------------------------

						realPchGoldPriceSum *= goldWeight;
						
						//개당 구매가(공임)-----------------------------------------------------------------------------------------------------------------
						perPriceGoldStddSum = 0;
						perPriceGoldStddSum += $(".perpricebasic").eq(idx).val() == '' ? 0 : Number($(".perpricebasic").eq(idx).val());
						perPriceGoldStddSum += $(".perpriceadd").eq(idx).val() == '' ? 0 : Number($(".perpriceadd").eq(idx).val());
						perPriceGoldStddSum += $(".perpricemain").eq(idx).val() == '' ? 0 : Number($(".perpricemain").eq(idx).val());
						perPriceGoldStddSum += $(".perpricesub").eq(idx).val() == '' ? 0 : Number($(".perpricesub").eq(idx).val());
						
						if(perPriceGoldStddSum == 0 || perPriceGoldStddSum == 0.0) $(".perpricegoldstdd").eq(idx).val('');
						else $(".perpricegoldstdd").eq(idx).val(perPriceGoldStddSum+'');
						//개당 구매가(공임) 끝---------------------------------------------------------------------------------------------------------------
						
						realPchGoldPriceSum += perPriceGoldStddSum;
						
						if(realPchGoldPriceSum == 0 || realPchGoldPriceSum == 0.0) $(".perpricegoldreal").eq(idx).val('');
						else $(".perpricegoldreal").eq(idx).val(realPchGoldPriceSum+'');
						

						multipleCnt = $(".multiplecnt").eq(idx).val() == '' ? 0 : Number($(".multiplecnt").eq(idx).val());
						consumerPrice = perPriceGoldStddSum * multipleCnt;
						
						if(consumerPrice == 0 || consumerPrice == 0.0) $(".consumerprice").eq(idx).val('');
						else $(".consumerprice").eq(idx).val(consumerPrice+'');
						
						
					});
				});
			});
			
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
		   		if(filenm == '')
		   			form.preview.src = '/img/no-image.png';
		   		else
		   			form.preview.src = '/file/image/display?filePath='+filepath+'&fileName='+filenm;
		   		
		   		form.reg_dt.value = checkSubstringNullVal(json.regdt,0,10);
		   		form.store_cd.value = checkNullVal(json.storecd);
		   		form.stock_type_cd.value = checkNullVal(json.stocktypecd);

		   		form.real_pch_gold_price.value = checkNullVal(json.realpchgoldprice);
		   		
		   		form.catalog_no_0.value = checkNullVal(json.catalogno);
		   		form.model_id_0.value = checkNullVal(json.modelid);
		   		form.vender_no_0.value = checkNullVal(json.venderno);
		   		form.vender_nm_0.value = checkNullVal(json.vendernm);
		   		
		   		form.material_cd_0.value = checkNullVal(json.materialcd);
		   		form.color_cd_0.value = checkNullVal(json.colorcd);
		   		form.quantity_0.value = checkNullVal(json.quantity);
		   		form.main_stone_type_0.value = checkNullVal(json.mainstonetype);
		   		form.sub_stone_type_0.value = checkNullVal(json.substonetype);
		   		form.size_0.value = checkNullVal(json.size);
		   		form.stock_desc_0.value = checkNullVal(json.stockdesc);
		   		form.quantity_0.value = checkNullVal(json.quantity);
		   		form.per_weight_gram_0.value = checkNullVal(json.perweightgram);
		   		
		   		materialCd = checkNullVal(json.materialcd);
		   		weight = 0;
		   		if(materialCd == 'SM01') weight = 0.6435;
					else if(materialCd == 'SM02') weight = 0.825;
					else if(materialCd == 'SM03') weight = 1;

		   		perWeightGram = Number(checkNullValR(json.perweightgram,'0'));
	
		   		//재질중량(g) 순금 계산
		   		perGoldWeight = perWeightGram * weight;
		   		
		   		form.per_weight_gold_0.value = (perGoldWeight == 0 || perGoldWeight == 0.0 ? '' : (perGoldWeight+''));
		   		
		   		form.per_price_basic_0.value = checkNullVal(json.perpricebasic);
		   		form.per_price_add_0.value = checkNullVal(json.perpriceadd);
		   		form.per_price_main_0.value = checkNullVal(json.perpricemain);
		   		form.per_price_sub_0.value = checkNullVal(json.perpricesub);

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
					
		   		form.per_price_gold_real_0.value = perPriceGoldReal;
		   		
		   		form.per_price_gold_stdd_0.value = (perPriceGoldStdd == 0 || perPriceGoldStdd == 0.0 ? '' : (perPriceGoldStdd+''));
		   		
		   		form.multiple_cnt_0.value = checkNullVal(json.multiplecnt);

		   		multipleCnt = Number(checkNullValR(json.multiplecnt,'1'));
					comsumerPrice = perPriceGoldStdd * multipleCnt;
		   		form.consumer_price_0.value = (comsumerPrice == 0 || comsumerPrice == 0.0 ? '' : (comsumerPrice+''));
 
		   	}).catch(error => {
		    	alert('재고 정보를 찾을 수 없습니다.');
		    	window.opener.refresh();
		    	fncClose();
		   	});
			}
			
			function readURL() {
			  if (this.files && this.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      document.getElementById('preview').src = e.target.result;
			    };
			    reader.readAsDataURL(this.files[0]);
			    document.getElementById('file-label').innerHTML = this.files[0].name;
			  } else {
			    document.getElementById('preview').src = "";
			    document.getElementById('file-label').innerHTML = '파일 첨부하기';
			  }
			}
			
			/* function readURL(obj) {
			  if (obj.files && obj.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      document.getElementById('preview').src = e.target.result;
			    };
			    reader.readAsDataURL(obj.files[0]);
			  } else {
			    document.getElementById('preview').src = "";
			  }
			} */

			function fncSave(){
				/* if( !isValid() ){
					return false;
				} */

				if($("#reg_dt").val() == ''){
					alert('등록일을 입력해주세요.');
					$("#reg_dt").focus();
					return false;
				}
				if($("#stock_type_cd").val() == ''){
					alert('현 재고구분을 선택해주세요.');
					$("#stock_type_cd").focus();
					return false;
				}
				
				var catalogflag = false;
				$("input[name=catalog_no_arr]").each(function(){
					if($(this).val() != '' && Number($(this).val()) > 0) {
						catalogflag = true;
					}
				});
				
				if(catalogflag == false){
					alert('1개 이상의 모델을 선택해주세요.');
					$("input[name=catalog_no_arr]").eq(0).focus();
					return false;
				}
				
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
				
				formData.append("file", fileField.files[0]);
								
				fetch('/api/stock/modify/${stockno}', {
					method: 'PATCH',
					body: formData
				}).then(response => {
					if(!response.ok){
						throw new Error('Request Failed...');
					}
					alert('저장되었습니다.');
					window.opener.refresh();
					fncClose();
				}).catch(error => {
					alert('오류가 발생하였습니다.');
				});
			}
			
			function fncValueInit(idx){
				$("#catalog_no_"+idx).val('');
				$("#model_id_"+idx).val('');
				$("#vender_no_"+idx).val('');
				$("#vender_nm_"+idx).val('');
				$("#material_cd_"+idx).val('');
				$("#color_cd_"+idx).val('');
				$("#main_stone_type_"+idx).val('');
				$("#sub_stone_type_"+idx).val('');
				$("#size_"+idx).val('');
				$("#stock_desc_"+idx).val('');
				$("#quantity_"+idx).val('1');
				$("#per_weight_gram_"+idx).val('');
				$("#per_weight_gold_"+idx).val('');
				$("#per_price_basic_"+idx).val('');
				$("#per_price_add_"+idx).val('');
				$("#per_price_main_"+idx).val('');
				$("#per_price_sub_"+idx).val('');
				$("#per_price_gold_real_"+idx).val('');
				$("#per_price_gold_stdd_"+idx).val('');
				$("#multiple_cnt_"+idx).val('');
				$("#consumer_price_"+idx).val('');
			}
			
			function fncCustomerListPop(){
				var url = "/customer/popup/list";
	      var name = "customerListPopup";
	      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
	      window.open(url, name, option);
			}
			
			function fncCatalogListPop(idx){
				var url = "/catalog/popup/list?reqtype=all&openeridx="+idx;
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