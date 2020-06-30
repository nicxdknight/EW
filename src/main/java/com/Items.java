/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

/**
 *
 * @author harsh
 */
public class Items {
	private int id;
	private String name;
	private String description;
	private ItemCategory category;
	private double price;
	private String image;
        
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public ItemCategory getCategory() {
		return category;
	}
	public void setCategory(ItemCategory category) {
		this.category = category;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
        
        public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public Items(int id, String name, String description, ItemCategory category, double price,String image) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.category = category;
		this.price = price;
                this.image = image;
	}
	
	public Items() {}
	
	public String toString() {
		return (this.category + "\t\t " + this.name + " \nPrice: " + this.price + "");
	}
	
	
}
