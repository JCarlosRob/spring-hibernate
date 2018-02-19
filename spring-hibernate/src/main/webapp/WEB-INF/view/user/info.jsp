<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
</head>
<body>
	<h3>Logged</h3>
	
	<table>
		<tr>
			<td>Name</td>
			<td><c:out value="${user.username}" /></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><c:out value="${user.email}" /></td>
		</tr>
		<tr>
			<td>Status</td>
			<c:choose>
				<c:when test="${user.enabled == true}">
					<td>Enabled</td>
				</c:when>
				<c:otherwise>
					<td>Disabled</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td>Role</td>
			<td><c:out value="${user.role}" /></td>
		</tr>
	</table>

	<c:url var="userEdit" value="edit">
		<c:param name="username" value="${user.username }"></c:param>
	</c:url>
	
	<c:if test="${user.role.contains('ROLE_ADMIN')}">
			<form action="${pageContext.request.contextPath}/admin/showAllUsers" method="get">
				<input type="submit" value="Show all users" />
			</form>	
	</c:if>
		
	<input type="submit" value="Edit my user" onclick="location.href='${userEdit }'" />
	
	<form action="${pageContext.request.contextPath}/appLogout" method="post">
		<input type="submit" value="Logout" />
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	</form>

</body>
</html>