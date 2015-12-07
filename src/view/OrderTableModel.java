/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.util.List;
import javax.swing.table.AbstractTableModel;
import sqlconnection.beans.Order;

/**
 *
 * @author chris940913
 */
public class OrderTableModel extends AbstractTableModel{
    
    private static final int ORDER_NO_COL=0;
    private static final int PROD_CODE_COL=1;
    private static final int QTY_COL=2;
    
    private String[]columnNames={"Order No","Prod Code","Quantity"};
    
    private List<Order>orders;
    
    public OrderTableModel(List<Order> od)
    {
        orders= od;
    }
    

    @Override
    public int getRowCount() {
        return orders.size();
    }

    @Override
    public int getColumnCount() {
        return columnNames.length;
    }
    
    @Override
	public String getColumnName(int col) {
		return columnNames[col];
	}

    @Override
    public Object getValueAt(int row, int col) {
        
        Order tempOrder= orders.get(row);
        
        switch(col){
            case ORDER_NO_COL:
                return tempOrder.getOrderNo();
            case PROD_CODE_COL:
                return tempOrder.getProdCode();
            case QTY_COL:
                return tempOrder.getQty();
            default:
                return tempOrder.getOrderNo();
        }
    }
    @Override
	public Class getColumnClass(int c) {
		return getValueAt(0, c).getClass();
	}
    
}
