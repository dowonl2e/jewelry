<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매관리</title>
<script>
	var minNumberLen = 1;
	var maxNumberLen = 100;
</script>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">판매관리</h6>
		</div>
		<div class="card-body">
    	<form id="searchForm" onsubmit="return false;">
				<div class="mb20" id="adv-search">
					<div class="form-inline">
		        <select id="searchstore" class="form-control">
	            <option value="">매장구분</option>
	            <c:forEach var="stlist" items="${stlist}">
	            	<option value="${stlist.cdid}">${stlist.cdnm}</option>
	            </c:forEach>
		        </select>
		        <select id="searchsaletype" class="form-control ml5">
	            <option value="">거래구분</option>
	            <option value="ORDER">주문</option>
	            <option value="STOCK">판매</option>
		        </select>
		        <select id="searchmaterial" class="form-control ml5">
	            <option value="">재질구분</option>
	            <c:forEach var="smlist" items="${smlist}">
	            	<option value="${smlist.cdid}">${smlist.cdnm}</option>
	            </c:forEach>
		        </select>
			    </div>
			    <div class="form-inline mt5">
			    	<span class="mlr5">등록일</span>
						<input type="date" id="searchstdt" class="form-control mlr5"/> ~
						<input type="date" id="searcheddt" class="form-control mlr5"/>
		        <input type="number" id="searchrecordcnt" class="form-control mlr5" placeholder="행 개수" min="1" max="100" oninput="fncCheckZero(this);" style="width:100px;"/>
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="고객명/모델번호 입력" style="width: auto;" />
				    <button type="button" onclick="findAll(0);" class="btn btn-secondary">
			        <span aria-hidden="true" class="glyphicon glyphicon-search">검색</span>
				    </button>
				    <a href="javascript: void(0);" onclick="fncRefresh(); return false;" class="btn btn-warning waves-effect waves-light ml5">새로고침</a>
			    </div>
				</div>
	    </form>
			<div class="table-responsive clearfix">
				<table class="table">
					<thead>
						<tr>
							<th rowspan="2" class="text-center">No</th>
							<th rowspan="2" class="text-center border-left"><a href="javascript:void(0);" class="btn btn-success btn-circle btn-sm"><i class="fas fa-check"></i></a></th>
							<th rowspan="2" class="text-center border-left">매장</th>
							<th rowspan="2" class="text-center border-left">일자</th>
							<th rowspan="2" class="text-center border-left">구분</th>
							<th rowspan="2" class="text-center border-left">고객</th>
							<th rowspan="2" class="text-center border-left">시리얼<br/>접수번호</th>
							<th rowspan="2" class="text-center border-left">모델<br/>번호</th>
							<th rowspan="2" class="text-center border-left">재질</th>
							<th rowspan="2" class="text-center border-left">비고사항<br/>스톤종류</th>
							<th rowspan="2" class="text-center border-left">수량</th>
							<th rowspan="2" class="text-center border-left">구매가</th>
							<th rowspan="2" class="text-center border-left">TAG가</th>
							<th rowspan="2" class="text-center border-left">매출<br/>금액</th>
							<th colspan="7" class="text-center border-left">결제(받은) 금액</th>
							<th rowspan="2" class="text-center border-left">적립<br/>포인트</th>
						</tr>
						<tr>
							<th class="text-center border-left">구분</th>
							<th class="text-center border-left">카드</th>
							<th class="text-center border-left">현금</th>
							<th class="text-center border-left">고금</th>
							<th class="text-center border-left">기타</th>
							<th class="text-center border-left">포인</th>
							<th class="text-center border-left">합계</th>
						</tr>
					</thead>
					<tbody id="list"></tbody>
				</table>
				
				<div class="text-left mt-3">
					<a href="javascript: void(0);" class="btn btn-success btn-circle btn-sm"><i class="fas fa-check"></i></a><span class="ml5">체크된 것</span>
	        <a href="javascript: alert('준비중입니다.');" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">고객변경</span></a>
	        <a href="javascript: alert('준비중입니다.');" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">거래일변경</span></a>
	        <a href="javascript: alert('준비중입니다.');" id="remove-btn" class="btn btn-danger btn-icon-split btn-sm mlr5"><span class="text">삭제</span></a>
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
				currentpage: page
				, searchstore: form.searchstore.value
				, searchsaletype: form.searchsaletype.value
				, searchmaterial: form.searchmaterial.value
				, searchstdt: form.searchstdt.value
				, searcheddt: form.searcheddt.value
				, searchrecordcnt: form.searchrecordcnt.value
				, searchword: form.searchword.value
			}
			checkListNullParams(params);
	
			const queryString = new URLSearchParams(params).toString();
			const replaceUri = location.pathname + '?' + queryString;
			history.replaceState({}, '', replaceUri);
			
			getJson('/api/sale/list', params).then(response => {
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<td colspan="22" class="text-center">판매내역이 없습니다.</td>';
					drawPages();
					return false;
				}
	
				let html = '';
				let num = response.params.totalcount - (response.params.currentpage-1) * response.params.recordcount;
				
				quantityTotal = 0;
				purchaseTotal = 0;
				consumerPriceTotal = 0;
				
     		response.list.forEach((obj, idx) => {
     			backgroundTr = '';
     			if(checkNullVal(obj.saletype) == 'ORDER')
     				backgroundTr = 'bg-springgreen';
     			html += `
     				<tr class="`+backgroundTr+` small">
     					<td class="text-center">
								<a href="javascript: void(0);" onclick="fncPopupView('`+checkNullVal(obj.saleno)+`','`+checkNullVal(obj.saletype)+`','`+checkNullVal(obj.saletype2)+`'); return false;">` + (num--) + `</a>
							</td>
     					<td class="text-center">
     						<input type="checkbox" name="saleno_no_arr" class="form-check" value="`+checkNullVal(obj.saleno)+`"/>
							</td>
							<td class="text-center blue">` + checkNullVal(codemap[checkNullVal(obj.storecd)]) + `</td>
							<td class="text-center">` + checkNullVal(obj.saleday) + `<span class="blue">` + checkSubstringNullVal(obj.saledt,2,10) + `</span></td>
					`;
					saletypenm = (checkNullVal(obj.saletype) == 'ORDER' ? '주문' : '판매');
     			html += `
							<td class="text-center">` + saletypenm + `</td>
							<td class="text-center"><a href="javascript: void(0)" onclick="fncPopupCustomerView('`+obj.customerno+`'); return false;">` + checkNullVal(obj.customernm) + `</a></td>
							<td class="text-center blue">` + checkNullVal(obj.saleno) + `</td>
							<td class="text-center"><a href="javascript: void(0)" onclick="fncPopupCatalogView('`+obj.catalogno+`'); return false;">` + checkNullVal(obj.modelid) + `</a></td>
							<td class="text-center important">` + checkNullVal(codemap[checkNullVal(obj.materialcd)]) + `</td>
							<td class="text-center">` + checkNullVal(obj.saledesc) + `<div class="blue">` + checkNullVal(obj.mainstonetype) + `</div></td>
							<td class="text-center">` + checkNullVal(obj.quantity) + `</td>
					`;
					
					weight = 0;
					materialCd = checkNullVal(obj.materialcd);
					if(materialCd == 'SM01') weight = 0.6435;
					else if(materialCd == 'SM02') weight = 0.825;
					else if(materialCd == 'SM03') weight = 1;
					
					perPrice = Number(checkNullValR(obj.purchaseprice,'0'));
					realPchGoldPrice = Number(checkNullValR(obj.realpchgoldprice,'0'));
					realPchGoldPrice = realPchGoldPrice*(Number(checkNullValR(obj.perweightgram,'0'))*weight)+perPrice;
					realPchGoldPriceTxt = (realPchGoldPrice == 0 || realPchGoldPrice == 0.0 ? '' : priceWithComma(realPchGoldPrice));

					html += `
							<td class="text-right">` + realPchGoldPriceTxt + `</td>
							<td class="text-right">` + (checkNullVal(obj.consumerprice) == '' ? '' : priceWithComma(obj.consumerprice)) + `</td>
							<td class="text-center">` + priceWithComma(obj.saleprice) + `</td>
							<td class="text-center">` + checkNullVal(codemap[checkNullVal(obj.recpaytypecd)]) + `</td>
							<td class="text-center">` + priceWithComma(obj.cardprice) + `</td>
							<td class="text-center">` + priceWithComma(obj.cashprice) + `</td>
							<td class="text-center">` + priceWithComma(obj.maintprice) + `</td>
							<td class="text-center">` + priceWithComma(obj.pntprice) + `</td>
							<td class="text-center">` + priceWithComma(obj.etcprice) + `</td>
					`;
					totalRecPayPrice = Number(obj.saleprice) + Number(obj.cardprice) + Number(obj.cashprice);
					totalRecPayPrice += Number(obj.maintprice) + Number(obj.pntprice) + Number(obj.etcprice);
					html += `
							<td class="text-center">` + (totalRecPayPrice == 0 ? '' : priceWithComma(totalRecPayPrice))+ `</td>
							<td class="text-center">` + priceWithComma(obj.accupnt) + `</td>
						</tr>
					`;
					quantityTotal += Number(checkNullValR(obj.quantity,'0'));
					purchaseTotal += Math.round(Number(checkNullValR(realPchGoldPrice,'0')),0);
					consumerPriceTotal += Number(checkNullValR(obj.consumerprice,'0'));
     		});
     		html += `
     			<tr class="bg-lightyellow border-bottom small">
	     			<td colspan="10" class="text-right">판매/주문/수리 소계</td>
	     			<td class="text-center">`+(quantityTotal == 0 ? '' : quantityTotal)+`</td>
	     			<td class="text-right">`+(purchaseTotal == 0 ? '' : priceWithComma(purchaseTotal))+`</td>
	     			<td class="text-right">`+(consumerPriceTotal == 0 ? '' : priceWithComma(consumerPriceTotal))+`</td>
	     			<td class="text-right"></td>
	     			<td colspan="7" class="text-right"></td>
	     			<td class="text-right"></td>
	     		</tr>
     		`;
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
		 * 조회하기
		 */
		function fncPopupView(saleno, saletype, saletype2) {
		  var url = '';
      var name = '';
			if(saletype == 'ORDER'){
				if(saletype2 == 'CUSTOMER'){
					url = "/order/popup/customer/"+saleno;
					name = "orderViewPopup";
				}
				else {
					url = "/order/popup/read-made/"+saleno;
					name = "orderViewPopup";
				}
			}
			else {
				url = "/stock/popup/"+saleno;
				name = "stockViewPopup";
			}
      var option = "width = 1500, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}

		/**
		 * 고객 조회 팝업
		 */
		function fncPopupCustomerView(catalogno){
		  var url = "/customer/popup/"+catalogno;
      var name = "customerViewPopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		
		/**
		 * 카다로그 조회 팝업
		 */
		function fncPopupCatalogView(catalogno){
		  var url = "/catalog/popup/"+catalogno;
      var name = "catalogViewPopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		
		function fncRemove(){

			var orderscheckcnt = 0;
			$(".form-check").each(function(){
				if($(this).is(":checked")){
					orderscheckcnt++;
				}
			});
			if(orderscheckcnt == 0){
				alert('삭제할 주문이력을 선택해주세요.');
				return false;
			}
			if(confirm('삭제하시겠습니까?')){
				const form = document.getElementById('searchForm');
				const writeForm = new FormData(form);
	
				const formData = new FormData();
				$(".form-check").each(function(){
					if($(this).is(":checked"))
						formData.append("stock_no_arr[]", checkNullVal($(this).val()));
				});
								
				fetch('/api/sale/sales/remove', {
					method: 'PATCH',
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

		function fncPopupCustomerModify(){
			var ordersno = '';
			$(".form-check").each(function(){
				if($(this).is(":checked")){
					if(ordersno != '')
						ordersno += ',';
					ordersno += $(this).val();
				}
			});
			
			if(ordersno == ''){
				alert('주문내역을 선택해주세요.');
				return false;
			}

		  var url = "/order/popup/customer/modify?ordersno="+ordersno;
      var name = "orderCustomerModifyPopup";
      var option = "width = 1100, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		
		function fncPopupSaleDateModify(){
			var nos = '';
			$(".form-check").each(function(){
				if($(this).is(":checked")){
					if(nos != '')
						nos += ',';
					nos += $(this).val();
				}
			});
			
			if(nos == ''){
				alert('재고내역을 선택해주세요.');
				return false;
			}
			
		  var url = "/stock/popup/reg-date/modify?stocksno="+stocksno;
      var name = "stockRegisterDateModifyPopup";
      var option = "width = 500, height = 300, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		
		function fncRefresh(){
			$("#adv-search").find("input").val('');
			$("#adv-search").find("select").val('');
			findAll(0);
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
	</script>
</body>
</html>