<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Java Test</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
  transition: 2s; 
  text-align: center;
}
</style>
<script type="text/javascript">
var nums=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52];
var counter=0;
var request;
var yourmarks=0;
var NonAtQue=0;
var WrongAnswers=0;
function Appear()
{
	document.getElementById("MyButtonsDiv").style.height = "70vh";
	document.getElementById("MyButtonsDiv").style.marginTop = "15vh";
	document.getElementById("MyButtonsDiv").style.marginBottom = "15vh";
	sendInfo();
}
function sendInfo()  
{  
	if(counter<30)
	{
		var number = nums[Math.floor(Math.random()*nums.length)];
		for( var i = 0; i < nums.length; i++){ 
			if ( nums[i] === number) {nums.splice(i, 1);}
		}
		counter++;
		document.forms["MarksForm"]["QuestionNos"].value+=""+number+",";
		var url="GetQuestion.jsp?Qnum="+number;
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
	else
	{
		var YA=document.forms["MarksForm"]["YourAnsw"].value;
		YA=YA.substr(0, YA.length-1);
		document.forms["MarksForm"]["YourAnsw"].value=YA;		
		YA=document.forms["MarksForm"]["QuestionNos"].value;
		YA=YA.substr(0, YA.length-1);
		document.forms["MarksForm"]["QuestionNos"].value=YA;
		document.MarksForm.submit();
	}
}
function getInfo()
{  
	if(request.readyState==4)
	{  
		if(counter==30)
		{
			var valu=request.responseText;
			valu=valu.substring(108,valu.length-17);
			valu=valu+'<br><input type="button" class="btn btn-primary" onclick="checkAns()" value="Submit test">';
			valu='<label class="badge badge-pill badge-secondary" style="width: auto;height:7vh;padding-left: 4vw;padding-right: 4vw;font-size: 4vh;margin-top:5vh;margin-bottom:5vh;">Question '+counter+'</label>'+valu;
			document.getElementById('QuestionForm').innerHTML=valu;	
		}
		else
		{
			var valu=request.responseText;
			valu=valu.substring(108,valu.length-17);
			valu=valu+'<br><input type="button" class="btn btn-primary" onclick="checkAns()" value="Next Question">';
			valu='<label class="badge badge-pill badge-secondary" style="width: auto;height:7vh;padding-left: 4vw;padding-right: 4vw;font-size: 4vh;margin-top:5vh;margin-bottom:5vh;">Question '+counter+'</label>'+valu;
			document.getElementById('QuestionForm').innerHTML=valu;
		}
	}  
}
function checkAns()
{
	var ans=parseInt(document.forms["MQF"]["ansKey"].value);
	var yourAns=parseInt(document.forms["MQF"]["choice"].value);
	if(isNaN(yourAns))
	{
		NonAtQue++;
		document.forms["MarksForm"]["NonAt"].value=NonAtQue;
	}
	else
	{
		if(ans==yourAns)
		{
			yourmarks++;
			document.forms["MarksForm"]["Marks"].value=yourmarks;
		}
		else
		{
			WrongAnswers++;
			document.forms["MarksForm"]["WrongAns"].value=WrongAnswers;
		}
	}
	if(counter==30)
	{
		document.forms["MarksForm"]["YourAnsw"].value+=""+yourAns+",";
		document.getElementById("MyButtonsDiv").style.height = "0vh";
		document.getElementById("MyButtonsDiv").style.marginTop = "50vh";
		document.getElementById("MyButtonsDiv").style.marginBottom = "50vh";
		document.getElementById('QuestionForm').innerHTML="";
		sendInfo();
	}
	else
	{
		document.forms["MarksForm"]["YourAnsw"].value+=""+yourAns+",";
		document.getElementById("MyButtonsDiv").style.height = "0vh";
		document.getElementById("MyButtonsDiv").style.marginTop = "50vh";
		document.getElementById("MyButtonsDiv").style.marginBottom = "50vh";
		document.getElementById('QuestionForm').innerHTML="";
		setTimeout(c2, 2000);
	}
}
function c2() {
	document.getElementById("MyButtonsDiv").style.height = "70vh";
	document.getElementById("MyButtonsDiv").style.marginTop = "15vh";
	document.getElementById("MyButtonsDiv").style.marginBottom = "15vh";
	sendInfo();
}
</script>
</head>
<body style="background-image: url('IMAGES/LoginWall.jpg');background-repeat: no-repeat;
  background-size: cover;" onload="Appear()">
  <div id="MyButtonsDiv">
  	<form id="QuestionForm" name='MQF' class='container' style='text-align:left;font-size:3vh;margin-top: 3vh;padding-left: 7vw;word-wrap: all;padding-right:5vw;'>
  	</form>
  	<form name='MarksForm' action="ShowResult.jsp" method="post">
  	<input type='hidden' name='Marks' value="0"/>
  	<input type='hidden' name='NonAt' value="0"/>
  	<input type='hidden' name='WrongAns' value="0"/>
  	<input type='hidden' name='YourAnsw' value=""/>
  	<input type='hidden' name='QuestionNos' value=""/>
  	</form>
  </div>
</body>
</html>