/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author hi
 */
public class ProductDAO extends DAO<Product> {

  public static void main(String[] args) {
    // Test connection
    ProductDAO pdao = new ProductDAO();
    try {
      for (Product p : pdao.getAll()) {
        System.out.println(p);
      }
    } catch (SQLException ex) {
      Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  // Queries
  private String READ_ID = "SELECT * FROM " + tableName + " WHERE id=?";
  private String READ_ALL = "SELECT * FROM " + tableName;
  private String CREATE = "INSERT INTO " + tableName
    + " (name,price,quantity,image,description,product_category_id) VALUES (?,?,?,?,?,?);";
  private String DELETE = "DELETE FROM " + tableName + " WHERE id=?;";
  private String UPDATE = "UPDATE " + tableName
    + " SET name=?, price=?, quantity=?, image=?, description=?, product_category_id=? WHERE id=?;";

  public ProductDAO() {
    super("product");
  }

  //<editor-fold defaultstate="collapsed" desc="SQL Abstract Methods">
  @Override
  protected Product construct(ResultSet rs) throws SQLException {
    return new Product(rs.getInt(1), rs.getString(4), rs.getString(3), rs.getString(2), rs.getInt(5), rs.getInt(6), rs.getInt(7));
  }

  @Override
  public List<Product> getAll() throws SQLException {
    List<Product> list = new ArrayList<>();
    ps = connection.prepareStatement(READ_ALL);
    rs = ps.executeQuery();
    while (rs.next()) {
      list.add(construct(rs));
    }
    return list;
  }

  @Override
  public Product get(int id) throws SQLException {
    Product p = null;
    ps = connection.prepareStatement(READ_ID);
    ps.setInt(1, id);
    rs = ps.executeQuery();
    if (rs.next()) {
      p = construct(rs);
    }
    return p;
  }

  @Override
  public Product get(Product t) throws SQLException {
    throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
  }

  @Override
  public int insert(Product t) throws SQLException {
//(name,price,quantity,image,description,product_category_id)
    ps = connection.prepareStatement(CREATE);
    ps.setString(1, t.getName());
    ps.setInt(2, t.getPrice());
    ps.setInt(3, t.getQuantity());
    ps.setString(4, t.getImage());
    ps.setString(5, t.getDescription());
    ps.setInt(6, t.getCategory_id());
    int n = ps.executeUpdate();
    return n;
  }

  @Override
  public int delete(int id) throws SQLException {
    ps = connection.prepareStatement(DELETE);
    ps.setInt(1, id);
    int n = ps.executeUpdate();
    return n;
  }

  @Override
  public int delete(Product t) throws SQLException {
    throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
  }

  @Override
  public int update(Product n) throws SQLException {
// name=?, price=?, quantity=?, image=?, description=?, product_category_id=? WHERE id=?;";
    ps = connection.prepareStatement(UPDATE);
    ps.setString(1, n.getName());
    ps.setInt(2, n.getPrice());
    ps.setInt(3, n.getQuantity());
    ps.setString(4, n.getImage());
    ps.setString(5, n.getDescription());
    ps.setInt(6, n.getCategory_id());
    ps.setInt(7, n.getId());
    int modifiedCount = ps.executeUpdate();
    return modifiedCount;
  }

  @Override
  public int update(Product o, Product n) throws SQLException {
    throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
  }
//</editor-fold>
}
