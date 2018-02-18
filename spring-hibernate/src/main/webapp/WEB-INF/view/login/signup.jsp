<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
</head>
<body>
	<h3>Sign In</h3>
	<form:form action="${pageContext.request.contextPath}/login/save" method="post" modelAttribute="newUser">
		<table>
			<tr>
				<td>username</td>
				<td><form:input type="text" path="username" /></td>
			</tr>
			<tr>
				<td>email</td>
				<td><form:input type="text" path="email" /></td>
			</tr>
			<tr>
				<td>password</td>
				<td><form:input type="password" path="password" /></td>
			</tr>
		</table>
		<br/>
		<button type="submit" >Sign in</button>
		
	</form:form>
</body>
</html>