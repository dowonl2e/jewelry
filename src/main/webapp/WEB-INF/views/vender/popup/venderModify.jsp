<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 등록</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">거래처 등록</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal m10">
				<div class="table-responsive clearfix">
					<table class="table">
						<colgroup>
							<col width="5%;"/>
							<col width="10%;"/>
							<col width="10%;"/>
							<col width="10%;"/>
						</colgroup>
						<tbody>
						   <tr>
								<th rowspan="2" class="text-center border-right">거래처</th>
								<th colspan="3" class="text-center border-right">거래처 별명<span class="important"> *</span></th>
							</tr>
							<tr>
								<td colspan="3" class="text-center"><input type ="text" id="vender_nm" class="form-control" value="" maxlength='40'/></td>
							</tr>
							<tr>
								<th rowspan="4" class="text-center border-right">사업자</th>
								<th colspan="3" class="text-center border-right">사업자명</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center "><input type ="text" id="business_nm" class="form-control" maxlength='40'/></td>
							</tr>
							<tr>
								<th colspan="3" class="text-center">대표자 연락처</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center"><input type ="text" id="agent_cel" class="form-control" maxlength='40'/></td>
							</tr>
							<tr>
								<th rowspan="4" class="text-center border-right">옵션</th>
								<th colspan="3" class="text-center border-right">매입해리</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center">
									<select id="melt_cd" class="form-control">
				            <c:forEach var="mtlist" items="${mtlist}">
				            	<option value="${mtlist.cdid}">${mtlist.cdnm}</option>
				            </c:forEach>
					        </select>
								</td>
							</tr>
							<tr>
							<th colspan="3" class="text-center">부가세 적용률</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center">
									<select id="vat_cd" class="form-control">
				            <c:forEach var="vtlist" items="${vtlist}">
				            	<option value="${vtlist.cdid}">${vtlist.cdnm}</option>
				            </c:forEach>
					        </select>	
								</td>
							</tr>
							<tr>
								<th rowspan="2" class="text-center border-right">연락처</th>
								<th colspan="1" class="text-center border-right">전화번호1</th>
								<th colspan="1" class="text-center border-right">전화번호2</th>
								<th colspan="1" class="text-center">팩스번호</th>
							</tr>
							<tr>
								<td colspan="1" class="text-center border-right"><input type ="text" id="vender_cel1" class="form-control" maxlength="13"/></td>
								<td colspan="1" class="text-center border-right"><input type ="text" id="vender_cel2" class="form-control" maxlength="13"/></td>
							  <td colspan="1" class="text-center"><input type ="text" id="vender_fax" class="form-control" maxlength="13"/></td>
							</tr>
							<tr>
								<th rowspan="2" class="text-center border-right">담당자</th>
								<th colspan="1" class="text-center border-right">이름</th>
								<th colspan="1" class="text-center border-right">핸드폰</th>
								<th colspan="1" class="text-center">이메일</th>
							</tr>
							<tr>
								<td colspan="1" class="text-center"><input type ="text" id="manager_nm" class="form-control" maxlength="40"/></td>
								<td colspan="1" class="text-center"><input type ="text" id="manager_cel" class="form-control" maxlength="13"/></td>
							  <td colspan="1" class="text-center"><input type ="text" id="manager_email" class="form-control" maxlength="40"/></td>
							</tr>
							<tr>
							  <th rowspan="1" class="text-center border-right">통상처</th>
							  <td colspan="3" class="text-center"><input type ="text" id="commerce" class="form-control" maxlength="100"/></td>
							</tr>
							
							<tr>
								<th class="border-right border-bottom">비고</td>
								<td colspan="3" class="border-bottom">
									<textarea id="etc" class="form-control" maxlength="650"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap text-center">
		        <a href="javascript: void(0);" onclick="fncModify(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
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
				
				const venderno = '${venderno}';
				if ( !venderno ) {
		    	return false;
		    }
				
				fetch(`/api/vender/${venderno}`).then(response => {  //response에 VenderVO가 있다? fetch는 기본적으로 get mapping.
		    	if (!response.ok) {
						throw new Error('Request failed...');
			    }
		    	return response.json();
		
		   	}).then(json => {
		   		const form = document.getElementById('form');
		   		
		   		form.vender_nm.value = checkNullVal(json.vendernm);
		   		form.business_nm.value = checkNullVal(json.businessnm);
		   		form.agent_cel.value = checkNullVal(json.agentcel);
		   		form.melt_cd.value = checkNullVal(json.meltcd);
		   		form.vat_cd.value = checkNullVal(json.vatcd);
		   		form.vender_cel1.value = checkNullVal(json.vendercel1);
		   		form.vender_cel2.value = checkNullVal(json.vendercel2);
		   		form.vender_fax.value = checkNullVal(json.venderfax);
		   		form.manager_nm.value = checkNullVal(json.managernm);
		   		form.manager_cel.value = checkNullVal(json.managercel);
		   		form.manager_email.value = checkNullVal(json.manageremail);
		   		form.commerce.value = checkNullVal(json.commerce);
		   		form.etc.value = checkNullVal(json.etc);
		   
		   	}).catch(error => {
		    	alert('거래처 정보를 찾을 수 없습니다.');
		    	window.opener.refresh();
		   	});
			}
			
			function fncModify(){ //update 실제로 치는 곳 (write와 같이 사용>form의 id로..)
				
					if($("#vendernm").val() == ''){
						
						alert('거래처 별명을 입력해주세요.');
						$("#vendernm").focus();
						return false;
					}					
					const form = document.getElementById('form');
					const params = {
						vender_nm : form.vender_nm.value,
						business_nm : form.business_nm.value,
						agent_cel : form.agent_cel.value,
						melt_cd : form.melt_cd.value,
						vat_cd : form.vat_cd.value,
						vender_cel1 : form.vender_cel1.value,
						vender_cel2 : form.vender_cel2.value,
						vender_fax : form.vender_fax.value,
						manager_nm : form.manager_nm.value,
						manager_cel : form.manager_cel.value,
						manager_email : form.manager_email.value,
						commerce : form.commerce.value,
						etc : form.etc.value
					};

					const customerno = '${venderno}';
					
					fetch(`/api/vender/${venderno}`, { //실행하는건데 url이 fetch 다음에.. PATCH 란 Mapping을 찾아서. stringfy해서 json으로 넘긴다.
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
						window.opener.refresh();
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