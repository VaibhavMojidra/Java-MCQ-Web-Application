<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Java Test</title>
  <link rel="stylesheet" href="MyResources/MyCSS.css">
  <script src="MyResources/MyJQuery.js"></script>
  <script src="MyResources/MyP.js"></script>
  <script src="MyResources/MyBS.js"></script>
<style type="text/css">
#MyButtonsDiv
{
  height: 0vh;
  width: 70vw;
  position: fixed;
  z-index: 2;
  margin-top: 50vh;
  margin-bottom: 50vh;
  margin-left: 15vw;
  margin-right: 15vw;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  border-radius: 60px 10px;
  background-color: #FFFFFF;
  overflow-x: hidden;
  overflow-y: hidden;
  transition: 3s; 
  text-align: center;
}
</style>
<script type="text/javascript">
function Appear() 
{
	document.getElementById("MyButtonsDiv").style.height = "70vh";
	document.getElementById("MyButtonsDiv").style.marginTop = "15vh";
	document.getElementById("MyButtonsDiv").style.marginBottom = "15vh";	
}
</script>
</head>
<body style="background-image: url('IMAGES/LoginWall.jpg');background-repeat: no-repeat;
  background-size: cover;" onload="Appear()">
  <div id="MyButtonsDiv">
  <label class="badge badge-pill badge-secondary" style="width: auto;height:7vh;padding-left: 4vw;padding-right: 4vw;font-size: 4vh;margin-top:5vh;">Welcome ${cookie['first_name'].getValue()} ${cookie['last_name'].getValue()}</label>
  <br><br>
  <ul type="square" class="container" style="text-align: left;margin-left: 12vw;margin-right: 12vw;font-size: 3vh;">
  <li>This is java test which contains 30 multiple choice questions.</li>
  <li>There is no time limit for attempting questions.</li>
  <li>Each question contains 1 positive mark.</li>
  <li>There are no negative marking. Passing percentage: 60 % (18 right answers)</li>
  <li><b>Note: </b> You cannot change the answer once you have clicked on next question.</li>
  </ul>
  	<p style="font-size: 5vh;align-self: center;"><i><b>Best Of Luck.!!!</b></i></p>
  <br>
  <form action="Questions.jsp" method="post">
  <input type="submit" style="height: 10vh;width: 20vw;font-size: 4vh;" class="btn btn-primary btn-lg" value="Start the test">
  </form>
  </div>
</body>
</html>