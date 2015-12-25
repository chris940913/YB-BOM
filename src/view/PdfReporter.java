/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;


import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PdfReporter {

    Document documento = null;
    FileOutputStream fop = null;
    List<String> list = new ArrayList<String>();
    List<String> headertitel = new ArrayList<String>();
    List<String> litem = new ArrayList<String>();
    List<String> footer = new ArrayList<String>(); 
    
    List<String> custOrder = new ArrayList<String>();
    List<String> custOrderhed = new ArrayList<String>();
    
    List<String> litemname = new ArrayList<String>();
    List<String> productmname = new ArrayList<String>();
    List<String> itemqty = new ArrayList<String>();
    List<String> itemqtyspec = new ArrayList<String>();
     List<String> productqty = new ArrayList<String>();
      List<String> totalqty = new ArrayList<String>();
     
    
    
    List<String> headcolor = new ArrayList<String>();
      List<String> colorname = new ArrayList<String>();
    
    
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";  // MySQL database connection
        String url = "jdbc:mysql://localhost:3306/ybbom";
        String user = "root";
        String pwd = "admin";
       
        int cid = 0;
        String name ="";
        int addcolor1=0;
        int addcolor2=0;
        int addtotal =0;
        int qty =0;
        int prodqty =0;
    
    public void createPDF(File file, String id)  {
         Connection conn=null;
         ResultSet resultSet = null;
         String pcode="";
         
         headertitel.add("Item Name");
         //list1.add("Quantity");
         headertitel.add("No Color");
         headertitel.add("Blue");
         headertitel.add("Oak");
         headertitel.add("TOTAL");
         
         custOrderhed.add("Product Code");
         custOrderhed.add("Color1");
         custOrderhed.add("Color2");
         custOrderhed.add("Color3");
         custOrderhed.add("Qty");
   try{
      conn = DriverManager.getConnection(url,user,pwd); 
String query="select multiple_order.ProdCode,multiple_order.Qty,multiple_order.customerId, product_raw.ItemCode,product_raw.Qty from multiple_order INNER JOIN product_raw ON multiple_order.ProdCode = product_raw.ProdCode Inner join rawmaterial on product_raw.ItemCode = rawmaterial.ItemCode where multiple_order.OrderNo IN ("+id+")";
    
      Statement sqlStmt = conn.createStatement();
      resultSet = sqlStmt.executeQuery(query);
      
      while(resultSet != null && resultSet.next())
                {
                   String tid = resultSet.getString("ItemCode");
                   prodqty =Integer.parseInt(resultSet.getString("Qty"));
                   litem.add(tid);
                   productqty.add(resultSet.getString("Qty"));
                   cid =  resultSet.getInt("customerId");
                   System.out.println("cid    "+cid);
                }
      
    resultSet = sqlStmt.executeQuery("select * from multiple_order where OrderNo='"+id+"'");
      
      while(resultSet != null && resultSet.next())
                {
                    custOrder.add(resultSet.getString("ProdCode"));
                    custOrder.add(resultSet.getString("Color1"));
                    custOrder.add(resultSet.getString("Color2"));
                    custOrder.add(resultSet.getString("Color3"));
                    custOrder.add(resultSet.getString("Qty"));
                }
      
      resultSet = sqlStmt.executeQuery("Select Name from customerinfo where id ='"+cid+"'");
      while(resultSet != null && resultSet.next())
                {
                   name = resultSet.getString("Name");
                }
      
//-------get rawmaterial all data----------------------------------------
            
      
      for (int j = 0; j < litem.size(); j++)
                {
                    System.out.println("*****************"+litem.get(j));
resultSet=sqlStmt.executeQuery("select rawmaterial.ItemCode,rawmaterial.ColorD1,rawmaterial.ColorD2, product_raw.Qty from rawmaterial INNER JOIN product_raw ON rawmaterial.ItemCode = product_raw.ItemCode where rawmaterial.ItemCode IN ('"+litem.get(j)+"')"); 
                    while(resultSet != null && resultSet.next())
                {
                    
                int qty = Integer.parseInt(resultSet.getString("Qty"));
                int color1 = Integer.parseInt(resultSet.getString("ColorD1"));
                int color2 = Integer.parseInt(resultSet.getString("ColorD2"));
                
                System.out.println("-------------"+color1+" "+qty);
                System.out.println("-------------"+color2+" "+qty);
                 
                String col1 = String.valueOf(prodqty*qty);
                String col2 = String.valueOf(prodqty*qty);
                 
                int addcol = Integer.parseInt(col1)+Integer.parseInt(col2);
                 
                String addcolor = String.valueOf(addcol);
                addcolor1+=Integer.parseInt(col1);
                addcolor2+=Integer.parseInt(col2);
                addtotal+= color1+color2;
                
                list.add(resultSet.getString("ItemCode"));
                list.add("");               
                list.add(col1);
                list.add(col2);
                list.add(addcolor);
                litemname.add(resultSet.getString("ItemCode"));
                
                String cl = resultSet.getString("ColorD1");
                String cl2 = resultSet.getString("ColorD2");

                headcolor.add(cl);
                headcolor.add(cl2);
                }
    }
                
                            
          for (int j = 0; j < headcolor.size(); j++)
                {      
                resultSet=sqlStmt.executeQuery("select name from color where colorcode in('"+headcolor.get(j)+"')");
                while(resultSet!=null && resultSet.next())
                {
                    String name = resultSet.getString("name");
                    System.out.println("----------------"+name);
                    colorname.add(name);
               
                }
                }
                
        //-----------------------------------------------------------------
        }catch(Exception e)
        {
            e.printStackTrace();
        }
       
    try {
            documento = new Document();
            file.createNewFile();
            fop = new FileOutputStream(file);
            PdfWriter.getInstance(documento, fop);
            documento.open();
            
//Fonts
            Font fontHeader = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
            Font fontBody = new Font(Font.FontFamily.COURIER, 12, Font.NORMAL);
    
//Product Report ----------------------------------------  
        
           Paragraph ordate = new Paragraph();
           ordate.add(String.valueOf(new Date()));
           ordate.setSpacingAfter(15);
           documento.add(ordate);
           
           Paragraph orheader = new Paragraph();
           orheader.add("ORDER REPORT");
           orheader.setAlignment(Element.ALIGN_CENTER);
           orheader.setSpacingAfter(10);
           documento.add(orheader);
           
           Paragraph orcname = new Paragraph();
           orcname.add("Customer Name :");
           orcname.add(name);
           orcname.setSpacingAfter(8);
           documento.add(orcname);
           
           Paragraph orhardware = new Paragraph();
           orhardware.add("Order No :");
           orhardware.add(id);
           orhardware.setSpacingAfter(8);
           documento.add(orhardware);
           
           Paragraph orunderline = new Paragraph();
           orunderline.add("______________________________________________________________________________");
           orunderline.setSpacingAfter(10);
           documento.add(orunderline);
           
           PdfPTable prodorder = new PdfPTable(custOrderhed.size());
           prodorder.setWidthPercentage(100);
            
            for (int j = 0; j < custOrderhed.size(); j++)
            {
                Phrase frase = new Phrase(custOrderhed.get(j), fontHeader);
                PdfPCell cell = new PdfPCell(frase);
                cell.setBackgroundColor(new BaseColor(Color.lightGray.getRGB()));
                prodorder.addCell(cell);
            }
      documento.add(prodorder);
            
            PdfPTable products= new PdfPTable(5);
            products.setWidthPercentage(100);
             
             for (int i = 0; i < custOrder.size(); i++) 
            {
            products.addCell(new Phrase(custOrder.get(i).toString(), fontBody));
            }
            documento.add(products);
            
           Paragraph orunderline1 = new Paragraph();
           orunderline1.add("______________________________________________________________________________");
           orunderline1.setSpacingBefore(75);
           documento.add(orunderline1);
       
//----------------------Order BY Meterial---------------------------        
            PdfPTable cabetabla = new PdfPTable(headertitel.size());
           cabetabla.setWidthPercentage(100);
            
           Paragraph date = new Paragraph();
           date.add(String.valueOf(new Date()));
           date.setSpacingAfter(15);
           date.setSpacingBefore(10);
           documento.add(date);
           
           
           Paragraph header = new Paragraph();
           header.add("ORDER BY METERIAL REPORT");
           header.setAlignment(Element.ALIGN_CENTER);
           header.setSpacingAfter(10);
           documento.add(header);
           
           Paragraph cname = new Paragraph();
           cname.add("Customer Name :");
           cname.add(name);
           cname.setSpacingAfter(8);
           documento.add(cname);
           
           Paragraph omorderid = new Paragraph();
           omorderid.add("Order No :");
           omorderid.add(id);
           omorderid.setSpacingAfter(8);
           documento.add(omorderid);
           
           Paragraph underline = new Paragraph();
           underline.add("______________________________________________________________________________");
           underline.setSpacingAfter(10);
           documento.add(underline);
           
           
           Paragraph hardware = new Paragraph();
           hardware.add("HARDWARE");
           hardware.setSpacingAfter(15);
           documento.add(hardware);

        PdfPTable headercolor= new PdfPTable(5);
       
//        Paragraph hedcolor1 = new Paragraph();
//        hedcolor1.add("Color1");
//        hedcolor1.setSpacingBefore(10);
//        documento.add(hedcolor1);
//        
//        Paragraph hedcolor2 = new Paragraph();
//        hedcolor2.add("Color2");
//        hedcolor2.add("                                                                                                                            ");
//        hedcolor2.add("Total");
//        documento.add(hedcolor2);
        
        
        
             headercolor.setWidthPercentage(100);
             headercolor.addCell("               Color1");
             headercolor.addCell(colorname.get(0));
             headercolor.addCell(colorname.get(2));
             headercolor.addCell(colorname.get(4));
             headercolor.addCell("         Total");
             headercolor.addCell("               Color2");
             headercolor.addCell(colorname.get(1));
             headercolor.addCell(colorname.get(3));
             headercolor.addCell(colorname.get(5));
             headercolor.addCell(" ");
        
            documento.add(headercolor);
       
           
//         for (int j = 0; j < headertitel.size(); j++)
//            {
//                Phrase frase = new Phrase(headertitel.get(j), fontHeader);
//                PdfPCell cell = new PdfPCell(frase);
//                cell.setBackgroundColor(new BaseColor(Color.lightGray.getRGB()));
//                cabetabla.addCell(cell);
//                
//            }
//      documento.add(cabetabla);
        
//Tabla for body
        PdfPTable pdfTable= new PdfPTable(5);
        pdfTable.setWidthPercentage(100);
        //int all=0;
        for (int i = 0; i < list.size(); i++) 
            {
              
             pdfTable.addCell(new Phrase(list.get(i).toString(), fontBody));
            
             
            }
            documento.add(pdfTable);
        
         footer.add("Total");
         footer.add("");
         footer.add(String.valueOf(addcolor1));
         footer.add(String.valueOf(addcolor2));
         footer.add(String.valueOf(addtotal));
            
         PdfPTable total = new PdfPTable(footer.size());
         total.setWidthPercentage(100);
         for (int j = 0; j < footer.size(); j++)
            {
                Phrase frase = new Phrase(footer.get(j), fontBody);
                PdfPCell cell = new PdfPCell(frase);
                total.addCell(cell);
            }
          documento.add(total);
    } catch (Exception e) {
            // e.printStackTrace();
        } finally {
            try {
                if(documento!=null && fop!=null){
                documento.close();
                fop.flush();
                fop.close();
                }
            } catch (Exception e) 
            {
                
            }
        }
    }
    
    
    //------------------------------------------------------------------------------------------
        public void showCuttingReport(File file, String id,String category)  {
         Connection conn=null;
         ResultSet resultSet = null;
         String pcode="";
         
         headertitel.add("Item Name");
         headertitel.add("No Color");
         headertitel.add("Blue");
         headertitel.add("Oak");
         headertitel.add("TOTAL");
         
         custOrderhed.add("Product Code");
         custOrderhed.add("Color1");
         custOrderhed.add("Color2");
         custOrderhed.add("Color3");
         custOrderhed.add("Qty");
   try{
      conn = DriverManager.getConnection(url,user,pwd); 
String query="select multiple_order.ProdCode,multiple_order.Qty,multiple_order.customerId, product_raw.ItemCode,product_raw.quantity from multiple_order INNER JOIN product_raw ON multiple_order.ProdCode = product_raw.ProdCode Inner join rawmaterial on product_raw.ItemCode = rawmaterial.ItemCode where multiple_order.OrderNo IN ("+id+")";
    
      Statement sqlStmt = conn.createStatement();
      resultSet = sqlStmt.executeQuery(query);
      
      while(resultSet != null && resultSet.next())
                {
                    
                   productmname.add(resultSet.getString("ProdCode"));
                   
                   
                  
                   
                   String tid = resultSet.getString("ItemCode");
                   prodqty =Integer.parseInt(resultSet.getString("Qty"));
                   String itemqty =resultSet.getString("quantity");
                   productqty.add(resultSet.getString("Qty"));
                   
                   int tqty=prodqty*Integer.parseInt(itemqty);
                   String tqty1 = String.valueOf(tqty);
                   totalqty.add(tqty1);
                   
                   
                   
                   litem.add(tid);
                   cid =  resultSet.getInt("customerId");
                   System.out.println("cid    "+cid+"   Pid     "+prodqty+"   "+itemqty);
                }
      
    resultSet = sqlStmt.executeQuery("select * from multiple_order where OrderNo='"+id+"'");
      
      while(resultSet != null && resultSet.next())
                {
                   
                    custOrder.add(resultSet.getString("ProdCode"));
                    custOrder.add(resultSet.getString("Color1"));
                    custOrder.add(resultSet.getString("Color2"));
                    custOrder.add(resultSet.getString("Color3"));
                    custOrder.add(resultSet.getString("Qty"));
                }
      
      resultSet = sqlStmt.executeQuery("Select Name from customerinfo where id ='"+cid+"'");
      while(resultSet != null && resultSet.next())
                {
                   name = resultSet.getString("Name");
                }
      
//-------get rawmaterial all data----------------------------------------
                
       
      
      for (int j = 0; j < litem.size(); j++)
                {
                    System.out.println("*****************"+litem.get(j));
resultSet=sqlStmt.executeQuery("select rawmaterial.ItemCode,rawmaterial.specification ,rawmaterial.ColorD1,rawmaterial.ColorD2, product_raw.quantity, product_raw.ProdCode from rawmaterial INNER JOIN product_raw ON rawmaterial.ItemCode = product_raw.ItemCode where rawmaterial.ItemCode IN ('"+litem.get(j)+"')"); 
                    while(resultSet != null && resultSet.next())
                {
                    
                int qty = Integer.parseInt(resultSet.getString("quantity"));
                int color1 = Integer.parseInt(resultSet.getString("ColorD1"));
                int color2 = Integer.parseInt(resultSet.getString("ColorD2"));
                
                System.out.println("-------------"+color1+" "+qty);
                System.out.println("-------------"+color2+" "+qty);
                 
                String col1 = String.valueOf(prodqty*qty);
                String col2 = String.valueOf(prodqty*qty);
                 
                int addcol = Integer.parseInt(col1)+Integer.parseInt(col2);
                 
                String addcolor = String.valueOf(addcol);
                addcolor1+=Integer.parseInt(col1);
                addcolor2+=Integer.parseInt(col2);
                addtotal+= color1+color2;
                
                list.add(resultSet.getString("ItemCode"));
                litemname.add(resultSet.getString("ItemCode"));
                itemqty.add(resultSet.getString("quantity"));
                itemqtyspec.add(resultSet.getString("specification"));
               
                list.add("");               
                list.add(col1);
                list.add(col2);
                list.add(addcolor);
                
                String cl = resultSet.getString("ColorD1");
                String cl2 = resultSet.getString("ColorD2");

                headcolor.add(cl);
                headcolor.add(cl2);
                }
    }
         
                
          for (int j = 0; j < headcolor.size(); j++)
                {      
                resultSet=sqlStmt.executeQuery("select name from color where colorcode in('"+headcolor.get(j)+"')");
                while(resultSet!=null && resultSet.next())
                {
                    String name = resultSet.getString("name");
                    System.out.println("----------------"+name);
                    colorname.add(name);
                 }
                }
                
         //-----------------------------------------------------------------
        }catch(Exception e)
        {
            e.printStackTrace();
        }
       
    try {
            documento = new Document();
            file.createNewFile();
            fop = new FileOutputStream(file);
            PdfWriter.getInstance(documento, fop);
            documento.open();
            
//Fonts
            Font fontHeader = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
            Font fontBody = new Font(Font.FontFamily.COURIER, 12, Font.NORMAL);
    

           PdfPTable cabetabla = new PdfPTable(headertitel.size());
           cabetabla.setWidthPercentage(100);
            
           Paragraph date = new Paragraph();
           date.add(String.valueOf(new Date()));
           date.setSpacingAfter(15);
           date.setSpacingBefore(10);
           documento.add(date);
           
           
           Paragraph header = new Paragraph();
           header.add("CUTTING REPORT");
           header.setAlignment(Element.ALIGN_CENTER);
           header.setSpacingAfter(10);
           documento.add(header);
           
           Paragraph cname = new Paragraph();
           cname.add("Customer Name :");
           cname.add(name);
           cname.setSpacingAfter(8);
           documento.add(cname);
           
           Paragraph omorderid = new Paragraph();
           omorderid.add("Order No :");
           omorderid.add(id);
           omorderid.setSpacingAfter(8);
           documento.add(omorderid);
           
           Paragraph underline = new Paragraph();
           underline.add("______________________________________________________________________________");
           underline.setSpacingAfter(10);
           documento.add(underline);
           
           
           Paragraph hardware = new Paragraph();
           hardware.add("OTHER");
           hardware.setSpacingAfter(15);
           documento.add(hardware);
           int increment=0;
           int colo1 = 0;
           int colo2 =1;
           
           
           
            for (int i = 0; i < litemname.size(); i++) 
            {
               
            Paragraph itemname = new Paragraph();
            itemname.add(litemname.get(i));
            itemname.setSpacingBefore(15);
            itemname.setSpacingAfter(3);
            documento.add(itemname);
             
            for(int j = 0;j<1;j++)
            {
            Paragraph pname = new Paragraph();
            pname.add(productmname.get(i));
            pname.setSpacingAfter(15);
            documento.add(pname);
            
            
             PdfPTable headercolor= new PdfPTable(4);
             headercolor.setWidthPercentage(100);
            
             System.out.println("incrementc befor-------------"+increment);
             headercolor.addCell("               Quantity");
             headercolor.addCell("               Color1");
             headercolor.addCell(colorname.get(colo1));
             headercolor.addCell("         Total");
             headercolor.addCell("         ");
             headercolor.addCell("          Spec/Color2");
             headercolor.addCell(colorname.get(colo2));
             headercolor.addCell("         ");
             headercolor.addCell(itemqty.get(increment));
             headercolor.addCell(itemqtyspec.get(increment));
             headercolor.addCell(totalqty.get(increment));
             headercolor.addCell(totalqty.get(increment));
             headercolor.addCell("                Total");
             headercolor.addCell("");
             headercolor.addCell(totalqty.get(increment));
             headercolor.addCell(totalqty.get(increment));
             
            documento.add(headercolor);
            increment++;
            colo1++;
            colo1++;
            colo2++;
            colo2++;
                System.out.println("increment after-------------"+increment);
            }
            
            }
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           

        PdfPTable headercolor= new PdfPTable(5);
       
//        Paragraph hedcolor1 = new Paragraph();
//        hedcolor1.add("Color1");
//        hedcolor1.setSpacingBefore(10);
//        documento.add(hedcolor1);
//        
//        Paragraph hedcolor2 = new Paragraph();
//        hedcolor2.add("Color2");
//        hedcolor2.add("                                                                                                                            ");
//        hedcolor2.add("Total");
//        documento.add(hedcolor2);
        
        
        
             headercolor.setWidthPercentage(100);
             headercolor.addCell("               Color1");
             headercolor.addCell(colorname.get(0));
             headercolor.addCell(colorname.get(2));
             headercolor.addCell(colorname.get(4));
             headercolor.addCell("         Total");
             headercolor.addCell("               Color2");
             headercolor.addCell(colorname.get(1));
             headercolor.addCell(colorname.get(3));
             headercolor.addCell(colorname.get(5));
             headercolor.addCell(" ");
        
       //--     documento.add(headercolor);
       
           
//         for (int j = 0; j < headertitel.size(); j++)
//            {
//                Phrase frase = new Phrase(headertitel.get(j), fontHeader);
//                PdfPCell cell = new PdfPCell(frase);
//                cell.setBackgroundColor(new BaseColor(Color.lightGray.getRGB()));
//                cabetabla.addCell(cell);
//                
//            }
//      documento.add(cabetabla);
        
//Tabla for body
        PdfPTable pdfTable= new PdfPTable(5);
        pdfTable.setWidthPercentage(100);
        //int all=0;
        for (int i = 0; i < list.size(); i++) 
            {
              
             pdfTable.addCell(new Phrase(list.get(i).toString(), fontBody));
            
             
            }
   //--         documento.add(pdfTable);
        
         footer.add("Total");
         footer.add("");
         footer.add(String.valueOf(addcolor1));
         footer.add(String.valueOf(addcolor2));
         footer.add(String.valueOf(addtotal));
            
         PdfPTable total = new PdfPTable(footer.size());
         total.setWidthPercentage(100);
         for (int j = 0; j < footer.size(); j++)
            {
                Phrase frase = new Phrase(footer.get(j), fontBody);
                PdfPCell cell = new PdfPCell(frase);
                total.addCell(cell);
            }
   //--       documento.add(total);
    } catch (Exception e) {
            // e.printStackTrace();
        } finally {
            try {
                if(documento!=null && fop!=null){
                documento.close();
                fop.flush();
                fop.close();
                }
            } catch (Exception e) 
            {
                
            }
        }
    }
}