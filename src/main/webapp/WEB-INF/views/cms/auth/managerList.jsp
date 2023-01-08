<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한관리</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
    	<form id="searchForm" onsubmit="return false;">
				<div class="mb20" id="adv-search">
					<div class="form-inline">
		        <select id="searchtype" class="form-control" style="width: 100px;">
	            <option value="">전체</option>
	            <option value="id">아이디</option>
	            <option value="name">이름</option>
		        </select>
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="키워드를 입력해 주세요." style="width: 200px;" />
				    <button type="button" onclick="findAll(0);" class="btn btn-secondary">
			        <span aria-hidden="true" class="glyphicon glyphicon-search">검색</span>
				    </button>
			    </div>
				</div>
	    </form>
			<div class="table-responsive clearfix">
				<table class="table table-hover">
					<colgroup>
						<col width="10%"/>
						<col width="15%"/>
						<col />
						<col width="10%"/>
						<col width="15%"/>
						<col width="17%"/>
						<col width="13%"/>
					</colgroup>
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">아이디</th>
							<th class="text-center">이름</th>
							<th class="text-center">성별</th>
							<th class="text-center">역할</th>
							<th class="text-center">사용여부</th>
							<th class="text-center">메뉴권한조회</th>
						</tr>
					</thead>
					<tbody id="list"></tbody>
				</table>
				<nav aria-label="Page navigation" class="text-center">
			    <ul class="pagination"></ul>
				</nav>
			</div>
			<div class="table-responsive clearfix mt-3" id="menuListDiv">
			
			</div>
		</div>
	</div>
	
	<script>
		/**
		 * 페이지 HTML 렌더링
		 */
		window.onload = () => {
			setQueryStringParams();
	    findAll();
			addEnterSearchEvent();
		}
		 /**
			 * 키워드 - 엔터 검색 이벤트 바인딩
			 */
		function addEnterSearchEvent() {
			document.getElementById('searchword').addEventListener('keyup', (e) => {
				if (e.keyCode === 13) {
					findAll(0);
				}
			});
		}
		
		function drawPages(params) {
	
			if (!params) {
	 			document.querySelector('.pagination').innerHTML = '';
	 			return false;
	 		}
	
	 		let html = '';
	 		const pagination = params;

			var startpage = pagination.startpage;
			var endpage = pagination.endpage;
			
			// 첫 페이지, 이전 페이지
	 		if (pagination.hasprevpage) {
	 			html += `
	 				<li><a href="javascript:void(0)" onclick="findAll(0);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
	 				<li><a href="javascript:void(0)" onclick="findAll(`+(startpage)+`);" aria-label="Previous"><span aria-hidden="true">&lsaquo;</span></a></li>
	 			`;
	 		}
			
	 		// 페이지 번호
	 		for (let i = startpage ; i < endpage ; i++) {
	 			const active = ((i) === (pagination.currentpage-1)) ? 'class="active"' : '';
        html += '<li '+active+'><a href="javascript:void(0)" onclick="findAll(\''+(i+1)+'\')">'+(i+1)+'</a></li>';
	 		}
	
	 		// 다음 페이지, 마지막 페이지
	 		if (pagination.hasnextpage) {
	 			html += `
	 				<li><a href="javascript:void(0)" onclick="findAll(`+(endpage+1)+`);" aria-label="Next"><span aria-hidden="true">&rsaquo;</span></a></li>
	 				<li><a href="javascript:void(0)" onclick="findAll(`+(pagination.totalpage)+`);" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
	 			`;
	 		}
	
	 		document.querySelector('.pagination').innerHTML = html;
	 	}
		
		/**
		 * 게시글 리스트 조회
		 */
		function findAll(page) {
			if($("#authMenuTbl").length > 0){
				$("#authMenuTbl").remove();
			}
			const pageParams = Number(new URLSearchParams(location.search).get('page'));
			page = page ? page : (pageParams ? pageParams : 1);
	
			const form = document.getElementById('searchForm');
			
			var params = {
			  currentpage: page,
				searchtype: form.searchtype.value,
				searchword: form.searchword.value
			};
			checkListNullParams(params);

			const queryString = new URLSearchParams(params).toString();
			const replaceUri = location.pathname + '?' + queryString;
			history.replaceState({}, '', replaceUri);
			
			getJson('/api/auth/managers', params).then(response => {
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<td colspan="7" class="text-center">등록된 사용자가 없습니다.</td>';
					drawPages();
					return false;
				}
	
				let html = '';
				let num = response.params.totalcount - (response.params.currentpage-1) * response.params.recordcount;
				const viewAuth = '${sessionScope.VIEW_AUTH}';
     		response.list.forEach((obj, idx) => {
     			const viewUri = `/code/modify/`+obj.cdid + '?' + queryString;
     			html += `
      			<tr>
  						<td class="text-center">`+(num--)+`</td>
  						<td class="text-center">`+obj.userid+`</td>
  						<td class="text-center bold">`+obj.username+`</td>
  						<td class="text-center">`+checkNullVal(obj.gendner)+`</td>
  						<td class="text-center">`;
  				if(checkNullVal(obj.userrole) == 'MANAGER'){
  					html += `매니저`;	
  				}
 					html += `
 							</td>
  						<td class="text-center">`+obj.useyn+`</td>
  						<td class="text-center">
  				`;
  				if(viewAuth == 'Y'){
  					html += `		<a href="javascript: void(0);" onclick="fncAuthMenuList(\'`+obj.userid+`\', \'`+obj.username+`\'); return false;" class="btn btn-info">권한조회</a>`;
  				}
  				html += `
 							</td>
      			</tr>
     			`;
     		});
     		
	
				document.getElementById('list').innerHTML = html;
				drawPages(response.params);
			});
		}
		
		/**
		 * 조회 API 호출
		 */
		async function getJson(uri, params) {
	
			if (params) {
				uri = uri + '?' + new URLSearchParams(params).toString();
			}
	
			const response = await fetch(uri);
	
			if (!response.ok) {
				await response.json().then(error => {
					throw error;
				});
			}
	
			return await response.json();
		}
		
		function setQueryStringParams() {
			
			if ( !location.search ) {
				return false;
			}
		
			const form = document.getElementById('searchForm');
		
			new URLSearchParams(location.search).forEach((value, key) => {
				if (form[key]) {
					form[key].value = value;
				}
			});
		}

		/**
		 * 작성하기
		 */
		function goWrite() {
	    location.href = '/code/write' + location.search;
		}
		
	
		/**
		 * 하위코드 팝업
		 */
		function fncAuthMenuList(userid, username) {
			if(userid == ''){
				alert('사용자 아이디가 없습니다.');
				return false;
			}

			fetch('/api/auth/menus/'+userid).then(response => {
	    	if (!response.ok) {
					throw new Error('Request failed...');
		    }
	    	return response.json();
	   	}).then(json => {
				if (!Object.keys(json).length || json.list == null || json.list.length == 0) {
					alert('메뉴가 없습니다.');
					$("#authMenuTbl").remove();
					return false;
				}
	
				const writeAuth = '${sessionScope.WRITE_AUTH}';
				const modifyAuth = '${sessionScope.MODIFY_AUTH}';

				let html = ``;
				html += `
					<table class="table table-hover" id="authMenuTbl">
						<colgroup>
							<col />
							<col width="13%"/>
							<col width="13%"/>
							<col width="13%"/>
							<col width="13%"/>
							<col width="13%"/>
							<col width="15%"/>
						</colgroup>
						<thead>
							<tr>
								<th colspan="6">`+username+`(`+userid+`) 메뉴 권한</th>
								<th class="text-right">
				`;
				if(writeAuth == 'Y' && modifyAuth == 'Y'){
					html += `				<a href="javascript:void(0)" onclick="fncSaveAll(\'`+userid+`\',\'`+username+`\'); return false;" class="btn btn-primary">전체저장</a>`;
				}
				html += `
										<span class="ml5"><a href="javascript:void(0)" onclick="fncCloseAuthMenuTbl(); return false;" class="btn btn-secondary">닫기</a></span>
								</th>
							</tr>
							<tr>
								<th class="text-center">메뉴명</th>
								<th class="text-center"><label for="accessChecked">접근권한</label><br/><input type="checkbox" id="accessChecked" onchange="fncChangeAuth(this, 'accessAuthArr');"></th>
								<th class="text-center"><label for="writeChecked">등록권한</label><br/><input type="checkbox" id="writeChecked" onchange="fncChangeAuth(this, 'writeAuthArr');"></th>
								<th class="text-center"><label for="viewChecked">조회권한</label><br/><input type="checkbox" id="viewChecked" onchange="fncChangeAuth(this, 'viewAuthArr');"></th>
								<th class="text-center"><label for="modifyChecked">수정권한</label><br/><input type="checkbox" id="modifyChecked" onchange="fncChangeAuth(this, 'modifyAuthArr');"></th>
								<th class="text-center"><label for="removeChecked">삭제권한</label><br/><input type="checkbox" id="removeChecked" onchange="fncChangeAuth(this, 'removeAuthArr');"></th>
								<th></th>
							</tr>
						</thead>
						<tbody id="menuList">
						</tbody>
					</table>
				`;
				
				document.getElementById('menuListDiv').innerHTML = html;
				
				html = ``;
				json.list.forEach((obj, idx) => {
     			html += `
      			<tr>
  						<td class="text-center"><input type="hidden" name="menuIdArr" class="form-data" value="`+obj.menuId+`"/>`+obj.menuNm+`</td>
  						<td class="text-center">
					`;
  				accessChecked = '';
  				if(checkNullVal(obj.accessAuth) == 'Y'){
  					accessChecked = 'checked';
  				}
  				html += `<input type="checkbox" name="accessAuthArr" class="form-check form-data" `+accessChecked+` onchange="fncChangeAccessAuth(this, \'`+idx+`\');"/>
  						</td>
  						<td class="text-center">
					`;
	 				writeChecked = '';
	 				if(checkNullVal(obj.writeAuth) == 'Y'){
	 					writeChecked = 'checked';
	 				}
	 				html += `<input type="checkbox" name="writeAuthArr" class="form-check form-data" `+writeChecked+`/>
							</td>
  						<td class="text-center">
					`;
	 				viewChecked = '';
	 				if(checkNullVal(obj.viewAuth) == 'Y'){
	 					viewChecked = 'checked';
	 				}
	 				html += `<input type="checkbox" name="viewAuthArr" class="form-check form-data" `+viewChecked+`/>
							</td>
  						<td class="text-center">
					`;
	 				modifyChecked = '';
	 				if(checkNullVal(obj.modifyAuth) == 'Y'){
	 					modifyChecked = 'checked';
	 				}
	 				html += `<input type="checkbox" name="modifyAuthArr" class="form-check form-data" `+modifyChecked+`/>
							</td>
  						<td class="text-center">
					`;
	 				removeChecked = '';
	 				if(checkNullVal(obj.removeAuth) == 'Y'){
	 					removeChecked = 'checked';
	 				}
	 				html += `<input type="checkbox" name="removeAuthArr" class="form-check form-data" `+removeChecked+`/>
							</td>
							<td class="text-center">
					`;
	 				if(writeAuth == 'Y' && modifyAuth == 'Y'){
						html += `		<a href="javascript:void(0)" onclick="fncSaveEach(\'`+userid+`\',\'`+username+`\',\'`+idx+`\',\'`+obj.menuNm+`\'); return false;" class="btn btn-primary">저장</a>`;
	 				}
	 				html += `
							</td>
  					</tr>
					`;
     		});
     		
				document.getElementById('menuList').innerHTML = html;
				
	   	}).catch(error => {
				$("#authMenuTbl").remove();
	    	alert('오류가 발생하였습니다.');
	   	});
		}
		
		function fncCloseAuthMenuTbl(){
			$("#authMenuTbl").remove();
		}
		
		function fncSaveAll(userId, userName){
			var checkedCnt = 0;
			
			$("input[name=accessAuthArr]").each(function(){
				if($(this).is(":checked")) checkedCnt++;
			});
			$("input[name=writeAuthArr]").each(function(){
				if($(this).is(":checked")) checkedCnt++;
			});
			$("input[name=viewAuthArr]").each(function(){
				if($(this).is(":checked")) checkedCnt++;
			});
			$("input[name=modifyAuthArr]").each(function(){
				if($(this).is(":checked")) checkedCnt++;
			});
			$("input[name=removeAuthArr]").each(function(){
				if($(this).is(":checked")) checkedCnt++;
			});
			if(checkedCnt == 0){
				alert('권한을 설정해주세요.');
				return false;
			}
			
			if(confirm('\'' + userName + '\'의 전체 권한을 저장하시겠습니까?')){
				const formData = new FormData();
				formData.append("user_id", userId);
				$("input[name=menuIdArr]").each(function(){
					formData.append("menuIdArr[]", checkNullVal($(this).val()));
				});
				$("input[name=accessAuthArr]").each(function(){
					formData.append("accessAuthArr[]", $(this).is(":checked") ? 'Y' : 'N');
				});
				$("input[name=writeAuthArr]").each(function(){
					formData.append("writeAuthArr[]", $(this).is(":checked") ? 'Y' : 'N');
				});
				$("input[name=viewAuthArr]").each(function(){
					formData.append("viewAuthArr[]", $(this).is(":checked") ? 'Y' : 'N');
				});
				$("input[name=modifyAuthArr]").each(function(){
					formData.append("modifyAuthArr[]", $(this).is(":checked") ? 'Y' : 'N');
				});
				$("input[name=removeAuthArr]").each(function(){
					formData.append("removeAuthArr[]", $(this).is(":checked") ? 'Y' : 'N');
				});
	
				fetch('/api/auth/menus', {
					method: 'POST',
					body: formData
				}).then(response => {
					if(!response.ok){
						throw new Error('Request Failed...');
					}
					alert('저장되었습니다.');
				}).catch(error => {
					alert('오류가 발생하였습니다.');
				});
			}
		}
		
		function fncSaveEach(userId, userNm, idx, menuNm){
			var checkedCnt = 0;
			if($("input[name=accessAuthArr]").eq(idx).is(":checked")) checkedCnt++;
			if($("input[name=writeAuthArr]").eq(idx).is(":checked")) checkedCnt++;
			if($("input[name=viewAuthArr]").eq(idx).is(":checked")) checkedCnt++;
			if($("input[name=modifyAuthArr]").eq(idx).is(":checked")) checkedCnt++;
			if($("input[name=removeAuthArr]").eq(idx).is(":checked")) checkedCnt++;
			
			if(checkedCnt == 0){
				alert(menuNm+'의 권한을 설정해주세요.');
				return false;
			}
			
			if(confirm('\'' + menuNm + '\' 메뉴의 권한을 저장하시겠습니까?')){
				const formData = new FormData();
				formData.append("user_id", userId);
				formData.append("menu_id", $("input[name=menuIdArr]").eq(idx).val());
				formData.append("access_auth", $("input[name=accessAuthArr]").eq(idx).is(":checked") ? 'Y' : 'N');
				formData.append("write_auth", $("input[name=writeAuthArr]").eq(idx).is(":checked") ? 'Y' : 'N');
				formData.append("view_auth", $("input[name=viewAuthArr]").eq(idx).is(":checked") ? 'Y' : 'N');
				formData.append("modify_auth", $("input[name=modifyAuthArr]").eq(idx).is(":checked") ? 'Y' : 'N');
				formData.append("remove_auth", $("input[name=removeAuthArr]").eq(idx).is(":checked") ? 'Y' : 'N');
	
				fetch('/api/auth/menu', {
					method: 'POST',
					body: formData
				}).then(response => {
					if(!response.ok){
						throw new Error('Request Failed...');
					}
					alert('저장되었습니다.');
				}).catch(error => {
					alert('오류가 발생하였습니다.');
				});
			}
		}
		
		function fncChangeAccessAuth(obj, idx){
			if(!$(obj).is(":checked")){
				$("input[name=writeAuthArr]").eq(idx).attr("checked", false);
				$("input[name=viewAuthArr]").eq(idx).attr("checked", false);
				$("input[name=modifyAuthArr]").eq(idx).attr("checked", false);
				$("input[name=removeAuthArr]").eq(idx).attr("checked", false);
			}
		}
		
		function fncChangeAuth(obj, auth){
			if($(obj).is(":checked")){
				$("input:checkbox[name="+auth+"]").attr("checked", true);
			}
			else {
				$("input:checkbox[name="+auth+"]").attr("checked", false);
			}
		}
	</script>
</body>
</html>