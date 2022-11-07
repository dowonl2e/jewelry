<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 추가</title>
</head>
<body>
	<div class="container-fluid">
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">코드등록</h6>
			</div>
			<form id="writeForm" class="form-horizontal">
				<div class="form-group row border-top">
					<div class="col-sm-3 text-right mt20">코드ID</div>
					<div class="col-sm-8 mt10">
						<input type="text" id="cd_id" class="form-control"/>
					</div>
				</div>
				<div class="form-group row border-top">
					<div class="col-sm-3 text-right mt20">코드명</div>
					<div class="col-sm-8 mt10">
						<input type="text" id="cd_nm" class="form-control"/>
					</div>
				</div>
	
				<div class="form-group row border-top">
					<div class="col-sm-3 text-right mt20">순번</div>
					<div class="col-sm-8 mt10">
						<input type="text" id="cd_ord" class="form-control"/>
					</div>
				</div>
				
				<div class="form-group row border-top border-bottom">
					<div class="col-sm-3 text-right mt10">사용여부</div>
					<div class="col-sm-8 mt10">
						<input type="radio" name="use_yn" id="use_yn_y" value="Y"/><label for="use_yn_y">&nbsp;사용</label>&nbsp;
						<input type="radio" name="use_yn" value="N"/><label for="use_yn_n">&nbsp;미사용</label>
					</div>
				</div>
				
				<div class="btn_wrap text-center mb-3">
					<button type="button" onclick="save(); return false;" class="btn btn-primary waves-effect waves-light">저장하기</button>
	    		<a href="javascript:void(0);" onclick="goList();" class="btn btn-default waves-effect waves-light">뒤로가기</a>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		/*<![CDATA[*/
			function save(){
				/* if( !isValid() ){
					return false;
				} */
				
				const form = document.getElementById('writeForm');
				const params = {
					cd_id : form.cd_id.value,
					cd_nm : form.cd_nm.value,
					cd_ord : form.cd_ord.value,
					use_yn : form.use_yn.value,
					up_cd_id : '00'
				};
				
				fetch('/api/code/write', {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json',
					},
					body: JSON.stringify(params)
				}).then(response => {
					if(!response.ok){
						throw new Error('Request Failed...');
					}
					console.log(response);
					alert('저장되었습니다.');
					location.href = '/code/list';
				}).catch(error => {
					alert('오류가 발생하였습니다.');
				});
			}
			
			function goList(){
				location.href = '/code/list' + location.search;
			}
		/*]]>*/
	    </script>
</body>
</html>