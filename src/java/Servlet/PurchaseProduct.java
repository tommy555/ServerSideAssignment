/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entity.Orderdetails;
import Entity.OrderdetailsPK;
import Entity.Orders;
import Entity.Products;
import Session.classicmodelsPool;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author TOMMY
 */
@WebServlet(name = "PurchaseProduct", urlPatterns = {"/PurchaseProduct"})
public class PurchaseProduct extends HttpServlet {

    @EJB
    private classicmodelsPool classicmodelsPool;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String pCode = request.getParameter("pCode");
        String customerName = request.getParameter("customerName");
        JSONObject jobj = new JSONObject();
        
        if(pCode.equalsIgnoreCase("") || pCode == null) {
            jobj.put("success", false);
        }
        
        Products product = classicmodelsPool.findProductByCode(pCode);
        
        Date date = new Date();
        
        Orderdetails orderdetails = new Orderdetails();
        OrderdetailsPK odPK = new OrderdetailsPK();
        Orders order = new Orders();
        
        int ordernum = classicmodelsPool.getOrdersNumber();
        System.out.println("new order num"+ordernum);
        order.setOrderNumber(ordernum);
        order.setOrderDate(date);
        order.setRequiredDate(date);
        order.setStatus("pending");
        order.setComments("");
        order.setCustomerNumber(classicmodelsPool.findCustomerByCustomerName(customerName));
        
        
        odPK.setOrderNumber(order.getOrderNumber());
        odPK.setProductCode(pCode);
        orderdetails.setQuantityOrdered(1);
        orderdetails.setPriceEach(product.getBuyPrice());
        orderdetails.setOrderLineNumber(Short.valueOf("1"));      
        orderdetails.setOrderdetailsPK(odPK);
        
        classicmodelsPool.insertOrder(order);
        classicmodelsPool.insertOrderdetails(orderdetails);
        
        jobj.put("success", true);
        out.println(jobj.toJSONString());
        
        out.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
