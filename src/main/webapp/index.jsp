<%
    if(session.getAttribute("name")==null){
    	response.sendRedirect("login.jsp");
    }
%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>HomePage</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style type="text/css">
		img{
			width:30%;
			height:50%;
		}
		body, .jumbotron{
			  background: linear-gradient(90deg, #e3ffe7 0%, #d9e7ff 100%);
			  background-repeat: no-repeat;
			  background-size: cover;
			  background-attachment:fixed;

		}
	</style>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)--> 0
<link href="css/index-styles.css" rel="stylesheet" />
<link rel="stylesheet" href="css/stylesheet.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="website icon" type="png" href="./img/website-icon-removebg.jpg">
    
    <!-- Quiz theme CSS (includes Bootstrap)-->
    
    
    

</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">ONLINE QUIZ</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="index.jsp">Home</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="quiz.jsp">Quiz</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="result.jsp">Result</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="review.jsp">Review</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%=session.getAttribute("name") %></a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	
	
	<div class="jumbotron m-5">
			<div class="card-deck">
  				<div class="card">
   					<img class="card-img-top bg-light" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsaFtrrc4u-O6jToQMsOZH85Qtmf0jzjOThQ&usqp=CAU" alt="Card image cap">
				    <div class="card-body">
				      <h5 class="card-title">Give Exam</h5>
				      <p class="card-text">Attempt online quiz exam for java to test your knowledege and understanding for it.</p>
				      

				    </div>
				    <a href="quiz.jsp" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Attemp Quiz</a>

  				</div>
  				 <div class="card">
   					<img class="card-img-top bg-light " src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVO6UPByn6dWSIcOQrz1pbiJzJ_iIBaxy0eg&usqp=CAU"" alt="Card image cap">
				    <div class="card-body">
				      <h5 class="card-title">Review Answers</h5>
				      <p class="card-text">Check your performance by comparing your selected answers with the actual answers.</p>
				      

				    </div>
				    <a href="review.jsp" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Review</a>

  				</div>
  				  <div class="card">
   					<img class="card-img-top bg-white " src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQeQzU3Xth_7MfirsZPNkDS98GW9e79PQN6OQ&usqp=CAU" alt="Card image cap">
				    <div class="card-body">
				      <h5 class="card-title">Check your score</h5>
				      <p class="card-text">View your assement based on the recent exam.</p>
				      

				    </div>
				    <a href="result.jsp" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">View Result</a>

  				</div>


  			</div>
 
		</div>
	
	
	
	
	
	
</body>
</html>
