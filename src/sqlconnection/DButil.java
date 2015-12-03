/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sqlconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author chris940913
 */
class DButil {
private static final String connectionURL1="jdbc:sqlserver://localhost:1433;databaseName=BOMDB;user=TestingUser;password=12345";

   
        public static Connection getConnection(DBtype dbtype) throws SQLException{
            
            switch(dbtype)
            {
                case MSQLS:
                    return DriverManager.getConnection(connectionURL1);
                default:
                    return null;
            }
            
            
            
        }
        
        
          public static void processException(SQLException e){
              System.err.println("Error msg :"+e.getMessage());
              System.err.println("Error code :"+e.getErrorCode());
              System.err.println("SQL state :"+e.getSQLState());
          }

        
        
        }   
        