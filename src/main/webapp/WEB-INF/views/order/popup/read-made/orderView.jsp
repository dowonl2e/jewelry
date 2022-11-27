<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 정보</title>
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mt-4 mb-4">
		<div class="card-header py-3 text-center">
			<h6 class="m-0 font-weight-bold text-primary">주문 정보</h6>
		</div>
		<div class="card-body">
			<form id="form" class="form-horizontal">
				<div class="table-responsive clearfix">
					<table class="table">
						<colgroup>
							<col />
							<col width="23%"/>
							<col width="23%"/>
							<col width="23%"/>
						</colgroup>
						<tbody>
							<tr>
								<td rowspan="2" class="text-center border-right">
									<label for="file" id="file-label"><img id="order_img" width="250px" height="150px"/></label>
								</td>
								<td class="bg-light border-right text-center">매장</td>
								<td class="bg-light border-right text-center">접수일</td>
								<td class="bg-light text-center">주문예정일</td>
							</tr>
							<tr class="border-bottom">
								<td class="text-center border-right mtb5" id="store_cd_td"></td>
								<td class="text-center border-right" id="receipt_dt_td"></td>
								<td class="text-center" id="expected_ord_dt_td"></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="table-responsive clearfix mt-3">
					<table class="table">
						<colgroup>
							<col width="3%"/>
							<col width="9%"/>
							<col width="9%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="9%"/>
							<col width="6%"/>
							<col width="6%"/>
							<col width="8%"/>
							<col />
						</colgroup>
						<thead>
							<tr>
								<th rowspan="2" class="text-center border-right">No</th> 
								<th rowspan="2" class="text-center border-right">시리얼</th>
								<th rowspan="2" class="text-center border-right">모델<br/>번호</th>
								<th rowspan="2" class="text-center border-right">제조사</th>
								<th rowspan="2" class="text-center border-right">재질</th>
								<th rowspan="2" class="text-center border-right">색상</th>
								<th rowspan="2" class="text-center border-right">수량</th>
								<th colspan="2" class="text-center border-right">스톤</th>
								<th rowspan="2" class="text-center border-right">사이즈</th>
								<th rowspan="2" class="text-center">주문 설명</th>
							</tr>
							<tr>
								<th class="text-center border-right">메인</th>
								<th class="text-center border-right">보조</th>
							</tr>
						</thead>
						<tbody id="orderlist">
							<tr class="border-bottom">
								<td class="text-center">1</td>
								<td class="text-center" id="serial_id_td"></td>
								<td class="text-center" id="model_id_td"></td>
								<td class="text-center" id="vender_nm_td"></td>
								<td class="text-center" id="material_cd_td"></td>
								<td class="text-center" id="color_cd_td"></td>
								<td class="text-center" id="quantity_td"></td>
								<td class="text-center" id="main_stone_type_td"></td>
								<td class="text-center" id="sub_stone_type_td"></td>
								<td class="text-center" id="size_td"></td>
								<td class="text-center" id="order_desc_td"></td>
							</tr>
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
				
				const orderno = '${orderno}';
				if ( !orderno ) {
		    	return false;
		    }
				
				fetch(`/api/order/${orderno}`).then(response => {
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
		   		document.getElementById('order_img').src = '/file/image/display?filePath='+filepath+'&fileName='+filenm;
		   		document.getElementById('store_cd_td').innerHTML = checkNullVal(cdmapper[json.storecd]);
		   		document.getElementById('receipt_dt_td').innerHTML = checkSubstringNullVal(json.receiptdt,0,10);
		   		document.getElementById('expected_ord_dt_td').innerHTML = checkSubstringNullVal(json.expectedorddt,0,10);
		   		
		   		document.getElementById('serial_id_td').innerHTML = checkNullVal(json.serialid);
		   		document.getElementById('model_id_td').innerHTML = checkNullVal(json.modelid);
		   		document.getElementById('vender_nm_td').innerHTML = checkNullVal(json.vendernm);
		   		document.getElementById('material_cd_td').innerHTML = checkNullVal(cdmapper[json.materialcd]);
		   		document.getElementById('color_cd_td').innerHTML = checkNullVal(cdmapper[json.colorcd]);
		   		document.getElementById('quantity_td').innerHTML = checkNullVal(json.quantity);
		   		document.getElementById('main_stone_type_td').innerHTML = checkNullVal(json.mainstonetype);
		   		document.getElementById('sub_stone_type_td').innerHTML = checkNullVal(json.substonetype);
		   		document.getElementById('size_td').innerHTML = checkNullVal(json.size);
		   		document.getElementById('order_desc_td').innerHTML = checkNullVal(json.orderdesc);

		   	}).catch(error => {
		    	alert('주문 정보를 찾을 수 없습니다.');
		    	fncParentRefresh();
		    	fncClose();
		   	});
			}
			
			/**
			 * 수정하기
			 */
			function goModify() {
		    location.href = '/order/popup/customer/modify/${orderno}';
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