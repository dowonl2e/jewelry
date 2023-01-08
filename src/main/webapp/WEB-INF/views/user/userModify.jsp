<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 수정</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">사용자 수정</h6>
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
								<th class="text-center border-right">비밀번호</th>
								<td class="border-right"><input type="password" id="user_pwd" class="form-control" maxlength="20" oninput="resetPwdChk();"/></td>
								<th class="text-center border-right">비밀번호 확인</th>
								<td>
									<input type="password" id="user_pwd_chk" class="form-control" maxlength="20" oninput="checkPwd(this);"/>
									<div class="mt10 blue" id="pwd_equal_txt"></div>
								</td>
							</tr>
							<tr>
								<th class="text-center border-right">이름<span class="important"> *</span></th>
								<td colspan="3"><input type="text" id="user_name" class="form-control" maxlength="30"/></td>
							</tr>
							<tr>
								<th class="text-center border-right">연락처</th>
								<td colspan="3"><input type="text" id="celnum" class="form-control" maxlength="13"/></td>
							</tr>
							<tr>
								<th class="text-center border-right">이메일</th>
								<td colspan="3"><input type="text" id="email" class="form-control" maxlength="30"/></td>
							</tr>
							<tr>
								<th class="border-right">성별</th>
								<td colspan="3" class="text-center">
									<select id="gender" class="form-control">
										<option value="">선택</option>
				            <option value="남">남</option>
				            <option value="여">여</option>
					        </select>
								</td>
							</tr>
							<tr class="border-bottom">
								<th class="text-center border-right">사용여부</th>
								<td colspan="3">
									<input type="radio" name="use_yn" id="use_yn_y" value="Y"/><label for="use_yn_y">&nbsp;사용</label>
									<span class="ml10"><input type="radio" name="use_yn" id="use_yn_n" value="N"/><label for="use_yn_n">&nbsp;미사용</label></span>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap text-center">
						<c:if test="${sessionScope.MODIFY_AUTH eq 'Y'}">
			        <a href="javascript: void(0);" onclick="fncSave(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
			      </c:if>
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
		   		form.user_name.value = checkNullVal(json.username);
		   		form.celnum.value = checkNullVal(json.celnum);
		   		form.email.value = checkNullVal(json.email);
		   		form.gender.value = checkNullVal(json.gender);
		   		if(checkNullVal(json.useyn) == 'Y'){
		   			form.use_yn_y.checked = true;
		   		}
		   		else {
		   			form.use_yn_n.checked = true;
		   		}
		   	}).catch(error => {
		    	alert('사용자를 찾을 수 없습니다.');
		    	goList();
		   	});
			}
			
			function fncSave(){
				
				if($("#user_pwd").val() != '' && $("#user_pwd_chk").val() == ''){
					alert('비밀번호를 확인해주세요.');
					$("#user_pwd_chk").focus();
					return false;
				}
				
				if($("#user_pwd").val() != '' && $("#user_pwd").val() != $("#user_pwd_chk").val()){
					alert('비밀번호가 일치하지 않습니다.');
					$("#user_pwd_chk").focus();
					return false;
				}
				
				if($("#user_name").val() == ''){
					alert('이름을 입력해주세요.');
					$("#user_name").focus();
					return false;
				}

				
				useYn = $("input:radio[name=use_yn]:checked").val();
				const form = document.getElementById('form');
				const params = {
						user_pwd : form.user_pwd.value,
						user_name : form.user_name.value,
						celnum : form.celnum.value,
						email : form.email.value,
						gender : form.gender.value,
						use_yn : useYn
				};
				
				fetch('/api/user/modify/${userid}', {
					method: 'PATCH',
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
		
			function checkEnglish(obj){
				if($(obj).val() != ''){
					const regex = /^[a-z|A-Z]+$/;
					if(!regex.test($(obj).val())){
						alert('영문만 입력해주세요.');
						$(obj).val('');
					}
				}
			}
			function checkPwd(obj){
				if($("#user_pwd").val() == $("#user_pwd_chk").val()){
					$("#pwd_equal_txt").text('비밀번호가 일치합니다.');
				}
				else {
					$("#pwd_equal_txt").text('');
				}
			}
			
			function resetPwdChk(){
				$("#user_pwd_chk").val('');	
			}
			
			function goList(){
				location.href = '/user/list' + location.search;
			}
			
		/*]]>*/
	    </script>
</body>
</html>