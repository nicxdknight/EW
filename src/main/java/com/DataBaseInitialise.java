/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author harsh
 */
public class DataBaseInitialise {
    private List<Items> getItemsList(){
        List<Items> electronicItems = new ArrayList<>();
        electronicItems.add(new Items(1, "Samsung Galaxy Tab A", "SmartPhone with 8 GB RAM, Front(8 MP)/ Rear(13 MP), 64 GB internal storage tab, Android 8", ItemCategory.MOBILE, 21500,"img/mob.jpg"));
		electronicItems.add(new Items(2, "Mivi", "wired speakers", ItemCategory.SPEAKERS, 3500,"img/speaker.png"));	
                electronicItems.add(new Items(3, "iBall", "Waterproof wireless speaker with portable bluetooth", ItemCategory.SPEAKERS, 999,"img/speaker.png"));	
                electronicItems.add(new Items(4, "Redmi Note 9 Pro", "8 GB RAM, Front(8 MP)/ Rear(13 MP), 64 GB internal storage, Android 9.0", ItemCategory.MOBILE, 22540,"img/mob.jpg"));
		electronicItems.add(new Items(5, "Samsung S8", "16 GB RAM, Front(8 MP)/ Rear(13 MP), 64 GB internal storage, Android 7.0, Face configuration", ItemCategory.MOBILE, 16880,"img/mob.jpg"));
		electronicItems.add(new Items(6, "Samsung J7", "8 GB RAM, Front(8 MP)/ Rear(13 MP), 32 GB internal storage, Android 8.0, Finger print Lock", ItemCategory.MOBILE,21900,"img/mob.jpg"));
		electronicItems.add(new Items(7, "Dell", "15.6 inch, 4GB RAM, 500 GB HHD  256 SSD. WIndows 10, i3 8th Generation", ItemCategory.LAPTOP, 35550,"img/laptop.jpg"));	
                electronicItems.add(new Items(8, "MacBook Pro", "13 inch, 8GB RAM, 1 TB HHD, i5 10th Genration ", ItemCategory.LAPTOP, 119700,"img/laptop.jpg"));	
                electronicItems.add(new Items(9, "Samsung A50", "8 GB RAM, Front(8 MP)/ Rear(13 MP), 64 GB internal storage, Android 9.0", ItemCategory.MOBILE, 30120,"img/mob.jpg"));
		electronicItems.add(new Items(10, "Vivo S1 Pro", "16 GB RAM, Front(8 MP)/ Rear(13 MP), 32 GB internal storage, Android 8.0", ItemCategory.MOBILE, 20800,"img/mob.jpg"));
		electronicItems.add(new Items(11, "Vivo V9", "4 GB RAM, Front(18 MP)/ Rear(32 MP), 64 GB internal storage, Android 9.0, ", ItemCategory.MOBILE, 25000,"img/mob.jpg"));
		electronicItems.add(new Items(12, "Vivo V11", "8 GB RAM, Front(16 MP)/ Rear(32 MP), 32 GB internal storage, Android 9.0", ItemCategory.MOBILE, 23590,"img/mob.jpg"));
		electronicItems.add(new Items(13, "BOAT", "protable bluetooth speakers / black", ItemCategory.SPEAKERS, 5555,"img/speaker.png"));
                electronicItems.add(new Items(14, "JBL", "portable wireless with mic and rich bass", ItemCategory.SPEAKERS, 2000,"img/speaker.png"));	
                electronicItems.add(new Items(15, "Redmi Note 8 Pro", "8 GB RAM, Front(13 MP)/ Rear(13 MP), 32 GB internal storage, Android 7", ItemCategory.MOBILE, 19870,"img/mob.jpg"));
		electronicItems.add(new Items(16, "Redmi Note 4", "4 GB RAM, Front(8 MP)/ Rear(13 MP), 32 GB internal storage, Android 8 ", ItemCategory.MOBILE, 15500,"img/mob.jpg"));
                electronicItems.add(new Items(17, "Sony", "Wireless and waterproof speaker with extra bass", ItemCategory.SPEAKERS, 2999,"img/speaker.png"));	
                electronicItems.add(new Items(18, "HP", "15.6 inch, 4GB RAM, 1 TB HHD + 256 SSD, Windows 10, i3 8th Generation", ItemCategory.LAPTOP, 45700,"img/laptop.jpg"));	
                electronicItems.add(new Items(19, "Lenovo", "15 inch, 4GB RAM, 1 TB HHD. Windows 10, i5 8th generation", ItemCategory.LAPTOP, 36000,"img/laptop.jpg"));	
                electronicItems.add(new Items(20, "BOSS", "wireless speaker with HD sound", ItemCategory.SPEAKERS, 2999,"img/speaker.png"));	
                electronicItems.add(new Items(21, "Mivi", "Bluetooth wireless speaker, with inbuilt FM radio", ItemCategory.SPEAKERS, 1299,"img/speaker.png"));	
                electronicItems.add(new Items(22, "Asus", "15.6 inch, 4GB RAM, 1 TB HHD, Windows 10, i5 10th Generation ", ItemCategory.LAPTOP, 56700,"img/laptop.jpg"));	
		
        return electronicItems;
    }
    public void initializeDatabase() throws ClassNotFoundException, FileNotFoundException {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
			
				try (PreparedStatement prepStm = conn.prepareStatement("DROP TABLE IF EXISTS items;")) {
					prepStm.execute();
				}
				
				try (PreparedStatement prepStm = conn.prepareStatement("DROP TABLE IF EXISTS orders;")) {
					prepStm.execute();
				}
                                
                                try (PreparedStatement prepStm = conn.prepareStatement("DROP TABLE IF EXISTS cart;")) {
					prepStm.execute();
				}
				
				try (PreparedStatement prepStm = conn.prepareStatement("CREATE TABLE items (id int primary key, name varchar(30), description varchar(150), category varchar(30), price float , image varchar(150));")) {
					prepStm.execute();
				}
				
				List<Items> itemsList = getItemsList();
				for (Items items : itemsList) {
					try (PreparedStatement prepStm = conn.prepareStatement("INSERT INTO items (id, name, description, category, price , image) values (?,?,?,?,?,?);");) {
						prepStm.setInt(1, items.getId());
						prepStm.setString(2, items.getName());
						prepStm.setString(3, items.getDescription());
						prepStm.setString(4, items.getCategory().toString());
						prepStm.setDouble(5, items.getPrice());
                                                prepStm.setString(6, items.getImage());
						prepStm.execute();
					}
				}	
				
				try (PreparedStatement prepStm = conn.prepareStatement("CREATE TABLE orders (id int auto_increment primary key, customer varchar(30), contents varchar(255), status varchar(20));")) {
					prepStm.execute();
				}
                                
                                try (PreparedStatement prepStm = conn.prepareStatement("CREATE TABLE cart (id int auto_increment primary key, customer varchar(30), contents varchar(255), status varchar(20));")) {
					prepStm.execute();
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
