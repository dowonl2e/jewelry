<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리</title>
<script>
	var minNumberLen = 1;
	var maxNumberLen = 100;
</script>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">코드현황</h6>
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
		        <select id="searchstep" class="form-control ml5">
	            <option value="">단계 전체</option>
	            <option value="A">주문등록</option>
	            <option value="B">주문접수</option>
	            <option value="C">주문 재고등록 완료</option>
	            <option value="F">판매처리완료</option>
		        </select>
			    </div>
			    <div class="form-inline mt5">
			    	<span class="mlr5">접수일</span>
						<input type="date" id="searchstdt" class="form-control mlr5"/> ~
						<input type="date" id="searcheddt" class="form-control mlr5"/>
		        <input type="number" id="searchrecordcnt" class="form-control mlr5" placeholder="행 개수" min="1" max="100" oninput="fncCheckZero(this);" style="width:100px;"/>
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="계약고객/배우자명을 입력" style="width: auto;" />
				    <button type="button" onclick="findAll(0);" class="btn btn-secondary">
			        <span aria-hidden="true" class="glyphicon glyphicon-search">검색</span>
				    </button>
				    <a href="javascript: void(0);" onclick="fncPopupWrite();" class="btn btn-primary waves-effect waves-light ml5">고객</a>
				    <a href="javascript: void(0);" onclick="fncPopupWrite();" class="btn btn-danger waves-effect waves-light ml5">기성</a>
			    </div>
				</div>
	    </form>
			<div class="table-responsive clearfix">
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">No</th>
							<th class="text-center border-left">V</th>
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
	 			const active = ((i) === (pagination.currentpage)) ? 'class="active"' : '';
	            html += '<li><a href="javascript:void(0)" onclick="findAll(\''+(i+1)+'\')">'+(i+1)+'</a></li>';
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
			  page: page
				, searchstore: form.searchstore.value
				, searchmaterial: form.searchmaterial.value
				, searchrecordcnt: form.searchrecordcnt.value
				, searchword: form.searchword.value
			}
			checkListNullParams(params);
	
			const queryString = new URLSearchParams(params).toString();
			const replaceUri = location.pathname + '?' + queryString;
			history.replaceState({}, '', replaceUri);
			
			getJson('/api/order/list', params).then(response => {
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
							<td class="text-center">` + (num--) + `</td>
							<td class="text-center"><input type="checkbox" id="arr_customer_no" value="`+checkNullVal(obj.customerno)+`"/></td>
							<td class="text-center">
								<div>접:` + checkSubstringNullVal(obj.receiptdt,0,10) + `</div>
								<div>주:` + checkSubstringNullVal(obj.expectedorddt,0,10) + `</div>
							</td>
							<td class="text-center"></td>
							<td class="text-center bold">
								`+checkNullVal(obj.vendernm)+`
							</td>
							<td class="text-center">` + checkNullVal(obj.contractornm)+`</td>
							<td class="text-center">` + checkNullVal(obj.contractorcel)+`</td>
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

		/**
		 * 작성하기
		 */
		function fncPopupWrite() {
		  var url = "./popup/write";
      var name = "customerWritePopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}

		/**
		 * 수정하기
		 */
		function fncPopupModify(customerno) {
		  var url = "./popup/modify/"+customerno;
      var name = "customeModifyPopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
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