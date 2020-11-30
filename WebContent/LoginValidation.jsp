<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<title>Java Test</title>
</head>
<body>
<%  
String UserName=request.getParameter("UName").toString();    
String Passwd=request.getParameter("Pwd").toString();
try 
{
	String Ht="jdbc:sqlserver://localhost\\VAIBHAV:1433;databaseName=JavaMCQ";
    String UN="xx";
    String UP="xxxx";
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con= DriverManager.getConnection(Ht,UN,UP);
    Statement smt=con.createStatement();
    ResultSet rs= smt.executeQuery("select * from UserDetails where UserName= '"+UserName+"'");
    if (rs.next()) 
    {
    	PreparedStatement p=con.prepareStatement("Select * from UserDetails where UserName=?");
    	p.setString(1,UserName);
        ResultSet rs2= p.executeQuery();
        if(rs2.next())
        {
        	String dbPass=rs2.getString("Passwd");
        	String FN=rs2.getString("FirstName");
        	String LN=rs2.getString("LastName");
        	String USN=rs2.getString("UserName");
        	if(dbPass.equals(Passwd))
        	{
        		Cookie firstName = new Cookie("first_name", FN);
        		Cookie lastName = new Cookie("last_name", LN);
        		Cookie userName = new Cookie("user_name", USN);
        		response.addCookie(firstName);
        		response.addCookie(lastName);
        		response.addCookie(userName);
        		out.print("Valid");
        	}
        	else
        	{
        		out.print("Invalid password");		
        	}
        }
    }
    else
    {
    	out.print("Invalid username");
    }
} 
catch (Exception e) 
{
	out.print("Oops!! Some Error occured please try again.!");
}
%>
</body>
</html>