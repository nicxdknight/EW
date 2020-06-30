
	
package com;
 
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
 
public class DataConnection {
	static final String URL="jdbc:mysql://localhost:3306/";
	static final String DATABASE_NAME="awp";
	static final String USERNAME="root";
	static final String PASSWORD="Optimus@123";
        
        private static ItemDao itemDao;
	
	public static Connection getConnection(){
		Connection con=null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(URL+DATABASE_NAME,USERNAME,PASSWORD);
 
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return con;
	}
        
        public static ItemDao getItemDao() throws ClassNotFoundException, FileNotFoundException {
		if (itemDao == null) {
			itemDao = new ItemDao();
		}
		return itemDao;
	}
}