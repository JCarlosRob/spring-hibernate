<div class="container-fluid">

	<div id="header">

		<div id="title" class="row">
			<h1 id="titleText" class="col-4">Spring-Hibernate</h1>
			<div class="col-4"></div>

			<div class="col-4"></div>
		</div>


		<div id="menubar" class="row">

			<nav class="navbar navbar-expand-lg navbar-light bg-light col-12">
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">Home</a>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/user/info">Logged by: ${pageContext.request.userPrincipal.name }</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/user/info">My books</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Forum</a></li>
						<li class="nav-item">
							<form action="${pageContext.request.contextPath}/appLogout" method="post">
								<input id="logout" class="nav-link" type="submit" value="Logout" />
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
							</form>
						</li>
					</ul>
				</div>
			</nav>
			
		</div>
		
	</div>
	
</div>

<div class="row">
  <div id="space" class="col-12"></div>
</div>