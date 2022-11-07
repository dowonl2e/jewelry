<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%-- 
	<form th:if="${not #maps.isEmpty( params )}" name="dataForm" th:action="${redirectUri}" th:method="${method}" style="display: none;">
		<input th:each="key, status : ${params.keySet()}" type="hidden" th:name="${key}" th:value="${params.get(key)}" />
	</form>
	--%>
	
	<script>
	/* <![CDATA[ */
	
		window.onload = function() {
			var message = ${message};
			if (isEmpty(message) == false) {
				alert(message);
			}

			var params = ${params};
			if (isEmpty(params) == false) {
				document.dataForm.submit();
			} else {
				var redirectUri = '${redirectUri}';
				location.href = redirectUri;
			}
		}
		/*[- end of onload -]*/

	/* ]]> */
	</script>
	
</body>
</html>