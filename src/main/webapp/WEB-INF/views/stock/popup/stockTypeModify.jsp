<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>재고구분 변경</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">재고구분 변경</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal">
				<div class="table-responsive clearfix">
					<table class="table">
						<colgroup>
							<col width="23%"/>
							<col />
						</colgroup>
						<tbody>
							<tr class="border-bottom">
								<td class="bg-light border-right text-center">재고구분<span class="important"> *</span></td>
								<td rowspan="2" class="text-center border-right">
					        <select name="stock_type_cd" id="stock_type_cd" class="form-control form-data">
										<option value="">선택</option>
										<c:forEach var="oc" items="${oclist}">
											<option value="${oc.cdid}">${oc.cdnm}</option>
										</c:forEach>
					        </select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="btn_wrap text-center">
	        <a href="javascript: void(0);" onclick="fncSave(); return false;" class="btn btn-primary waves-effect waves-light mlr5">저장</a>
	        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
	    	</div>
			</form>
		</div>
	</div>
	
	<script>
		/*<![CDATA[*/
			function fncSave(){
			  if($("#stock_type_cd").val() == ''){
				  alert('변경할 재고구분을 선택해주세요.');
				  $("#stock_type_cd").focus();
				  return false;
			  }
				if(confirm('변경하시겠습니까?')){
					var stocksno = '${param.stocksno}';
					var stock_no_arr = stocksno.split(',');
					const form = document.getElementById('form');
					const writeForm = new FormData(form);
	
					const formData = new FormData();
					$(".form-data").each(function(){
						formData.append($(this).attr("name"), checkNullVal($(this).val()));
					});
					
					for(var i = 0 ; i < stock_no_arr.length ; i++){
						formData.append('stock_no_arr[]',stock_no_arr[i]);
					}
					fetch('/api/stock/type/modify', {
						method: 'PATCH',
						body: formData
					}).then(response => {
						if(!response.ok){
							throw new Error('Request Failed...');
						}
						alert('변경되었습니다.');
						window.opener.findAll();
						fncClose();
					}).catch(error => {
						alert('오류가 발생하였습니다.');
					});
				}
			}
			
			function fncClose(){
				self.close();
			}
		/*]]>*/
	    </script>
</body>
</html>