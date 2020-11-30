<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Properties"%>    
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Java Test</title>
</head>
<body>
<%
	String Email=request.getParameter("EmailAdd").toString();
	String UserN=request.getParameter("UserName").toString();
	String PWD=request.getParameter("Passwd").toString();
	String FName=request.getParameter("FN").toString();
	String LName=request.getParameter("LN").toString();
	try 
	{
		String Ht="jdbc:sqlserver://localhost\\VAIBHAV:1433;databaseName=JavaMCQ";
	    String UN="xx";
	    String UP="xxxxxx";
	    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    Connection con= DriverManager.getConnection(Ht,UN,UP);
	    PreparedStatement p=con.prepareStatement("insert into UserDetails values(?,?,?,?,?)");
	    p.setString(1,Email);
	    p.setString(2,UserN);
	    p.setString(3,PWD);
	    p.setString(4,FName);
	    p.setString(5,LName);
	    int r= p.executeUpdate();
	    if(r>0)
	    {
	    	Properties props = new Properties();    
	    	props.put("mail.smtp.host", "smtp.gmail.com");    
	    	props.put("mail.smtp.socketFactory.port", "465");    
	    	props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
	    	props.put("mail.smtp.auth", "true");    
	    	props.put("mail.smtp.port", "465");   
	    	Session sess = Session.getInstance(props,new javax.mail.Authenticator(){protected PasswordAuthentication getPasswordAuthentication() { return new PasswordAuthentication("JavaMCQTest@gmail.com","ForJMQ2311Zeal");}});        
	    	try {
	    		MimeMessage message = new MimeMessage(sess);    
	            message.addRecipient(Message.RecipientType.TO,new InternetAddress(Email));    
	            message.setSubject("Java MCQ Test Registration Complete - VM");    
	            message.setText("Java MCQ Test Registration Completed\nFirst name: "+FName+"\nLast name: "+LName+"\nUsername: "+UserN+"\nPassword: "+PWD+"\nPlease do not share this email with anyone.");    
	            Transport.send(message);
	    	 	out.println("RAES");
	    	} catch (MessagingException e) {out.println(e);System.out.println(e);}	
	    }
	    
	} 
	catch (Exception e) 
	{
		System.out.print(e);
		out.print("Oops!! Some Error occured please try again.!");
	}
%>
</body>
</html>