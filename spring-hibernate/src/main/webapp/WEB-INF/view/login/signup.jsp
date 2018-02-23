<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/index.css"></c:url>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/login.css"></c:url>">
    

    <title>Spring-Hibernate</title>
  </head>
  <body>
    
    <jsp:include page="../includes/header.jsp"></jsp:include>

	<div class="row">
		<div class="col-4"></div>
		<div id="form_sign" class="col-4">
		
			<form action="${pageContext.request.contextPath}/login/save" method="post" modelAttribute="newUser">
			
				<div class="row">
					<div id="sigin_text" class=col-12>
						Sign Up
					</div>
					<div id="username_text" class=col-12>
						Username:
					</div>
					<div id="username_input" class=col-12 >
						<input type="text" name="username" placeholder="Username">
					</div>
					<div id="username_text" class=col-12>
						Email:
					</div>
					<div id="username_input" class=col-12 >
						<input type="text" name="email" placeholder="Email">
					</div>
					<div id="password_text" class=col-12>
						Password:
					</div>
					<div id="password_input" class=col-12>
						<input type="password" name="password" placeholder="Password">
					</div>
					<div id="signin_button" class=col-12>
						<button type="submit" >Sign up</button>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					</div>
				</div>
			
			</form>
			
		</div>
		<div class="col-4"></div>	
	</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>

<!--  

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

-->