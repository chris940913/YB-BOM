/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sqlconnection;

import java.sql.*;
import java.sql.SQLException;
import java.util.Scanner;
import sqlconnection.DAO.OrderDAO;
import sqlconnection.beans.Order;
import sqlconnection.util.Input;

/**
 *
 * @author chris940913
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ClassNotFoundException, Exception {

     
     

            Scanner sc = new Scanner(System.in);
            boolean quit = false;

            do {
                System.out.println("***! YB-BOM !***");
                System.out.println("------------------------");
                System.out.println("1. Create Order");
                System.out.println("2. Generate Material Report");
                System.out.println("3. Generate Product by Color Report");
                System.out.println("4. Generate Cutting report");
                System.out.println("5. Quit");

                int choice = sc.nextInt();
                switch (choice) {
                    case 1:
                        
                        Order bean = new Order();
                        bean.setOrderNo(Input.getInput("Order NO:"));
                        bean.setProdCode(Input.getInput("pROD code:"));
                        bean.setQty(Input.getIntegerInput("QTY:"));
                        
                        boolean result= OrderDAO.insert(bean);
                    
                        
                        
                        
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                    case 4:
                        break;
                    case 5:
                        quit = true;
                        break;
                    default:
                        System.out.println("Wrong Input!");
                        break;

                }

            } while (!quit);

    
    }

}
