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
String CUserN=(request.getParameter("USName").toString()).trim();
String FromE="";
try 
{
	String Ht="jdbc:sqlserver://localhost\\VAIBHAV:1433;databaseName=JavaMCQ";
    String UN="xxx";
    String UP="xxxxx";
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con= DriverManager.getConnection(Ht,UN,UP);
    PreparedStatement p=con.prepareStatement("select * from UserDetails where UserName=?");
    p.setString(1,CUserN);
    ResultSet rs= p.executeQuery();
    if (rs.next()) 
    {
		FromE=rs.getString("UserEmail");
	}
    else
    {
    	out.println("EmailNotSent");
    }
} 
catch (Exception e) 
{
	out.println("EmailNotSent");
}
Properties props = new Properties();    
props.put("mail.smtp.host", "smtp.gmail.com");    
props.put("mail.smtp.socketFactory.port", "465");    
props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
props.put("mail.smtp.auth", "true");    
props.put("mail.smtp.port", "465");   
Session sess = Session.getInstance(props,new javax.mail.Authenticator(){protected PasswordAuthentication getPasswordAuthentication() { return new PasswordAuthentication("xxxxxxxx@gmail.com","xxxxxx");}});
try {

 MimeMessage message = new MimeMessage(sess);    
 message.addRecipient(Message.RecipientType.TO,new InternetAddress(FromE));    
 message.setSubject("Java MCQ Test - VM");
 BodyPart messageBodyPart1 = new MimeBodyPart();  
 messageBodyPart1.setText("Java Multiple Choice Question Test");  
 MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
 String filename = "Result.pdf";  
 DataSource source = new FileDataSource(filename);  
 messageBodyPart2.setDataHandler(new DataHandler(source));  
 messageBodyPart2.setFileName(filename);
 Multipart multipart = new MimeMultipart();  
 multipart.addBodyPart(messageBodyPart1);  
 multipart.addBodyPart(messageBodyPart2);
 message.setContent(multipart);
 Transport.send(message); 
 out.println("EmailSent");    
} catch (MessagingException e) {out.println("EmailNotSent");System.out.println("EmailNotSent");}
%>


</body>
</html>