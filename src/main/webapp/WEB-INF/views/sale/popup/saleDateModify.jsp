<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>거래일 변경</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">거래일 변경</h6>
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
								<td class="bg-light border-right text-center">거래일<span class="important"> *</span></td>
								<td rowspan="2" class="text-center border-right">
					        <input type="date" name="sale_dt" id="sale_dt" class="form-control form-data" maxlength="10"/>
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
			  if($("#sale_dt").val() == ''){
				  alert('변경할 거래일을 선택해주세요.');
				  $("#sale_dt").focus();
				  return false;
			  }
				if(confirm('변경하시겠습니까?')){
					var salesno = '${salesno}';
					var sale_arr = orderno.split(',');
					
					const formData = new FormData();
					$(".form-data").each(function(){
						formData.append($(this).attr("name"), checkNullVal($(this).val()));
					});
					for(var i = 0 ; i < order_no_arr.length ; i++){
						formData.append('sale_arr[]',order_no_arr[i]);
					}
					fetch('/api/order/step/modify', {
						method: 'PATCH',
						body: formData
					}).then(response => {
						if(!response.ok){
							throw new Error('Request Failed...');
						}
						alert('변경되었습니다.');
						window.opener.refresh();
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