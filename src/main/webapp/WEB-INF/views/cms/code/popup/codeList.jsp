<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드관리</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary" id="upcdnm"></h6>
		</div>
		<div class="card-body">
			<div class="table-responsive clearfix">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="text-center">코드</th>
							<th class="text-center">코드명</th>
							<th class="text-center">사용여부</th>
							<th class="text-center">등록자</th>
							<th class="text-center">등록일</th>
						</tr>
					</thead>
					<tbody id="list"></tbody>
				</table>
			</div>
			<div class="text-center">
				<a href="javascript: void(0);" onclick="goWrite();" class="btn btn-primary waves-effect waves-light mlr5">코드추가</a>
				<a href="javascript: void(0);" onclick="fncClose();" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
			</div>
		</div>
	</div>
	
	<script>
		/**
		 * 페이지 HTML 렌더링
		 */
		window.onload = () => {
	    findAll();
		}

		/**
		 * 게시글 리스트 조회
		 */
		function findAll() {
	
			getJson('/api/code/list/${upcdid}/${cddepth}').then(response => {
				document.getElementById('upcdnm').innerHTML = response.vo.cdnm;
				if (!Object.keys(response).length || response.list == null || response.list.length == 0) {
					document.getElementById('list').innerHTML = '<td colspan="5" class="text-center">등록된 코드가 없습니다.</td>';
					return false;
				}
	
				let html = '';
     		response.list.forEach((obj, idx) => {
     			const viewUri = `/code/popup/modify/`+obj.cdid+`/`+obj.cddepth;
     			html += `
      			<tr>
  						<td class="text-center">`+obj.cdid+`</td>
  						<td class="text-center bold">
								<a href="`+viewUri+`">`+obj.cdnm+`</a>
							</td>
  						<td class="text-center">`+obj.useyn+`</td>
  						<td class="text-center">`+obj.inptnm+`</td>
  						<td class="text-center">`+obj.inptdt+`</td>
      			</tr>
     			`;
     		});

     		document.getElementById('list').innerHTML = html;
			});
		}
		
		/**
		 * 조회 API 호출
		 */
		async function getJson(uri) {
	
			const response = await fetch(uri);
	
			if (!response.ok) {
				await response.json().then(error => {
					throw error;
				});
			}
	
			return await response.json();
		}
		
		/**
		 * 작성하기
		 */
		function goWrite() {
	    location.href = '/code/popup/write/${upcdid}/${cddepth}';
		}
		
		function fncClose() {
	    self.close();
		}
	</script>
</body>
</html>