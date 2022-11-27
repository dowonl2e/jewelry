<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 추가</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">고객 등록</h6>
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
								<th colspan="4" class="text-center border-right">등록일</th>
								<th colspan="3" class="text-center">매장</th>
							</tr>
							<tr>
								<td colspan="4" class="border-right" id="reg_dt_td"></td>
								<td colspan="3" class="text-center" id="store_cd_td"></td>
							</tr>
							<tr>
								<th rowspan="2" class="text-center border-right">구분</th>
								<th colspan="7" class="text-center border-right">계약구분</th>
							</tr>
							<tr>
								<td colspan="7" class="text-center" id="contract_cd_td"></td>
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
								<td class="border-right text-center" id="contractor_nm_td"></td>
								<td class="border-right text-center" id="contractor_gen_td"></td>
								<td class="border-right text-center" id="contractor_cel_td"></td>
								<td class="border-right text-center" id="contractor_birth_td"></td>
								<td class="border-right text-center" id="contractor_lunar_td"></td>
								<td class="text-center" id="contractor_email_td"></td>
							</tr>
							<tr>
								<th rowspan="3" class="border-right">주소</th>
								<th class="border-right">우편번호</th>
								<td colspan="6" id="zipcode_td"></td>
							</tr>
							<tr>
								<th class="border-right">기본주소</th>
								<td colspan="6" id="address1_td"></td>
							</tr>
							<tr>
								<th class="border-right">나머지</th>
								<td colspan="6" id="address2_td"></td>
							</tr>
							<tr>
								<th class="border-right border-bottom">비고</th>
								<td colspan="7" class="border-bottom" id="etc_td"></td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap text-center">
		        <a href="javascript: void(0);" onclick="goModify(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
		        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
		    	</div>
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
		   		document.getElementById('reg_dt_td').innerHTML = checkSubstringNullVal(json.regdt,0,10);
		   		document.getElementById('store_cd_td').innerHTML = checkNullVal(codemap[checkNullVal(json.storecd)]);
		   		document.getElementById('contract_cd_td').innerHTML = checkNullVal(codemap[checkNullVal(json.contractcd)]);
		   		document.getElementById('contractor_nm_td').innerHTML = checkNullVal(json.contractornm);
		   		document.getElementById('contractor_gen_td').innerHTML = checkNullVal(json.contractorgen);
		   		document.getElementById('contractor_cel_td').innerHTML = checkNullVal(json.contractorcel);
		   		document.getElementById('contractor_birth_td').innerHTML = checkSubstringNullVal(json.contractorbirth,0,10);
		   		document.getElementById('contractor_lunar_td').innerHTML = checkNullVal(json.contractorlunar);
		   		document.getElementById('contractor_email_td').innerHTML = checkNullVal(json.contractoremail);
		   		document.getElementById('zipcode_td').innerHTML = checkNullVal(json.zipcode);
		   		document.getElementById('address1_td').innerHTML = checkNullVal(json.address1);
		   		document.getElementById('address2_td').innerHTML = checkNullVal(json.address2);
		   		document.getElementById('etc_td').innerHTML = checkNullVal(json.etc);
		   	}).catch(error => {
		    	alert('고객정보를 찾을 수 없습니다.');
		    	window.opener.findAll();
		    	fncClose();
		   	});
			}
			function goModify(){
				location.href = '/customer/popup/modify/${customerno}';	
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