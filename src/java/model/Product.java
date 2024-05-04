/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hi
 */
public class Product {

  private final int id;
  private String name;
  private String image;
  private String description;
  private int price;
  private int quantity;
  private int category_id;

  public Product(int id, String name, String image, String description, int price, int quantity, int category_id) {
    this.id = id;
    this.name = name;
    this.image = image;
    this.description = description;
    this.price = price;
    this.quantity = quantity;
    this.category_id = category_id;
  }

  @Override
  public String toString() {
    return "[%d %s %s '%s' %d %d %d]".formatted(id, name, image, description, price, quantity, category_id);
  }

  //<editor-fold defaultstate="collapsed" desc="Getters & Setters">
  public int getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public String getImage() {
    return image;
  }

  public String getDescription() {
    return description;
  }

  public int getPrice() {
    return price;
  }

  public int getQuantity() {
    return quantity;
  }

  public int getCategory_id() {
    return category_id;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setImage(String image) {
    this.image = image;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public void setCategory_id(int category_id) {
    this.category_id = category_id;
  }//</editor-fold>

}
