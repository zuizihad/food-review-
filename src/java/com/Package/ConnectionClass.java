package com.Package;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionClass {
    
    public Connection getConnectiontoSQLite() throws UnsupportedClassVersionError, SQLException{
       Connection conn=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
             
            Class.forName("org.sqlite.JDBC");
            String ConnectionURL = "jdbc:sqlite:" + getPath() + "/com/Package/" + "foodReviewDatabase.sqlite";
            conn = DriverManager.getConnection(ConnectionURL);
                return conn;
        }
        catch(ClassNotFoundException e){
            return null;
        }
        
        
        
        
    }
    public String getPath() {
        
        String path=this.getClass().getClassLoader().getResource("").getPath();
        return path;
    }
}

