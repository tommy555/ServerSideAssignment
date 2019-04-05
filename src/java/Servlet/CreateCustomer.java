/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entity.Customers;
import Entity.Orders;
import Entity.Payments;
import Session.classicmodelsPool;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "CreateCustomer", urlPatterns = {"/CreateCustomer"})
public class CreateCustomer extends HttpServlet {

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

        String customerName = request.getParameter("customerName");
        String contactFirstName = request.getParameter("contactFirstName");
        String contactLastName = request.getParameter("contactLastName");
        String phone = request.getParameter("phone");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postalCode = request.getParameter("postalCode");
        int salesRepEmployeeNumber = Integer.valueOf(request.getParameter("salesRepEmployeeNumber"));

        Customers newCust = new Customers();
        List<Orders> newOrderList = new ArrayList<>();
        List<Payments> newPaymentList = new ArrayList<>();
        
        newCust.setCustomerNumber(classicmodelsPool.findUsableCustomerNUmber());
        newCust.setCustomerName(customerName);
        newCust.setContactFirstName(contactFirstName);
        newCust.setContactLastName(contactLastName);
        newCust.setPhone(phone);
        newCust.setAddressLine1(addressLine1);
        newCust.setAddressLine2(addressLine2);
        newCust.setCountry(country);
        newCust.setCity(city);
        newCust.setState(state);
        newCust.setPostalCode(postalCode);
        newCust.setSalesRepEmployeeNumber(classicmodelsPool.findEmployeeByNumber(salesRepEmployeeNumber));
        newCust.setOrdersList(newOrderList);
        newCust.setPaymentsList(newPaymentList);
        newCust.setCreditLimit(new BigDecimal(0));

        JSONObject jobj = new JSONObject();

        try {
            classicmodelsPool.createCustomer(newCust);
            jobj.put("success", true);
        } catch (Exception ex) {
            System.out.println("Create Customer went wrong");
            System.out.println(ex.getCause());
            System.out.println(ex.getMessage());
            System.out.println(ex.getLocalizedMessage());
            jobj.put("success", false);
        }

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
