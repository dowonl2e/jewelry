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
								<th colspan="3" class="text-center border-right">거래처 별명</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center" id="vender_nm_td"></td>
							</tr>
							<tr>
								<th rowspan="4" class="text-center border-right">사업자</th>
								<th colspan="3" class="text-center border-right">사업자명</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center" id="business_nm_td"></td>
							</tr>
							<tr>
								<th colspan="3" class="text-center">대표자 연락처</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center" id="agent_cel_td"></td>
							</tr>
							<tr>
								<th rowspan="4" class="text-center border-right">옵션</th>
								<th colspan="3" class="text-center border-right">매입해리</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center" id="melt_cd_td"></td>
							</tr>
							<tr>
							<th colspan="3" class="text-center">부가세 적용률</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center" id="vat_cd_td"></td>
							</tr>
							<tr>
								<th rowspan="2" class="text-center border-right">연락처</th>
								<th colspan="1" class="text-center border-right">전화번호1</th>
								<th colspan="1" class="text-center border-right">전화번호2</th>
								<th colspan="1" class="text-center">팩스번호</th>
							</tr>
							<tr>
								<td colspan="1" class="text-center border-right" id="vender_cel1_td"></td>
								<td colspan="1" class="text-center border-right" id="vender_cel2_td"></td>
							  <td colspan="1" class="text-center" id="vender_fax_td"></td>
							</tr>
							<tr>
								<th rowspan="2" class="text-center border-right">담당자</th>
								<th colspan="1" class="text-center border-right">이름</th>
								<th colspan="1" class="text-center border-right">핸드폰</th>
								<th colspan="1" class="text-center">이메일</th>
							</tr>
							<tr>
								<td colspan="1" class="text-center" id="manager_nm_td"></td>
								<td colspan="1" class="text-center" id="manager_cel_td"></td>
							  <td colspan="1" class="text-center" id="manager_email_td"></td>
							</tr>
							<tr>
							  <th rowspan="1" class="text-center border-right">통상처</th>
							  <td colspan="3" class="text-center" id="commerce_td"></td>
							</tr>
							
							<tr>
								<th class="border-right border-bottom">비고</td>
								<td colspan="3" class="border-bottom" id="etc_td"></td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap text-center">
						<c:if test="${sessionScope.MODIFY_AUTH eq 'Y'}">
		        	<a href="javascript: void(0);" onclick="goModify(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
		        </c:if>
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
				
				const venderno = '${venderno}';
				if ( !venderno ) {
		    	return false;
		    }
				
				fetch(`/api/vender/${venderno}`).then(response => {  //response에 VenderVO가 있다?
		    	if (!response.ok) {
						throw new Error('Request failed...');
			    }
		    	return response.json();
		
		   	}).then(json => {
		   		document.getElementById('vender_nm_td').innerHTML = checkNullVal(json.vendernm); // innerHTML이 갖고온 놈을 위에 태그의 id안에 뿌려준다.
		   		document.getElementById('business_nm_td').innerHTML = checkNullVal(json.businessnm);
		   		document.getElementById('agent_cel_td').innerHTML = checkNullVal(json.agentcel);
		   		document.getElementById('melt_cd_td').innerHTML = checkNullVal(codemap[checkNullVal(json.meltcd)]);
		   		document.getElementById('vat_cd_td').innerHTML = checkNullVal(codemap[checkNullVal(json.vatcd)]);
		   		document.getElementById('vender_cel1_td').innerHTML = checkNullVal(json.vendercel1);
		   		document.getElementById('vender_cel2_td').innerHTML = checkNullVal(json.vendercel2);
		   		document.getElementById('vender_fax_td').innerHTML = checkNullVal(json.venderfax);
		   		document.getElementById('manager_nm_td').innerHTML = checkNullVal(json.managernm);
		   		document.getElementById('manager_cel_td').innerHTML = checkNullVal(json.managercel);
		   		document.getElementById('manager_email_td').innerHTML = checkNullVal(json.manageremail);
		   		document.getElementById('commerce_td').innerHTML = checkNullVal(json.commerce);
		   		document.getElementById('etc_td').innerHTML = checkNullVal(json.etc);		   		
					
		   	}).catch(error => {
		    	alert('거래처 정보를 찾을 수 없습니다.');
		    	window.opener.findAll();
		   	});
			}
			
			function goModify() {
			  location.href = '/vender/popup/modify/${venderno}';
			}
						
			function fncClose(){
				self.close();
			}
		/*]]>*/
  </script>
</body>
</html>