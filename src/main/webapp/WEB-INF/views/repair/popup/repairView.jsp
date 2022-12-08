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
					<div class="col"><img id="repair_img" width="640px" height="480px" class="m10"/></div>
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
							<th colspan="4">고객 정보</th>
						</tr>
						<tr>
							<th>고객번호</th>
							<td id="customer_no_td"></td>
							<th>고객명</th>
							<td id="customer_nm_td"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td colspan="3" id="customer_cel_td"></td>
						</tr>
						<tr>
							<th colspan="4">수리 정보</th>
						</tr>
						<tr>
							<th>수리품명</th>
							<td colspan="3" id="repair_nm_td"></td>
						</tr>
						<tr>
							<th>수리요청일</th>
							<td id="repair_req_dt_td"></td>
							<th>수리완료일</th>
							<td id="repair_res_dt_td"></td>
						</tr>
						<tr class="border-bottom">
							<th>비고</th>
							<td colspan="3" id="repair_desc_td"></td>
						</tr>
					</table>
				</div>

				<div class="btn_wrap text-center">
	        <a href="javascript: void(0);" onclick="goModify(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
	        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
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
				
				const repairno = '${repairno}';
				if ( !repairno ) {
		    	return false;
		    }
				
				fetch(`/api/repair/${repairno}`).then(response => {
		    	if (!response.ok) {
						throw new Error('Request failed...');
			    }
		    	return response.json();
		
		   	}).then(json => {
		   		var filelist = json.filelist;
		   		var filepath = '';
		   		var filenm = '';
		   		
		   		if(filelist != null && filelist.length > 0){
			   		for(var i = 0 ; i < filelist.length ; i++){
			   			if(filelist[i].fileord == 1){
			   				filepath = checkNullVal(filelist[i].filepath);
			   				filenm = checkNullVal(filelist[i].filenm);
			   			}
			   		}
		   		}

		   		if(filenm == '')
		   			document.getElementById('repair_img').src = '/img/no-image.png';
		   		else
		   			document.getElementById('repair_img').src = '/file/image/display?filePath='+filepath+'&fileName='+filenm;

		   		document.getElementById('customer_no_td').innerHTML = checkNullVal(json.customerno);
		   		document.getElementById('customer_nm_td').innerHTML = checkNullVal(json.customernm);
		   		document.getElementById('customer_cel_td').innerHTML = checkNullVal(json.customercel);
		   		document.getElementById('repair_nm_td').innerHTML = checkNullVal(json.repairnm);
		   		document.getElementById('repair_req_dt_td').innerHTML = checkSubstringNullVal(json.repairreqdt,0,10);
		   		document.getElementById('repair_res_dt_td').innerHTML = checkSubstringNullVal(json.repairresdt,0,10);
		   		document.getElementById('repair_desc_td').innerHTML = checkNullVal(json.repairdesc);
		   		
		   	}).catch(error => {
		    	alert('수리 정보를 찾을 수 없습니다.');
		    	fncParentRefresh();
		    	fncClose();
		   	});
			}
			
			/**
			 * 수정하기
			 */
			function goModify() {
		    location.href = '/repair/popup/modify/${repairno}';
			}
			
			function fncParentRefresh(){
				window.opener.findAll();
			}
			
			function fncClose(){
				self.close();
			}
		/*]]>*/
	    </script>
</body>
</html>