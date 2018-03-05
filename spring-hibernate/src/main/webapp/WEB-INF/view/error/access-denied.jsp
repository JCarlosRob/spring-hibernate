<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.min.css"></c:url>" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/header.css"></c:url>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/index.css"></c:url>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/access-denied.css"></c:url>">

    <title>Spring-Hibernate</title>
  </head>
  <body>
    
 		<c:choose>
        
        	<c:when test="${pageContext.request.userPrincipal.name == null}">
        		<jsp:include page="../includes/header_nologin.jsp"></jsp:include>
        	</c:when>
        	<c:otherwise>
        		  <jsp:include page="../includes/header_login.jsp"></jsp:include>
        	</c:otherwise>
        
        </c:choose>

	<div class="row">
		<div class="col-4"></div>
		<div id="notification" class="col-4">
		
			Access Denied - You are not authorized to access
			
		</div>
		<div class="col-4"></div>	
	</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/js/bootstrap/bootstrap.min.js"></c:url>" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>


<!--<html>

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

</html> -->