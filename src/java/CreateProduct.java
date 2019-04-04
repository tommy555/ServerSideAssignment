/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Entity.Productlines;
import Entity.Products;
import Session.classicmodelsPool;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
@WebServlet(urlPatterns = {"/CreateProduct"})
public class CreateProduct extends HttpServlet {

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

        String productName = request.getParameter("productName");
        String productVendor = request.getParameter("productVendor");
        String quantityInStock = request.getParameter("quantityInStock");
        String buyPrice = request.getParameter("buyPrice");
        String productLine = request.getParameter("productLine");
        String productDescription = request.getParameter("productDescription");

        Products newProduct = new Products();
        JSONObject jobj = new JSONObject();

        try {
            Productlines selectedProductline = classicmodelsPool.findProductlinesByLines(productLine);

            newProduct.setProductVendor(productVendor);
            newProduct.setQuantityInStock(Short.valueOf(quantityInStock));
            newProduct.setBuyPrice(BigDecimal.valueOf(Double.valueOf(buyPrice)));
            newProduct.setProductDescription(productDescription);
            newProduct.setProductLine(selectedProductline);
            newProduct.setMsrp(new BigDecimal(5.55));
            newProduct.setProductScale("5.55");
            newProduct.setProductCode(classicmodelsPool.getNewProductNumber());
            newProduct.setProductName(productName);

            classicmodelsPool.createNewProduct(newProduct);
            jobj.put("success", true);

        } catch (Exception ex) {
            System.out.println("Error when updating product: " + productName);
            System.out.println(ex.getMessage());

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
