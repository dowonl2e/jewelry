<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied</title>
<%
	session.invalidate();
%>
	<script>
		alert('로그인 후 이용해주세요.');
	</script>
<%
	response.sendRedirect("/signin");
%>
</head>
<body>

</body>
</html>