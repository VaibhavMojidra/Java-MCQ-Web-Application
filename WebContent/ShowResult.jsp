<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="com.itextpdf.text.Document"%>
<%@ page import="com.itextpdf.text.DocumentException"%>
<%@ page import="com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@ page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@ page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@ page import="com.itextpdf.text.Element"%>
<%@ page import="com.itextpdf.text.pdf.fonts.*"%>
<%@ page import="com.itextpdf.text.ZapfDingbatsList"%>
<%@ page import="com.itextpdf.text.ListItem"%>
<%@ page import="com.itextpdf.text.pdf.*"%>
<%@ page import="com.itextpdf.text.Image"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

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
.vm-light-grey,.vm-hover-light-grey:hover,.vm-light-gray,.vm-hover-light-gray:hover
{
	color:#000!important;
	background-color:#f1f1f1!important;
}
.vm-table-all{border:1px solid #ccc}
.vm-bordered tr,.vm-table-all tr{border-bottom:1px solid #ddd}.vm-striped tbody tr:nth-child(even){background-color:#f1f1f1}
.vm-table-all tr:nth-child(odd){background-color:#fff}.vm-table-all tr:nth-child(even){background-color:#f1f1f1}
.vm-hoverable tbody tr:hover,.vm-ul.vm-hoverable li:hover{background-color:#ccc}.vm-centered tr th,.vm-centered tr td{text-align:center}
.vm-table td,.vm-table th,.vm-table-all td,.vm-table-all th{padding:8px 8px;display:table-cell;text-align:left;vertical-align:top}
.vm-table th:first-child,.vm-table td:first-child,.vm-table-all th:first-child,.vm-table-all td:first-child{padding-left:16px}
</style>
<script type="text/javascript">
function Appear()
{
	document.getElementById("MyButtonsDiv").style.height = "80vh";
	document.getElementById("MyButtonsDiv").style.marginTop = "10vh";
	document.getElementById("MyButtonsDiv").style.marginBottom = "10vh";
}
function SendEmail()
{
	document.getElementById("StatusAndAlert").style.height = "50vh";
	document.getElementById("StatusAndAlert").style.marginTop = "25vh";
	document.getElementById("StatusAndAlert").style.marginBottom = "25vh";
	document.getElementById("StatusAndAlert").style.width = "50vw";
	document.getElementById("StatusAndAlert").style.marginLeft = "25vw";
	document.getElementById("StatusAndAlert").style.marginRight = "25vw";
	document.getElementById("EBtn").disabled = true;
	document.getElementById("LBtn").disabled = true;
	sendInfo();
}
function LogoutFun()
{
	document.LogoutF.submit();
}
function sendInfo()  
{  
	
		var url="SendEmail.jsp?USName="+(document.forms["valueform"]["UserNameTb"].value);
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
function getInfo()
{  
	if(request.readyState==4)
	{  

			var valu=request.responseText;
			valu=valu.substring(121,valu.length-17);
			valu=valu.trim();
			if(valu=="EmailSent")
			{
				document.getElementById("spin1").style.display = "hidden";
				document.getElementById("spin2").style.display = "hidden";
				document.getElementById("spin3").style.display = "hidden";
				document.getElementById('waitl').innerHTML = 'Result has been sent on your registered email.';
				setTimeout(restore, 2000);
			}
			if(valu=="EmailNotSent")
			{
				document.getElementById("spin1").style.display = "hidden";
				document.getElementById("spin2").style.display = "hidden";
				document.getElementById("spin3").style.display = "hidden";
				document.getElementById('waitl').innerHTML = 'There was some problem. Please check internet connection';
				setTimeout(restore, 2000);
			}
		
	}  
}
function restore() 
{
	document.getElementById("StatusAndAlert").style.height = "0vh";
	document.getElementById("StatusAndAlert").style.marginTop = "50vh";
	document.getElementById("StatusAndAlert").style.marginBottom = "50vh";
	document.getElementById("StatusAndAlert").style.width = "0vw";
	document.getElementById("StatusAndAlert").style.marginLeft = "50vw";
	document.getElementById("StatusAndAlert").style.marginRight = "50vw";
	document.getElementById("spin1").style.display ="visible";
	document.getElementById("spin2").style.display ="visible";
	document.getElementById("spin3").style.display ="visible";
	document.getElementById('waitl').innerHTML = 'Please wait until <br>email is been sent';
	document.getElementById("EBtn").disabled = false;
	document.getElementById("LBtn").disabled = false;
}
</script>
</head>
<body style="background-image: url('IMAGES/LoginWall.jpg');background-repeat: no-repeat;
  background-size: cover;" onload="Appear()">
<%!
public static Cookie getCookie(HttpServletRequest request, String name) {
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(name)) {
                return cookie;
            }
        }
    }
    return null;
}
%>
<%
 String MarksScrored=request.getParameter("Marks").toString();
 String NonAttempts=request.getParameter("NonAt").toString();
 String WrongAttempts=request.getParameter("WrongAns").toString();
 String UrAnsArray[]=request.getParameter("YourAnsw").toString().split(",",30);
 String Questions[]=request.getParameter("QuestionNos").toString().split(",",30);
 int NA=Integer.parseInt(NonAttempts);
 int A=30-NA;
 int ICA=Integer.parseInt(WrongAttempts);
 int ICAINA=ICA+NA;
 int CA=30-ICAINA;
 double perct=((CA*100)/30);
 String res=(perct>=60) ? "Pass":"Fail";
 Document document = new Document();
 try
 {
	PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("Result.pdf"));
    document.open();
    document.add(new Paragraph("\n"));
	document.add(new Paragraph("\n"));
	document.add(new Paragraph("\n"));
	document.add(new Paragraph("\n"));
	document.add(new Paragraph("\n"));
	document.add(new Paragraph("\n"));
    Image image1 = Image.getInstance("Resources\\JavaMCQ\\LogoT.png");
    image1.setAbsolutePosition(50f, 705f);
    image1.scaleAbsolute(480,123);
    document.add(image1);
    
    Cookie c=getCookie(request,"first_name");
    Cookie c2=getCookie(request,"last_name");
    Cookie c3=getCookie(request,"user_name");
    document.add(new Paragraph("First name: "+c.getValue()));
    document.add(new Paragraph("Last name: "+c2.getValue()));
    document.add(new Paragraph("User name: "+c3.getValue()));
    document.addAuthor("Vaibhav Mojidra");
    document.addCreationDate();
    document.addCreator("Vaibhav Mojidra");
    document.addTitle("Result of Java Test");
    document.addSubject("Java MCQ Test Result Summary along with score");
    
    PdfPTable table = new PdfPTable(3);
    table.setWidthPercentage(100);
    
    table.setSpacingBefore(10f);
    table.setSpacingAfter(10f);
    float[] columnWidths = {60f, 20f, 20f};
    table.setWidths(columnWidths);
    PdfPCell cell11 = new PdfPCell(new Paragraph(""));
    cell11.setFixedHeight(28f);
    PdfPCell cell12 = new PdfPCell(new Paragraph(""));
    PdfPCell cell13 = new PdfPCell(new Paragraph("Out Of"));
    cell13.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell13.setVerticalAlignment(Element.ALIGN_MIDDLE);

    PdfPCell cell21 = new PdfPCell(new Paragraph("Number of questions attempt: "));
    cell21.setPaddingLeft(10);
    cell21.setFixedHeight(25f);
    cell21.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell21.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell22 = new PdfPCell(new Paragraph(String.valueOf(A)));
    cell22.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell22.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell23 = new PdfPCell(new Paragraph("30"));
    cell23.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell23.setVerticalAlignment(Element.ALIGN_MIDDLE);
    
    PdfPCell cell31 = new PdfPCell(new Paragraph("Number of non-attempt questions:"));
    cell31.setPaddingLeft(10);
    cell31.setFixedHeight(25f);
    cell31.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell31.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell32 = new PdfPCell(new Paragraph(String.valueOf(NA)));
    cell32.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell32.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell33 = new PdfPCell(new Paragraph("30"));
    cell33.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell33.setVerticalAlignment(Element.ALIGN_MIDDLE);
    
    PdfPCell cell41 = new PdfPCell(new Paragraph("Number of correct answers: "));
    cell41.setPaddingLeft(10);
    cell41.setFixedHeight(25f);
    cell41.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell41.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell42 = new PdfPCell(new Paragraph(String.valueOf(CA)));
    cell42.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell42.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell43 = new PdfPCell(new Paragraph("30"));
    cell43.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell43.setVerticalAlignment(Element.ALIGN_MIDDLE);
    
    PdfPCell cell51 = new PdfPCell(new Paragraph("Number of incorrect answers(excluding non-attempt): "));
    cell51.setPaddingLeft(10);
    cell51.setFixedHeight(25f);
    cell51.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell51.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell52 = new PdfPCell(new Paragraph(String.valueOf(ICA)));
    cell52.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell52.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell53 = new PdfPCell(new Paragraph("30"));
    cell53.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell53.setVerticalAlignment(Element.ALIGN_MIDDLE);
    
    PdfPCell cell61 = new PdfPCell(new Paragraph("Number of incorrect answers(including non-attempt): "));
    cell61.setPaddingLeft(10);
    cell61.setFixedHeight(25f);
    cell61.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell61.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell62 = new PdfPCell(new Paragraph(String.valueOf(ICAINA)));
    cell62.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell62.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell63 = new PdfPCell(new Paragraph("30"));
    cell63.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell63.setVerticalAlignment(Element.ALIGN_MIDDLE);
    
    PdfPCell cell71 = new PdfPCell(new Paragraph("Total Marks: "));
    cell71.setPaddingLeft(10);
    cell71.setFixedHeight(25f);
    cell71.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell71.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell72 = new PdfPCell(new Paragraph(String.valueOf(CA)));
    cell72.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell72.setVerticalAlignment(Element.ALIGN_MIDDLE);
    PdfPCell cell73 = new PdfPCell(new Paragraph("30"));
    cell73.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell73.setVerticalAlignment(Element.ALIGN_MIDDLE);
    
    PdfPCell cell81 = new PdfPCell(new Paragraph("Total Percentage: "+String.valueOf(perct)+" %"));
    cell81.setFixedHeight(25f);
    cell81.setPaddingLeft(10);
    cell81.setHorizontalAlignment(Element.ALIGN_MIDDLE);
    cell81.setVerticalAlignment(Element.ALIGN_MIDDLE);
    cell81.setColspan(3);
    
    PdfPCell cell91 = new PdfPCell(new Paragraph("Result: "+res));
    cell91.setFixedHeight(25f);
    cell91.setPaddingLeft(10);
    cell91.setHorizontalAlignment(Element.ALIGN_MIDDLE);
    cell91.setVerticalAlignment(Element.ALIGN_MIDDLE);
    cell91.setColspan(3);
    
    table.addCell(cell11);
    table.addCell(cell12);
    table.addCell(cell13);
    table.addCell(cell21);
    table.addCell(cell22);
    table.addCell(cell23);
    table.addCell(cell31);
    table.addCell(cell32);
    table.addCell(cell33);
    table.addCell(cell41);
    table.addCell(cell42);
    table.addCell(cell43);
    table.addCell(cell51);
    table.addCell(cell52);
    table.addCell(cell53);
    table.addCell(cell61);
    table.addCell(cell62);
    table.addCell(cell63);
    table.addCell(cell71);
    table.addCell(cell72);
    table.addCell(cell73);
    table.addCell(cell81);
    table.addCell(cell91);
    document.add(table);
	document.add(new Paragraph("\n"));
	document.add(new Paragraph("\n"));
	document.add(new Paragraph("\n"));
	document.add(new Paragraph("\n"));
	document.add(new Paragraph("\n"));
	Image image2 = Image.getInstance("Resources\\JavaMCQ\\IMG.png");
    image2.setAbsolutePosition(430f,325f);
    image2.scaleAbsolute(120,66);
    document.add(image2);
    
    
    	String Ht="jdbc:sqlserver://localhost\\VAIBHAV:1433;databaseName=JavaMCQ";
        String UN="xx";
        String UP="xxxxxxxx";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con= DriverManager.getConnection(Ht,UN,UP);
        for(int i=0;i<Questions.length;i++)
        {
   	     PreparedStatement p=con.prepareStatement("select * from JavaQ where QueNum=?");
   	     p.setInt(1,Integer.parseInt(Questions[i]));
   	     ResultSet rs= p.executeQuery();
   	     if (rs.next()) 
   	     {
   	    	String Quest=rs.getString("Question");
   	    	ZapfDingbatsList zapfDingbatsList = new ZapfDingbatsList(43, 30);
   	     	zapfDingbatsList.add(new ListItem(Quest));
   	     	document.add(zapfDingbatsList);
   	     	Quest=null;
    	 	Quest="Your Answer: ";
    	 	if((UrAnsArray[i].trim()).equals("1"))
	    	 {
	    		 Quest+=rs.getString("Option1");
	    		 Quest=Quest.replaceAll("&apos;", "'");
	    		 Quest=Quest.replaceAll("&#45;", "-");
	    		 Quest=Quest.replaceAll("&quot;", "\"");
	    	 }
	    	 else if((UrAnsArray[i].trim()).equals("2"))
	    	 {
	    		 Quest+=rs.getString("Option2");
	    		 Quest=Quest.replaceAll("&apos;", "'");
	    		 Quest=Quest.replaceAll("&#45;", "-");
	    		 Quest=Quest.replaceAll("&quot;", "\"");
	    	 }
	    	 else if((UrAnsArray[i].trim()).equals("3"))
	    	 {
	    		 Quest+=rs.getString("Option3");	 
	    		 Quest=Quest.replaceAll("&apos;", "'");
	    		 Quest=Quest.replaceAll("&#45;", "-");
	    		 Quest=Quest.replaceAll("&quot;", "\"");
	    	 }
	    	 else if((UrAnsArray[i].trim()).equals("4"))
	    	 {
	    		 Quest+=rs.getString("Option4");
	    		 Quest=Quest.replaceAll("&apos;", "'");
	    		 Quest=Quest.replaceAll("&#45;", "-");
	    		 Quest=Quest.replaceAll("&quot;", "\"");
	    	 }
	    	 else
	    	 {
	    		 Quest+="Not Attempted";
	    	 }
	   	     document.add(new Paragraph(Quest));
	   	     
	   	     Quest="Correct Answer: ";
	   	     
	    	 int anskey=rs.getInt("AnswerNum");
	    	 if(anskey==1)
	    	 {
	    		 Quest+=rs.getString("Option1");
	    		 Quest=Quest.replaceAll("&apos;", "'");
	    		 Quest=Quest.replaceAll("&#45;", "-");
	    		 Quest=Quest.replaceAll("&quot;", "\"");
	    	 }
	    	 else if(anskey==2)
	    	 {
	    		 Quest+=rs.getString("Option2");
	    		 Quest=Quest.replaceAll("&apos;", "'");
	    		 Quest=Quest.replaceAll("&#45;", "-");
	    		 Quest=Quest.replaceAll("&quot;", "\"");
	    	 }
	    	 else if(anskey==3)
	    	 {
	    		 Quest+=rs.getString("Option3");
	    		 Quest=Quest.replaceAll("&apos;", "'");
	    		 Quest=Quest.replaceAll("&#45;", "-");
	    		 Quest=Quest.replaceAll("&quot;", "\"");
	    	 }
	    	 else
	    	 {
	    		 Quest+=rs.getString("Option4");
	    		 Quest=Quest.replaceAll("&apos;", "'");
	    		 Quest=Quest.replaceAll("&#45;", "-");
	    		 Quest=Quest.replaceAll("&quot;", "\"");
	    	 }
	    	 document.add(new Paragraph(Quest));
	    	 document.add(new Paragraph("\n"));
	    	 document.add(new Paragraph("\n"));
   	     }
   	     rs.close();
   	     p.close();
   	  	}
    
    document.close();
    
 } catch (DocumentException e)
 {
    e.printStackTrace();
 } catch (FileNotFoundException e)
 {
    e.printStackTrace();
 }
 catch(Exception e){e.printStackTrace();}
 
%>

<div id='MyButtonsDiv' >
<label style="width: auto;font-size: 4vh;margin-top:3vh;">${cookie['first_name'].getValue()} ${cookie['last_name'].getValue()}</label>
<table class="vm-table-all" style="font-size:2vh;;margin-top:2vh;width: 50vw;margin-left: 10vw;margin-right: 10vw;">
    <thead>
      <tr class="vm-light-grey">
        <th></th>
        <th></th>
        <th>Out Of</th>
      </tr>
    </thead>
    <tr>
      <td>Number of questions attempt:</td>
      <td><%=A%></td>
      <td>30</td>
    </tr>
    <tr>
      <td>Number of non-attempt questions:</td>
      <td><%=NA%></td>
      <td>30</td>
    </tr>
    <tr>
      <td>Number of correct answers: </td>
      <td><%=CA%></td>
      <td>30</td>
    </tr>
    <tr>
      <td>Number of incorrect answers(excluding non-attempt): </td>
      <td><%=ICA%></td>
      <td>30</td>
    </tr>
    <tr>
      <td>Number of incorrect answers(including non-attempt): </td>
      <td><%=ICAINA%></td>
      <td>30</td>
    </tr>
    <tr>
      <td>Total Marks:</td>
      <td><%=CA%></td>
      <td>30</td>
    </tr>
    <tr>
      <td colspan="3" style="text-align:center;">Total Percentage: <%=perct%> %</td>
    </tr>
    <tr>
      <td colspan="3" style="text-align:center;">Result: <%=res%></td>
    </tr>
  </table>
  <button id="EBtn" class="btn btn-primary" style="margin-top: 3vh;margin-left: 3vw;" onclick="SendEmail()">Get Result Email</button>
  <button id="LBtn" class="btn btn-primary" style="margin-top: 3vh;margin-left: 3vw;" onclick="LogoutFun()">Logout</button>
</div>
<div id='StatusAndAlert'>
<label id='waitl' style="font-size: 6vh;margin-top: 15vh;" class="text-primary">Your email being is processed, Please wait</label>
<div id='spin1' style="width: 3vh;height: 3vh;margin-top: 16vh;" class="spinner-grow text-primary"></div>
<div id='spin2' style="width: 3vh;height: 3vh;margin-top: 16vh;" class="spinner-grow text-primary"></div>
<div id='spin3'style="width: 3vh;height: 3vh;margin-top: 16vh;ma" class="spinner-grow text-primary"></div>
</div>
<form name='valueform'>
<input type='hidden' name='UserNameTb' value="${cookie['user_name'].getValue()}"/>
</form>
<form name='LogoutF' method="post" action="index.jsp">
</form>
</body>
</html>