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
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary" id="upcdnm"></h6>
		</div>
		<form id="form" class="form-horizontal">
			<div class="form-group row border-top">
				<div class="col-sm-3 text-right mt20">코드ID</div>
				<div class="col-sm-8 mt10">
					<input type="text" id="cd_id" class="form-control" oninput="fncChangeUpperCase(this);" maxlength="5" readonly="readonly"/>
				</div>
			</div>
			<div class="form-group row border-top">
				<div class="col-sm-3 text-right mt20">코드명</div>
				<div class="col-sm-8 mt10">
					<input type="text" id="cd_nm" class="form-control" maxlength="20"/>
				</div>
			</div>

			<div class="form-group row border-top border-bottom">
				<div class="col-sm-3 text-right mt10">사용여부</div>
				<div class="col-sm-8 mt10">
					<input type="radio" name="use_yn" id="use_y" value="Y" checked="checked"/><label for="use_y">&nbsp;사용</label>&nbsp;
					<input type="radio" name="use_yn" id="use_n" value="N"/><label for="use_n">&nbsp;미사용</label>
				</div>
			</div>
			
			<div class="btn_wrap text-center mb-3">
				<a href="javascript:void(0);" onclick="save(); return false;" class="btn btn-primary waves-effect waves-light"><span class="text">저장</span></a>
    		<a href="javascript:void(0);" onclick="goList();" class="btn btn-secondary btn-icon-split"><span class="text">목록</span></a>
			</div>
		</form>
	</div>
	
	<script>
		/*<![CDATA[*/
			window.onload = () => {
				find();
	  	}
			
			function find() {
				
				const upcdid = '${upcdid}';
				if ( !upcdid ) {
		    	return false;
		    }
				
				fetch(`/api/code/${upcdid}`).then(response => {
		    	if (!response.ok) {
						throw new Error('Request failed...');
			    }
		    	return response.json();
		
		   	}).then(json => {
		   		
		   		document.getElementById('upcdnm').innerHTML = checkNullVal(json.cdnm);
		   		const form = document.getElementById('form');
		   		form.cd_id.value = checkNullVal(json.cdid)+addZeroFront(json.childcnt+1,2);
		   	}).catch(error => {
		    	alert('코드정보를 찾을 수 없습니다.');
		    	window.opener.findAll();
		   	});
			}
		
			function save(){
				/* if( !isValid() ){
					return false;
				} */
				
				if($("#cd_nm").val() == ''){
					alert('코드명을 입력해주세요.');
					$("#cd_nm").focus();
					return false;
				}
				
				const form = document.getElementById('form');
				const params = {
					cd_id : form.cd_id.value,
					cd_nm : form.cd_nm.value,
					use_yn : form.use_yn.value,
					up_cd_id : '${upcdid}',
					cd_depth : '${cddepth}',
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
					alert('저장되었습니다.');
					goList();
				}).catch(error => {
					alert('오류가 발생하였습니다.');
				});
			}
		
			function fncChangeUpperCase(obj){
				if($(obj).val() != ''){
					const regex = /^[a-z|A-Z]+$/;
					if(!regex.test($(obj).val())){
						alert('영문만 입력해주세요.');
						$(obj).val('');
					}
					else {
						$(obj).val($(obj).val().toUpperCase());
					}
				}
			}
		
			function goList(){
				location.href = '/code/popup/list/${upcdid}/${cddepth}';
			}
		/*]]>*/
	    </script>
</body>
</html>