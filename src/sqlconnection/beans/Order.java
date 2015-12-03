/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sqlconnection.beans;

/**
 *
 * @author chris940913
 */
public class Order {
    
    private String OrderNo;
    private String ProdCode;
    private int Qty;

    public String getOrderNo() {
        return OrderNo;
    }

    public void setOrderNo(String OrderNo) {
        this.OrderNo = OrderNo;
    }

    public String getProdCode() {
        return ProdCode;
    }

    public void setProdCode(String ProdCode) {
        this.ProdCode = ProdCode;
    }

    public int getQty() {
        return Qty;
    }

    public void setQty(int Qty) {
        this.Qty = Qty;
    }
    
    
    
}
