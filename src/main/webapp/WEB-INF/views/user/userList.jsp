<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
    	<form id="searchForm" onsubmit="return false;">
				<div class="mb20" id="adv-search">
					<div class="form-inline">
		        <input type="text" id="searchword" class="form-control mlr5" placeholder="아이디/이름 입력" style="width: 200px;" />
				    <button type="button" onclick="findAll(0);" class="btn btn-secondary">
			        <span aria-hidden="true" class="glyphicon glyphicon-search">검색</span>
				    </button>
				    <a href="javascript: void(0);" onclick="goWrite();" class="btn btn-primary waves-effect waves-light mlr5">사용자 추가</a>
			    </div>
				</div>
	    </form>
			<div class="table-responsive clearfix">
				<table class="table table-hover">
					<colgroup>
						<col width="10%"/>
						<col width="15%"/>
						<col />
						<col width="15%"/>
						<col width="18%"/>
						<col width="8%"/>
						<col width="13%"/>
						<col width="8%"/>
					</colgroup>
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">아이디</th>
							<th class="text-center">이름</th>
							<th class="text-center">연락처</th>
							<th class="text-center">이메일</th>
							<th class="text-center">성별</th>
							<th class="text-center">등록일</th>
							<th class="text-center">사용여부</th>
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
			  currentpage: page,
				searchword: form.searchword.value
			};
			checkListNullParams(params);

			const queryString = new URLSearchParams(params).toString();
			const replaceUri = location.pathname + '?' + queryString;
			history.replaceState({}, '', replaceUri);
			
			getJson('/api/user/list', params).then(response => {
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<td colspan="7" class="text-center">등록된 사용자가 없습니다.</td>';
					drawPages();
					return false;
				}
	
				let html = '';
				let num = response.params.totalcount - (response.params.currentpage-1) * response.params.recordcount;
     		response.list.forEach((obj, idx) => {
     			const viewUri = `/user/`+ checkNullVal(obj.userid) + '?' + queryString;
     			html += `
      			<tr>
  						<td class="text-center">`+(num--)+`</td>
  						<td class="text-center">`+checkNullVal(obj.userid)+`</td>
  						<td class="text-center bold">
								<a href="`+viewUri+`">`+checkNullVal(obj.username)+`</a>
							</td>
  						<td class="text-center">`+checkNullVal(obj.celnum)+`</td>
  						<td class="text-center">`+checkNullVal(obj.email)+`</td>
  						<td class="text-center">`+checkNullVal(obj.gender)+`</td>
  						<td class="text-center">`+checkSubstringNullVal(obj.inptdt,0,16)+`</td>
  						<td class="text-center">`+(checkNullVal(obj.useyn) == 'Y' ? '사용' : '미사용')+`</td>
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
		function goWrite() {
	    location.href = '/user/write' + location.search;
		}
		
	</script>
</body>
</html>