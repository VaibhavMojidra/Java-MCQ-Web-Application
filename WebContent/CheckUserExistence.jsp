<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Java Test</title>
</head>
<body>
<%
String UserN=(request.getParameter("UserE").toString()).trim();
try 
{
	String Ht="jdbc:sqlserver://localhost\\VAIBHAV:1433;databaseName=JavaMCQ";
    String UN="xx";
    String UP="xxxxx";
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con= DriverManager.getConnection(Ht,UN,UP);
    PreparedStatement p=con.prepareStatement("select * from UserDetails where UserName=?");
    p.setString(1,UserN);
    ResultSet rs= p.executeQuery();
    if (rs.next()) 
    {
    	out.print("GotUser");
    }
    else
    {
    	out.print("NoUser");
    }
} 
catch (Exception e) 
{
	out.print("Oops!! Some Error occured please try again.!");
}
%>
</body>
</html>