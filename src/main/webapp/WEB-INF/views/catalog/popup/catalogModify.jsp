<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카다로그 등록</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">카다로그 등록</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal">
				<div class="row text-center border-bottom">
					<div class="col bg-light" style="line-height:40px;">제품 사진</div>
				</div>
				<div class="row text-center">
					<div class="col bg-light">
						<label for="file" id="file-label" class="custom-file custom-file-label mt5">파일 첨부하기</label>
						<input type="file" name="file" id="file" class="custom-file-input" onchange="readURL(this);" style="display:none;"/>
					</div>
				</div>
				<div class="row text-center">
					<div class="col"><img id="preview" width="640px" height="480px" class="m10"/></div>
				</div>
				<div class="row text-center border-bottom">
					<div class="col bg-light" style="line-height:40px;">모델 정보</div>
				</div>
				<div class="row row-cols-3 border-bottom text-center">
					<div class="col bg-light border-righ t">제조사<span class="important"> *</span></div>
					<div class="col bg-light border-right">모델번호<span class="important"> *</span></div>
					<div class="col bg-light">품명</div>
				</div>
				<div class="row row-cols-3 border-bottom text-center">
					<div class="col border-right">
						<input type="hidden" name="vender_no" id="vender_no" class="form-data"/>
						<input type="text" name="vender_nm" id="vender_nm" class="form-control mtb5" readonly="readonly"/>
					</div>
					<div class="col border-right">
						<input type="text" name="model_id" id="model_id" class="form-control form-data mtb5"/>
					</div>
					<div class="col">
						<input type="text" name="model_nm" id="model_nm" class="form-control form-data mtb5"/>
					</div>
				</div>
				<div class="row row-cols-3 border-bottom text-center">
					<div class="col bg-light border-right">표준재질</div>
					<div class="col bg-light border-right">표준중량(g)</div>
					<div class="col bg-light">표준색상</div>
				</div>
				<div class="row row-cols-3 border-bottom text-center">
					<div class="col border-right">
						<select name="stdd_material_cd" id="stdd_material_cd" class="form-control form-data mtb5">
							<option value="">선택</option>
							<c:forEach var="smlist" items="${smlist}">
								<option value="${smlist.cdid}">${smlist.cdnm}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col border-right">
						<input type="text" name="stdd_weight" id="stdd_weight" class="form-control form-data mtb5" maxlength="10"/>
					</div>
					<div class="col">
						<select name="stdd_color_cd" id="stdd_color_cd" class="form-control form-data mtb5">
							<option value="">선택</option>
							<c:forEach var="sclist" items="${sclist}">
								<option value="${sclist.cdid}">${sclist.cdnm}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="row row-cols-3 border-bottom text-center">
					<div class="col bg-light border-right">표준사이즈</div>
					<div class="col bg-light border-right">주문시 유의사항</div>
					<div class="col bg-light">등록일</div>
				</div>
				<div class="row row-cols-3 border-bottom text-center">
					<div class="col border-right">
						<input type="text" name="stdd_size" id="stdd_size" class="form-control form-data mtb5" maxlength="20"/>
					</div>
					<div class="col border-right">
						<input type="text" name="odr_notice" id="odr_notice" class="form-control form-data mtb5" maxlength="500"/>
					</div>
					<div class="col">
						<input type="date" name="reg_dt" id="reg_dt" class="form-control form-data mtb5" maxlength="10"/>
					</div>
				</div>
				
				<div class="row text-center border-bottom">
					<div class="col bg-light" style="line-height:40px;">구매단가</div>
				</div>
				<div class="row row-cols-4 border-bottom text-center">
					<div class="col bg-light border-right">기본공업</div>
					<div class="col bg-light border-right">메인가격</div>
					<div class="col bg-light border-right">보조가격</div>
					<div class="col bg-light">합계</div>
				</div>
				<div class="row row-cols-4 border-bottom text-center">
					<div class="col border-right">
						<input type="text" name="basic_idst" id="basic_idst" class="form-control form-data mtb5" maxlength="50"/>
					</div>
					<div class="col border-right">
						<input type="text" name="main_price" id="main_price" class="form-control form-data mtb5" maxlength="10"/>
					</div>
					<div class="col border-right">
						<input type="text" name="sub_price" id="sub_price" class="form-control form-data mtb5" maxlength="10"/>
					</div>
					<div class="col border-right">
						<input type="text" name="total_price" id="total_price" class="form-control form-data mtb5" maxlength="10"/>
					</div>
				</div>
				<div class="table-responsive clearfix mt-3">
					<table class="table">
						<colgroup>
							<col width="8%"/>
							<col width="13%"/>
							<col width="18%"/>
							<col width="10%"/>
							<col width="13%"/>
							<col width="13%"/>
							<col />
						</colgroup>
						<thead>
							<tr>
								<th colspan="7">스톤정보</th> 
							</tr>
							<tr>
								<th class="text-center border-right">No</th> 
								<th class="text-center border-right">구분</th>
								<th class="text-center border-right">스톤명</th>
								<th class="text-center border-right">알수</th>
								<th class="text-center border-right">구매단가</th>
								<th class="text-center border-right">합계</th>
								<th class="text-center">스톤설명</th>
							</tr>
						</thead>
						<tbody id="stonelist">
						</tbody>
					</table>
				</div>

				<div class="btn_wrap text-center">
	        <a href="javascript: void(0);" onclick="fncModify(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
	        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
	    	</div>
				<nav aria-label="Page navigation" class="text-center">
			    <ul class="pagination"></ul>
				</nav>
			</form>
		</div>
	</div>
	
	<script>
		/*<![CDATA[*/
			$(document).ready(function(){
				find();
			});
		
			function find() {
				
				const catalogno = '${catalogno}';
				if ( !catalogno ) {
		    	return false;
		    }
				
				fetch(`/api/catalog/${catalogno}`).then(response => {
		    	if (!response.ok) {
						throw new Error('Request failed...');
			    }
		    	return response.json();
		
		   	}).then(json => {
		   		const form = document.getElementById('form');
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
		   		form.preview.src = 'https://yourjewelrybucket.s3.ap-northeast-2.amazonaws.com/'+filepath+'/'+filenm;
		   		form.vender_no.value = checkNullVal(json.venderno);
		   		form.vender_nm.value = checkNullVal(json.vendernm);
		   		form.model_id.value = checkNullVal(json.modelid);
		   		form.model_nm.value = checkNullVal(json.modelnm);
		   		form.stdd_material_cd.value = checkNullVal(json.stddmaterialcd);
		   		form.stdd_weight.value = checkNullVal(json.stddweight);
		   		form.stdd_color_cd.value = checkNullVal(json.stddcolorcd);
		   		form.stdd_size.value = checkNullVal(json.stddsize);
		   		form.odr_notice.value = checkNullVal(json.odrnotice);
		   		form.reg_dt.value = checkSubstringNullVal(json.regdt,0,10);
		   		form.basic_idst.value = checkNullVal(json.basicidst);
		   		form.main_price.value = checkNullVal(json.mainprice);
		   		form.sub_price.value = checkNullVal(json.subprice);
		   		form.total_price.value = checkNullVal(json.totalprice);
		   		
		   		var stonelist = json.stonelist;
		   		var html = ``;
		   		if(stonelist == null || stonelist.length == 0){
		   			for(var i = 1 ; i <= 5 ; i++){
			   			html += `
								<tr>
									<td class="text-center border-right">`+i+`</td>
									<td class="text-center border-right">
										<select name="stone_type_cd_arr" id="stone_type_cd_`+i+`" class="form-control mtb5">
											<option value="">선택</option>
											<c:forEach var="ttlist" items="${ttlist}">
												<option value="${ttlist.cdid}">${ttlist.cdnm}</option>
											</c:forEach>
										</select>
									</td>
									<td class="text-center border-right">
										<input type="text" name="stone_nm_arr" id="stone_nm_`+i+`" class="form-control mtb5" maxlength="50"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="bead_cnt_arr" id="bead_cnt_`+i+`" class="form-control mtb5 beadcnt" min="0"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="purchase_price_arr" id="purchase_price_`+i+`" class="form-control mtb5 purchaseprice" min="0"/>
									</td>
									<td class="text-center border-right">
										<input type="text" class="form-control mtb5 totalpurchaseprice" readonly="readonly"/>
									</td>
									<td class="text-center">
										<input type="text" name="stone_desc_arr" id="ston_desc_`+i+`" class="form-control mtb5" maxlength="500"/>
									</td>
								</tr>
							`;
		   			}
		   			html += `
							<tr>
								<td colspan="3" class="text-right border-right border-bottom">소계</td>
								<td id="total_bead_cnt_txt" class="bg-yellow text-center border-right border-bottom"></td>
								<td class="border-right border-bottom"></td>
								<td id="total_price_txt" class="bg-yellow text-center border-right border-bottom"></td>
								<td class="border-bottom"></td>
							</tr>
		   			`;
		   		}
		   		else {
						
		   			var total_bead_cnt = 0;
		   			var total_purchase_price = 0;
			   		for(var i = 0 ; i < 10 ; i++){
			   			if(i <= stonelist.length-1){
				   			bead_cnt = Number(stonelist[i].beadcnt);
				   			purchase_price_sum = (Number(stonelist[i].beadcnt)*Number(stonelist[i].purchaseprice));
				   			html += `
				   				<tr>
										<td class="text-center border-right">`+(i+1)+`</td>
										<td class="text-center border-right">
											<select name="stone_type_cd_arr" class="form-control mtb5">
												<option value="">선택</option>
													<c:forEach var="ttlist" items="${ttlist}">
								`;
								stone_type_cd_check = '';
								if(checkNullVal(stonelist[i].stonetypecd) != '' && '${ttlist.cdid}' == checkNullVal(stonelist[i].stonetypecd)){
									stone_type_cd_check = 'selected';
								}
								html += `
													<option value="${ttlist.cdid}" `+stone_type_cd_check+`>${ttlist.cdnm}</option>
												</c:forEach>
											</select>
										</td>
										<td class="text-center border-right">
											<input type="text" name="stone_nm_arr" class="form-control mtb5" value="`+checkNullVal(stonelist[i].stonenm)+`" maxlength="50"/>
										</td>
										<td class="text-center border-right">
											<input type="number" name="bead_cnt_arr" class="form-control mtb5 beadcnt" value="`+checkNullVal(bead_cnt)+`" min="0"/>
										</td>
										<td class="text-center border-right">
											<input type="number" name="purchase_price_arr" class="form-control mtb5 purchaseprice" value="`+checkNullVal(stonelist[i].purchaseprice)+`" min="0"/>
										</td>
										<td class="text-center border-right">
											<input type="text" class="form-control mtb5 totalpurchaseprice" value="`+purchase_price_sum+`" readonly="readonly"/>
										</td>
										<td class="text-center">
											<input type="text" name="stone_desc_arr" class="form-control mtb5" value="`+checkNullVal(stonelist[i].stonedesc)+`" maxlength="500"/>
										</td>
									</tr>
				   			`;
				   			total_bead_cnt += bead_cnt;
				   			total_purchase_price += purchase_price_sum;
			   			}
			   			else {
			   				html += `
				   				<tr>
										<td class="text-center border-right">`+(i+1)+`</td>
										<td class="text-center border-right">
											<select name="stone_type_cd_arr" id="stone_type_cd_`+i+`" class="form-control mtb5">
												<option value="">선택</option>
												<c:forEach var="ttlist" items="${ttlist}">
													<option value="${ttlist.cdid}">${ttlist.cdnm}</option>
												</c:forEach>
											</select>
										</td>
										<td class="text-center border-right">
											<input type="text" name="stone_nm_arr" id="stone_nm_`+i+`" class="form-control mtb5" maxlength="50"/>
										</td>
										<td class="text-center border-right">
											<input type="number" name="bead_cnt_arr" id="bead_cnt_`+i+`" class="form-control mtb5 beadcnt" min="0"/>
										</td>
										<td class="text-center border-right">
											<input type="number" name="purchase_price_arr" id="purchase_price_`+i+`" class="form-control mtb5 purchaseprice" min="0"/>
										</td>
										<td class="text-center border-right">
											<input type="text" class="form-control mtb5 totalpurchaseprice" readonly="readonly"/>
										</td>
										<td class="text-center">
											<input type="text" name="stone_desc_arr" id="ston_desc_`+i+`" class="form-control mtb5" maxlength="500"/>
										</td>
									</tr>
								`;
			   			}
			   		}
			   		html += `
							<tr>
								<td colspan="3" class="text-right border-right border-bottom">소계</td>
								<td id="total_bead_cnt_txt" class="bg-yellow text-center border-right border-bottom">`+(total_bead_cnt == 0 ? '' : total_bead_cnt)+`</td>
								<td class="border-right border-bottom"></td>
								<td id="total_price_txt" class="bg-yellow text-center border-right border-bottom">`+(total_purchase_price == 0 ? '' : total_purchase_price)+`</td>
								<td class="border-bottom"></td>
							</tr>
			   		`;
		   		}
		   		document.getElementById('stonelist').innerHTML = html;
		   		addStoneListener();
		   		
		   	}).catch(error => {
		    	alert('카다로그 정보를 찾을 수 없습니다.');
		    	/* fncParentRefresh();
		    	fncClose(); */
		   	});
			}
				
			function readURL(obj) {
			  if (obj.files && obj.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      document.getElementById('preview').src = e.target.result;
			    };
			    reader.readAsDataURL(obj.files[0]);
			    document.getElementById('file-label').innerHTML = obj.files[0].name;
			  } else {
			    document.getElementById('preview').src = "";
			    document.getElementById('file-label').innerHTML = '파일 첨부하기';
			  }
			}

			function fncModify(){
				/* if( !isValid() ){
					return false;
				} */
				const fileField = document.querySelector('input[type="file"]');
				const form = document.getElementById('form');
				const writeForm = new FormData(form);

				const formData = new FormData();
				$(".form-data").each(function(){
					formData.append($(this).attr("name"), checkNullVal($(this).val()));
				});
				$("select[name=stone_type_cd_arr]").each(function(){
					formData.append("stone_type_cd_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=stone_nm_arr]").each(function(){
					formData.append("stone_nm_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=bead_cnt_arr]").each(function(){
					formData.append("bead_cnt_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=purchase_price_arr]").each(function(){
					formData.append("purchase_price_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=stone_desc_arr]").each(function(){
					formData.append("stone_desc_arr[]", checkNullVal($(this).val()));
				});
				//배열 데이터 넣기
				formData.append("file", fileField.files[0]);
								
				fetch('/api/catalog/modify/${catalogno}', {
					method: 'PATCH',
					body: formData
				}).then(response => {
					if(!response.ok){
						throw new Error('Request Failed...');
					}
					alert('수정되었습니다.');
					window.opener.findAll();
					fncClose();
				}).catch(error => {
					alert('오류가 발생하였습니다.');
				});
			}
			
			function addStoneListener(){
				$('.beadcnt').on('change keyup', function() {
					
					$("#total_bead_cnt").text('');
					$("#total_price").text('');
					
					var totalprice = 0;
					var totalbeadcnt = 0;
					
					$(".beadcnt").each(function(idx){
						var breadcnt = Number($(this).val() == '' ? '0' : $(this).val());
						var purchaseprice = Number($(".purchaseprice").eq(idx).val() == '' ? '0' : $(".purchaseprice").eq(idx).val());
						
						var totalpurchaseprice = (breadcnt*purchaseprice) == 0 ? '' : ((breadcnt*purchaseprice)+'');
						$(".totalpurchaseprice").eq(idx).val(totalpurchaseprice);
						
						totalprice += Number(totalpurchaseprice);
						
						if(breadcnt >= 0){
							totalbeadcnt += breadcnt
						}
					});
					$("#total_bead_cnt_txt").text(totalbeadcnt == 0 ? '' : (totalbeadcnt+''));
					$("#total_price_txt").text(totalprice == 0 ? '' : (totalprice+''));
		    });
				
				$('.purchaseprice').on('change keyup', function() {
					
					$("#total_price").text('');
					
					var totalprice = 0;
					
					$(".purchaseprice").each(function(idx){
						var breadcnt = Number($(".beadcnt").eq(idx).val() == '' ? '0' : $(".beadcnt").eq(idx).val());
						var purchaseprice = Number($(this).val() == '' ? '0' : $(this).val());
						
						var totalpurchaseprice = (breadcnt*purchaseprice) == 0 ? '' : ((breadcnt*purchaseprice)+'');
						$(".totalpurchaseprice").eq(idx).val(totalpurchaseprice);
						
						totalprice += Number(totalpurchaseprice);
						
					});
					$("#total_price_txt").text(totalprice == 0 ? '' : (totalprice+''));
		    });
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