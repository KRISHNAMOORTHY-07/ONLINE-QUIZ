<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Css Part -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style type="text/css">
		#questionNumber{
			float:right;
		}

		#submitButton {
			visibility: gone;
		}
		body{
			  background: linear-gradient(90deg, #00d2ff 0%, #3a47d5 100%);
			  background-repeat: no-repeat;
			  background-size: cover;
			  background-attachment:fixed;

		}

	</style>

	<title>Review</title>

</head>
<body>
		<form>
			
			
		</form>

		<div class="container">
			<div class="jumbotron m-5">
				<span id="questionNumber"></span>
				

				<p id="Question"> Question 1</p>
				<form>
					<label id="1">Option 1 </label>
					<br>
					<label id="2">Option 2 </label>
					<br>
					<label id="3">Option 3 </label>
					<br>
					<label id="4">Option 4 </label>
					

				</form>
				<br>
				<span id="userSelectedChoice" class="mt-4"> </span>
				 
				<button type="button" class="btn btn-primary btn-lg btn-block mt-5" id="nextButton" onClick="nextQuestion()">Next</button>


			</div>

		</div>

		<script type="text/javascript">
		//----------------------------Json Data ------------------------------------
		questions = [
		{
			question:"Which of the following option leads to the portability and security of Java?",
			options : {
				1:"Bytecode is executed by JVM",
				2:"The applet makes the Java code secure and portable",
				3: "Use of exception handling",
				4: "Dynamic binding between objects"
			}
		},{
			question:"Which of the following is not a Java features?",
			options : {
				1:"Dynamic",
				2:"Architecture Neutral",
				3: "Use of pointers",
				4: "Object-oriented"
			}
		},
		{
			question:" The \u0021 article referred to as a",
			options : {
				1:"Unicode escape sequence",
				2:"Octal escape",
				3: "Hexadecimal",
				4: "Line feed"
			}
		},
		{
			question:"_____ is used to find and fix bugs in the Java programs.",
			options : {
				1:"JVM",
				2:"JRE",
				3: "JDK",
				4: "JDB"
			}
		},
		{
			question:"What is the return type of the hashCode() method in the Object class?",
			options : {
				1:"Object",
				2:"int",
				3: "long",
				4: "void"
			}
		},
		{
			question:"What does the expression float a = 35 / 0 return?",
			options : {
				1:"0",
				2:"Not a Number",
				3: "Infinity",
				4: "Run time exception"
			}
		},{
			question:"Which of the following tool is used to generate API documentation in HTML format from doc comments in source code?",
			options : {
				1:"javap tool",
				2:"javaw command",
				3: "Javadoc tool",
				4: "javah command"
			}
		},{
			question:" Which method of the Class.class is used to determine the name of a class represented by the class object as a String?",
			options : {
				1:"getClass()",
				2:"intern()",
				3: "getName()",
				4: "toString()"
			}
		},{
			question:"In which process, a local variable has the same name as one of the instance variables?",
			options : {
				1:"Serialization",
				2:"Variable Shadowing",
				3: "Abstraction",
				4: "Multi-threading"
			}
		},
		{
			question:"Which of the following is true about the anonymous inner class?",
			options : {
				1:"It has only methods",
				2:"Objects can't be created",
				3: "It has a fixed class name",
				4: "It has no class name"
			}
		}


		];

		answersJson = {1:1,2:3,3:1,4:4,5:2,6:3,7:3,8:3,9:1,10:4};

		//-------------------------------Json data ends ----------------------------

		//Initializing variables
		var answers = Object.values(answersJson)		
		var counter = 0
		userScore = localStorage.getItem("userScore");
		//Checking if the user has given exam or not
		if(userScore==null){
			alert("Please attempt the test first!!");
			window.location.replace('index.html');
		}
		
		var userSelectedOptionString = localStorage.getItem("userSelectedOption");
		var userSelectedOption = userSelectedOptionString.split(',').map(function(item) {
								    return parseInt(item, 10);
								});
		


		
		
		setQuestionCounter(); //Function to set question counter

		//Function to create question by fetching question from json 
		createQuestion(questions[counter])
		function createQuestion(question){
			document.getElementById('Question').innerHTML = counter+1 + ". "  +question['question'];
			for(i=1;i<=4;i++){
				document.getElementById(i).className = "";
				document.getElementById(i).innerHTML = i + ") " +question.options[i];
				if(parseInt(userSelectedOption[counter])==i){
					document.getElementById(i).className = "bg-danger";
				}
				if(answers[counter]==i){
					document.getElementById(i).className = "bg-success";

				}
				
			}
			if(userSelectedOption[counter] == answers[counter]){
				document.getElementById("userSelectedChoice").innerHTML = "You have selected right answer";
			}
			else{
				document.getElementById("userSelectedChoice").innerHTML = "You have selected wrong answer";
			}

		}

		//Function to set counter for questions
		function setQuestionCounter(){
			let questionPosition = counter+1 + " of " + questions.length + " question";
			document.getElementById("questionNumber").innerHTML = questionPosition;
			if(counter==answers.length-1){
				document.getElementById("nextButton").innerHTML = "View Result";
			}
		}

		//Funtion to go to next question
		function nextQuestion(){
			if(counter<questions.length-1){
					counter+=1;
					createQuestion(questions[counter]);
					setQuestionCounter();
				}	
			else if(counter==questions.length-1){
					window.location.replace('results.html');
					counter+=1;
				}
				else{
					alert("You have reviewed all Questions\nRedireting to result page");


				}
		}	
		
	</script>
</body>
