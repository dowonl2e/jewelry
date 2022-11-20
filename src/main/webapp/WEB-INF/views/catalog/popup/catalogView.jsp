<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카다로그</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">카다로그</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal">
				<div class="row text-center border-bottom">
					<div class="col bg-light" style="line-height:40px;">제품 사진</div>
				</div>
				<div class="row text-center">
					<div class="col"><img id="catalog_img" width="640px" height="480px" class="m10"/></div>
				</div>
				<div class="row text-center border-bottom">
					<div class="col bg-light" style="line-height:40px;">모델 정보</div>
				</div>
				<div class="row row-cols-3 border-bottom text-center" style="line-height:40px;">
					<div class="col bg-light border-right">제조사</div>
					<div class="col bg-light border-right">모델번호</div>
					<div class="col bg-light">품명</div>
				</div>
				<div class="row row-cols-3 border-bottom text-center">
					<div class="col border-right" id="vender_div"></div>
					<div class="col border-right" id="model_id_div"></div>
					<div class="col" id="model_nm_div"></div>
				</div>
				<div class="row row-cols-3 border-bottom text-center" style="line-height:40px;">
					<div class="col bg-light border-right">표준재질</div>
					<div class="col bg-light border-right">표준중량(g)</div>
					<div class="col bg-light">표준색상</div>
				</div>
				<div class="row row-cols-3 border-bottom text-center" style="line-height:40px;">
					<div class="col border-right" id="stdd_material_div">
						<%-- <select name="stdd_material_cd" id="stdd_material_cd" class="form-control form-data mtb5">
							<option value="">선택</option>
							<c:forEach var="smlist" items="${smlist}">
								<option value="${smlist.cdid}">${smlist.cdnm}</option>
							</c:forEach>
						</select> --%>
					</div>
					<div class="col border-right" id="stdd_weight_div"></div>
					<div class="col" id="stdd_color_div">
						<%-- <select name="stdd_color_cd" id="stdd_color_cd" class="form-control form-data mtb5">
							<option value="">선택</option>
							<c:forEach var="sclist" items="${sclist}">
								<option value="${sclist.cdid}">${sclist.cdnm}</option>
							</c:forEach>
						</select> --%>
					</div>
				</div>
				
				<div class="row row-cols-3 border-bottom text-center" style="line-height:40px;">
					<div class="col bg-light border-right">표준사이즈</div>
					<div class="col bg-light border-right">주문시 유의사항</div>
					<div class="col bg-light">등록일</div>
				</div>
				<div class="row row-cols-3 border-bottom text-center" style="line-height:40px;">
					<div class="col border-right" id="stdd_size_div"></div>
					<div class="col border-right" id="odr_notice_div"></div>
					<div class="col" id="reg_dt_div"></div>
				</div>
				
				<div class="row text-center border-bottom" style="line-height:40px;">
					<div class="col bg-light" style="line-height:40px;">구매단가</div>
				</div>
				<div class="row row-cols-4 border-bottom text-center" style="line-height:40px;">
					<div class="col bg-light border-right">기본공업</div>
					<div class="col bg-light border-right">메인가격</div>
					<div class="col bg-light border-right">보조가격</div>
					<div class="col bg-light">합계</div>
				</div>
				<div class="row row-cols-4 border-bottom text-center" style="line-height:40px;">
					<div class="col border-right" id="basic_idst_div"></div>
					<div class="col border-right" id="main_price_div"></div>
					<div class="col border-right" id="sub_price_div"></div>
					<div class="col border-right" id="total_price_div"></div>
				</div>
				<div class="table-responsive clearfix mt-3">
					<table class="table">
						<colgroup>
							<col width="8%"/>
							<col width="13%"/>
							<col width="18%"/>
							<col width="10%"/>
							<col width="13%"/>
							<col width="13%"/>
							<col />
						</colgroup>
						<thead>
							<tr>
								<th colspan="7">스톤정보</th> 
							</tr>
							<tr>
								<th class="text-center border-right">No</th> 
								<th class="text-center border-right">구분</th>
								<th class="text-center border-right">스톤명</th>
								<th class="text-center border-right">알수</th>
								<th class="text-center border-right">구매단가</th>
								<th class="text-center border-right">합계</th>
								<th class="text-center">스톤설명</th>
							</tr>
						</thead>
						<tbody id="stonelist">
						</tbody>
					</table>
				</div>

				<div class="btn_wrap text-center">
	        <a href="javascript: void(0);" onclick="goModify(); return false;" class="btn btn-primary waves-effect waves-light mlr5">수정</a>
	        <a href="javascript: void(0);" onclick="fncClose(); return false;" class="btn btn-secondary waves-effect waves-light mlr5">닫기</a>
	    	</div>
				<nav aria-label="Page navigation" class="text-center">
			    <ul class="pagination"></ul>
				</nav>
			</form>
		</div>
	</div>
	
	<script>
		/*<![CDATA[*/
			
			var cdmapper = {
				<c:forEach var="code" items="${cdmapper}" varStatus="loop">
				  ${code.cdid}: '${code.cdnm}' ${not loop.last ? ',' : ''}
				</c:forEach>
			};
			
			window.onload = () => {
				find();
	  	}
			
			function find() {
				
				const catalogno = '${catalogno}';
				if ( !catalogno ) {
		    	return false;
		    }
				
				fetch(`/api/catalog/${catalogno}`).then(response => {
		    	if (!response.ok) {
						throw new Error('Request failed...');
			    }
		    	return response.json();
		
		   	}).then(json => {
		   		var filelist = json.filelist;
		   		var filepath = '';
		   		var filenm = '';
		   		
		   		if(filelist != null && filelist.length > 0){
			   		for(var i = 0 ; i < filelist.length ; i++){
			   			if(filelist[i].fileord == 1){
			   				filepath = checkNullVal(filelist[i].filepath);
			   				filenm = checkNullVal(filelist[i].filenm);
			   			}
			   		}
		   		}
		   		document.getElementById('catalog_img').src = '/file/image/display?filePath='+filepath+'&fileName='+filenm;
		   		document.getElementById('vender_div').innerHTML = checkNullVal(json.vendernm);
		   		document.getElementById('model_id_div').innerHTML = checkNullVal(json.modelid);
		   		document.getElementById('model_nm_div').innerHTML = checkNullVal(json.modelnm);
		   		document.getElementById('stdd_material_div').innerHTML = checkNullVal(cdmapper[json.stddmaterialcd]);
		   		document.getElementById('stdd_weight_div').innerHTML = checkNullVal(json.stddweight);
		   		document.getElementById('stdd_color_div').innerHTML = checkNullVal(cdmapper[json.stddcolorcd]);
		   		document.getElementById('stdd_size_div').innerHTML = checkNullVal(json.stddsize);
		   		document.getElementById('odr_notice_div').innerHTML = checkNullVal(json.odrnotice);
		   		document.getElementById('reg_dt_div').innerHTML = checkSubstringNullVal(json.regdt,0,10);
		   		document.getElementById('basic_idst_div').innerHTML = checkNullVal(json.basicidst);
		   		document.getElementById('main_price_div').innerHTML = checkNullVal(json.mainprice);
		   		document.getElementById('sub_price_div').innerHTML = checkNullVal(json.subprice);
		   		document.getElementById('total_price_div').innerHTML = checkNullVal(json.totalprice);
		   		
		   		var stonelist = json.stonelist;
		   		var html = ``;
		   		if(stonelist == null || stonelist.length == 0){
		   			html += `
		   				<tr>
		   					<td colspan="7" class="text-center" style="line-height:60px;">등록된 스톤정보가 없습니다.</td>
		   				</tr>
		   			`;
		   		}
		   		else {
		   			var total_bead_cnt = 0;
		   			var total_purchase_price = 0;
			   		for(var i = 0 ; i < stonelist.length ; i++){
			   			bead_cnt = Number(stonelist[i].beadcnt);
			   			purchase_price_sum = (Number(stonelist[i].beadcnt)*Number(stonelist[i].purchaseprice));
			   			html += `
			   				<tr>
									<td class="text-center border-right">`+(i+1)+`</td>
									<td class="text-center border-right">`+checkNullVal(cdmapper[stonelist[i].stonetype])+`</td>
									<td class="text-center border-right">`+checkNullVal(stonelist[i].stonenm)+`</td>
									<td class="text-center border-right">`+checkNullVal(bead_cnt)+`</td>
									<td class="text-center border-right">`+checkNullVal(stonelist[i].purchaseprice)+`</td>
									<td class="text-center border-right">`+purchase_price_sum+`</td>
									<td class="text-center">`+checkNullVal(stonelist[i].stonedesc)+`</td>
								</tr>
			   			`;
			   			total_bead_cnt += bead_cnt;
			   			total_purchase_price += purchase_price_sum;
			   		}
			   		html += `
							<tr>
								<td colspan="3" class="text-right border-right border-bottom">소계</td>
								<td id="total_bead_cnt_txt" class="bg-yellow text-center border-right border-bottom">`+total_bead_cnt+`</td>
								<td class="border-right border-bottom"></td>
								<td id="total_price_txt" class="bg-yellow text-center border-right border-bottom">`+total_purchase_price+`</td>
								<td class="border-bottom"></td>
							</tr>
			   		`;
			   		
		   		}
		   		document.getElementById('stonelist').innerHTML = html;
		   		
		   	}).catch(error => {
		    	alert('카다로그 정보를 찾을 수 없습니다.');
		    	fncParentRefresh();
		    	fncClose();
		   	});
			}
			
			/**
			 * 수정하기
			 */
			function goModify() {
		    location.href = '/catalog/popup/modify/${catalogno}';
			}
			
			function fncParentRefresh(){
				window.opener.findAll();
			}
			
			function fncClose(){
				self.close();
			}
		/*]]>*/
	    </script>
</body>
</html>