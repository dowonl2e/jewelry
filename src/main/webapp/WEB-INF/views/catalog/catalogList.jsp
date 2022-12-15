<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객관리</title>
<script>
	var minNumberLen = 1;
	var maxNumberLen = 100;
</script>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
    	<form id="searchForm" onsubmit="return false;" class="border-bottom">
				<div class="mb20" id="adv-search">
					<div class="form-inline">
						<select id="searchvender" class="form-control">
	            <option value="">제조사구분</option>
	            <option value="1">제조사1</option>
	            <option value="2">제조사2</option>
		        </select>
		        <input type="number" id="searchrecordcnt" class="form-control mlr5" placeholder="행 개수" min="1" max="100" oninput="fncCheckZero(this);" style="width:100px;"/>
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="모델명 입력" style="width: auto;" />
				    <button type="button" onclick="findAll(0);" class="btn btn-secondary">
			        <span aria-hidden="true" class="glyphicon glyphicon-search">검색</span>
				    </button>
		        <a href="javascript: void(0);" onclick="fncRefresh(); return false;" class="btn btn-warning waves-effect waves-light mlr5">새로고침</a>
		        <a href="javascript: void(0);" onclick="fncPopupWrite(); return false;" class="btn btn-primary waves-effect waves-light">단독등록</a>
					</div>
				</div>
	    </form>
	    <div class="table-responsive clearfix text-center border-bottom" id="list">
	    
			</div>
			
			<div class="btn_wrap text-left mt-3">
        <a href="javascript: alert('준비중입니다.');" onclick="" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">기성주문</span></a>
        <a href="javascript: alert('준비중입니다.');" onclick="" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">고객주문</span></a>
        <a href="javascript: alert('준비중입니다.');" onclick="" class="btn btn-primary btn-icon-split btn-sm mlr5"><span class="text">재고등록</span></a>
        <a href="javascript: void(0);" onclick="fncRemove(); return false;" class="btn btn-danger btn-icon-split btn-sm mlr5"><span class="text">삭제</span></a>
    	</div>
    	
			<nav aria-label="Page navigation" class="text-center">
		    <ul class="pagination"></ul>
			</nav>
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
				, searchvender: form.searchvender.value
				, searchrecordcnt: form.searchrecordcnt.value
				, searchword: form.searchword.value
			}
			checkListNullParams(params);
	
			const queryString = new URLSearchParams(params).toString();
			const replaceUri = location.pathname + '?' + queryString;
			history.replaceState({}, '', replaceUri);
			
			getJson('/api/catalog/list', params).then(response => {
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<div class="row row-cols-1" style="line-height:80px;"><div class="col">등록된 카다로그가 없습니다.</div></div>';
					drawPages();
					return false;
				}
	
				let html = '';
				let num = response.params.totalcount - (response.params.currentpage-1) * response.params.recordcount;
				
     		response.list.forEach((obj, idx) => {
     			const viewUri = `/code/modify/`+obj.cdid + '?' + queryString;
     			if(idx%4 == 0){
     				html += `<div class="row">`;
     			}
     			html += `
     		    	<div class="col-xl-3 col-lg-4 text-center text-black">
     		    		<div class="card bg-light shadow rounded m10">
     		    			<div class="row row-cols-1">
     		    				<div class="col">
     		    					<div class="m5 rounded">
     		  `;
     		  if(checkNullVal(obj.filepath) == ''){
	     		  html += `
							<img src="/img/no-image.png" width="100%" style="height:200px;"/>
						`;
     		  }
     		  else {
     			 	html += `
							<img src="/file/image/display?filePath=`+checkNullVal(obj.filepath)+`&fileName=`+checkNullVal(obj.filenm)+`" width="100%" style="height:200px;"/>
						`;
     		  }
					html += `
     		    					</div>
     		    				</div>
     		    			</div>
     		    			<div class="row row-cols-1 mlr5 mt5">
     		    				<div class="col text-center">
     		    					<input type="checkbox" id="catalog_no_`+obj.catalogno+`" class="form-check-inline form-check" value="`+obj.catalogno+`"/>
     		    					<label for="catalog_no_`+obj.catalogno+`" class="form-label">
 		    								<a href="javascript: void(0);" onclick="fncPopupView(\'`+obj.catalogno+`\'); return false;">
 		    								` + checkNullVal(obj.modelid) + `
					`;
					if(checkNullVal(obj.modelnm) != ''){
						html += `(` + checkNullVal(obj.modelnm) + `)`;
					}
					html += `
 		    								</a>
     		    					</label>
     		    				</div>
     		    			</div>
     		    			<div class="row mlr1 mtb5">
     		    				<div class="col text-left small">` + checkNullVal(obj.vendernm) + `</div>
     		    				<div class="col text-right small">`+ checkNullValR(codemap[obj.stddmaterialcd], '&nbsp;') + `
   				`;
  				if(checkNullVal(obj.stddweight) != ''){
  					html += `(` + checkNullValR(obj.stddweight, '&nbsp;') + `)`;
  				}
  				html += `
     		    				</div>
     		    			</div>
     		    			<div class="row mlr1 mtb5">
     		    				<div class="col text-left small">`+ checkNullValR(obj.stddsize, '&nbsp;')+`</div>
     		    				<div class="col text-right small">`+ priceWithComma(obj.basicidst)+`</div>
     		    			</div>
     		    		</div>
     		    	</div>
     			`;
     			if(idx > 0 && (idx+1)%4 == 0){
     				html += `</div>`;
     			}
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
		  var url = "/catalog/popup/write";
      var name = "catalogWritePopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
	
		/**
		 * 수정하기
		 */
		function fncPopupView(catalogno) {
		  var url = "/catalog/popup/"+catalogno;
      var name = "catalogViewPopup";
      var option = "width = 1000, height = 800, top = 100, left = 200, location = no";
      window.open(url, name, option);
		}
		
		/**
		 * 수정하기
		 */
		function fncPopupModify(catalogno) {
		  var url = "/catalog/popup/modify/"+catalogno;
      var name = "catalogModifyPopup";
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
				alert('삭제할 카다로그를 선택해주세요.');
				return false;
			}
			
			if(confirm('삭제하시겠습니까?')){
				
				const formData = new FormData();
				$(".form-check").each(function(){
					if($(this).is(":checked"))
						formData.append("catalog_no_arr[]", checkNullVal($(this).val()));
				});
								
				fetch('/api/catalog/catalogs/remove', {
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
		
		//새로고침
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
		
		function refresh(){
			findAll('${param.currentpage}');
		}
	</script>
</body>
</html>