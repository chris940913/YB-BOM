/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sqlconnection.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import sqlconnection.beans.Order;

/**
 *
 * @author chris940913 Data Access object
 */
public class OrderDAO {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static boolean insert(Order order) throws Exception {

        try {
            //Establish Connection
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DButil.getConnection(DBtype.MSQLS);
          

            String sql = "INSERT into [dbo].[Order](OrderNo,ProdCode,Qty) " + "VALUES(?,?,?)";

            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, order.getOrderNo());
            pstmt.setString(2, order.getProdCode());
            pstmt.setInt(3, order.getQty());
            pstmt.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                }
            }

        }
        return true;

    }

}
