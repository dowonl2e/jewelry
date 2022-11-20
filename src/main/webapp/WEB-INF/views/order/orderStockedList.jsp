<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고예정</title>
<script>
	var minNumberLen = 1;
	var maxNumberLen = 100;
</script>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">입고예정</h6>
		</div>
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
		        <select id="searchmaterial" class="form-control ml5">
	            <option value="">재질 전체</option>
	            <c:forEach var="smlist" items="${smlist}">
	            	<option value="${smlist.cdid}">${smlist.cdnm}</option>
	            </c:forEach>
		        </select>
			    </div>
			    <div class="form-inline mt5">
			    	<span class="mlr5">접수일</span>
						<input type="date" id="searchstdt" class="form-control mlr5"/> ~
						<input type="date" id="searcheddt" class="form-control mlr5"/>
		        <input type="number" id="searchrecordcnt" class="form-control mlr5" placeholder="행 개수" min="1" max="100" oninput="fncCheckZero(this);" style="width:100px;"/>
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="고객명/모델번호 입력" style="width: auto;" />
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
							<th class="text-center">No</th>
							<th class="text-center border-left"><a href="javascript:void(0);" class="btn btn-success btn-circle btn-sm"><i class="fas fa-check"></i></a></th>
							<th class="text-center border-left">접수일<br/>입고일</th>
							<th class="text-center border-left">구  분<br/>판매일</th>
							<th class="text-center border-left">매장명<br/>고객명</th>
							<th class="text-center border-left">사진</th>
							<th class="text-center border-left">모델번호<br/>접수번호</th>
							<th class="text-center border-left">재질<br/>색상</th>
							<th class="text-center border-left">수량</th>
							<th class="text-center border-left">메.스톤<br/>보.스톤</th>
							<th class="text-center border-left">사이즈</th>
							<th class="text-center border-left">기타 설명</th>
							<th class="text-center border-left">제조사<br/>제조사번호</th>
							<th class="text-center border-left">단계</th>
						</tr>
					</thead>
					<tbody id="list"></tbody>
				</table>
				
				<div class="text-left mt-3"><a href="javascript:void(0);" class="btn btn-success btn-circle btn-sm"><i class="fas fa-check"></i></a><span class="ml5">체크된 것</span>
	        <a href="javascript: void(0);" onclick="fncPopupStepModify(); return false;" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">단계변경</span></a>
	        <a href="javascript: void(0);" onclick="fncPopupCustomerModify(); return false;" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">고객변경</span></a>
	        <a href="javascript: void(0);" onclick="fncPopupVenderModify(); return false;" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">제조사 변경</span></a>
	        <a href="javascript: void(0);" onclick="fncPopupWrite(); return false;" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">재고등록</span></a>
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
				, searchmaterial: form.searchmaterial.value
				, searchrecordcnt: form.searchrecordcnt.value
				, searchword: form.searchword.value
			}
			checkListNullParams(params);
	
			const queryString = new URLSearchParams(params).toString();
			const replaceUri = location.pathname + '?' + queryString;
			history.replaceState({}, '', replaceUri);
			
			getJson('/api/order/stocked/list', params).then(response => {
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<td colspan="14" class="text-center">주문내역이 없습니다.</td>';
					drawPages();
					return false;
				}
	
				let html = '';
				let num = response.params.totalcount - (response.params.currentpage-1) * response.params.recordcount;
				
     		response.list.forEach((obj, idx) => {
     			html += `
     				<tr>
							<td class="text-center">
								<a href="javascript: void(0);" onclick="fncPopupView('`+checkNullVal(obj.orderno)+`','`+checkNullVal(obj.ordertype)+`'); return false;">` + (num--) + `</a>
							</td>
							<td class="text-center"><input type="checkbox" name="order_no_arr" class="form-check" value="`+checkNullVal(obj.orderno)+`"/></td>
							<td class="text-center">
								<div>접:` + checkSubstringNullVal(obj.receiptdt,0,10) + `</div>
								<div>주:` + checkSubstringNullVal(obj.expectedorddt,0,10) + `</div>
							</td>
							<td class="text-center">`+ (checkNullVal(obj.ordertype) == 'CUSTOMER' ? '고객<br/>주문' : '기성<br/>주문') + `</td>
							<td class="text-center bold">
								`+checkNullVal(codemap[obj.storecd])+`<br/>`+checkNullVal(obj.customernm)+`
							</td>
					`;
					html += `
							<td class="text-center"><img src="/file/image/display?filePath=`+checkNullVal(obj.filepath)+`&fileName=`+checkNullVal(obj.filenm)+`" width="60px;" height="60px"/></td>
							<td class="text-center">` + checkNullVal(obj.modelid)+`<br/>`+checkNullVal(obj.orderno)+`</td>
							<td class="text-center"><span class="important">` + checkNullVal(codemap[obj.materialcd])+`</span><br/>`+checkNullVal(codemap[obj.colorcd])+`</td>
							<td class="text-center">` + checkNullVal(obj.quantity) + `</td>
							<td class="text-center">` + checkNullVal(obj.mainstonetype) + `<br/>` + checkNullVal(obj.substonetype) + `</td>
							<td class="text-center">` + checkNullVal(obj.size) + `</td>
							<td class="text-center">` + checkNullVal(obj.orderdesc) + `</td>
							<td class="text-center">` + checkNullVal(obj.vendernm) + `<br/>` + checkNullVal(obj.venderno) + `</td>
							<td class="text-center">` + checkNullVal(obj.orderstep) + `</td>
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
		 * 수정하기
		 */
		function fncPopupView(orderno, ordertype) {
		  var url = ordertype == 'CUSTOMER' ? "/order/popup/customer/"+orderno : "/order/popup/read-made/"+orderno;
      var name = "orderViewPopup";
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
		
		function fncPopupStepModify(){
			var ordersno = '';
			$("input[name=order_no_arr]").each(function(){
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
						formData.append("order_no_arr[]", checkNullVal($(this).val()));
				});
								
				fetch('/api/order/orders/remove', {
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