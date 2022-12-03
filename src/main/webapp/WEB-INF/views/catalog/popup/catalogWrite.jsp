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
						<input type="text" id="vender_nm" class="form-control mtb5" readonly="readonly"/>
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
					<div class="col bg-light border-right">기본공임</div>
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
						<tbody>
							<c:forEach var="idx" begin="1" end="10">
								<tr>
									<td class="text-center border-right">${idx}</td>
									<td class="text-center border-right">
										<select name="stone_type_cd_arr" id="stone_type_cd_${idx}" class="form-control mtb5">
											<option value="">선택</option>
											<c:forEach var="ttlist" items="${ttlist}">
												<option value="${ttlist.cdid}">${ttlist.cdnm}</option>
											</c:forEach>
										</select>
									</td>
									<td class="text-center border-right">
										<input type="text" name="stone_nm_arr" id="stone_nm_${idx}" class="form-control mtb5" maxlength="50"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="bead_cnt_arr" id="bead_cnt_${idx}" class="form-control mtb5 beadcnt" min="0"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="purchase_price_arr" id="purchase_price_${idx}" class="form-control mtb5 purchaseprice" min="0"/>
									</td>
									<td class="text-center border-right">
										<input type="text" class="form-control mtb5 totalpurchaseprice" readonly="readonly"/>
									</td>
									<td class="text-center">
										<input type="text" name="stone_desc_arr" id="ston_desc_${idx}" class="form-control mtb5" maxlength="500"/>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="3" class="text-right border-right border-bottom">소계</td>
								<td id="total_bead_cnt_txt" class="bg-yellow text-center border-right border-bottom"></td>
								<td class="border-right border-bottom"></td>
								<td id="total_price_txt" class="bg-yellow text-center border-right border-bottom"></td>
								<td class="border-bottom"></td>
							</tr>
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
				
			});
				
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

			function fncSave(){
				/* if( !isValid() ){
					return false;
				} */
				
				/* if($("#vender_no").val() == ''){
					alert('제조사를 선택해주세요.');
					$("#vender_nm").focus();
					return false;
				} */
				
				if($("#model_id").val() == ''){
					alert('모델번호를 입력해주세요.');
					$("#model_id").focus();
					return false;
				}

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
								
				fetch('/api/catalog/write', {
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
			
			function fncClose(){
				self.close();
			}
		/*]]>*/
	    </script>
</body>
</html>