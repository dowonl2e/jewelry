<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 조회</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">사용자 조회</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal m10">
				<div class="table-responsive clearfix">
					<table class="table">
						<colgroup>
							<col width="20%;"/>
							<col />
							<col width="20%;"/>
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center border-right">아이디</th>
								<td colspan="3" id="user_id_td"></td>
							</tr>
							<tr>
								<th class="text-center border-right">이름</th>
								<td colspan="3" id="user_name_td"></td>
							</tr>
							<tr>
								<th class="text-center border-right">연락처</th>
								<td colspan="3" id="celnum_td"></td>
							</tr>
							<tr>
								<th class="text-center border-right">이메일</th>
								<td colspan="3" id="email_td"></td>
							</tr>
							<tr>
								<th class="border-right">성별</th>
								<td class="text-left" id="gender_td"></td>
							</tr>
							<tr class="border-bottom">
								<th class="text-center border-right">사용여부</th>
								<td colspan="3" id="use_yn_td"></td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap text-center">
		        <a href="javascript: void(0);" onclick="goModify(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
		        <a href="javascript: void(0);" onclick="goList(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">목록</a>
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
				
				const userid = '${userid}';
				if ( !userid ) {
		    	return false;
		    }
				
				fetch(`/api/user/${userid}`).then(response => {
		    	if (!response.ok) {
						throw new Error('Request failed...');
			    }
		    	return response.json();
		
		   	}).then(json => {
		   		document.getElementById('user_id_td').innerHTML = checkNullVal(json.userid);
		   		document.getElementById('user_name_td').innerHTML = checkNullVal(json.username);
		   		document.getElementById('celnum_td').innerHTML = checkNullVal(json.celnum);
		   		document.getElementById('email_td').innerHTML = checkNullVal(json.email);
		   		document.getElementById('gender_td').innerHTML = checkNullVal(json.gender);
		   		document.getElementById('use_yn_td').innerHTML = checkNullVal(json.useyn) == 'Y' ? '사용' : '미사용';
		   	}).catch(error => {
		    	alert('사용자를 찾을 수 없습니다.');
		    	goList();
		   	});
			}
			
			function goModify(){
				location.href = '/user/modify/${userid}';	
			}
			
			function goList(){
				location.href = '/user/list' + location.search;
			}
			
		/*]]>*/
	    </script>
</body>
</html>