<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html>
<head>
	<script >
		function checkPassword() {
			
			var password = document.getElementById('password');
			var confirmPassword = document.getElementById('confirmPassword');
			
			if(password.value != confirmPassword.value){
				
				confirmPassword.setCustomValidity('Deben de ser iguales');
				return false;
			}
			
			else {
				
				return true;

			}
			
		}
	</script>
</head>
<body>
	<h3>Edit User</h3>
	<form:form action="save" name="form" method="post" modelAttribute="user">
	
		<form:hidden path="username" />
		<table border="1">
			<tr>
				<th>Username:</th>
				<td><input type="text" value="${user.username }" name="username" disabled="disabled""/></td>
			</tr>
			<tr>
				<th>Email:</th>
				<td><input type="text" value="${user.email }" name="email" /></td>
			</tr>
			<tr>
				<th>Enabled:</th>
				<td><input type="text" value="${user.enabled }" name="enabled" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>New Password:</th>
				<td><input type="password" value="" name="password" id="password"/></td>
			</tr>
			<tr>
				<th>Confirm Password:</th>
				<td><input type="password" value="" name="confirmPassword" id="confirmPassword"/></td>
			</tr>
		</table>
		
		<input type="submit" value="save" onclick="return checkPassword();">
		
	</form:form>
	
	<button type="button" name="back" onclick="history.back()">back</button>
	
</body>
</html>