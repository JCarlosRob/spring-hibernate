<html>
<head>
	<title>Spring</title>
</head>
<body>
	<h3>Spring example</h3>
	<form action="<%=request.getContextPath()%>/appLogin" method="POST">
		Enter Username: <input type="text" name="username" /><br/><br/>
		Enter Password: <input type="password" name="password"/><br/><br/>
		<input type="submit" value="Login" />
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	</form>
</body>
</html>