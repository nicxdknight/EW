 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<head>
<title>Creating a Table</title>
</head>

<h1>Creating a Table</h1>

  
        
        
<%
Connection connection = null;

try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
String email =  "nick";
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp", "root", "Optimus@123");
Statement statement = connection.createStatement();
String query = "CREATE TABLE "+email+" (Id INTEGER, Name CHAR(50));";
statement.executeUpdate(query);
out.println("Table student create sucessfully.");
}
catch (Exception e)
{
out.println("An error occurred.");
}
%>

 