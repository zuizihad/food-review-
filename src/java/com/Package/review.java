package com.Package;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class review extends HttpServlet {
    Connection conn;
    Statement st;
    ResultSet rs;
    PreparedStatement pst;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, UnsupportedClassVersionError, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        ConnectionClass obj1= new ConnectionClass();
        conn= obj1.getConnectiontoSQLite();
                
        String city= request.getParameter("city");
        String area= request.getParameter("area");
        String restaurantName= request.getParameter("restaurantName");
        String comments= request.getParameter("comments");
        String rating = request.getParameter("rating");
        if(city==""|| area=="" || restaurantName=="" || comments=="" || rating ==""){
            response.sendRedirect("post.jsp");
        }else{
            
            String sql= "INSERT INTO reviewTable (city, area, restaurantName, comments, rating) VALUES(?,?,?,?,?);";
               
            pst = conn.prepareStatement(sql);
             
                pst.setString(1, city);
                pst.setString(2, area); 
                pst.setString(3, restaurantName);
                pst.setString(4, comments);
                pst.setString(5, rating);
                pst.execute();
                response.sendRedirect("post.jsp"); 
            }
                 conn.close(); 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (UnsupportedClassVersionError ex) {
            Logger.getLogger(review.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(review.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (UnsupportedClassVersionError ex) {
            Logger.getLogger(review.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(review.class.getName()).log(Level.SEVERE, null, ex);
        }
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
