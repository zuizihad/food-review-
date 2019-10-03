<%-- 
    Document   : searchResult
    Created on : Jul 20, 2018, 7:33:54 PM
    Author     : ahmedxihad
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Package.ConnectionClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
        <link rel="stylesheet" hreflang="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js">
       
    </head>
    <body class="">
       <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">search</h4>
                  <p class="card-category"> search result </p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>
                          City
                        </th>
                        <th>
                          Area
                        </th>
                        <th>
                          Restaurant Name
                        </th>
                       
                        <th>
                          Rating
                        </th>
                      </thead>
                      <tbody>
                        <p class="card-text">
        
                                    
            <%
            Connection conn;
            Statement st;
            ResultSet rs;
            ConnectionClass obj1= new ConnectionClass();
            conn= obj1.getConnectiontoSQLite();
            %>
                            
        <%
            try{
                
            
        response.setContentType("text/html;charset=UTF-8");
        
                      
        ConnectionClass obj= new ConnectionClass();
         conn= obj.getConnectiontoSQLite();
        
         
        String value= request.getParameter("search");

        if(value==""){
            response.sendRedirect("index.jsp");
        }else if(value!=""){
            st=conn.createStatement();
           
            String sql= "SELECT * FROM reviewTable where city like '"+value+"' or area like '"+value+"' or restaurantName like '"+value+"'";
        st=conn.createStatement();
        rs=st.executeQuery(sql);
        while(rs.next()){
            
         
        %>
        <tr style="font-family: inherit ; color: #468847" >
            <td><%=rs.getString("city") %> <br /></td>
            <td><%=rs.getString("area") %><br /> </td>
            <td><%=rs.getString("restaurantName") %> <br /></td>
       
            <td><%=rs.getString("rating") %> <br /></td>
        </tr>
        <%
            }}else{
                response.sendRedirect("index.jsp");
}
            }catch(Exception e){
            out.print(e);
            }
            conn.close();
            
        %>
    </p>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </body>
    
    
    
</html>
