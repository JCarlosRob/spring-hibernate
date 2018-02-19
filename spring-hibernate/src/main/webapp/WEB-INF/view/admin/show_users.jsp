<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
</head>
<body>
	<h3>Show Users</h3>
	
	<table border="1">
		<c:forEach items="${users}" var="user">
		
		<c:url  var="edit" value="/user/edit">
			<c:param name="username" value="${user.username }">
			</c:param>
		</c:url>
		
			<tr>
				<th>Username</th>
				<td>${user.username}</td>
				<td><a href="${edit}">Edit</a></td>
			</tr>
		</c:forEach>
	</table>
	<button type="button" name="back" onclick="history.back()">back</button>
</body>
</html>