/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Customers;
import Entity.Employees;
import Entity.Orderdetails;
import Entity.Orders;
import Entity.Productlines;
import Entity.Products;
import java.util.HashSet;

import java.util.List;
import java.util.Set;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import org.apache.commons.lang.StringUtils;

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
        if (!em.contains(updatedCustomer)) {
            updatedCustomer = em.merge(updatedCustomer);
        }
        em.merge(updatedCustomer);
    }

    public List<String> findCustomerNamelist() {
        return em.createNamedQuery("Customers.findNamelist").getResultList();
    }

    public int findUsableCustomerNUmber() {
        Long total = (Long) em.createNamedQuery("Customers.findTotalCustomer").getSingleResult();
        return (total.intValue() + 1);
    }

    public void createCustomer(Customers customer) {
        validateCustomers(customer);
        if (!em.contains(customer)) {
            customer = em.merge(customer);
        }
        em.persist(customer);
    }
    
    public void removeCustomer(Customers c) {
        if (!em.contains(c)) {
            c = em.merge(c);
        }
        em.remove(c);
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
        return String.valueOf(total.intValue() + 1);
    }

    public void createNewProduct(Products newProduct) {
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
    
    public void updateOrder(Orders order) {
        if (!em.contains(order)) {
            order = em.merge(order);
        }
        em.merge(order);
    }
    
    public void removeOrder(Orders order) {
        if (!em.contains(order)) {
            order = em.merge(order);
        }
        em.remove(order);
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    //Employee
    public Employees findEmployeeByNumber(int number) {
        return ((Employees) em.createNamedQuery("Employees.findByEmployeeNumber").setParameter("employeeNumber", number).getSingleResult());
    }

    public List<String> findSalesRepresentativeList() {
        return em.createNamedQuery("Employees.findRepresentativeList").getResultList();
    }

    public void validateCustomers(Customers cust) {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Customers>> constraintViolations = validator.validate(cust);

        if (constraintViolations.size() > 0) {
            Set<String> violationMessages = new HashSet<String>();

            for (ConstraintViolation<Customers> constraintViolation : constraintViolations) {
                violationMessages.add(constraintViolation.getPropertyPath() + ": " + constraintViolation.getMessage());
            }

            throw new RuntimeException("Customer is not valid:\n" + StringUtils.join(violationMessages, "\n"));
        }
    }

}
