
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String email=request.getParameter("email");
String currentPassword=request.getParameter("current");
String Newpass=request.getParameter("new");
String conpass=request.getParameter("confirm");
String connurl = "jdbc:mysql://localhost:3306/awp";
Connection con=null;
String pass="";
String emails = "";
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connurl, "root", "Optimus@123");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from login where password='"+currentPassword+"'");
while(rs.next()){
emails=rs.getString(1);
pass=rs.getString(2);
} 
if(pass.equals(currentPassword)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update login set password='"+Newpass+"' where email='"+emails+"'");
out.println("Password changed successfully");
st1.close();
con.close();
}
else{
out.println("Invalid Current Password");
}
}
catch(Exception e){
out.println(e);
}
%> 