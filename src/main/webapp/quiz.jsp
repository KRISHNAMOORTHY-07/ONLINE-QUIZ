<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Css Styling -->
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

	<title>Quiz</title>

</head>
<body>
		<form>
			
			
		</form>

		<div class="container">
			<div class="jumbotron m-5">
				<span id="questionNumber"></span>
				

				<p id="Question"> Question 1</p>
				<form>
					<input type="radio" name="options" value="1" id=1>
					<label id="option1Text">Option 1 </label>
					<br>
					<input type="radio" name="options" value="2" id=2>
					<label id="option2Text">Option 2 </label>
					<br>
					<input type="radio" name="options" value="3" id=3>
					<label id="option3Text">Option 3 </label>
					<br>
					<input type="radio" name="options" value="4" id=4>
					<label id="option4Text">Option 4 </label>
					

				</form>
				<button type="button" class="btn btn-primary btn-lg btn-block mt-5" id="nextButton" onClick="nextQuestion()">Next Question</button>


			</div>

		</div>

		<script type="text/javascript">
		;

		//--------------------------Json Data  starts ----------------------------------//
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


		//--------------------------Json Data Ends ----------------------------------


		//-----------------------------Initialiaing variable-----------------------------
		var userSelectedOption = []
		var counter = 0
		var answers = Object.values(answersJson)


		setQuestionCounter();  //Calling this method to display the current count of question


		//Function to fetch new question from json file and display it on screen
		createQuestion(questions[counter])
		function createQuestion(question){
			document.getElementById('Question').innerHTML = counter+1 + ". "  +question['question'];
			for(i=1;i<=4;i++){
				labelId = "option" + i + "Text";
				document.getElementById(labelId).innerHTML = question.options[i];
			}

		}

		//Function to set the current question counter
		function setQuestionCounter(){
			let questionPosition = counter+1 + " of " + questions.length + " question";
			document.getElementById("questionNumber").innerHTML = questionPosition;
			if(counter==answers.length-1){
				document.getElementById("nextButton").innerHTML = "Submit";
			}
		}

		//Function to traverse to next question
		function nextQuestion(){
			if(counter<questions.length-1){
				let selectedOption = getSelectedOption();
				if(selectedOption){
					userSelectedOption.push(selectedOption);
					counter+=1;
					createQuestion(questions[counter]);
					setQuestionCounter();
				}	
				

			}
			else if(counter==questions.length-1){

				let selectedOption = getSelectedOption();
				if(selectedOption){
					userSelectedOption.push(parseInt(selectedOption));
					counter+=1
					calculateResult();

				}
				

			}
			else{
				alert("You have  already submiitted all answers");
			}
		}
					
					
		//Function to get the option selected by user
		function getSelectedOption(){
			var options = document.getElementsByName('options');
					for(let i=0;i<options.length;i++){
						if(options[i].checked){
							let index = options[i].value; 
							document.getElementById(index).checked = false;
							alert("Answer Submitted");
							return index;
						}
					}
					alert("Please select an option");
					return null;

		}

		//Function to calculate user's result and store data using localStorage
		function calculateResult(){
			userScore = 0;
			for(let i=0;i<userSelectedOption.length;i++){
				if(parseInt(userSelectedOption[i],10)===answers[i]){
					userScore+=1;
				}

			}
			localStorage.setItem("userSelectedOption",userSelectedOption);
			localStorage.setItem("answers",answers);
			localStorage.setItem("userScore",userScore);
			alert("Exam is successfully submiitted \nPlease check the result section to view score");
			window.location.replace('index.jsp');
			

			
		}

		
	</script>
</body>
</html>