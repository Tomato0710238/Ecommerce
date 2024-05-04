/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author hi
 */
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 2,
  maxFileSize = 1024 * 1024 * 10,
  maxRequestSize = 1024 * 1024 * 50
//   ,location = "/product-images"
)
public class UploadProduct extends HttpServlet {

  private String page = "upload-product.jsp";
  private String location = "/product-images/";

  @Override
  public void init() throws ServletException {
  }

  protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    String name = req.getParameter("name");
    int price = Integer.parseInt(req.getParameter("price"));
    int quantity = Integer.parseInt(req.getParameter("quantity"));
    String description = req.getParameter("description");
    Part part = req.getPart("image");
    String imagePath = saveImage(part, location);
    if (imagePath == null) {
      return;
    }
    Product p = new Product(0, name, imagePath, description, price, quantity, quantity);

    try (PrintWriter out = resp.getWriter()) {
      out.println(imagePath);
//      req.setAttribute("image", partPath);
      req.setAttribute("p", p);
      req.getRequestDispatcher("test-linking-image.jsp").forward(req, resp);
    }

//    ProductDAO pdao = new ProductDAO();
//    try (PrintWriter out = resp.getWriter()) {
//      pdao.insert(new Product(0, name, partPath, description, price, quantity, quantity));
//      out.println("uploaded product");
//    } catch (SQLException ex) {
//      Logger.getLogger(UploadProduct.class.getName()).log(Level.SEVERE, null, ex);
//    }
  }

  // <editor-fold defaultstate="collapsed" desc="Images Processing Methods">
  /**
   *
   * @param part
   * @param location ( "/images/" )
   * @return
   */
  private String saveImage(Part part, String location) {
    try (InputStream input = part.getInputStream()) {
      String partname = new Date().getTime() + getPartName(part);
      String type = part.getHeader("content-type");
      type = type.substring(type.lastIndexOf("/") + 1);

      partname = hash(partname) + "." + type;

      String filePath = getServletContext().getRealPath(location) + partname;
      OutputStream output = new FileOutputStream(filePath);

      byte[] buffer = new byte[1024];
      int bytesRead;
      while ((bytesRead = input.read(buffer)) != -1) {
        output.write(buffer, 0, bytesRead);
      }
      return getServletContext().getContextPath() + location + partname;
    } catch (Exception e) {
      System.err.println(e);
      return null;
    }
  }

  private String getPartName(Part part) {
    String filename = null;
    for (String cd : part.getHeader("content-disposition").split(";")) {
      if (cd.trim().startsWith("filename")) {
        filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
//        filename = filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1);
      }
    }
    return filename;
  }

  public static String hash(String string) throws Exception {
    MessageDigest md = MessageDigest.getInstance("SHA-1");
    ByteArrayInputStream fis = new ByteArrayInputStream(string.getBytes());
    byte[] dataBytes = new byte[1024];
    int nread = 0;
    while ((nread = fis.read(dataBytes)) != -1) {
      md.update(dataBytes, 0, nread);
    };
    byte[] mdbytes = md.digest();
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < mdbytes.length; i++) {
      sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1));
    }
    return sb.toString();
  }// </editor-fold>

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    req.getRequestDispatcher(page).forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    processRequest(req, resp);
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
