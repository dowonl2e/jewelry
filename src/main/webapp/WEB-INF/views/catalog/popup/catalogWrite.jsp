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
						<input type="file" id="file" class="custom-file-input" onchange="readURL(this);" style="display:none;"/>
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
						<input type="text" id="vender_id" class="form-control mtb5" readonly="readonly"/>
					</div>
					<div class="col border-right">
						<input type="text" id="model_id" class="form-control mtb5"/>
					</div>
					<div class="col">
						<input type="text" id="model_nm" class="form-control mtb5"/>
					</div>
				</div>
				<div class="row row-cols-3 border-bottom text-center">
					<div class="col bg-light border-right">표준재질</div>
					<div class="col bg-light border-right">표준중량(g)</div>
					<div class="col bg-light">표준색상</div>
				</div>
				<div class="row row-cols-3 border-bottom text-center">
					<div class="col border-right">
						<select id="" class="form-control mtb5">
							<option value="stdd_material_cd">선택</option>
							<c:forEach var="smlist" items="${smlist}">
								<option value="${smlist.cdid}">${smlist.cdnm}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col border-right">
						<input type="text" id="stdd_weight" class="form-control mtb5" maxlength="10"/>
					</div>
					<div class="col">
						<select id="stdd_color_cd" class="form-control mtb5">
							<option value="">선택</option>
							<c:forEach var="smlist" items="${smlist}">
								<option value="${smlist.cdid}">${smlist.cdnm}</option>
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
						<input type="text" id="stdd_size" class="form-control mtb5" maxlength="20"/>
					</div>
					<div class="col border-right">
						<input type="text" id="odr_notice" class="form-control mtb5" maxlength="500"/>
					</div>
					<div class="col">
						<input type="date" id="reg_dt" class="form-control mtb5" maxlength="10"/>
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
						<input type="text" id="basic_idst" class="form-control mtb5" maxlength="50"/>
					</div>
					<div class="col border-right">
						<input type="text" id="main_price" class="form-control mtb5" readonly="readonly" maxlength="10"/>
					</div>
					<div class="col border-right">
						<input type="text" id="sub_price" class="form-control mtb5" readonly="readonly" maxlength="10"/>
					</div>
					<div class="col border-right">
						<input type="text" id="total_price" class="form-control mtb5" readonly="readonly" maxlength="10"/>
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
							<c:forEach var="idx" begin="1" end="5">
								<tr>
									<td class="text-center border-right">${idx}</td>
									<td class="text-center border-right">
										<select name="stone_type" id="stone_type" class="form-control mtb5">
											<option value="">선택</option>
										</select>
									</td>
									<td class="text-center border-right">
										<input type="text" name="stone_nm" id="stone_nm" class="form-control mtb5" maxlength="50"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="bead_cnt" id="bead_cnt" class="form-control mtb5 beadcnt" min="0"/>
									</td>
									<td class="text-center border-right">
										<input type="number" name="purchase_price" id="purchase_price" class="form-control mtb5 purchaseprice" min="0"/>
									</td>
									<td class="text-center border-right">
										<input type="text" class="form-control mtb5 totalpurchaseprice" readonly="readonly"/>
									</td>
									<td class="text-center">
										<input type="text" name="ston_desc" id="ston_desc" class="form-control mtb5" maxlength="500"/>
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
				<nav aria-label="Page navigation" class="text-center">
			    <ul class="pagination"></ul>
				</nav>
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
			
			function fncChangeBeadCnt(obj){
				
			}
		
			function fncSave(){
				/* if( !isValid() ){
					return false;
				} */

				const form = document.getElementById('form');
				
				const payload = new FormData(form);
				console.log([...payload]);
				
				
				return;
				const params = {
						reg_dt : form.reg_dt.value,
						store_cd : form.store_cd.value,
						contract_cd : form.contract_cd.value,
						contractor_nm : form.contractor_nm.value,
						contractor_gen : form.contractor_gen.value,
						contractor_cel : form.contractor_cel.value,
						contractor_birth : form.contractor_birth.value,
						contractor_lunar : form.contractor_lunar.value,
						contractor_email : form.contractor_email.value,
						zipcode : form.zipcode.value,
						address1 : form.address1.value,
						address2 : form.address2.value,
						etc : form.etc.value
				};
				
				fetch('/api/customer/write', {
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
			
			function goList(){
				location.href = '/code/list' + location.search;
			}
			
			function fncClose(){
				self.close();
			}
		/*]]>*/
	    </script>
</body>
</html>