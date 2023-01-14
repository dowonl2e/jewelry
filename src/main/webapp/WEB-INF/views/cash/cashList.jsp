<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금 및 현금 관리</title>
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
		        <select id="searchstore" class="form-control">
	            <option value="">매장 전체</option>
	            <c:forEach var="stlist" items="${stlist}">
	            	<option value="${stlist.cdid}">${stlist.cdnm}</option>
	            </c:forEach>
		        </select>
		        <select id="searchcashtype" class="form-control ml5">
	            <option value="">입출구분</option>
	            <c:forEach var="rslist" items="${rslist}">
	            	<option value="${rslist.cdid}">${rslist.cdnm}</option>
	            </c:forEach>
		        </select>
		        <select id="searchbankbook" class="form-control ml5">
	            <option value="">통장구분</option>
	            <c:forEach var="btlist" items="${btlist}">
	            	<option value="${btlist.cdid}">${btlist.cdnm}</option>
	            </c:forEach>
		        </select>
		        <select id="searchcashtype2" class="form-control ml5">
	            <option value="">계정구분</option>
	            <c:forEach var="rslist" items="${rslist}">
	            	<option value="${rslist.cdid}">${rslist.cdnm}</option>
	            </c:forEach>
		        </select>
		        <select id="searchmaterial" class="form-control ml5">
	            <option value="">재질 전체</option>
	            <c:forEach var="smlist" items="${smlist}">
	            	<option value="${smlist.cdid}">${smlist.cdnm}</option>
	            </c:forEach>
		        </select>
			    </div>
			    <div class="form-inline mt5">
			    	<span class="mlr5">기간</span>
						<input type="date" id="searchstdt" class="form-control mlr5"/> ~
						<input type="date" id="searcheddt" class="form-control mlr5"/>
		        <input type="number" id="searchrecordcnt" class="form-control mlr5" placeholder="행 개수" min="1" max="100" oninput="fncCheckZero(this);" style="width:100px;"/>
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="거래처/내역 입력" style="width: auto;" />
				    <button type="button" onclick="findAll(0);" class="btn btn-secondary">
			        <span aria-hidden="true" class="glyphicon glyphicon-search">검색</span>
				    </button>
		        <a href="javascript: void(0);" onclick="fncRefresh(); return false;" class="btn btn-warning waves-effect waves-light mlr5">새로고침</a>
		        <c:if test="${sessionScope.WRITE_AUTH eq 'Y'}">
		        	<a href="javascript: void(0);" onclick="fncPopupCashWrite(); return false;" class="btn btn-primary waves-effect waves-light">자료등록</a>
		       	</c:if>
			    </div>
				</div>
	    </form>
			<div class="table-responsive clearfix">
				<table class="table">
					<colgroup>
						<col width="3%"/>
						<col width="3%"/>
						<col width="5%"/>
						<col width="10%"/>
						<col width="7%"/>
						<col width="8%"/>
						<col width="7%"/>
						<col width="7%"/>
						<col />
						<col width="6%"/>
						<col width="6%"/>
						<col width="4%"/>
						<col width="7%"/>
						<col width="7%"/>
						<col width="5%"/>
					</colgroup>
					<thead>
						<tr>
							<th class="text-center">No</th>
							<th class="text-center border-left"><input type="checkbox" onchange="fncCheckAll(this);"/></th>
							<th class="text-center border-left">매장</th>
							<th class="text-center border-left">등록일</th>
							<th class="text-center border-left">구분</th>
							<th class="text-center border-left">통장구분</th>
							<th class="text-center border-left">계정구분</th>
							<th class="text-center border-left">거래처</th>
							<th class="text-center border-left">내역</th>
							<th class="text-center border-left">재질</th>
							<th class="text-center border-left">중량(g)</th>
							<th class="text-center border-left">수량</th>
							<th class="text-center border-left">단가</th>
							<th class="text-center border-left">공급가</th>
							<th class="text-center border-left">세액</th>
						</tr>
					</thead>
					<tbody id="list"></tbody>
				</table>
				
				<div class="text-left mt-3">
					<a href="javascript: void(0);" class="btn btn-success btn-circle btn-sm"><i class="fas fa-check"></i></a><span class="ml5">체크된 것</span>
					<c:if test="${sessionScope.REMOVE_AUTH eq 'Y'}">
	        	<a href="javascript: void(0);" onclick="fncRemove(); return false;" id="remove-btn" class="btn btn-danger btn-icon-split btn-sm mlr5"><span class="text">삭제</span></a>
	        </c:if>
	    	</div>
	    					
				<nav aria-label="Page navigation" class="text-center">
			    <ul class="pagination"></ul>
				</nav>
				
				<div class="table-responsive clearfix" id="stats_div">
				</div>
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
		var codemap2 = {
			<c:forEach var="code" items="${cdmapper2}" varStatus="loop">
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
				, searchstore: form.searchstore.value
				, searchcashtype: form.searchcashtype.value
				, searchbankbook: form.searchbankbook.value
				, searchcashtype2: form.searchcashtype2.value
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

			getJson('/api/cash/list', params).then(response => {
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<td colspan="14" class="text-center">금/현금 내역이 없습니다.</td>';
					drawPages();
					return false;
				}
	
				let html = '';
				let num = response.params.totalcount - (response.params.currentpage-1) * response.params.recordcount;
				const viewAuth = '${sessionScope.VIEW_AUTH}';
				
				recWeightGramSum = 0.0;
				recQuantitySum = 0;
				recUnitPriceSum = 0;
				shipWeightGramSum = 0.0;
				shipQuantitySum = 0;
				shipUnitPriceSum = 0;
				totalWeightGramSum = 0.0;
				totalQuantitySum = 0;
				totalUnitPriceSum = 0;
     		response.list.forEach((obj, idx) => {
     			fontClass = checkNullVal(obj.cashtypecd) == 'RS02' ? 'blue' : '';
     			html += `
     				<tr class="small `+fontClass+`">
							<td class="text-center">
					`;
					if(viewAuth == 'Y'){
						html += `		<a href="javascript: void(0);" onclick="fncPopupView('`+checkNullVal(obj.cashno)+`'); return false;">` + (num--) + `</a>`;
					}
					else {
						html += (num--);
					}
					html += `
							</td>
							<td class="text-center"><input type="checkbox" name="cash_no_arr" class="form-check" value="`+checkNullVal(obj.cashno)+`"/></td>
							<td class="text-center">` + checkNullVal(codemap[obj.storecd]) + `</td>
							<td class="text-center">` + checkNullVal(obj.regday) + ` ` + checkSubstringNullVal(obj.regdt,0,10) + `</td>
							<td class="text-center">` + checkNullVal(codemap[obj.cashtypecd]) + `</td>
							<td class="text-center">` + checkNullVal(codemap[obj.bankbookcd]) + `</td>
							<td class="text-center">` + checkNullVal(codemap2[obj.cashtypecd2]) + `</td>
							<td class="text-center">` + checkNullVal(obj.vendernm) + `</td>
							<td class="text-left">` + checkNullVal(obj.historydesc) + `</td>
							<td class="text-center">` + checkNullVal(codemap[obj.materialcd]) + `</td>
							<td class="text-right">` + checkNullVal(obj.weightgram) + `</td>
							<td class="text-center">` + checkNullVal(obj.quantity) + `</td>
							<td class="text-right">` + priceWithComma(obj.unitprice) + `</td>
							<td class="text-right">` + priceWithComma(obj.unitprice) + `</td>
							<td></td>
						</tr>
					`;
					
					
					if(checkNullVal(obj.cashtypecd) == 'RS01'){
						recWeightGramSum += Number(checkNullValR(obj.weightgram,'0'));
						recQuantitySum += Number(checkNullValR(obj.quantity,'0'));
						recUnitPriceSum += Number(checkNullValR(obj.unitprice,'0'));
						totalWeightGramSum += Number(checkNullValR(obj.weightgram,'0'));
						totalQuantitySum += Number(checkNullValR(obj.quantity,'0'));
						totalUnitPriceSum += Number(checkNullValR(obj.unitprice,'0'));
					}
					else if(checkNullVal(obj.cashtypecd) == 'RS02'){
						shipWeightGramSum += Number(checkNullValR(obj.weightgram,'0'));
						shipQuantitySum += Number(checkNullValR(obj.quantity,'0'));
						shipUnitPriceSum += Number(checkNullValR(obj.unitprice,'0'));
						totalWeightGramSum -= Number(checkNullValR(obj.weightgram,'0'));
						totalQuantitySum -= Number(checkNullValR(obj.quantity,'0'));
						totalUnitPriceSum -= Number(checkNullValR(obj.unitprice,'0'));
					}
     		});
     		html += `
     			<tr class="weight-500 important bg-lightyellow">
     				<td colspan="10" class="small weight-600 text-right">입고 리스트 합계</td>
     				<td class="small weight-600 text-right">` + (recWeightGramSum == 0.0 ? '' : ((Math.round(recWeightGramSum*100)/100)+'')) + `</td>
     				<td class="small weight-600 text-center">` + (recQuantitySum == 0 ? '' : (recQuantitySum+'')) + `</td>
     				<td></td>
     				<td colspan="2" class="small weight-600 text-right">` + (recUnitPriceSum == 0 ? '' : (priceWithComma(recUnitPriceSum)+'')) + `</td>
     			</tr>
     			<tr class="blue">
		 				<td colspan="10" class="small weight-600 text-right">출고 리스트 합계</td>
     				<td class="small weight-600 text-right">` + (shipWeightGramSum == 0.0 ? '' : ((Math.round(shipWeightGramSum*100)/100)+'')) + `</td>
     				<td class="small weight-600 text-center">` + (shipQuantitySum == 0 ? '' : (shipQuantitySum+'')) + `</td>
     				<td></td>
     				<td colspan="2" class="small weight-600 text-right">` + (shipUnitPriceSum == 0 ? '' : (priceWithComma(shipUnitPriceSum)+'')) + `</td>
		 			</tr>
		 			<tr class="bg-lightyellow3">
     				<td colspan="10" class="small weight-600 text-right">입고-출고 리스트 합계</td>
     				<td class="small weight-600 text-right">` + (totalWeightGramSum == 0.0 ? '' : ((Math.round(totalWeightGramSum*100)/100)+'')) + `</td>
     				<td class="small weight-600 text-center">` + (totalQuantitySum == 0 ? '' : (totalQuantitySum+'')) + `</td>
     				<td></td>
     				<td colspan="2" class="small weight-600 text-right">` + (totalUnitPriceSum == 0 ? '' : (priceWithComma(totalUnitPriceSum)+'')) + `</td>
     			</tr>
				`;
				document.getElementById('list').innerHTML = html;
				drawPages(response.params);

				let html2 = '';
				html2 += `
					<table class="table">
						<thead>
							<tr>
								<th class="text-center">매장명</th>
								<th class="text-center border-left">통장 및 재질 구분</th>
								<th class="text-center border-left">전일</th>
								<th class="text-center border-left">`+response.today+`</th>
							</tr>
						</thead>
						<tbody>
				`;
			
				//전일 당일 통계
				if (response.statslist == null || response.statslist.length == 0) {
					<c:forEach var="st" items="${stlist}">
						html2 += `
		      	  <tr class="border-bottom">
		      		  <th class="text-center">${st.cdnm}</th>
		      		  <td></td>
		      		  <td></td>
		      		  <td></td>
		      		</tr>
		      	`;
		      </c:forEach>
				}
				else {
					statsListLen = response.statslist.length;
	      	let yesBankBookTotal = 0;
	      	let todayBankBookTotal = 0;

					<c:forEach var="st" items="${stlist}">
		      	html2 += `
		      	  <tr class="border-bottom">
		      		  <th rowspan="`+(statsListLen+3)+`" class="text-center">${st.cdnm}</th>
		      		</tr>
		      	`;
		      	befYesBankBookTotal = 0;
		      	yesBankBookTotal = 0;
		      	todayBankBookTotal = 0;
      			response.statslist.forEach((obj, idx) => {
      				if('${st.cdid}' == checkNullVal(obj.storecd)){
      					if(checkSubstringNullVal(obj.statscd,0,2) == 'BT'){
      						html2 += `
	      						<tr>
	      							<td class="text-center border-right">`+checkNullVal(codemap[obj.statscd])+`</td>
	      							<td class="text-right border-right">`+priceWithComma(Number(checkNullValR(obj.yesterdayprice,'0')) + Number(checkNullValR(obj.befYesterdayPrice,'0')))+`</td>
	      							<td class="text-right">`+priceWithComma(Number(checkNullValR(obj.yesterdayprice,'0'))+Number(checkNullValR(obj.todayprice,'0')))+`</td>
	      						</tr>
	      					`;
      						befYesBankBookTotal += Number(obj.befYesterdayPrice == null ? 0 : checkNullValR(obj.befYesterdayPrice,'0'));
      						yesBankBookTotal += Number(obj.yesterdayprice == null ? 0 : checkNullValR(obj.yesterdayprice,'0'));
      						todayBankBookTotal += Number(obj.todayprice == null ? 0 : checkNullValR(obj.todayprice,'0'));
      					}      					
      				}
      			});
      			html2 += `
      				<tr class="bg-lightyellow">
      			    <td class="text-right border-right">현금합계</td>
      			    <td class="text-right border-right">`+priceWithComma(yesBankBookTotal + befYesBankBookTotal)+`</td>
      			    <td class="text-right">`+priceWithComma(yesBankBookTotal+todayBankBookTotal)+`</td>
      			  </tf>
      			`;
      			response.statslist.forEach((obj, idx) => {
	    				if('${st.cdid}' == checkNullVal(obj.storecd)){
	    					if(checkSubstringNullVal(obj.statscd,0,2) == 'SM'){
	    						html2 += `
	      						<tr>
	      							<td class="text-center border-right">`+checkNullVal(codemap[obj.statscd])+`</td>
	      							<td class="text-right border-right">`+priceWithComma(obj.yesterdayprice)+`</td>
	      							<td class="text-right">`+priceWithComma(obj.todayprice)+`</td>
	      						</tr>
	      					`;
	    					}      					
	    				}
	    			});
		      </c:forEach>
				}
				html2 += `
						</tbody>
					</table>
				`;
				document.getElementById('stats_div').innerHTML = html2;
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
	
		function fncPopupCashWrite(){
		  var url = "/cash/popup/write";
      var name = "cashWritePopup";
      var option = "width = 1150, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		
		/**
		 * 조회하기
		 */
		function fncPopupView(orderno, ordertype) {
		  var url = "/cash/popup/"+orderno;
      var name = "cashViewPopup";
      var option = "width = 1150, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		/**
		 * 수정하기
		 */
		function fncPopupModify(customerno) {
		  var url = "/order/popup/modify/"+customerno;
      var name = "orderModifyPopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		
		function fncRemove(){

			var checkcnt = 0;
			$(".form-check").each(function(){
				if($(this).is(":checked")){
					checkcnt++;
				}
			});
			if(checkcnt == 0){
				alert('삭제할 이력을 선택해주세요.');
				return false;
			}
			if(confirm('삭제하시겠습니까?')){
				const form = document.getElementById('searchForm');
				const writeForm = new FormData(form);
	
				const formData = new FormData();
				$(".form-check").each(function(){
					if($(this).is(":checked"))
						formData.append("cash_no_arr[]", checkNullVal($(this).val()));
				});
								
				fetch('/api/cash/cashes/remove', {
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

		function fncPopupStepModify(){
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
			
		  var url = "/order/popup/step/modify?ordersno="+ordersno;
      var name = "orderStepModifyPopup";
      var option = "width = 500, height = 300, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}

		//새로고침
		function fncRefresh(){
			$("#adv-search").find("input").val('');
			$("#adv-search").find("select").val('');
			findAll(0);
		}
		
		function fncCheckAll(obj){
			if($(obj).is(":checked")){
				$(".form-check").attr("checked", true);
			}
			else {
				$(".form-check").attr("checked", false);
			}
		}

		function refresh(){
			findAll('${param.currentpage}');
		}
	</script>
</body>
</html>