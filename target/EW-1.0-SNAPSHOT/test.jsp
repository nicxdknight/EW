<%-- 
    Document   : test
    Created on : 16-Jun-2020, 12:21:30 pm
    Author     : NIKHIL
--%><%@page import="java.util.Properties"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.MessagingException"%>




<%
 

String to="nickpc007@gmail.com";//change accordingly
//Get the session object
Properties props = new Properties();
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class",
"javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", "465");
Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
protected PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication("nick.kumar0036@gmail.com","Nishant@123");//Put your email id and password here
}
});

//compose message
try {
MimeMessage message = new MimeMessage(session);
message.setFrom(new InternetAddress("nickpc007@gmail.com"));//change accordingly
message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
message.setSubject("Order Confirmation");
message.setText("Your Order from EW Franchise is Success.You Will Recive a mail for tracking id soon.");
//send message
Transport.send(message);
System.out.println("message sent successfully");
} catch (MessagingException e) {throw new RuntimeException(e);}

  %>
