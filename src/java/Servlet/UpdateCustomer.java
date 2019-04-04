/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entity.Customers;
import Session.classicmodelsPool;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "UpdateCustomer", urlPatterns = {"/UpdateCustomer"})
public class UpdateCustomer extends HttpServlet {

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
        
        int customerNumber = Integer.valueOf(request.getParameter("customerNumber"));
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
        
        Customers updatedCustomer = classicmodelsPool.findCustomerByCustomerNum(customerNumber);
        
        updatedCustomer.setCustomerName(customerName);
        updatedCustomer.setContactFirstName(contactFirstName);
        updatedCustomer.setContactLastName(contactLastName);
        updatedCustomer.setPhone(phone);
        updatedCustomer.setAddressLine1(addressLine1);
        updatedCustomer.setAddressLine2(addressLine2);
        updatedCustomer.setCountry(country);
        updatedCustomer.setCity(city);
        updatedCustomer.setState(state);
        updatedCustomer.setPostalCode(postalCode);
        updatedCustomer.setSalesRepEmployeeNumber(classicmodelsPool.findEmployeeByNumber(salesRepEmployeeNumber));
        
        JSONObject jobj = new JSONObject();
        
        try {
            classicmodelsPool.updateCustomer(updatedCustomer);
            jobj.put("success", true);
        }
        catch (Exception ex) {
            System.out.println("Updated Customer went wrong");
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
