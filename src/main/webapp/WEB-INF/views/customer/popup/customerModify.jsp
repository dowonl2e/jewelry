<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 수정</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">고객 수정</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal m10">
				<div class="table-responsive clearfix">
					<table class="table">
						<colgroup>
							<col width="10%;"/>
							<col width="10%;"/>
							<col />
							<col width="10%;"/>
							<col />
							<col />
							<col width="10%;"/>
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th rowspan="2" class="text-center border-right">관리매장</th>
								<th colspan="4" class="text-center border-right">등록일<span class="important"> *</span></th>
								<th colspan="3" class="text-center">매장<span class="important"> *</span></th>
							</tr>
							<tr>
								<td colspan="4" class="border-right"><input type="date" id="reg_dt" class="form-control"/></td>
								<td colspan="3" class="text-center">
									<select id="store_cd" class="form-control">
				            <c:forEach var="stlist" items="${stlist}">
				            	<option value="${stlist.cdid}">${stlist.cdnm}</option>
				            </c:forEach>
					        </select>
								</td>
							</tr>
							<tr>
								<th rowspan="2" class="text-center border-right">구분</th>
								<th colspan="7" class="text-center border-right">계약구분<span class="important"> *</span></th>
							</tr>
							<tr>
								<td colspan="7" class="text-center">
									<select id="contract_cd" class="form-control">
				            <c:forEach var="ctlist" items="${ctlist}">
				            	<option value="${ctlist.cdid}">${ctlist.cdnm}</option>
				            </c:forEach>
					        </select>
								</td>
							</tr>
							<tr>
								<th rowspan="2" class="border-right">고객</th>
								<th></th>
								<th>이름</th>
								<th>성별</th>
								<th>연락처</th>
								<th>생일</th>
								<th>음력</th>
								<th>이메일</th>
							</tr>
							<tr>
								<th class="border-right">계약고객</th>
								<td class="border-right"><input type="text" id="contractor_nm" class="form-control"/></td>
								<td class="border-right">
									<select id="contractor_gen" class="form-control">
										<option value=""></option>
										<option value="남">남</option>
										<option value="여">여</option>
									</select>
								</td>
								<td class="border-right"><input type="text" id="contractor_cel" class="form-control"/></td>
								<td class="border-right"><input type="date" id="contractor_birth" class="form-control"/></td>
								<td class="border-right">
									<select id="contractor_lunar" class="form-control">
										<option value=""></option>
										<option value="Y">Y</option>
										<option value="N">N</option>
									</select>
								</td>
								<td><input type="text" id="contractor_email" class="form-control"/></td>
							</tr>
							<tr>
								<th rowspan="3" class="border-right">주소</th>
								<th class="border-right">우편번호</th>
								<td colspan="6"><input type="text" id="zipcode" class="form-control" style="width: 100px;"/></td>
							</tr>
							<tr>
								<th class="border-right">기본주소</th>
								<td colspan="6"><input type="text" id="address1" class="form-control"/></td>
							</tr>
							<tr>
								<th class="border-right">나머지</th>
								<td colspan="6"><input type="text" id="address2" class="form-control"/></td>
							</tr>
							<tr>
								<th class="border-right border-bottom">비고</th>
								<td colspan="7" class="border-bottom">
									<textarea id="etc" class="form-control"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap text-center">
		        <a href="javascript: void(0);" onclick="modify(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
		        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
		    	</div>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		/*<![CDATA[*/
			window.onload = () => {
				find();
	  	}
			
			function find() {
				
				const customerno = '${customerno}';
				if ( !customerno ) {
		    	return false;
		    }
				
				fetch(`/api/customer/${customerno}`).then(response => {
		    	if (!response.ok) {
						throw new Error('Request failed...');
			    }
		    	return response.json();
		
		   	}).then(json => {
		   		const form = document.getElementById('form');
		   		form.reg_dt.value = checkSubstringNullVal(json.regdt,0,10);
		   		form.store_cd.value = checkNullVal(json.storecd);
		   		form.contract_cd.value = checkNullVal(json.contractcd);
		   		form.contractor_nm.value = checkNullVal(json.contractornm);
		   		form.contractor_gen.value = checkNullVal(json.contractorgen);
		   		form.contractor_cel.value = checkNullVal(json.contractorcel);
		   		form.contractor_birth.value = checkSubstringNullVal(json.contractorbirth,0,10);
		   		form.contractor_lunar.value = checkNullVal(json.contractorlunar);
		   		form.contractor_email.value = checkNullVal(json.contractoremail);
		   		form.zipcode.value = checkNullVal(json.zipcode);
		   		form.address1.value = checkNullVal(json.address1);
		   		form.address2.value = checkNullVal(json.address2);
		   		form.etc.value = checkNullVal(json.etc);
		   		
		   	}).catch(error => {
		    	alert('고객정보를 찾을 수 없습니다.');
		    	window.opener.findAll();
		    	fncClose();
		   	});
			}
			
			function modify(){

				if($("#reg_dt").val() == ''){
					alert('등록일을 입력해주세요.');
					$("#reg_dt").focus();
					return false;
				}
				if($("#store_cd").val() == ''){
					alert('매장을 선택해주세요.');
					$("#store_cd").focus();
					return false;
				}
				if($("#contract_cd").val() == ''){
					alert('계약구분을 선택해주세요.');
					$("#contract_cd").focus();
					return false;
				}
				
				const form = document.getElementById('form');
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

				const customerno = '${customerno}';
				
				fetch(`/api/customer/${customerno}`, {
					method: 'PATCH',
					headers: {
						'Content-Type': 'application/json',
					},
					body: JSON.stringify(params)
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
			
			//고객 삭제
			function remove() {
				
  	  	const customerno = '${customerno}';

      	if ( !confirm(`고객을 삭제하시겠습니까?`) ) {
      		return false;
      	}

      	fetch(`/api/customer/${customerno}`, {
					method: 'DELETE',
        	headers: { 'Content-Type': 'application/json' },

      	}).then(response => {
      		if (!response.ok) {
         		throw new Error('Request failed...');
        	}

        	alert('삭제되었습니다.');
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