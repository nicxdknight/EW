/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author harsh
 */
public class ItemDao {

	public ItemDao() throws ClassNotFoundException, FileNotFoundException {
		DataBaseInitialise initialise = new DataBaseInitialise();
		initialise.initializeDatabase();
	}

	private List<Items> buildItems(ResultSet results) throws SQLException {
		List<Items> items = new ArrayList<>();
		while (results.next()) {
			Items item = new Items();
			item.setId(results.getInt("id"));
                       // System.out.println(results.getInt("id"));
			item.setDescription(results.getString("description"));
			item.setName(results.getString("name"));
			item.setPrice(results.getDouble("price"));
			item.setCategory(ItemCategory.valueOf(results.getString("category")));
                        item.setImage(results.getString("image"));
			items.add(item);
		}
		return items;
	}
        
        private List<Items> buildCart(ResultSet results) throws SQLException {
		List<Items> items = new ArrayList<>();
		while (results.next()) {
			
                        Map<Items,Integer> orderMap = convertContentsToOrderMap(results.getString("contents"));
			for (Items item : orderMap.keySet()) {
				//d += item.getPrice() * orderMap.get(item);
			
                            Items newitem = new Items();
                            newitem.setId(item.getId());
                            newitem.setDescription(item.getDescription());
                            newitem.setName(item.getName());
                            newitem.setPrice(item.getPrice());
                            //newitem.setCategory(ItemCategory.valueOf(results.getString("category")));
                            newitem.setCategory(item.getCategory());
                            newitem.setImage(item.getImage());
                            items.add(newitem);
                        }
		}
		return items;
	}
        
        
        
