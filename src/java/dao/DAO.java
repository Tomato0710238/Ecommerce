/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * <ul><li><code><b>CREATE</b> = "INSERT INTO " + table + " (...) VALUES
 * (?,?,?);";</code></li>
 * <li><code><b>READ</b> = "SELECT * FROM " + table + " WHERE
 * ...=?";</code></li>
 * <li><code><b>UPDATE</b> = "UPDATE " + table + " SET ...=?, ...=? WHERE
 * ...=?;";</code></li>
 * <li><code><b>DELETE</b> = "DELETE FROM " + table + " WHERE
 * ...=?;";</code></li></ul>
 *
 * @author hi
 */
public abstract class DAO<T> extends DBContext {

  protected final String tableName;
//  private String CREATE = "INSERT INTO " + table + " (...) VALUES (?,?,?);";
//  private String READ = "SELECT * FROM " + table + " WHERE ...=?";
//  private String UPDATE = "UPDATE " + table + " SET ...=?, ...=? WHERE ...=?;";
//  private String DELETE = "DELETE FROM " + table + " WHERE ...=?;";

  protected Connection connection;
  protected PreparedStatement ps;
  protected ResultSet rs;

  public DAO(String tableName) {
    this.tableName = tableName;
    try {
      connection = getConnection();
    } catch (Exception ex) {
      throw new IllegalStateException("Can't get connection to dataase.");
    }
  }

  //<editor-fold defaultstate="collapsed" desc="SQL Abstract Methods">
  protected abstract T construct(ResultSet rs) throws SQLException;

  public abstract List<T> getAll() throws SQLException;

  public abstract T get(int id) throws SQLException;

  public abstract T get(T t) throws SQLException;

  public abstract int insert(T t) throws SQLException;

  public abstract int delete(int id) throws SQLException;

  public abstract int delete(T t) throws SQLException;

  public abstract int update(T n) throws SQLException;

  public abstract int update(T o, T n) throws SQLException;
  //</editor-fold>

}
