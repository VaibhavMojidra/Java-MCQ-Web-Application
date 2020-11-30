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
	String OTP=request.getParameter("OOTP").toString();
	try 
	{
		String Ht="jdbc:sqlserver://localhost\\VAIBHAV:1433;databaseName=JavaMCQ";
	    String UN="xxx";
	    String UP="xxxxxx";
	    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    Connection con= DriverManager.getConnection(Ht,UN,UP);
	    PreparedStatement p=con.prepareStatement("select * from UserDetails where UserEmail=?");
	    p.setString(1,Email);
	    ResultSet rs= p.executeQuery();
	    if (rs.next()) 
	    {
	    	out.print("GotEmail");
	    }
	    else
	    {
	    	Properties props = new Properties();    
	    	props.put("mail.smtp.host", "smtp.gmail.com");    
	    	props.put("mail.smtp.socketFactory.port", "465");    
	    	props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
	    	props.put("mail.smtp.auth", "true");    
	    	props.put("mail.smtp.port", "465");   
	    	Session sess = Session.getInstance(props,new javax.mail.Authenticator(){protected PasswordAuthentication getPasswordAuthentication() { return new PasswordAuthentication("xxxxxxxx@gmail.com","xxxxxxx");}});        
	    	try {
	    		MimeMessage message = new MimeMessage(sess);    
	            message.addRecipient(Message.RecipientType.TO,new InternetAddress(Email));    
	            message.setSubject("Java MCQ Test OTP - VM");    
	            message.setText("Your OTP: "+OTP+"\nPlease do not share this OTP with anyone.");    
	            Transport.send(message);
	    	 	out.println("EmailSent");
	    	} catch (MessagingException e) {out.println(e);System.out.println(e);}    		
	    }
	} 
	catch (Exception e) 
	{
		out.print("Oops!! Some Error occured please try again.!");
	}
	
%>
</body>
</html>