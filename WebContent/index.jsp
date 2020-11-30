<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#MyButtonsDiv
{
  height: 0vh;
  width: 50vw;
  position: fixed;
  z-index: 2;
  margin-top: 50vh;
  margin-bottom: 50vh;
  margin-left: 25vw;
  margin-right: 25vw;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  border-radius: 60px 10px;
  background-color: #FFFFFF;
  overflow-x: hidden;
  overflow-y: hidden;
  transition: 1s; 
  text-align: center;
}
</style>
<script type="text/javascript">
function OpenButtonDiv()
{
	document.getElementById("GS").style.display = "none";
	document.getElementById("MyButtonsDiv").style.height = "50vh";
	document.getElementById("MyButtonsDiv").style.marginTop = "25vh";
	document.getElementById("MyButtonsDiv").style.marginBottom = "25vh";
}
</script>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="MyResources/MyCSS.css">
  <script src="MyResources/MyJQuery.js"></script>
  <script src="MyResources/MyP.js"></script>
  <script src="MyResources/MyBS.js"></script>
<title>Java Test</title>
</head>
<body>
<%
try{
	Cookie[] array= request.getCookies(); 
	for(int i=0; i<array.length; i++)
	{
		if(array[i].getName().equals("first_name"))
		{
			array[i].setMaxAge(0);
			response.addCookie(array[i]);
		}
		if(array[i].getName().equals("last_name"))
		{
			array[i].setMaxAge(0);
			response.addCookie(array[i]);
		}
		if(array[i].getName().equals("user_name"))
		{
			array[i].setMaxAge(0);
			response.addCookie(array[i]);
		}
	}
}catch(Exception e){}
%>
<button id="GS" style="position: fixed;z-index: 2;height: 10vh;width: 40vw;margin-top: 45vh;margin-bottom: 45vh;margin-left: 30vw;margin-right: 30vw;font-size:5vh;" class="btn btn-warning" onclick="OpenButtonDiv()">Get Started</button>
<div id="MyButtonsDiv">
	<label class="badge badge-pill badge-secondary" style="width: 30vw;height:7vh;font-size: 4vh;margin-top:5vh;">Java Test</label>
	<form action="SignUp.jsp" method="post">
		<input type="submit" style="margin-left:15vw;width:20vw;margin-right:15vw;height:8vh;margin-top:5vh;" class="btn btn-primary btn-lg" value="Sign Up"/>
		<label style="font-size:1.9vh;">Don't have an account?</label>
	</form>
	<form action="LoginPage.html" method="post">
		<input type="submit" style="margin-left:15vw;width:20vw;margin-right:15vw;height:8vh;margin-top:3.5vh;" class="btn btn-primary btn-lg" value="Login"/>
		<label style="font-size:1.9vh;">Already have an account?</label>
	</form>
</div>

<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" >
  <div class="carousel-inner">
  	<div class="carousel-item active">
      <img src="IMAGES/2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="IMAGES/1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="IMAGES/3.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="IMAGES/4.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="IMAGES/5.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="IMAGES/6.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
</div>
</body>
</html>