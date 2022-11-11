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
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">고객 등록</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal m10">
				<div class="table-responsive clearfix">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th rowspan="2" class="text-center border-right">관리매장</th>
								<th colspan="4" class="text-center border-right">등록일</th>
								<th colspan="3" class="text-center">매장</th>
							</tr>
							<tr>
								<td colspan="4" class="border-right"><input type="date" id="reg_dt" class="form-control"/></td>
								<td colspan="3" class="text-center">
									<select id="store_cd" class="form-control">
				            <c:forEach var="stlist" items="${stlist}">
				            	<option value="${stlist.cdid}">${stlist.cdnm}</option>
				            </c:forEach>
					        </select>
								</td>
							</tr>
							<tr>
								<th rowspan="2" class="text-center border-right">구분</th>
								<th colspan="7" class="text-center border-right">계약구분</th>
							</tr>
							<tr>
								<td colspan="7" class="text-center">
									<select id="constract_cd" class="form-control">
				            <c:forEach var="ctlist" items="${ctlist}">
				            	<option value="${ctlist.cdid}">${ctlist.cdnm}</option>
				            </c:forEach>
					        </select>
								</td>
							</tr>
							<tr>
								<th rowspan="2" class="border-right">고객</th>
								<th></th>
								<th>이름</th>
								<th>성별</th>
								<th>연락처</th>
								<th>생일</th>
								<th>음력</th>
								<th>이메일</th>
							</tr>
							<tr>
								<th class="border-right">계약고객</th>
								<td class="border-right"><input type="text" id="constractor_nm" class="form-control"/></td>
								<td class="border-right">
									<select id="constractor_gen" class="form-control">
										<option value=""></option>
										<option value="남">남</option>
										<option value="여">여</option>
									</select>
								</td>
								<td class="border-right"><input type="text" id="constractor_cel" class="form-control"/></td>
								<td class="border-right"><input type="date" id="constractor_birth" class="form-control"/></td>
								<td class="border-right">
									<select id="constractor_gen" class="form-control">
										<option value=""></option>
										<option value="Y">Y</option>
										<option value="N">N</option>
									</select>
								</td>
								<td><input type="text" id="constractor_email" class="form-control"/></td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap text-right">
		    		
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
			function save(){
				/* if( !isValid() ){
					return false;
				} */
				
				const form = document.getElementById('form');
				const params = {
					cd_id : form.cd_id.value,
					cd_nm : form.cd_nm.value,
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
					alert('저장되었습니다.');
					location.href = '/code/list';
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
				location.href = '/code/list' + location.search;
			}
		/*]]>*/
	    </script>
</body>
</html>