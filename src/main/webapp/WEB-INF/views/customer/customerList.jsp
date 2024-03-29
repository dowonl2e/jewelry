<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 현황</title>
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
						<span class="mlr5">등록일</span>
						<input type="date" id="searchstdt" class="form-control mlr5"/> ~
						<input type="date" id="searcheddt" class="form-control mlr5"/>
		        <input type="number" id="searchrecordcnt" class="form-control mlr5" placeholder="행 개수" min="1" max="100" oninput="fncCheckZero(this);" style="width:100px;"/>
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="계약고객/배우자명/연락처"/>
				    <button type="button" onclick="findAll(0);" class="btn btn-secondary">
			        <span aria-hidden="true" class="glyphicon glyphicon-search">검색</span>
				    </button>
		        <a href="javascript: void(0);" onclick="fncRefresh(); return false;" class="btn btn-warning waves-effect waves-light mlr5">새로고침</a>
		        <c:if test="${sessionScope.WRITE_AUTH eq 'Y'}">
		        	<a href="javascript: void(0);" onclick="fncPopupWrite(); return false;" class="btn btn-primary waves-effect waves-light">자료등록</a>
		        </c:if>
					</div>
				</div>
	    </form>
			<div class="table-responsive clearfix">
				<table class="table">
					<thead>
						<tr>
							<th rowspan="2" class="">No.</th>
							<th rowspan="2" class="border-left"><input type="checkbox" id="arr_customer_no"/></th>
							<th rowspan="2" class="border-left">등록일</th>
							<th rowspan="2" class="border-left">계약구분</th>
							<th rowspan="2" class="border-left">고객코드</th>
							<th colspan="2" class="border-left">계약고객</th>
							<th colspan="5" class="border-left">건수</th>
							<th colspan="2" class="border-left">(단위:천원)</th>
							<th rowspan="2" class="border-left">비고</th>
						</tr>
						<tr>
							<th class="border-left">이름</th>
							<th class="border-left">H.P</th>
							<th class="border-left">주문</th>
							<th class="border-left">수리</th>
							<th class="border-left">예약</th>
							<th class="border-left">판매</th>
							<th class="border-left">견적</th>
							<th class="border-left">매츨</th>
							<th class="border-left">매수</th>
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
		//<![CDATA[
		/**
		 * 페이지 HTML 렌더링
		 */
		var codemap = {
				<c:forEach var="code" items="${codelist}" varStatus="loop">
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
				, searchstdt: form.searchstdt.value
				, searcheddt: form.searcheddt.value
				, searchrecordcnt: form.searchrecordcnt.value
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
				const viewAuth = '${sessionScope.VIEW_AUTH}';
     		response.list.forEach((obj, idx) => {
     			const viewUri = `/code/modify/`+obj.cdid + '?' + queryString;
     			html += `
     				<tr class="small">
							<td class="text-center">` + (num--) + `</td>
							<td class="text-center"><input type="checkbox" id="arr_customer_no" value="`+checkNullVal(obj.customerno)+`"/></td>
							<td class="text-center">` + checkSubstringNullVal(obj.regdt,0,10) + `</td>
							<td class="text-center">` + checkNullVal(codemap[checkNullVal(obj.contractcd)]) +`</td>
							<td class="text-center bold">
					`;
					if(viewAuth == 'Y'){
						html += `		<a href="javascript: void(0);" onclick="fncPopupView('` + obj.customerno + `'); return false;">` + checkNullVal(obj.customerno) + `</a>`;
					}
					else {
						html += checkNullVal(obj.customerno);
					}
					html += `
							</td>
							<td class="text-center">` + checkNullVal(obj.contractornm)+`</td>
							<td class="text-center">` + checkNullVal(obj.contractorcel)+`</td>
							<td class="text-center">
					`;
					if(Number(checkNullValR(obj.ordercnt,'0')) == 0){
     				html += checkNullVal(obj.ordercnt);
     			}
					else {
						html += `<a href="javascript: void(0);" onclick="fncCustomerOrderListPopup('` + obj.customerno + `'); return false;">` + checkNullVal(obj.ordercnt) + `</a>`;
					}
					html += `
							</td>
							<td class="text-center">
					`;
					if(Number(checkNullValR(obj.repaircnt,'0')) == 0){
     				html += checkNullVal(obj.repaircnt);
     			}
					else {
						html += `<a href="javascript: void(0);" onclick="fncCustomerRepairListPopup('` + obj.customerno + `'); return false;">` + checkNullVal(obj.repaircnt)+`</a>`;
					}
					html += `
							</td>
							<td class="text-center">
					`;
					if(Number(checkNullValR(obj.reservecnt,'0')) == 0){
     				html += checkNullVal(obj.reservecnt);
     			}
					else {
						html += `<a href="javascript: void(0);" onclick="fncCustomerReserveListPopup('` + obj.customerno + `'); return false;">` + checkNullVal(obj.reservecnt)+`<a/>`;
					}
					html += `
							</td>
							<td class="text-center">`+checkNullVal(obj.saleCnt)+`</td>
							<td class="text-center"></td>
							<td class="text-center">` + (checkNullVal(obj.saleprice) == '' ? '' : priceWithComma(obj.saleprice)) +`</td>
							<td class="text-center"></td>
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

		/**
		 * 작성하기
		 */
		function fncPopupWrite() {
		  var url = "/customer/popup/write";
      var name = "customerWritePopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}

		/**
		 * 수정하기
		 */
		function fncPopupView(customerno) {
		  var url = "/customer/popup/"+customerno;
      var name = "customeViewPopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		function fncCustomerOrderListPopup(customerno){
			var url = "/customer/popup/order/list/"+customerno;
      var name = "customeOrderListPopup";
      var option = "width = 1300, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}

		function fncCustomerReserveListPopup(customerno){
			var url = "/customer/popup/order/list/"+customerno+"/B";
      var name = "customeOrderBListPopup";
      var option = "width = 1300, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		
		function fncCustomerRepairListPopup(customerno){
			var url = "/customer/popup/repair/list/"+customerno;
      var name = "customeRepairListPopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		//새로고침
		function fncRefresh(){
			$("#adv-search").find("input").val('');
			$("#adv-search").find("select").val('');
			findAll(0);
		}

		function refresh(){
			findAll('${param.currentpage}');
		}
		//]]>
	</script>
</body>
</html>