        public List<Items>  getCartItems() {
		List<Items> items = null;
		
		
		try (	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
				Statement stm = conn.createStatement();
				ResultSet results = stm.executeQuery("SELECT * FROM cart");
				) {	
			items = buildCart(results);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return items;
	}
        
        public List<Items>  getOrderItems() {
		List<Items> items = null;
		
		
		try (	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
				Statement stm = conn.createStatement();
				ResultSet results = stm.executeQuery("SELECT * FROM orders");
				) {	
			items = buildCart(results);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return items;
	}
        
        
        

	public List<Items>  getFullItems() {
		List<Items> items = null;
		
		
		try (	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
				Statement stm = conn.createStatement();
				ResultSet results = stm.executeQuery("SELECT * FROM items");
				) {	
			items = buildItems(results);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return items;
	}
	

	public List<Items> find(String searchString) {
		List<Items> items = null;
		try (	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
				PreparedStatement stm = conn.prepareStatement("SELECT * FROM items WHERE name LIKE ? OR description LIKE ? OR category LIKE ?");
				) {	

			stm.setString(1, "%" + searchString + "%");
			stm.setString(2, "%" + searchString + "%");
                        stm.setString(3, "%" + searchString + "%");
                        

			ResultSet results = stm.executeQuery();
			items = buildItems(results);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return items;
	}
        
       public void makeCartEmpty(String name) throws ClassNotFoundException, SQLException{
           Class.forName("com.mysql.jdbc.Driver");
	   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
           try(PreparedStatement stm = conn.prepareStatement("DELETE FROM cart WHERE customer = ?");
                   ){
               stm.setString(1,name);
               stm.execute();
           }
       }

	public Items getItem(int id) {
		List<Items> items = null;
		try (	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
				PreparedStatement stm = conn.prepareStatement("SELECT * FROM items WHERE id = ?");
				) {	

			stm.setInt(1, id);

			ResultSet results = stm.executeQuery();
			items = buildItems(results);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return items.get(0);
                //return items.get(1);
        }
        
        public Order checkifexist(String email){
            Order order = new Order();
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
		Statement stm = conn.createStatement();
		ResultSet res = stm.executeQuery("SELECT * FROM cart WHERE CUSTOMER = '"+ email + "'");
		){
                   if(res.absolute(1)){
                       order.setCustomer(email);
                       order.setStatus(res.getString("status"));
                       order.setId(res.getLong("id"));
                       return order;
                   }else{
                       return null;
                   }
                   
            }catch(SQLException e){
                throw new RuntimeException(e);
            }
            
        }
        
        public Order newtoCart(String customer) {
		Order order = new Order(); 
		order.setStatus("pending");
		order.setCustomer(customer);
		try (	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
				PreparedStatement stm = conn.prepareStatement("INSERT INTO cart (status, customer) values (?,?)", Statement.RETURN_GENERATED_KEYS);
				) {	
			stm.setString(1, order.getStatus());
			stm.setString(2,  order.getCustomer());
			stm.execute();
			
			try(ResultSet generatedKeys = stm.getGeneratedKeys()) {
				generatedKeys.next();
		        order.setId(generatedKeys.getLong(1));		        
		    }
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return order;
	}
        
        
        public Order cartToOrder(){
            Order order = new Order();
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
			PreparedStatement stm = conn.prepareStatement("INSERT INTO orders (customer,contents,status) SELECT customer,contents,status FROM cart ;", Statement.RETURN_GENERATED_KEYS);
			) {	
		stm.execute();
			
		try(ResultSet generatedKeys = stm.getGeneratedKeys()) {
			generatedKeys.next();
		        order.setId(generatedKeys.getLong(1));	
                }
            } catch (SQLException e) {
			throw new RuntimeException(e);
            }
            return order;
        }


	public Order newOrder(String customer) {
		Order order = new Order(); 
		order.setStatus("pending");
		order.setCustomer(customer);
		try (	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
				PreparedStatement stm = conn.prepareStatement("INSERT INTO orders (status, customer) values (?,?)", Statement.RETURN_GENERATED_KEYS);
				) {	
			stm.setString(1, order.getStatus());
			stm.setString(2,  order.getCustomer());
			stm.execute();
			
			try(ResultSet generatedKeys = stm.getGeneratedKeys()) {
				generatedKeys.next();
		        order.setId(generatedKeys.getLong(1));		        
		    }
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return order;
	}
        
        private Map<Items,Integer> updateOrderMap(String contents,int id){
            Map<Items,Integer> orderMap = new HashMap<Items,Integer>();
		if (contents == null || contents.equals("")) {
			return orderMap;
		}
			String[] items = contents.split(":");
      
			for (int i = 0; i < items.length; i++) {
                                
				String key = items[i].split(",")[0];
				String value = items[i].split(",")[1];
				
                                if(Integer.valueOf(key) != id){
                                    Items item = getItem(Integer.valueOf(key));
                                    System.out.print("item id ");
                                    System.out.println(item.getId());
                                    orderMap.put(item, Integer.valueOf(value));
                                }
			}
		return orderMap;
        }

	private Map<Items,Integer> convertContentsToOrderMap(String contents) {
		Map<Items,Integer> orderMap = new HashMap<Items,Integer>();
		if (contents == null || contents.equals("")) {
			return orderMap;
		}
			String[] items = contents.split(":");
			for (int i = 0; i < items.length; i++) {
				String key = items[i].split(",")[0];
				String value = items[i].split(",")[1];
				Items item = getItem(Integer.valueOf(key));
				orderMap.put(item, Integer.valueOf(value));
			}
		return orderMap;
	}

	private String convertOrderMapToContents(Map<Items,Integer> orderMap) {
		String contents = "";
		if (orderMap.keySet().size() == 0) {
			return contents;
		}
		for (Items item : orderMap.keySet() ) {
			contents = contents + item.getId() + "," + orderMap.get(item) + ":";
		}
		contents = contents.substring(0, contents.length()-1);
		return contents;
	}
        
        public void removeFromCart(int id ,Items item,String email) {
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
		Statement stm = conn.createStatement();
		ResultSet res = stm.executeQuery("SELECT * FROM cart WHERE CUSTOMER = '"+ email + "'");
		PreparedStatement stmUpdate = conn.prepareStatement("UPDATE cart SET contents = ? WHERE customer = ?");
				){
                res.next();
                String contents = res.getString("contents");
		Map<Items, Integer> orderMap = updateOrderMap(contents,id);
//                System.out.println(item.getName());
//		//int q = orderMap.remove(item);
//                //System.out.println(q);
//                System.out.println(orderMap);
//             
                contents = convertOrderMapToContents(orderMap);
		stmUpdate.setString(1, contents);
		stmUpdate.setString(2, email);
		stmUpdate.execute();
            }catch (SQLException e) {
			throw new RuntimeException(e);
            }
            
        }
        
        
        public void addToCart(Long id, Items item, int quantity) {
		try (	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
				Statement stm = conn.createStatement();
				ResultSet res = stm.executeQuery("SELECT * FROM cart WHERE ID = " + id);
				PreparedStatement stmUpdate = conn.prepareStatement("UPDATE cart SET contents = ? WHERE id = ?");
				) {	
			res.next();
                        System.out.println("Start--");
                        System.out.print("Passed id - ");
                        System.out.println(id);
                        System.out.print("id fetched from table- ");
                        System.out.println(res.getLong("id"));
                        System.out.println("End----");
			String contents = res.getString("contents");
			Map<Items, Integer> orderMap = convertContentsToOrderMap(contents);
			if (orderMap.get(item) != null) {
				orderMap.put(item, orderMap.get(item) + quantity);
			}
			else {
				orderMap.put(item, quantity);
			}
			contents = convertOrderMapToContents(orderMap);
			stmUpdate.setString(1, contents);
			stmUpdate.setLong(2, id);
			stmUpdate.execute();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void addToOrder(Long id, Items item, int quantity) {
		try (	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
				Statement stm = conn.createStatement();
				ResultSet res = stm.executeQuery("SELECT * FROM orders WHERE ID = " + id);
				PreparedStatement stmUpdate = conn.prepareStatement("UPDATE orders SET contents = ? WHERE id = ?");
				) {	
			res.next();
			String contents = res.getString("contents");
			Map<Items, Integer> orderMap = convertContentsToOrderMap(contents);
			if (orderMap.get(item) != null) {
				orderMap.put(item, orderMap.get(item) + quantity);
			}
			else {
				orderMap.put(item, quantity);
			}
			contents = convertOrderMapToContents(orderMap);
			stmUpdate.setString(1, contents);
			stmUpdate.setLong(2, id);
			stmUpdate.execute();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
        
        public int getQuantity(int id){
            int q = 0;
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
			Statement stm = conn.createStatement();
			ResultSet res = stm.executeQuery("SELECT * FROM cart WHERE id = " + id);
			) {
		res.next();
		Map<Items,Integer> orderMap = convertContentsToOrderMap(res.getString("contents"));
		Items item = getItem(Integer.valueOf(id));
                q = orderMap.get(item);
            } catch (SQLException e) {
			throw new RuntimeException(e);
            }
            return q;
        }
        
//        public int getOneTotal(Long id){
//            int q = 0;
//            double d = 0d;
//            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
//			Statement stm = conn.createStatement();
//			ResultSet res = stm.executeQuery("SELECT * FROM cart WHERE id = " + id);
//			) {
//		res.next();
//		Map<Items,Integer> orderMap = convertContentsToOrderMap(res.getString("contents"));
//		Items item = getItem(Integer.valueOf((id));
//                q = orderMap.get(item);	
//                d = item.getPrice() * orderMap.get(item);
//            } catch (SQLException e) {
//			throw new RuntimeException(e);
//            }
//            return q;
//        }
        
        public Double getCartTotal(Long id) {
		double d = 0d;
		try (	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
				Statement stm = conn.createStatement();
				ResultSet res = stm.executeQuery("SELECT * FROM cart WHERE id = " + id);
				) {
			res.next();
			Map<Items,Integer> orderMap = convertContentsToOrderMap(res.getString("contents"));
			for (Items item : orderMap.keySet()) {
				d += item.getPrice() * orderMap.get(item);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return d;
	}

	public Double getOrderTotal(Long id) {
		double d = 0d;
		try (	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/awp","root","Optimus@123");
				Statement stm = conn.createStatement();
				ResultSet res = stm.executeQuery("SELECT * FROM orders WHERE id = " + id);
				) {
			res.next();
			Map<Items,Integer> orderMap = convertContentsToOrderMap(res.getString("contents"));
			for (Items item : orderMap.keySet()) {
				d += item.getPrice() * orderMap.get(item);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return d;
	}
}
