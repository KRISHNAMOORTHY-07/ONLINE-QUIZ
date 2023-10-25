<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Result</title>
	<!-- Css Styling -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style type="text/css">
		p{
			
			color: white;
		}
		body{
			  background: linear-gradient(90deg, #e3ffe7 0%, #d9e7ff 100%);
			  background-repeat: no-repeat;
			  background-size: cover;
			  background-attachment:fixed;

		}

	</style>
</head>
<body>
	
		<div class="card mx-auto mt-5" style="width:30%; height:50%">
  			<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ-7w9BdnqYsnSqYieWezPiWlgVYwLJQs_EYg&usqp=CAU"  alt="Result">
  			<div class="card-body center" id="resultBody">
    			<p class="card-text" >Based on your assement</p>
    			<p class="card-text" id="resultText"> </p>
    			<p class="card-text" id="resultScore"> </p>
  			</div>
  			<a href="index.jsp" class="btn btn-info btn-lg active" role="button" aria-pressed="true">Go back to home</a>

		</div>
	
	
		<script type="text/javascript">
			userScore = localStorage.getItem("userScore");
			if(userScore==null){
				alert("Please attempt the test first!!");
				window.location.replace('index.html');
			}
			msg = ""
			if(userScore>4){
				msg  = "Congratulations you have Pass !!"
				document.getElementById("resultBody").className+=" bg-success"

			}
			else{
				msg = "You have failed!!!"
				document.getElementById("resultBody").className+=" bg-danger"
			}
			document.getElementById("resultText").innerHTML=msg;
			document.getElementById("resultScore").innerHTML = "Your score is " + userScore +   " marks out of 10"  ;
		</script>

</body>
</html>