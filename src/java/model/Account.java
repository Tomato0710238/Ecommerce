/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hi
 */
public class Account {
    
  private int id;
  private String name;
  private String pass;
  private int role;

  

  @Override
  public String toString() {
    return "[%d %s %s %d]".formatted(id,name, pass, role);
  }

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

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Account(int id, String name, String pass, int role) {
        this.id = id;
        this.name = name;
        this.pass = pass;
        this.role = role;
    }

  

}
