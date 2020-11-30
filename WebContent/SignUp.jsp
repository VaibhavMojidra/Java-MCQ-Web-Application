<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
html {
  background-color: #56baed;
}

body {
  font-family: "Poppins", sans-serif;
  height: 100vh;
}

a {
  color: #92badd;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}

h2 {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 40px 8px 10px 8px; 
  color: #cccccc;
}
#StatusAndAlert
{
  height: 0vh;
  width: 0vw;
  position: fixed;
  z-index: 3;
  margin-top: 50vh;
  margin-bottom: 50vh;
  margin-left: 50vw;
  margin-right: 50vw;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  border-radius: 60px 10px;
  background-color: #FFFFFF;
  overflow-x: hidden;
  overflow-y: hidden;
  transition: 1s; 
  text-align: center;
}
.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}

#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 30px;
  width: 90%;
  max-width: 450px;
  position: relative;
  padding: 0px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}

#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}
h2.inactive {
  color: #cccccc;
}

h2.active {
  color: #0d0d0d;
  border-bottom: 2px solid #5fbae9;
}

input[type=button], input[type=submit], input[type=reset]  {
  background-color: #56baed;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #39ace7;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}
input[type=text] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder {
  color: #cccccc;
}

input[type=password] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=password]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=password]:placeholder {
  color: #cccccc;
}


.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #56baed;
  content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
  color: #0d0d0d;
}

.underlineHover:hover:after{
  width: 100%;
}

*:focus {
    outline: none;
} 

#icon {
  width:60%;
}

