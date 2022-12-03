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
							<col />
							<col width="23%"/>
							<col width="23%"/>
							<col width="23%"/>
						</colgroup>
						<tbody>
							<tr>
								<td rowspan="4" class="text-center border-right">
									<label for="file" id="file-label"><img src="/img/no-image.png" id="preview" width="300px" height="250px"/></label>
									<input type="file" name="file" id="file" class="custom-file-input" onchange="readURL(this);" style="display:none;"/>
								</td>
								<td class="bg-light border-right text-center">매장<span class="important"> *</span></td>
								<td class="bg-light border-right text-center">접수일<span class="important"> *</span></td>
								<td class="bg-light text-center">주문예정일<span class="important"> *</span></td>
							</tr>
							<tr>
								<td class="text-center border-right mtb5">
									<select name="store_cd" id="store_cd" class="form-control form-data">
										<c:forEach var="stlist" items="${stlist}">
											<option value="${stlist.cdid}">${stlist.cdnm}</option>
										</c:forEach>
									</select>
								</td>
								<td class="text-center border-right">
									<input type="date" name="receipt_dt" id="receipt_dt" class="form-control form-data mtb5" value="${today}" maxlength="10"/>
								</td>
								<td class="text-center">
									<input type="date" name="expected_ord_dt" id="expected_ord_dt" class="form-control form-data mtb5" value="${today}" maxlength="10"/>
								</td>
							</tr>
							<tr>
								<td class="bg-light border-right text-center">고객코드<span class="important"> *</span></td>
								<td class="bg-light border-right text-center">고객명</td>
								<td class="bg-light text-center">연락처</td>
							</tr>
							<tr class="border-bottom">
								<td class="text-center border-right">
									<div class="input-group-append">
										<input type="text" name="customer_no" id="customer_no" class="form-control form-data mtb5" readonly="readonly"/>
										<i class="fas fa-search fa-sm ml5 mt15" onclick="fncCustomerListPop(); return false;"></i>
									</div>
								</td>
								<td class="text-center border-right">
									<input type="text" name="customer_nm" id="customer_nm" class="form-control form-data mtb5" readonly="readonly"/>
								</td>
								<td class="text-center">
									<input type="text" name="customer_cel" id="customer_cel" class="form-control form-data mtb5" readonly="readonly"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="table-responsive clearfix mt-3">
					<table class="table">
						<colgroup>
							<col width="3%"/>
							<col width="4%"/>
							<col width="9%"/>
							<col width="9%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="9%"/>
							<col width="6%"/>
							<col width="6%"/>
							<col width="8%"/>
							<col />
						</colgroup>
						<thead>
							<tr>
								<th rowspan="2" class="text-center border-right">No</th> 
								<th rowspan="2" class="text-center border-right">취소</th>
								<th rowspan="2" class="text-center border-right">시리얼</th>
								<th rowspan="2" class="text-center border-right">모델<br/>번호</th>
								<th rowspan="2" class="text-center border-right">제조사</th>
								<th rowspan="2" class="text-center border-right">재질</th>
								<th rowspan="2" class="text-center border-right">색상</th>
								<th rowspan="2" class="text-center border-right">수량</th>
								<th colspan="2" class="text-center border-right">스톤</th>
								<th rowspan="2" class="text-center border-right">사이즈</th>
								<th rowspan="2" class="text-center">주문 설명</th>
							</tr>
							<tr>
								<th class="text-center border-right">메인</th>
								<th class="text-center border-right">보조</th>
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
										<input type="text" name="serial_id_arr" id="serial_id_${idx}" class="form-control mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="hidden" name="catalog_no_arr" id="catalog_no_${idx}" class="form-data"/>
										<div class="input-group-append">
											<input type="text" name="model_id_arr" id="model_id_${idx}" class="form-control mtb5 beadcnt" readonly="readonly"/>
											<i class="fas fa-search fa-sm ml5 mt15" onclick="fncCatalogListPop('${idx}'); return false;"></i>
										</div>
									</td>
									<td class="text-center border-right">
										<input type="hidden" name="vender_no_arr" id="vender_no_${idx}" class="form-data"/>
										<div class="input-group-append">
											<input type="text" name="vender_nm_arr" id="vender_nm_${idx}" class="form-control mtb5 beadcnt" readonly="readonly"/>
											<i class="fas fa-search fa-sm ml5 mt15" onclick="fncVenderListPop('${idx}'); return false;"></i>
										</div>
									</td>
									<td class="text-center border-right">
										<select name="material_cd_arr" id="material_cd_${idx}" class="form-control mtb5">
											<option value="">선택</option>
											<c:forEach var="smlist" items="${smlist}">
												<option value="${smlist.cdid}">${smlist.cdnm}</option>
											</c:forEach>
										</select>
									</td>
									<td class="text-center border-right">
										<select name="color_cd_arr" id="color_cd_${idx}" class="form-control mtb5">
											<option value="">선택</option>
											<c:forEach var="sclist" items="${sclist}">
												<option value="${sclist.cdid}">${sclist.cdnm}</option>
											</c:forEach>
										</select>
									</td>
									<td class="text-center border-right">
										<input type="number" name="quantity_arr" id="quantity_${idx}" class="form-control mtb5" value="1" min="1"/>
									</td>
									<td class="text-center border-right">
										<input type="text" name="main_stone_type_arr" id="main_stone_type_${idx}" class="form-control mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="text" name="sub_stone_type_arr" id="sub_stone_type_${idx}" class="form-control mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="text" name="size_arr" id="size_${idx}" class="form-control mtb5" maxlength="20"/>
									</td>
									<td class="text-center border-right">
										<input type="text" name="order_desc_arr" id="order_desc_${idx}" class="form-control mtb5" maxlength="500"/>
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
					alert('매장을 선택해주세요.');
					$("#store_cd").focus();
					return false;
				}
				if($("#receipt_dt").val() == ''){
					alert('접수일을 입력해주세요.');
					$("#receipt_dt").focus();
					return false;
				}
				if($("#expected_ord_dt").val() == ''){
					alert('주문예정일을 입력해주세요.');
					$("#expected_ord_dt").focus();
					return false;
				}
				if($("#customer_no").val() == ''){
					alert('고객을 선택해주세요.');
					$("#customer_no").focus();
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
				formData.append("order_type", "CUSTOMER");
				formData.append("order_step", "A");
				$(".form-data").each(function(){
					formData.append($(this).attr("name"), checkNullVal($(this).val()));
				});
				$("input[name=serial_id_arr]").each(function(){
					formData.append("serial_id_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=catalog_no_arr]").each(function(){
					formData.append("catalog_no_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=model_id_arr]").each(function(){
					formData.append("model_id_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=vender_no_arr]").each(function(){
					formData.append("vender_no_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=vender_nm_arr]").each(function(){
					formData.append("vender_nm_arr[]", checkNullVal($(this).val()));
				});
				$("select[name=material_cd_arr]").each(function(){
					formData.append("material_cd_arr[]", checkNullVal($(this).val()));
				});
				$("select[name=color_cd_arr]").each(function(){
					formData.append("color_cd_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=quantity_arr]").each(function(){
					formData.append("quantity_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=main_stone_type_arr]").each(function(){
					formData.append("main_stone_type_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=sub_stone_type_arr]").each(function(){
					formData.append("sub_stone_type_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=size_arr]").each(function(){
					formData.append("size_arr[]", checkNullVal($(this).val()));
				});
				$("input[name=order_desc_arr]").each(function(){
					formData.append("order_desc_arr[]", checkNullVal($(this).val()));
				});
				//배열 데이터 넣기
				formData.append("file", fileField.files[0]);
								
				fetch('/api/order/write', {
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
			
			function fncValueInit(idx){
				$("#catalog_no_"+idx).val('');
				$("#model_id_"+idx).val('');
				$("#vender_no_"+idx).val('');
				$("#vender_nm_"+idx).val('');
				$("#serial_id_"+idx).val('');
				$("#material_cd_"+idx).val('');
				$("#color_cd_"+idx).val('');
				$("#quantity_"+idx).val('1');
				$("#main_stone_type_"+idx).val('');
				$("#sub_stone_type_"+idx).val('');
				$("#size_"+idx).val('');
				$("#order_desc_"+idx).val('');
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
			
			function fncClose(){
				self.close();
			}
		/*]]>*/
	    </script>
</body>
</html>