<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객주문</title>
<script>
	var minNumberLen = 1;
	var maxNumberLen = 100;
</script>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">고객주문</h6>
		</div>
		<div class="card-body">
    	<form id="searchForm" onsubmit="return false;">
				<div class="mb20" id="adv-search">
					<div class="form-inline">
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="계약고객/배우자명을 입력" style="width: auto;" />
				    <button type="button" onclick="findAll(0);" class="btn btn-secondary">
			        <span aria-hidden="true" class="glyphicon glyphicon-search">검색</span>
				    </button>
				    <a href="javascript: void(0);" onclick="fncRefresh(); return false;" class="btn btn-warning waves-effect waves-light ml5">새로고침</a>
					</div>
				</div>
	    </form>
			<div class="table-responsive clearfix">
				<table class="table table-hover">
					<thead>
						<tr>
							<th rowspan="2" class="">No.</th>
							<th rowspan="2" class="border-left">등록일</th>
							<th rowspan="2" class="border-left">계약구분</th>
							<th rowspan="2" class="border-left">고객코드</th>
							<th colspan="2" class="border-left">계약고객</th>
							<th rowspan="2" class="border-left">비고</th>
						</tr>
						<tr>
							<th class="border-left">이름</th>
							<th class="border-left">H.P</th>
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
				<c:forEach var="code" items="${cdmapper}" varStatus="loop">
				  ${code.cdid}: '${code.cdnm}' ${not loop.last ? ',' : ''}
				</c:forEach>
		};
		
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
			  startpage: page
			  , stocksno : '${stocksno}'
				, searchword: form.searchword.value
			}
			checkListNullParams(params);
	
			const queryString = new URLSearchParams(params).toString();
			const replaceUri = location.pathname + '?' + queryString;
			history.replaceState({}, '', replaceUri);
			
			getJson('/api/customer/list', params).then(response => {
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<td colspan="15" class="text-center">등록된 고객이 없습니다.</td>';
					drawPages();
					return false;
				}
	
				let html = '';
				let num = response.params.totalcount - (response.params.currentpage-1) * response.params.recordcount;
				
     		response.list.forEach((obj, idx) => {
     			const viewUri = `/code/modify/`+obj.cdid + '?' + queryString;
     			html += `
     				<tr>
							<td class="text-center">` + (num--) + `</td>
							<td class="text-center">` + checkSubstringNullVal(obj.regdt,0,10) + `</td>
							<td class="text-center">` + checkNullVal(codemap[checkNullVal(obj.contractcd)]) +`</td>
							<td class="text-center bold">
								<a href="javascript: void(0);" onclick="fncSelect('` + checkNullVal(obj.customerno) + `', '`+checkNullVal(obj.contractornm)+`', '`+checkNullVal(obj.contractorcel)+`'); return false;">`+checkNullVal(obj.customerno)+`</a>
							</td>
							<td class="text-center">` + checkNullVal(obj.contractornm)+`</td>
							<td class="text-center">` + checkNullVal(obj.contractorcel)+`</td>
							<td class="text-center">`+checkNullVal(obj.etc)+`</td>
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

		//새로고침
		function fncRefresh(){
			$("#adv-search").find("input").val('');
			$("#adv-search").find("select").val('');
			findAll(0);
		}
		
		function fncSelect(customerno, customernm, customercel){
			if(confirm('\''+customernm+'\' 고객으로 주문하시겠습니까?')){
				var stocksno = '${stocksno}';
				var stock_no_arr = stocksno.split(',');
				if(stock_no_arr == null || stock_no_arr.length == 0){
					alert('재고 선택 후 주문바랍니다.');
					fncClose();
					return false;
				}
				
				const form = document.getElementById('searchForm');
				const writeForm = new FormData(form);
				
				const formData = new FormData();
				formData.append('customer_no', customerno);
				formData.append('customer_nm', customernm);
				formData.append('customer_cel', customercel);
				
				for(var i = 0 ; i < stock_no_arr.length ; i++){
					formData.append('stock_no_arr[]',stock_no_arr[i]);
				}
				
				fetch('/api/stock/order/customer/write', {
					method: 'POST',
					body: formData
				}).then(response => {
					if(!response.ok){
						throw new Error('Request Failed...');
					}
					alert('고객주문이 완료되었습니다.');
					window.opener.findAll();
					fncClose();
				}).catch(error => {
					alert('오류가 발생하였습니다.');
				});
			}
		}
		
		function fncClose(){
			self.close();
		}
	</script>
</body>
</html>