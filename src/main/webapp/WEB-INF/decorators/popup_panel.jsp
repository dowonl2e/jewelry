<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8" />
  <!-- Custom fonts for this template-->
  <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <script src="/vendor/jquery/jquery.js"></script>
  <!-- Custom styles for this template-->
  <link href="/css/sb-admin-2.css" rel="stylesheet">
  <link href="/css/common.css" rel="stylesheet">

  <!-- <link href="/css/style.css" rel="stylesheet"> -->
	<link href="/plugin/mCustomScrollbar/jquery.mCustomScrollbar.min.css" rel="stylesheet" />

  <!-- Custom styles for this page -->
  <!-- <link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> -->
</head>
<body id="page-top">
  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
    	<div class="container-fluid">
   			<sitemesh:write property="body"/>
   		</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- <script src="/vendor/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script> -->

  <!-- Core plugin JavaScript-->
  <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/js/sb-admin-2.min.js"></script>
  <script src="/js/common/common.js"></script>
</body>
</html>