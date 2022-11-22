<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 등록</title>
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
								<td colspan="3" class="text-center"> 거래처 갖고와야함</td>
<%-- 									<select id="contract_cd" class="form-control">
				            <c:forEach var="ctlist" items="${ctlist}">
				            	<option value="${ctlist.cdid}">${ctlist.cdnm}</option>
				            </c:forEach>
					        </select> --%>
							</tr>
							<tr>
								<th rowspan="4" class="text-center border-right">사업자</th>
								<th colspan="3" class="text-center border-right">사업자명</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center ">a</td>
							</tr>
							<tr>
								<th colspan="3" class="text-center">대표자 연락처</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center">b</td>
							</tr>
							<tr>
								<th rowspan="4" class="text-center border-right">옵션</th>
								<th colspan="3" class="text-center border-right">매입해리</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center">a</td>
							</tr>
							<tr>
							<th colspan="3" class="text-center">부가세 적용률</th>
							</tr>
							<tr>
								<td colspan="3" class="text-center">b</td>
							</tr>
							<tr>
								<th rowspan="2" class="text-center border-right">연락처</th>
								<th colspan="1" class="text-center border-right">전화번호1</th>
								<th colspan="1" class="text-center border-right">전화번호2</th>
								<th colspan="1" class="text-center">팩스번호</th>
							</tr>
							<tr>
								<td colspan="1" class="text-center">a</td>
								<td colspan="1" class="text-center">b</td>
							  <td colspan="1" class="text-center">c</td>
							</tr>
							<tr>
								<th rowspan="2" class="text-center border-right">담당자</th>
								<th colspan="1" class="text-center border-right">이름</th>
								<th colspan="1" class="text-center border-right">핸드폰</th>
								<th colspan="1" class="text-center">이메일</th>
							</tr>
							<tr>
								<td colspan="1" class="text-center">a</td>
								<td colspan="1" class="text-center">b</td>
							  <td colspan="1" class="text-center">c</td>
							</tr>
							<tr>
							  <th rowspan="1" class="text-center border-right">통상처</th>
							  <td colspan="3" class="text-center">d</td>
							</tr>
							
							<tr>
								<th class="border-right border-bottom">비고</th>
								<td colspan="3" class="border-bottom">
									<textarea id="etc" class="form-control"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap text-center">
		        <a href="javascript: void(0);" onclick="fncSave(); return false;" class="btn btn-primary waves-effect waves-light mlr5">등록</a>
		        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
		    	</div>
					<nav aria-label="Page navigation" class="text-center">
				    <ul class="pagination"></ul>
					</nav>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		/*<![CDATA[*/
			function fncSave(){
				/* if( !isValid() ){
					return false;
				} */
				
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