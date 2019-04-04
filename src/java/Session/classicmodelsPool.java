/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Customers;
import Entity.Employees;
import Entity.Offices;
import Entity.Orderdetails;
import Entity.OrderdetailsPK;
import Entity.Orders;
import Entity.Payments;
import Entity.PaymentsPK;
import Entity.Productlines;
import Entity.Products;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author TOMMY
 */
@Stateless
public class classicmodelsPool {

    @PersistenceContext(unitName = "ServerSideAssignmentPU")
    EntityManager em;

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    //Customer
    public List<Customers> findAllCustomers() {
        return em.createNamedQuery("Customers.findAll").getResultList();
    }

    public Customers findCustomerByCustomerNum(int number) {
        return (Customers) em.createNamedQuery("Customers.findByCustomerNumber").setParameter("customerNumber", number).getSingleResult();
    }

    public Customers findCustomerByCustomerName(String name) {
        return (Customers) em.createNamedQuery("Customers.findByCustomerName").setParameter("customerName", name).getSingleResult();
    }

    public void updateCustomer(Customers updatedCustomer) {
        em.merge(updatedCustomer);
    }

    public List<String> findCustomerNamelist() {
        return em.createNamedQuery("Customers.findNamelist").getResultList();
    }

    //Products
    public List<String> findAllProductlinesName() {
        return em.createNamedQuery("Productlines.findAllName").getResultList();
    }

    public Products findProductByCode(String pCode) {
        return (Products) em.createNamedQuery("Products.findByProductCode").setParameter("productCode", pCode).getSingleResult();
    }

    public Products findProductByName(String pName) {
        return (Products) em.createNamedQuery("Products.findByProductName").setParameter("productName", pName).getSingleResult();
    }

    public List<Products> findAllProducts() {
        return em.createNamedQuery("Products.findAll").getResultList();
    }

    public Productlines findProductlinesByLines(String lines) {
        return (Productlines) em.createNamedQuery("Productlines.findByProductLine").setParameter("productLine", lines).getSingleResult();
    }

    public void updateProduct(Products updatedProduct) {
        if (!em.contains(updatedProduct)) {
            updatedProduct = em.merge(updatedProduct);
        }
        em.merge(updatedProduct);
    }

    public void removeProduct(Products selectedProduct) {
        if (!em.contains(selectedProduct)) {
            selectedProduct = em.merge(selectedProduct);
        }
        em.remove(selectedProduct);
    }
    
    public String getNewProductNumber() {
        Long total = (Long) em.createNamedQuery("Products.countTotalProduct").getSingleResult();
        return String.valueOf(total.intValue()+1);
    }
    
    public void createNewProduct(Products newProduct){
         if (!em.contains(newProduct)) {
            newProduct = em.merge(newProduct);
        }
        em.persist(newProduct);
    }

    //Orders
    public List<Orders> findAllOrders() {
        return em.createNamedQuery("Orders.findAll").getResultList();
    }

    public List<Orders> findAllOrdersByCustNum(Customers cust) {
        return em.createNamedQuery("Orders.findByCustNum").setParameter("customerNumber", cust).getResultList();
    }

    public int getOrdersNumber() {
        List<Orders> orders = findAllOrders();
        int lastNumber = orders.get(orders.size() - 1).getOrderNumber();
        return (lastNumber + 1);
    }

    public void insertOrder(Orders newOrder) {
        em.persist(newOrder);
    }

    public void insertOrderdetails(Orderdetails newOrderdetail) {
        em.persist(newOrderdetail);
    }

    public Orders findOrdersByOrderNum(int orderNum) {
        return ((Orders) em.createNamedQuery("Orders.findByOrderNumber").setParameter("orderNumber", orderNum).getSingleResult());
    }

    //Employee
    public Employees findEmployeeByNumber(int number) {
        return ((Employees) em.createNamedQuery("Employees.findByEmployeeNumber").setParameter("employeeNumber", number).getSingleResult());
    }

}
