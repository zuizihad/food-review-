
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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class search extends HttpServlet {

    Connection conn;
    Statement st;
    ResultSet rs;
    PreparedStatement pst;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedClassVersionError, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
                        
        ConnectionClass obj= new ConnectionClass();
        conn= obj.getConnectiontoSQLite();
        
        PrintWriter out = response.getWriter();
        String value= request.getParameter("search");

        if(value==""){
            response.sendRedirect("index.jsp");
        }else{
            st=conn.createStatement();
            out.print(value);
            String sql= "SELECT * FROM reviewTable where city like '"+value+"' or area like '"+value+"' or restaurantName like '"+value+"'";
            rs=st.executeQuery(sql);
            while(rs.next()){
            String city= rs.getString("city");
            out.println();
            String area= rs.getString("area");
            out.println();
            String resName= rs.getString("restaurantName");
            String comments= rs.getString("comments");
            String rating= rs.getString("rating");
            request.setAttribute("city", city);
            request.setAttribute("area", area);
            request.setAttribute("restaurantName", resName);
            request.setAttribute("comments", comments);
            request.setAttribute("rating", rating);
           RequestDispatcher view = request.getRequestDispatcher("/searchResult.jsp");
            view.forward(request, response);
            }
        }
        conn.close();
        pst.close();
        
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
            Logger.getLogger(search.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(search.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(search.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(search.class.getName()).log(Level.SEVERE, null, ex);
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
