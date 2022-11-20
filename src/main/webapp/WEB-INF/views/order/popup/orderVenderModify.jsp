<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 제조사 변경</title>
<script>
	var minNumberLen = 1;
	var maxNumberLen = 100;
</script>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">주문 제조사 변경</h6>
		</div>
		<div class="card-body">
    	<form id="searchForm" onsubmit="return false;">
				<div class="mb20" id="adv-search">
					<div class="form-inline">
		        <input type="number" id="searchrecordcnt" class="form-control mlr5" placeholder="행 개수" min="1" max="100" oninput="fncCheckZero(this);" style="width:100px;"/>
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="거래처명/사업자명 을 입력" style="width: auto;" />
				    <button type="button" onclick="findAll(0);" class="btn btn-secondary">
			        <span aria-hidden="true" class="glyphicon glyphicon-search">검색</span>
				    </button>
					</div>
				</div>
	    </form>
			<div class="table-responsive clearfix">
				<table class="table">
					<thead>
						<tr>
							<th rowspan="2" class="">No.</th>
							<th rowspan="2" class="border-left">구분</th>
							<th rowspan="2" class="border-left">등록일</th>
							<th rowspan="2" class="border-left">거래처명</th>
							<th rowspan="2" class="border-left">사업자명</th>							
							<th colspan="2" class="border-left">대표자연락처</th>
							<th colspan="5" class="border-left">전화번호</th>
							<th colspan="2" class="border-left">팩스번호</th>
							<th rowspan="2" class="border-left">담당자</th>
							<th rowspan="2" class="border-left">담당자연락처</th>
							<th rowspan="2" class="border-left">비고</th>
							<th rowspan="2" class="border-left">VAT</th>
							<th rowspan="2" class="border-left">해리</th>
  					</tr>
					</thead>
					<tbody id="list"></tbody>
				</table>
				<div class="btn_wrap text-right">
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
				<c:forEach var="code" items="${codelist}" varStatus="loop">
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

			var startpage = parseInt(params.currentpage / pagination.pagesize) * pagination.pagesize;
			var endpage = startpage + pagination.pagesize - 1;
			endpage  = ( endpage > pagination.totalpage ? pagination.totalpage : endpage);

			// 첫 페이지, 이전 페이지
	 		if (pagination.hasprevpage) {
	 			html += `
	 				<li><a href="javascript:void(0)" onclick="findAll(0);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
	 				<li><a href="javascript:void(0)" onclick="findAll("+(params.startpage - 1)+");" aria-label="Previous"><span aria-hidden="true">&lsaquo;</span></a></li>
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
	 				<li><a href="javascript:void(0)" onclick="findAll("+(params.endpage - 1)+");" aria-label="Next"><span aria-hidden="true">&rsaquo;</span></a></li>
	 				<li><a href="javascript:void(0)" onclick="findAll("+(params.totalpage)+");" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
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
				, ordersno: '${ordersno}'
			}
			checkListNullParams(params);
	
			const queryString = new URLSearchParams(params).toString();
			const replaceUri = location.pathname + '?' + queryString;
			history.replaceState({}, '', replaceUri);
			
			getJson('/api/vender/list', params).then(response => {
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<td colspan="15" class="text-center">등록된 고객이 없습니다.</td>';
					drawPages();
					return false;
				}
	
				let html = '';
				let num = response.params.totalcount - (response.params.currentpage-1) * response.params.recordcount;
				
     		response.list.forEach((obj, idx) => {
     			html += `
     				<tr>
							<td class="text-center">` + (num--) + `</td>
							<td class="text-center"><input type="checkbox" id="arr_vender_no" value="`+checkNullVal(obj.venderno)+`"/></td>
							<td class="text-center">` + checkNullVal(codemap[checkNullVal(obj.vendernm)]) +`</td>
							<td class="text-center bold">
								<a href="javascript: void(0);" onclick="fncModify('`+checkNullVal(obj.venderno)+`'); return false;">`+checkNullVal(obj.venderno)+`</a>
							</td>
							<td class="text-center">` + checkNullVal(obj.vendernm)+`</td>
							<td class="text-center">` + checkNullVal(obj.businessnm)+`</td>
							<td class="text-center"></td>
							<td class="text-center"></td>
							<td class="text-center"></td>
							<td class="text-center"></td>
							<td class="text-center"></td>
							<td class="text-center"></td>
							<td class="text-center"></td>
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
		
		function fncModify(customerno){
			if(confirm('변경하시겠습니까?')){
				var orderno = '${ordersno}';
				var order_no_arr = orderno.split(',');
				const form = document.getElementById('searchForm');
				const writeForm = new FormData(form);

				const formData = new FormData();
				formData.append('customer_no', customerno);
				for(var i = 0 ; i < order_no_arr.length ; i++){
					formData.append('order_no_arr[]',order_no_arr[i]);
				}
				
				fetch('/api/order/vender/modify', {
					method: 'PATCH',
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

		function fncClose(){
			self.close();
		}

	</script>
</body>
</html>