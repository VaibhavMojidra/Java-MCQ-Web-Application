<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='ISO-8859-1'>
<title>Java Test</title>
</head>
<body>
<%
int QuestionNum=Integer.parseInt(request.getParameter("Qnum").toString());
try 
{
	String Ht="jdbc:sqlserver://localhost\\VAIBHAV:1433;databaseName=JavaMCQ";
    String UN="xxx";
    String UP="xxxxx";
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con= DriverManager.getConnection(Ht,UN,UP);
    PreparedStatement p=con.prepareStatement("select * from JavaQ where QueNum=?");
	p.setInt(1,QuestionNum);
    ResultSet rs= p.executeQuery();
    if (rs.next()) 
    {
		out.print("<p>"+(rs.getString("Question").trim())+"</p><br><input type='radio' name='choice' value='1'>&nbsp;"+(rs.getString("Option1").trim())+"<br><input type='radio' name='choice' value='2'>&nbsp;"+(rs.getString("Option2").trim())+"<br><input type='radio' name='choice' value='3'>&nbsp;"+(rs.getString("Option3").trim())+"<br><input type='radio'  name='choice' value='4'>&nbsp;"+(rs.getString("Option4").trim())+"<br><input type='hidden' name='ansKey' value="+rs.getInt("AnswerNum")+"/>");
    }
    else
    {
    	out.print("No row");
    }
} 
catch (Exception e) 
{
	out.print("Oops!! Some Error occured please try again.!");
}
%>
</body>
</html>