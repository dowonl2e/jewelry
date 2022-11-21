<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수리 등록</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">수리 등록</h6>
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

				<div class="table-responsive clearfix">
					<table class="table">
						<colgroup>
							<col width="20%"/>
							<col width="30%"/>
							<col width="20%"/>
							<col width="30%"/>
						</colgroup>
						<tr>
							<th colspan="4">수리 정보</th>
						</tr>
						<tr>
							<th>수리품명<span class="important"> *</span></th>
							<td colspan="3"><input type="text" name="repair_nm" id="repair_nm" class="form-control form-data mtb5" maxlength="30"/></td>
						</tr>
						<tr>
							<th>수리요청일</th>
							<td><input type="date" name="repair_req_dt" id="repair_req_dt" class="form-control form-data mtb5" maxlength="10"/></td>
							<th>수리완료일</th>
							<td><input type="date" name="repair_res_dt" id="repair_res_dt" class="form-control form-data mtb5" maxlength="10"/></td>
						</tr>
						<tr class="border-bottom">
							<th>비고</th>
							<td colspan="3"><textarea name="repair_desc" id="repair_desc" class="form-control form-data mtb5" maxlength="800"></textarea></td>
						</tr>
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
				
				if($("#repair_nm").val() == ''){
					alert('수리품명을 입력해주세요.');
					$("#repair_nm").focus();
					return false;
				}

				const fileField = document.querySelector('input[type="file"]');
				const form = document.getElementById('form');
				const writeForm = new FormData(form);

				const formData = new FormData();
				$(".form-data").each(function(){
					formData.append($(this).attr("name"), checkNullVal($(this).val()));
				});
				//배열 데이터 넣기
				formData.append("file", fileField.files[0]);
								
				fetch('/api/repair/write', {
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