</style>
<script type="text/javascript">
var FirNam;
var LasNam;
var EmailId;
var UserN;
var Pass;
var request;
var stages=0;
var ROTP;
function JumpToOTP()
{
	FirNam=document.LoginForm.FName.value;
	LasNam=document.LoginForm.LName.value;
	EmailId=document.LoginForm.EmailA.value;
	stages=1;
	ROTP=Math.floor(100000 + Math.random() * 900000);
	document.getElementById('errordis').innerHTML="Please wait, Verfying your email address..";
	sendInfo();
}
function ResendOTP(){
	stages=2;
	ROTP=Math.floor(100000 + Math.random() * 900000);
	sendInfo();
}
function CheckUE() {
	UserN=document.LoginForm.USERNAMETB.value;
	stages=3;
	sendInfo();
}
function Register() {
	var EnterP=document.LoginForm.EPTB.value;
	var ConfirmP=document.LoginForm.CPTB.value;
	if(EnterP==ConfirmP)
	{
		Pass=ConfirmP;
		stages=4;
		document.getElementById('errordis').innerHTML="Please wait.!! Registration in process...";
		document.getElementById("RBtn").disabled = false;
		sendInfo();
	}
	else
	{
		document.getElementById('errordis').innerHTML="Password does't match";
	}
	
}
function RegisterPass() 
{
	document.getElementById("formContent").innerHTML='<form name="LoginForm" method="post"><img src="IMAGES/UserIcon.png" style="width: 25vh;height: 25vh;" alt="User Icon"/><input type="password" class="fadeIn second" name="EPTB"  placeholder="Enter Password"><input type="password" class="fadeIn second" name="CPTB" placeholder="Confirm Password"><br><label id="Mesg" style="font-size:1.5vh;color: #000FFF;"></label><br><label id="errordis" style="font-size:2vh;color: #ff3d3d;"></label><br><input type="button" id="RBtn" class="fadeIn fourth" onclick="Register()" value="Register"></form>';
}
function JumpToU() 
{
	var OTPVAL=document.LoginForm.OTPTB.value;
	if(ROTP==OTPVAL)
	{
		stages=3;
		document.getElementById("formContent").innerHTML='<form name="LoginForm" method="post"><img src="IMAGES/UserIcon.png" style="width: 25vh;height: 25vh;" alt="User Icon"/><input type="text" class="fadeIn second" name="USERNAMETB" onkeyup="CheckUE()" placeholder="Username"><br><label id="Mesg" style="font-size:1.5vh;color: #000FFF;">Choose a username.</label><br><label id="errordis" style="font-size:2vh;color: #ff3d3d;"></label><br><input type="button" class="fadeIn fourth" onclick="RegisterPass()" value="Next >>"></form>';
	}
	else
	{
		document.getElementById('errordis').innerHTML="Invalid OTP";
	}
}
function sendInfo()  
{  
	if(stages==1||stages==2)
	{
		var url="SendOTP.jsp?EmailAdd="+EmailId+"&OOTP="+ROTP;
	  	if(window.XMLHttpRequest)
	  	{  
			request=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject)
		{  
			request=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  try  
		{  
			request.onreadystatechange=getInfo;  
			request.open("GET",url,true);
			request.send();
		}  
		catch(e)  
		{  
			alert("Unable to connect to server");
		}
	}
	 if(stages==3)
	{
		var url="CheckUserExistence.jsp?UserE="+UserN;
	  	if(window.XMLHttpRequest)
	  	{  
			request=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject)
		{  
			request=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  try  
		{  
			request.onreadystatechange=getInfo;  
			request.open("GET",url,true);
			request.send();
		}  
		catch(e)  
		{  
			alert("Unable to connect to server");
		}
	}
	if(stages==4)
	{
		var url="RegisterAndSent.jsp?EmailAdd="+EmailId+"&UserName="+UserN+"&Passwd="+Pass+"&FN="+FirNam+"&LN="+LasNam;
			if(window.XMLHttpRequest)
			{  
				request=new XMLHttpRequest();
			}  
			else if(window.ActiveXObject)
			{  
				request=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  try  
			{  
				request.onreadystatechange=getInfo;  
				request.open("GET",url,true);
				request.send();
			}  
			catch(e)  
			{  
				alert("Unable to connect to server");
			}
	}
}

function getInfo()
{  
	if(request.readyState==4)
	{  
		if(stages==1)
		{
			var valu=request.responseText;
			if(valu.match("is not a valid"))
			{
				document.getElementById('errordis').innerHTML="Invalid email address";
			}
			else 
			{
				if(valu.match("GotEmail"))
				{
					document.getElementById('errordis').innerHTML="This email address is already registered";
				}
				else
				{
					document.getElementById("formContent").innerHTML='<form name="LoginForm" method="post"><img src="IMAGES/UserIcon.png" style="width: 25vh;height: 25vh;" alt="User Icon" /><input type="text" class="fadeIn second" name="OTPTB" placeholder="Enter OTP"><br><label id="Mesg" style="font-size:1.5vh;color: #000FFF;">OTP has been sent to your email.</label><br><label id="errordis" style="font-size:2vh;color: #ff3d3d;"></label><br><input type="button" class="fadeIn fourth" onclick="ResendOTP()" value="Resend OTP"><input type="button" class="fadeIn fourth" onclick="JumpToU()" value="Next >>"></form>';	
				}					
			}
		}
		if(stages==2)
		{
			var valu=request.responseText;
			if(valu.match("EmailSent"))
			{
				document.getElementById('Mesg').innerHTML="OTP has been resent to your email";
			}
			else 
			{
				document.getElementById('errordis').innerHTML="There was some error please try again.";	
			}
		}
		if(stages==3)
		{
			var valu=request.responseText;
			if(valu.match("GotUser"))
			{
				document.getElementById('errordis').innerHTML="Username has been taken";
			}
			else 
			{
				document.getElementById('errordis').innerHTML="Valid Username";	
			}
		}
		if(stages==4)
		{
			var valu=request.responseText;
			if(valu.match("RAES"))
			{
				document.getElementById("StatusAndAlert").style.height = "50vh";
				document.getElementById("StatusAndAlert").style.marginTop = "25vh";
				document.getElementById("StatusAndAlert").style.marginBottom = "25vh";
				document.getElementById("StatusAndAlert").style.width = "50vw";
				document.getElementById("StatusAndAlert").style.marginLeft = "25vw";
				document.getElementById("StatusAndAlert").style.marginRight = "25vw";
				setTimeout(Redirect, 2000);
			}
			else 
			{
				document.getElementById('errordis').innerHTML="Valid Username";	
			}
		}
	}  
}
function Redirect()
{
	document.getElementById("StatusAndAlert").style.height = "0vh";
	document.getElementById("StatusAndAlert").style.marginTop = "50vh";
	document.getElementById("StatusAndAlert").style.marginBottom = "50vh";
	document.getElementById("StatusAndAlert").style.width = "0vw";
	document.getElementById("StatusAndAlert").style.marginLeft = "50vw";
	document.getElementById("StatusAndAlert").style.marginRight = "50vw";
	document.RestartW.submit();
}
function ShowForm() 
{
	document.getElementById("formContent").innerHTML='<form name="LoginForm" method="post"><img src="IMAGES/UserIcon.png" style="width: 25vh;height: 25vh;" alt="User Icon" /><input type="text" id="FirstN" class="fadeIn second" name="FName" placeholder="First name"><input type="text" id="LastN" class="fadeIn second" name="LName" placeholder="Last name"><input type="text" id="emailid" class="fadeIn second" name="EmailA" placeholder="Email"><br><label style="font-size:1.5vh;color: #000FFF;">Please enter correct email address as an otp will be sent on your email</label><br><label id="errordis" style="font-size:2vh;color: #ff3d3d;"></label><br><input type="button" class="fadeIn fourth" onclick="JumpToOTP()" value="Next >>"></form>';
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
<body style="background-image: url('IMAGES/LoginWall.jpg');background-repeat: no-repeat;
  background-size: 100% 100%;" onload="ShowForm()">
<div class="wrapper fadeInDown">
  <div id="formContent">
  </div>
</div>
<form action="index.jsp" name="RestartW" method="post">
</form>
<div id='StatusAndAlert'>
<label id='waitl' style="font-size: 6vh;margin-top: 15vh;" class="text-primary">Successfully registered</label>
</div>
</body>
</html>