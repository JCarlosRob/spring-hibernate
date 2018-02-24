<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="resources/css/index.css">

    <title>Spring-Hibernate</title>
  </head>
  <body>
    
    <jsp:include page="../includes/header.jsp"></jsp:include>

      <div id="content" class="row">
        <div class="col-2"></div>
        <div class="panel panel-default col-8">
          <div id="titlePanel" class="panel-heading">
              <h3 class="panel-title">Last added</h3>
          </div>
          <div id="bodyPanel" class="panel-body">

            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
	              	<ul class="row">
	              		<c:forEach items="${books }" var="book" begin="0" end="3">
		              		<li class="col-3">                
		              				 <img id="book" class="d-block w-100" src="${book.img }">
	                    	</li>
                    	</c:forEach>
	              	</ul>
                </div>
                
                <div class="carousel-item">
                  <ul class="row">
	              		<c:forEach items="${books }" var="book" begin="4" end="7">
		              		<li class="col-3">                
		              				 <img id="book" class="d-block w-100" src="${book.img }">
	                    	</li>
                    	</c:forEach>
	              	</ul>
                </div>
                <div class="carousel-item">
                 	<ul class="row">
	              		<c:forEach items="${books }" var="book" begin="8" end="11">
		              		<li class="col-3">                
		              				 <img id="book" class="d-block w-100" src="${book.img }">
	                    	</li>
                    	</c:forEach>
	              	</ul>
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
            
        </div>
        <div class="col-2"></div>
      </div>

    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="resources/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>