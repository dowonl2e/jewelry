<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 관리</title>
<script>
	var minNumberLen = 1;
	var maxNumberLen = 100;
</script>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
    	<form id="searchForm" onsubmit="return false;">
				<div class="mb20" id="adv-search">
					<div class="form-inline">
		        <input type="number" id="searchrecordcnt" class="form-control mlr5" placeholder="행 개수" min="1" max="100" oninput="fncCheckZero(this);" style="width:100px;"/>
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="거래처명/사업자명 을 입력" style="width: auto;" />
				    <button type="button" onclick="findAll(0);" class="btn btn-secondary">
			        <span aria-hidden="true" class="glyphicon glyphicon-search">검색</span>
				    </button>
		        <a href="javascript: void(0);" onclick="fncRefresh(); return false;" class="btn btn-warning waves-effect waves-light mlr5">새로고침</a>
		        <a href="javascript: void(0);" onclick="fncPopupWrite();" class="btn btn-primary waves-effect waves-light mlr5">자료등록</a>
					</div>
				</div>
	    </form>
			<div class="table-responsive clearfix">
				<table class="table">
					<thead>
						<tr>
							<th class="">No.</th>
							<th class="border-left"><input type="checkbox" onclick="fncCheckAll(this);"/></th>
							<th class="border-left">등록일</th>
							<th class="border-left">거래처명</th>
							<th class="border-left">사업자명</th>							
							<th class="border-left">대표자연락처</th>
							<th class="border-left">전화번호</th>
							<th class="border-left">팩스번호</th>
							<th class="border-left">담당자</th>
							<th class="border-left">담당자연락처</th>
							<th class="border-left">비고</th>
							<th class="border-left">VAT</th>
							<th class="border-left">해리</th>
  					</tr>
					</thead>
					<tbody id="list"></tbody>
				</table>
				<div class="btn_wrap text-left mt-3">
					<a href="javascript: void(0);" class="btn btn-success btn-circle btn-sm"><i class="fas fa-check"></i></a><span class="ml5">체크된 것</span>
		      <a href="javascript: void(0);" onclick="fncRemove(); return false;" id="remove-btn" class="btn btn-danger btn-icon-split btn-sm mlr5"><span class="text">삭제</span></a>
	    	</div>
				<nav aria-label="Page navigation" class="text-center">
			    <ul class="pagination"></ul>
				</nav>
			</div>
		</div>
	</div>
	
	<script>
		/**
		 * 페이지 HTML 렌더링
		 */
		var codemap = {
				<c:forEach var="code" items="${cdmapper}" varStatus="loop">
				  ${code.cdid}: '${code.cdnm}' ${not loop.last ? ',' : ''}
				</c:forEach>
		};
		
		window.onload = () => {       //들어왔을때 가장먼저 호출하지 않아도 실행되는 자바스크립트 함수
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
	
			const pageParams = Number(new URLSearchParams(location.search).get('page'));
			page = page ? page : (pageParams ? pageParams : 1);
	
			const form = document.getElementById('searchForm');
			
			var params = {
			  currentpage: page
				, searchrecordcnt: form.searchrecordcnt.value
				, searchword: form.searchword.value
			}
			checkListNullParams(params);
	
			const queryString = new URLSearchParams(params).toString();
			const replaceUri = location.pathname + '?' + queryString;
			history.replaceState({}, '', replaceUri);
			
			getJson('/api/vender/list', params).then(response => {
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<td colspan="13" class="text-center">등록된 거래처가 없습니다.</td>';
					drawPages();
					return false;
				}
	
				let html = '';
				let num = response.params.totalcount - (response.params.currentpage-1) * response.params.recordcount;
				
     		response.list.forEach((obj, idx) => {
/*      			const viewUri = `/code/modify/`+obj.cdid + '?' + queryString;
 */     			html += `
     				<tr>
							<td class="text-center">` + (num--) + `</td>
							<td class="text-center"><input type="checkbox" class="form-check-inline form-check" value="`+checkNullVal(obj.venderno)+`" /></td>
							<td class="text-center">` + checkSubstringNullVal(obj.inptdt,0,10) +`</td>
							<td class="text-center bold">
								<a href="javascript: void(0);" onclick="fncPopupView('` + obj.venderno + `'); return false;">`+checkNullVal(obj.vendernm)+`</a>
							</td>
							<td class="text-center">` + checkNullVal(obj.businessnm)+`</td>
							<td class="text-center">` + checkNullVal(obj.agentcel)+`</td>
							<td class="text-center">` + checkNullVal(obj.vendercel1)+`</td>
							<td class="text-center">` + checkNullVal(obj.venderfax)+`</td>
							<td class="text-center">` + checkNullVal(obj.managernm)+`</td>
							<td class="text-center">` + checkNullVal(obj.managercel)+`</td>
							<td class="text-center">` + checkNullVal(obj.etc)+`</td>
							<td class="text-center">` + checkNullVal(codemap[checkNullVal(obj.vatcd)])+`</td>
							<td class="text-center">` + checkNullVal(codemap[checkNullVal(obj.meltcd)])+`</td>
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
		function fncPopupWrite() {
		  var url = "/vender/popup/write";
      var name = "venderWritePopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}

		/**
		 * 수정하기
		 */
		function fncPopupView(venderno) {
		  var url = "/vender/popup/"+venderno;
      var name = "venderModifyPopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		
		
		/* 
		 * 삭제하기
		 */
		 function fncRemove(){

			var checkcnt = 0;
			$(".form-check").each(function(){
				if($(this).is(":checked")){
					checkcnt++;
				}
			});
			if(checkcnt == 0){
				alert('삭제할 거래처를 선택해주세요.');
				return false;
			}
			
			if(confirm('삭제하시겠습니까?')){
				const formData = new FormData();
				$(".form-check").each(function(){
					if($(this).is(":checked"))
						formData.append("vender_no_arr[]", checkNullVal($(this).val())); // VenderTO의 vender_no_arr 변수를 가리킨다. 
				});
								
				fetch('/api/vender/venders/remove', {
					method: 'PATCH',  //컨트롤러 api에 들어가면 venderto 에 넣기 위해서 이걸 정리하고
					body: formData
				}).then(response => {
					if(!response.ok){
						throw new Error('Request Failed...');
					}
					alert('삭제되었습니다.');
					findAll();
				}).catch(error => {
					alert('오류가 발생하였습니다.');
				});
			}
		} 		
		
		function fncCheckZero(obj){
			if($(obj).val() != ''){
				if(Number($(obj).val()) < minNumberLen){
					$(obj).val('1');
				}
				if(Number($(obj).val()) > maxNumberLen){
					$(obj).val('100');
				}
			}
		}

		function refresh(){
			findAll('${param.currentpage}');
		}
		
		function fncCheckAll(obj){
			if($(obj).is(":checked")){
        $(".form-check").attr("checked", true);    
			}
			else
        $(".form-check").attr("checked", false);    
		}	
	</script>
</body>
</html>