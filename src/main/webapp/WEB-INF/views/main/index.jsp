<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너의 금방</title>
</head>
<body>

	<div class="row">
		<div class="col-xl-12 col-lg-11">
			<div class="card shadow mb-1">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			    <h6 class="m-0 font-weight-bold text-primary">재질별 현 재고현황</h6>
			    <div class="dropdown no-arrow">
            <select class="form-control" onchange="materialStocksStats(this.value);">
         		  <option value="">전체</option>
           	  <c:forEach var="year" begin="2022" end="2030">
           		  <option value="${year}" <c:if test="${nowYear eq year}">selected</c:if>>${year}년</option>
           	  </c:forEach>
            </select>
	        </div>
			  </div>
			</div>
		</div>
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<div class="m-2 font-weight-bold text-center">재고(개수)</div>
				<!-- Card Body -->
		   	<div class="card-body">
		     	<div class="chart-area" id="materialStocksChartDiv">
		       <canvas id="materialStocksChart"></canvas>
		     	</div>
		   	</div>
			</div>
		</div>
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<div class="m-2 font-weight-bold text-center">재고(중량)</div>
				<!-- Card Body -->
		   	<div class="card-body">
		     	<div class="chart-area" id="materialStocksChart2Div">
		       <canvas id="materialStocksChart2"></canvas>
		     	</div>
		   	</div>
			</div>
		</div>
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<div class="m-2 font-weight-bold text-center">재고현황</div>
				<div class="card-body">
					<div class="chart-area" style="overflow:auto;">
						<div class="table-responsive">
							<table class="table">
								<colgroup>
									<col />
									<col width="30%"/>
									<col width="30%"/>
								</colgroup>
								<tr>
									<th>재질</th>
									<th>중량(g)</th>
									<th>개수</th>
								</tr>
								<tbody id="matStockList" class="border-bottom"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Content Row -->
	<div class="row">
	
		<!-- Area Chart -->
		<div class="col-xl-8 col-lg-7">
			<div class="card shadow mb-4">
			  <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			    <h6 class="m-0 font-weight-bold text-primary">월별 매출</h6>
			    <div class="dropdown no-arrow">
            <select class="form-control" onchange="salePriceStats(this.value);">
           		<option value="">전체</option>
            	<c:forEach var="year" begin="2022" end="2030">
            		<option value="${year}" <c:if test="${nowYear eq year}">selected</c:if>>${year}년</option>
            	</c:forEach>
            </select>
	        </div>
			  </div>
			  <!-- Card Body -->
		   	<div class="card-body">
		     	<div class="chart-area" id="monthlySalePriceChartDiv">
		       <canvas id="monthlySalePriceChart"></canvas>
		     	</div>
		   	</div>
			</div>
		</div>
	
    <!-- Pie Chart -->
    <div class="col-xl-4 col-lg-5">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
         	<h6 class="m-0 font-weight-bold text-primary">재질별 주문 수</h6>
         	<div class="dropdown no-arrow">
            <select class="form-control" onchange="materialOrdersStats(this.value);">
           		<option value="">전체</option>
            	<c:forEach var="year" begin="2022" end="2030">
            		<option value="${year}" <c:if test="${nowYear eq year}">selected</c:if>>${year}년</option>
            	</c:forEach>
            </select>
	        </div>
        </div>
        <!-- Card Body -->
        <div class="card-body">
          <div class="chart-pie pt-4 pb-2" id="materialOrdersPieChartDiv">
            <canvas id="materialOrdersPieChart"></canvas>
          </div>
          <div class="mt-4 text-center small" id="materialOrdersPieChart-Div">
            <span class="mr-2">
              <i class="fas fa-circle text-primary"></i> Direct
            </span>
            <span class="mr-2">
              <i class="fas fa-circle text-success"></i> Social
            </span>
            <span class="mr-2">
              <i class="fas fa-circle text-info"></i> Referral
            </span>
          </div>
        </div>
      </div>
    </div>
	</div>
	
	<%--
	<!-- Content Row -->
	<div class="row">
	
    <!-- Content Column -->
    <div class="col-lg-6 mb-4">
	
      <!-- Project Card Example -->
      <div class="card shadow mb-4">
          <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
          </div>
          <div class="card-body">
              <h4 class="small font-weight-bold">Server Migration <span
                      class="float-right">20%</span></h4>
              <div class="progress mb-4">
                  <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                      aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <h4 class="small font-weight-bold">Sales Tracking <span
                      class="float-right">40%</span></h4>
              <div class="progress mb-4">
                  <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                      aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <h4 class="small font-weight-bold">Customer Database <span
                      class="float-right">60%</span></h4>
              <div class="progress mb-4">
                  <div class="progress-bar" role="progressbar" style="width: 60%"
                      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <h4 class="small font-weight-bold">Payout Details <span
                      class="float-right">80%</span></h4>
              <div class="progress mb-4">
                  <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                      aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <h4 class="small font-weight-bold">Account Setup <span
                      class="float-right">Complete!</span></h4>
              <div class="progress">
                  <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                      aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
          </div>
      </div>
		</div>
	</div>
 	--%>
 	
	<!-- Page level plugins -->
  <script src="/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/js/chart/chart.js"></script>
  <script src="/js/chart/pie.js"></script>
  
	<script>
		var salePriceLineChartLabels = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
	
		var codemap = {
			<c:forEach var="code" items="${cdmapper}" varStatus="loop">
			  ${code.cdid}: '${code.cdnm}' ${not loop.last ? ',' : ''}
			</c:forEach>
		};
	
		window.onload = () => {
			findAll();
		}
		/**
		 * 게시글 리스트 조회
		 */
		function findAll() {
			var salePriceData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			getJson('/api/main/stats/all', null).then(response => {
				if(!Object.keys(response).length){
     			return false;
				}
				
				if (response.salePriceMonthly == null || response.salePriceMonthly.length == 0) {
					initLineChart('monthlySalePriceChart', salePriceLineChartLabels, salePriceData);
					return false;
				}
			
				salePriceData = new Array();
     		response.salePriceMonthly.forEach((obj, idx) => {
     			salePriceData.push(obj);
     		});
     		initCanvas('monthlySalePriceChart');
     		lineChart('monthlySalePriceChart', salePriceLineChartLabels, salePriceData);
     		
     		//재질별 주문
     		if (response.materialOrders == null || response.materialOrders.length == 0) {
					initPieChart('materialOrdersPieChart');
     			return false;
				}
				
     		var chartLabels = new Array();
     		var bgColor = ['#f6c23e', '#20c9a6', '#4e73df', '#e83e95', '#e3e6f0'];
     		var hoverBgColor = ['#fd7e14', '#36b9cc', '#36b9cc', '#e74a3b', '#858796'];
     		var chartData = new Array();
     		
     		let html = '';
     		
     		response.materialOrders.forEach((obj, idx) => {
     			chartLabels.push(checkNullVal(codemap[obj.materialcd]));
     			chartData.push(Number(checkNullValR(obj.ordercnt,'0')));
     			html += `
     				<span class="mr-2">
	            <i class="fas fa-circle " style="color: `+bgColor[idx]+` !important;"></i> `+ checkNullVal(codemap[obj.materialcd]) + `
	          </span>
          `;
     		});
     		
     		initCanvas('materialOrdersPieChart');
     		pieChart('materialOrdersPieChart', chartLabels, bgColor, hoverBgColor, chartData);
     		document.getElementById('materialOrdersPieChart-Div').innerHTML = html;
     		
     		html = '';
     		//재질별 재고현황
     		chartLabels = new Array();
     		chartData = new Array();
     		chartData2 = new Array();
     		if (response.materialStocks == null || response.materialStocks.length == 0) {
     			initBarChart('materialStocksChart', '', chartLabels, chartData);
     			initBarChart('materialStocksChart2', '', chartLabels, chartData2);
     			document.getElementById('matStockList').innerHTML = '<td colspan="3" class="text-center">No Data</th>';
     			return false;
				}
     		
     		totalWeightGram = 0.0;
     		totalStockCnt = 0;
     		response.materialStocks.forEach((obj, idx) => {
     			chartLabels.push(checkNullVal(codemap[obj.materialcd]));
     			chartData.push(Number(checkNullValR(obj.stockcnt,'0')));
     			chartData2.push(Math.round(Number(checkNullValR(obj.perweightgram,'0.0'))*100)/100);
     			html += `
     				<tr>
     			    <td class="text-center">` + checkNullVal(codemap[obj.materialcd]) + `</td>
     			    <td class="text-center">` + Math.round(Number(checkNullValR(obj.perweightgram,'0.0'))*100)/100 + `g</td>
     			    <td class="text-center">` + checkNullValR(obj.stockcnt,'0') + `</td>
     			  </tr>
          `;
         	totalWeightGram += Math.round(Number(checkNullValR(obj.perweightgram,'0.0'))*100)/100;
         	totalStockCnt += Number(checkNullValR(obj.stockcnt,'0'));
     		});
     		html += `
     			<tr>
     		    <th>합계</th>
     		    <th>`+totalWeightGram.toFixed(2)+`g</th>
     		    <th>`+totalStockCnt+`</th>
     		  </tr>
     		`;
     		initCanvas('materialStocksChart');
     		initCanvas('materialStocksChart2');
     		barChart('materialStocksChart', '개수', chartLabels, chartData);
     		barChart('materialStocksChart2', '중량', chartLabels, chartData2);
				document.getElementById('matStockList').innerHTML = html;
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
		function materialStocksStats(val){
			var params = {
			  searchyear: val
			};
			getJson('/api/main/material/stocks', params).then(response => {
				//재질별 재고현황
     		chartLabels = new Array();
     		chartData = new Array();
     		chartData2 = new Array();

     		if (response.materialStocks == null || response.materialStocks.length == 0) {
		 			initBarChart('materialStocksChart', '', chartLabels, chartData);
		 			initBarChart('materialStocksChart2', '', chartLabels, chartData2);
     			document.getElementById('matStockList').innerHTML = '<td colspan="3" class="text-center">No Data</th>';
     			return false;
				}
     		
				let html = '';

				totalWeightGram = 0.0;
     		totalStockCnt = 0;
     		response.materialStocks.forEach((obj, idx) => {
     			chartLabels.push(checkNullVal(codemap[obj.materialcd]));
     			chartData.push(Number(checkNullValR(obj.stockcnt,'0')));
     			chartData2.push(Math.round(Number(checkNullValR(obj.perweightgram,'0.0'))*100)/100);
     			html += `
     				<tr>
     			    <td class="text-center">` + checkNullVal(codemap[obj.materialcd]) + `</td>
     			    <td class="text-center">` + Math.round(Number(checkNullValR(obj.perweightgram,'0.0'))*100)/100 + `g</td>
     			    <td class="text-center">` + checkNullValR(obj.stockcnt,'0') + `</td>
     			  </tr>
          `;
         	totalWeightGram += Math.round(Number(checkNullValR(obj.perweightgram,'0.0'))*100)/100;
         	totalStockCnt += Number(checkNullValR(obj.stockcnt,'0'));
     		});
     		html += `
     			<tr>
     		    <th>합계</th>
     		    <th>`+totalWeightGram.toFixed(2)+`g</th>
     		    <th>`+totalStockCnt+`</th>
     		  </tr>
     		`;
     		initCanvas('materialStocksChart');
     		initCanvas('materialStocksChart2');
     		barChart('materialStocksChart', '개수', chartLabels, chartData);
     		barChart('materialStocksChart2', '중량', chartLabels, chartData2);
				document.getElementById('matStockList').innerHTML = html;
			});
		}
		
		function salePriceStats(val){
			var params = {
			  searchyear: val
			};
			
			getJson('/api/main/monthly/sale/price', params).then(response => {
				var salePriceData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
				if (!Object.keys(response).length || response.salePriceMonthly == null || response.salePriceMonthly.length == 0) {
					initLineChart('monthlySalePriceChart', salePriceLineChartLabels, salePriceData);
					return false;
				}
			
				salePriceData = new Array();
     		response.salePriceMonthly.forEach((obj, idx) => {
     			salePriceData.push(obj);
     		});
     		
     		initCanvas('monthlySalePriceChart');
     		lineChart('monthlySalePriceChart', salePriceLineChartLabels, salePriceData);
			});
		}
		
		function materialOrdersStats(val){
			var params = {
			  searchyear: val
			};
			
			getJson('/api/main/material/orders', params).then(response => {
				if (!Object.keys(response).length || response.materialOrders == null || response.materialOrders.length == 0) {
					initPieChart('materialOrdersPieChart');
					return false;
				}
				
				var chartLabels = new Array();
     		var bgColor = ['#f6c23e', '#20c9a6', '#4e73df', '#e83e95', '#e3e6f0'];
     		var hoverBgColor = ['#fd7e14', '#36b9cc', '#36b9cc', '#e74a3b', '#858796'];
     		var chartData = new Array();
     		
     		let pieChartHtml = '';
     		
     		response.materialOrders.forEach((obj, idx) => {
     			chartLabels.push(checkNullVal(codemap[obj.materialcd]));
     			chartData.push(Number(checkNullValR(obj.ordercnt,'0')));
     			pieChartHtml += `
     				<span class="mr-2">
	            <i class="fas fa-circle " style="color: `+bgColor[idx]+` !important;"></i> `+ checkNullVal(codemap[obj.materialcd]) + `
	          </span>
          `;
     		});
     		
     		initCanvas('materialOrdersPieChart');
     		pieChart('materialOrdersPieChart', chartLabels, bgColor, hoverBgColor, chartData);
     		
     		document.getElementById('materialOrdersPieChart-Div').innerHTML = pieChartHtml;
			});
		}
		
		function initLineChart(id, labels, data){
			initCanvas(id);
   		lineChart(id, labels, data);
		}
		function initBarChart(id, label, labels, data){
			initCanvas(id);
			barChart(id, label, labels, data);
		}
		function initPieChart(id){
			initCanvas(id);
			pieChart(id, null, null, null, null);
 			document.getElementById(id+'-Div').innerHTML = 'No Data';
		}
		function initCanvas(id){
			$('#'+id).remove(); // this is my <canvas> element
		  $('#'+id+'Div').append('<canvas id="'+id+'"><canvas>');
		}
	</script>
</body>
</html>