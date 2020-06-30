package com.mvc.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mvc.bean.RegisterBean;
import com.mvc.util.DBConnection;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.Statement;
 
public class RegisterDao { 
     public String registerUser(RegisterBean registerBean)
     {
         String fullName = registerBean.getFullName();
         String email = registerBean.getEmail();
         String userName = registerBean.getUserName();
         String password = registerBean.getPassword();
         String cart = "cart" + userName;
         String order = "ord" + userName;
         
         
         
          Connection connection = null;
        try {
Class.forName("com.mysql.jdbc.Driver").newInstance();

        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp", "root", "Optimus@123");
        Statement statement = connection.createStatement();
    String query = "CREATE TABLE "+cart+" (Id INTEGER, Name CHAR(50));";
    statement.executeUpdate(query);

}
        catch (Exception e){
        out.println("An error occurred.");
}
          
         Connection con = null;  
        PreparedStatement preparedStatement = null;         
         try
         {
             con = DBConnection.createConnection();
             String query = "insert into users(fullName,Email,userName,password) values (?,?,?,?)"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
             preparedStatement.setString(1, fullName);
             preparedStatement.setString(2, email);
             preparedStatement.setString(3, userName);
             preparedStatement.setString(4, password);
             
             int i= preparedStatement.executeUpdate();
             
             if (i!=0)  //Just to ensure data has been inserted into the database
             return "SUCCESS"; 
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }       
         return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
     }
}