<%-- 
    Document   : updateProduct
    Created on : Apr 5, 2019, 2:25:02 AM
    Author     : TOMMY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:set var="pCode" value="${param.pCode}"/>
        <title>Update ${pCode}</title>
        <jsp:include page="headscript.jsp"/>

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="row">
                <form>
                    <table>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="productName">Product name:</label>
                                    <input type="text" name="productName" value="" class="form-control" required/>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="productVendor">Product vendor:</label>
                                    <input type="text" name="productVendor" value="" class="form-control" required/>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="quantityInStock">Quantity in stock:</label>
                                    <input type="text" name="quantityInStock" value="" class="form-control" required/>
                                </div>
                            </td>
                            
                            <td>
                                <div class="form-group">
                                    <label for="buyPrice">Buy price:</label>
                                    <input type="text" name="buyPrice" value="" class="form-control" required/>
                                </div>
                            </td>
                            
                            <td>
                                <div class="form-group">
                                    <label for="productLine">Product line:</label>
                                    <select name="productLine">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="productDescription">Product description</label>
                                    <textarea name="productDescription" value="" class="form-control" required></textarea>
                                </div>
                            </td>
                        </tr>
                        
                    </table>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
