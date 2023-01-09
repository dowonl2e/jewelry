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
		        <select id="searchstore" class="form-control mlr5">
	            <option value="">매장 전체</option>
	            <c:forEach var="stlist" items="${stlist}">
	            	<option value="${stlist.cdid}">${stlist.cdnm}</option>
	            </c:forEach>
		        </select>
		        <input type="date" id="searchstdt" class="form-control mlr5" maxlength="10" />
		        <input type="number" id="searchrecordcnt" class="form-control mlr5" placeholder="행 개수" min="1" max="100" oninput="fncCheckZero(this);" style="width:100px;"/>
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="제조사명 입력" style="width: auto;" />
				    <button type="button" onclick="findAll(0);" class="btn btn-secondary">
			        <span aria-hidden="true" class="glyphicon glyphicon-search">검색</span>
				    </button>
		        <a href="javascript: void(0);" onclick="fncRefresh(); return false;" class="btn btn-warning waves-effect waves-light mlr5">새로고침</a>
		       	<c:if test="${sessionScope.WRITE_AUTH eq 'Y'}">
		        	<a href="javascript: void(0);" onclick="fncPopupWrite();" class="btn btn-primary waves-effect waves-light">자료등록</a>
		        </c:if>
					</div>
				</div>
	    </form>
			<div class="table-responsive clearfix">
				<table class="table">
					<thead>
						<tr>
							<th rowspan="2" class="">No.</th>
							<th rowspan="2" class="border-left"><input type="checkbox" onclick="fncCheckAll(this);"/></th>
							<th rowspan="2" class="border-left">제조사</th>
							<th rowspan="2" class="border-left">등록일자</th>
							<th colspan="2" class="border-left">결제 예정(제조사)</th>							
							<th colspan="2" class="border-left">결제진행내용</th>
							<th colspan="2" class="border-left">거래 후 미수</th>
							<th rowspan="2" class="border-left">비고</th>
  					</tr>
  					<tr>
  						<th class="border-left">순금결제금액</th>
  						<th class="border-left">공임결제금액</th>
  						<th class="border-left">순금결제금액</th>
  						<th class="border-left">공임결제금액</th>
  						<th class="border-left">순금미수</th>
  						<th class="border-left">공임미수</th>
  					</tr>
					</thead>
					<tbody id="list" class="border-bottom"></tbody>
				</table>
				<div class="btn_wrap text-left mt-3">
					<a href="javascript: void(0);" class="btn btn-success btn-circle btn-sm"><i class="fas fa-check"></i></a><span class="ml5">체크된 것</span>
					<c:if test="${sessionScope.REMOVE_AUTH eq 'Y'}">
		      	<a href="javascript: void(0);" onclick="fncRemove(); return false;" id="remove-btn" class="btn btn-danger btn-icon-split btn-sm mlr5"><span class="text">삭제</span></a>
		      </c:if>
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
				, searchstore: form.searchstore.value
				, searchrecordcnt: form.searchrecordcnt.value
				, searchword: form.searchword.value
			}
			checkListNullParams(params);
	
			const queryString = new URLSearchParams(params).toString();
			const replaceUri = location.pathname + '?' + queryString;
			history.replaceState({}, '', replaceUri);
			
			getJson('/api/vender/pay/list', params).then(response => {
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<td colspan="11" class="text-center">등록된 제조사 결제내역이 없습니다.</td>';
					drawPages();
					return false;
				}
	
				let html = '';
				let num = response.params.totalcount - (response.params.currentpage-1) * response.params.recordcount;
				const viewAuth = '${sessionScope.VIEW_AUTH}';
				
				var exptSumGram = 0;
				var exptSumPrice = 0;
				var prgSumGram = 0;
				var prgSumPrice = 0;
				var exptDotMaxLen = 0;
				var prgDotMaxLen = 0;
     		response.list.forEach((obj, idx) => {
     			calGoldGram = 0;
     			calPayPrice = 0;
     			
     			html += `
     				<tr>
							<td class="text-center">` + (num--) + `</td>
							<td class="text-center"><input type="checkbox" class="form-check-inline form-check" value="`+checkNullVal(obj.payNo)+`" /></td>
							<td class="text-center bold">
					`;
					if(viewAuth == 'Y'){
						html += `		<a href="javascript: void(0);" onclick="fncPopupView('` + obj.payNo + `'); return false;">`+checkNullVal(obj.venderNm)+`</a>`;
					}
					else {
						html += checkNullVal(obj.venderNm);
					}
					html += `
							</td>
							<td class="text-center">` + checkSubstringNullVal(obj.regDt,0,10) +`</td>
							<td class="text-center">` + checkNullValR(obj.exptGoldGram,'0')+`g</td>
							<td class="text-center">` + priceWithComma(checkNullValR(obj.exptPayPrice,'0'))+`</td>
							<td class="text-center">` + checkNullValR(obj.prgGoldGram,'0')+`g</td>
							<td class="text-center">` + priceWithComma(checkNullValR(obj.prgPayPrice,'0'))+`</td>
					`;
					
					exptGoldGram = checkNullValR(obj.exptGoldGram,'0');
					exptGoldGramIdx = exptGoldGram.indexOf('.');
					exptGoldGramLen = (exptGoldGramIdx > 0) ? exptGoldGram.length - (exptGoldGramIdx+1) : 0;
					
					prgGoldGram = checkNullValR(obj.prgGoldGram,'0');
					prgGoldGramIdx = prgGoldGram.indexOf('.');
					prgGoldGramLen = (prgGoldGramIdx > 0) ? prgGoldGram.length - (prgGoldGramIdx+1) : 0;
					
					gramDotLen = exptGoldGramLen < prgGoldGramLen ? prgGoldGramLen : exptGoldGramLen;
					
					calGoldGram = Number(exptGoldGram) - Number(prgGoldGram);
					calPayPrice = Number(checkNullValR(obj.exptPayPrice,'0')) - Number(checkNullValR(obj.prgPayPrice,'0'));
					html += `
							<td class="text-center">` + (calGoldGram == 0.0 ? '0' : calGoldGram.toFixed(gramDotLen)) + `g</td>
							<td class="text-center">` + priceWithComma(calPayPrice) + `</td>
							<td class="text-center">` + checkNullVal(obj.payEtc)+`</td>
	   				</tr>
     			`;
     			
     			exptDotMaxLen = exptDotMaxLen <= exptGoldGramLen ? exptGoldGramLen : exptDotMaxLen;
     			prgDotMaxLen = prgDotMaxLen <= prgGoldGramLen ? prgGoldGramLen : prgDotMaxLen;
     			
     			
					exptSumGram += Number(exptGoldGram);
					exptSumPrice += Number(checkNullValR(obj.exptPayPrice,'0'));
					prgSumGram += Number(checkNullValR(obj.prgGoldGram,'0'));
					prgSumPrice += Number(checkNullValR(obj.prgPayPrice,'0'));
     		});

     		html += `
     			<tr>
		 				<th colspan="4" class="border-right">합계</th>
		 				<th class="border-right">` + (exptSumGram == 0.0 ? '0' : exptSumGram.toFixed(exptDotMaxLen)) + `g</th>
		 				<th class="border-right">` + priceWithComma(exptSumPrice) + `</th>
		 				<th class="border-right">` + (prgSumGram == 0.0 ? '0' : prgSumGram.toFixed(prgDotMaxLen)) + `g</th>
		 				<th class="border-right">` + priceWithComma(prgSumPrice) + `</th>
		 		`;
		 		
		 		sumDotMaxLen = exptDotMaxLen <= prgDotMaxLen ? prgDotMaxLen : exptDotMaxLen;
		 		sumGoldGram = exptSumGram - prgSumGram;
		 		html += `
		 				<th class="border-right">` + (sumGoldGram == 0.0 ? '0' : sumGoldGram.toFixed(sumDotMaxLen)) + `g</th>
		 				<th class="border-right">` + priceWithComma(exptSumPrice-prgSumPrice) + `</th>
		 				<th></th>
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
		
		function fncRemove(){

			var paycheckcnt = 0;
			$(".form-check").each(function(){
				if($(this).is(":checked")){
					paycheckcnt++;
				}
			});
			if(paycheckcnt == 0){
				alert('삭제할 결제이력을 선택해주세요.');
				return false;
			}
			if(confirm('삭제하시겠습니까?')){
				const formData = new FormData();
				$(".form-check").each(function(){
					if($(this).is(":checked"))
						formData.append("pay_no_arr[]", checkNullVal($(this).val()));
				});
								
				fetch('/api/vender/pays/remove', {
					method: 'PATCH',
					body: formData
				}).then(response => {
					if(!response.ok){
						throw new Error('Request Failed...');
					}
					alert('삭제되었습니다.');
					refresh();
				}).catch(error => {
					alert('오류가 발생하였습니다.');
				});
			}
		}
		
		/**
		 * 작성하기
		 */
		function fncPopupWrite() {
		  var url = "/vender/pay/popup/write";
      var name = "venderPayWritePopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}

		/**
		 * 조회하기
		 */
		function fncPopupView(payno) {
		  var url = "/vender/pay/popup/"+payno;
      var name = "venderPayViewPopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
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