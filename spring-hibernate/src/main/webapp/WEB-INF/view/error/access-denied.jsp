<html>

<head>
	<title>luv2code - Access Denied</title>
</head>

<body>

	<h2>Access Denied - You are not authorized to access this resource.</h2>

	<hr>
	
	<form action="<%=request.getContextPath()%>/appLogout" method="POST">
		<input type="submit" value="Logout" />
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	</form>
	
</body>

</html>