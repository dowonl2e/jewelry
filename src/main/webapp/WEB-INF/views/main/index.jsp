<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/decorators/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너의 금방</title>
</head>
<body>
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
		     	<div class="chart-area">
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
          <div class="chart-pie pt-4 pb-2">
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
			
			getJson('/api/main/stats/all', null).then(response => {
				var salePriceData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
				if(!Object.keys(response).length){
					initChart('monthlySalePriceChart');
					initPieChart('materialOrdersPieChart');
     			return false;
				}
				
				if (response.salePriceMonthly == null || response.salePriceMonthly.length == 0) {
					initChart('monthlySalePriceChart');
					return false;
				}
			
				salePriceData = new Array();
     		response.salePriceMonthly.forEach((obj, idx) => {
     			salePriceData.push(obj);
     		});
     		monthlySalePriceChart('monthlySalePriceChart', salePriceData);
     		
     		//재질별 주문
     		if (response.salePriceMonthly == null || response.salePriceMonthly.length == 0) {
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
     		
     		pieChart('materialOrdersPieChart', chartLabels, bgColor, hoverBgColor, chartData);
     		
     		document.getElementById('materialOrdersPieChart-Div').innerHTML = pieChartHtml;
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
		
		function salePriceStats(val){
			var params = {
			  searchyear: val
			};
			
			getJson('/api/main/monthly/sale/price', params).then(response => {
				var salePriceData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
				if (!Object.keys(response).length || response.salePriceMonthly == null || response.salePriceMonthly.length == 0) {
					v = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
					return false;
				}
			
				salePriceData = new Array();
     		response.salePriceMonthly.forEach((obj, idx) => {
     			salePriceData.push(obj);
     		});
     		monthlySalePriceChart('monthlySalePriceChart', salePriceData);
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
     		
     		pieChart('materialOrdersPieChart', chartLabels, bgColor, hoverBgColor, chartData);
     		
     		document.getElementById('materialOrdersPieChart-Div').innerHTML = pieChartHtml;
			});
		}
		
		function initChart(id){
			salePriceData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   		monthlySalePriceChart(id, salePriceData);
		}
		
		function initPieChart(id){
			pieChart(id, null, null, null, null);
 			document.getElementById(id+'-Div').innerHTML = 'No Data';
		}
	</script>
</body>
</html>