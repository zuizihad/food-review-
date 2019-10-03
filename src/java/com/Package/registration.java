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
public class registration extends HttpServlet {
    Connection conn;
    Statement st;
    ResultSet rs;
    PreparedStatement pst;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException {
    response.setContentType("text/html;charset=UTF-8");
               
                ConnectionClass obj= new ConnectionClass();
                conn= obj.getConnectiontoSQLite();
        
            String name=request.getParameter("name");
            String password= request.getParameter("password");
            String email= request.getParameter("email");
            String address= request.getParameter("address");
            String phoneno= request.getParameter("phoneno");
       
            if(name=="" || password=="" || email==""|| address=="" || phoneno==""){
                response.sendRedirect("accountCreate.jsp");
            }else{
               
                String sql= "INSERT INTO registration (name, email, phoneno, address, password) VALUES(?,?,?,?,?);";
                
                pst = conn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, phoneno);
                pst.setString(4, address);
                pst.setString(5, password);
                pst.execute();
                response.sendRedirect("loginPage.jsp");     
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
        } catch (SQLException ex) {
            Logger.getLogger(registration.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(registration.class.getName()).log(Level.SEVERE, null, ex);
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
