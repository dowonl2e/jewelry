<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리</title>
<script>
	var minNumberLen = 1;
	var maxNumberLen = 100;
</script>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">재고관리</h6>
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
		        <select id="searchstocktype" class="form-control ml5">
	            <option value="">현재고구분</option>
	            <c:forEach var="oclist" items="${oclist}">
	            	<option value="${oclist.cdid}">${oclist.cdnm}</option>
	            </c:forEach>
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
				    <a href="javascript: void(0);" onclick="findAll(0); return false;" class="btn btn-warning waves-effect waves-light ml5">새로고침</a>
				    <a href="javascript: void(0);" onclick="fncPopupStockWrite();" class="btn btn-primary waves-effect waves-light ml5">재고등록</a>
			    </div>
				</div>
	    </form>
			<div class="table-responsive clearfix">
				<table class="table">
					<thead>
						<tr>
							<th rowspan="2" class="text-center">No</th>
							<th rowspan="2" class="text-center border-left"><a href="javascript:void(0);" class="btn btn-success btn-circle btn-sm"><i class="fas fa-check"></i></a></th>
							<th rowspan="2" class="text-center border-left">등록일</th>
							<th rowspan="2" class="text-center border-left">시리얼</th>
							<th rowspan="2" class="text-center border-left">재고<br/>구분</th>
							<th rowspan="2" class="text-center border-left">사이즈<br/>비&nbsp;&nbsp;&nbsp;고</th>
							<th rowspan="2" class="text-center border-left">모델<br/>번호</th>
							<th rowspan="2" class="text-center border-left">재질</th>
							<th rowspan="2" class="text-center border-left">색상</th>
							<th rowspan="2" class="text-center border-left">메인</th>
							<th rowspan="2" class="text-center border-left">보조</th>
							<th rowspan="2" class="text-center border-left">수량</th>
							<th rowspan="2" class="text-center border-left">중량</th>
							<th colspan="3" class="text-center border-left">개당 구매가</th>
							<th rowspan="2" class="text-center border-left">배수</th>
							<th rowspan="2" class="text-center border-left">개당<br/>TAG가</th>
						</tr>
						<tr>
							<th class="text-center border-left">공임</th>
							<th class="text-center border-left">실질</th>
							<th class="text-center border-left">기준</th>
						</tr>
					</thead>
					<tbody id="list"></tbody>
				</table>
				
				<div class="text-left mt-3">
					<a href="javascript: void(0);" class="btn btn-success btn-circle btn-sm"><i class="fas fa-check"></i></a><span class="ml5">체크된 것</span>
	        <a href="javascript: void(0);" onclick="fncPopupStepModify(); return false;" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">판매</span></a>
	        <a href="javascript: void(0);" onclick="fncPopupCustomerModify(); return false;" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">고객주문</span></a>
	        <a href="javascript: void(0);" onclick="fncPopupVenderModify(); return false;" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">등록일 변경</span></a>
	        <a href="javascript: void(0);" onclick="fncPopupWrite(); return false;" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">재고구분변경</span></a>
	        <a href="javascript: void(0);" onclick="fncPopupWrite(); return false;" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">매입처변경</span></a>
	        <a href="javascript: void(0);" onclick="fncPopupWrite(); return false;" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">재고이동</span></a>
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
				, searchstocktype: form.searchstocktype.value
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
			
			getJson('/api/stock/list', params).then(response => {
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<td colspan="19" class="text-center">재고내역이 없습니다.</td>';
					drawPages();
					return false;
				}
	
				let html = '';
				let num = response.params.totalcount - (response.params.currentpage-1) * response.params.recordcount;
				
     		response.list.forEach((obj, idx) => {
     			html += `
     				<tr>
							<td class="text-center">
								<a href="javascript: void(0);" onclick="fncPopupView('`+checkNullVal(obj.stockno)+`'); return false;">` + (num--) + `</a>
							</td>
							<td class="text-center"><input type="checkbox" name="stock_no_arr" class="form-check" value="`+checkNullVal(obj.stockno)+`"/></td>
							<td class="text-center">` + checkSubstringNullVal(obj.regdt,2,10) + `</td>
							<td class="text-center bold">`+checkNullVal(obj.stockno)+`</td>
							<td class="text-center">`+ checkNullVal(codemap[obj.stocktypecd]) + `</td>
							<td class="text-center"><div class="border-bottom">` + checkNullVal(obj.size)+`</div><div>`+checkNullVal(obj.stockdesc)+`</div></td>
							<td class="text-center">` + checkNullVal(obj.modelid)+`</td>
							<td class="text-center">` + checkNullVal(codemap[obj.materialcd])+`</td>
							<td class="text-center">` + checkNullVal(codemap[obj.colorcd]) + `</td>
							<td class="text-center">` + checkNullVal(obj.mainstonetype) + `</td>
							<td class="text-center">` + checkNullVal(obj.substonetype) + `</td>
							<td class="text-center">` + checkNullVal(obj.quantity) + `</td>
							<td class="text-center">` + checkNullVal(obj.perweightgram) + `</td>
					`;
					//개당구매가 공임
					perPrice = Number(checkNullValR(obj.perpricebasic,'0'));
					perPrice += Number(checkNullValR(obj.perpriceadd,'0'));
					perPrice += Number(checkNullValR(obj.perpricemain,'0'));
					perPrice += Number(checkNullValR(obj.perpricesub,'0'));
					perPriceTxt = (perPrice == 0 || perPrice == 0.0 ? '' : priceWithComma(perPrice));
					html += `
							<td class="text-center">`+perPriceTxt+`</td>
					`;

					//재질별 중량 체크
					weight = 0;
					materialCd = checkNullVal(obj.materialcd);
					if(materialCd == 'SM01') weight = 0.6435;
					else if(materialCd == 'SM02') weight = 0.825;
					else if(materialCd == 'SM03') weight = 1;
					
					//개당구매가 실질
					realPchGoldPrice = Number(checkNullValR(obj.realpchgoldprice,'0'));
					realPchGoldPrice = realPchGoldPrice*weight+perPrice;
					realPchGoldPriceTxt = (realPchGoldPrice == 0 || realPchGoldPrice == 0.0 ? '' : priceWithComma(realPchGoldPrice));
					html += `
							<td class="text-center">`+realPchGoldPriceTxt+`</td>
					`;
					//개당구매가 기준
					html += `
							<td class="text-center">`+perPriceTxt+`</td>
							<td class="text-center">`+checkNullVal(obj.multiplecnt)+`</td>
					`;
					//소비자 TAG가
					consumerPrice = Number(checkNullValR(obj.multiplecnt,'0'))*perPrice;
					consumerPriceTxt = (consumerPrice == 0 || consumerPrice == 0.0 ? '' : priceWithComma(consumerPrice));
					html += `
							<td class="text-center">`+consumerPriceTxt+`</td>
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
		function fncPopupStockWrite() {
		  var url = "/stock/popup/write";
      var name = "stockWritePopup";
      var option = "width = 1500, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}

		/**
		 * 수정하기
		 */
		function fncPopupView(stockno) {
		  var url = "/stock/popup/"+stockno;
      var name = "stockViewPopup";
      var option = "width = 1500, height = 800, top = 100, left = 200, location = no";
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
								
				fetch('/api/stock/stocks/remove', {
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
		
		function fncPopupVenderModify(){
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

		  var url = "/order/popup/vender/modify?ordersno="+ordersno;
      var name = "orderVenderModifyPopup";
      var option = "width = 1100, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
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