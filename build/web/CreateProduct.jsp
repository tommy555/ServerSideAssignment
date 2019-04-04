<%-- 
    Document   : CreateProduct
    Created on : Apr 5, 2019, 3:45:59 AM
    Author     : TOMMY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="headscript.jsp"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="container">
            <div class="row">
                <form id="prodCreateForm" action="CreateProduct" method="post">
                    <table>
                        <tr>
                            <td colspan="3">
                                <div class="form-group">
                                    <label for="productName">Product name:</label>
                                    <input type="text" name="productName" id="productName" value="" class="form-control" required/>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="3">
                                <div class="form-group">
                                    <label for="productVendor">Product vendor:</label>
                                    <input type="text" name="productVendor" id="productVendor" value="" class="form-control" required/>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="quantityInStock">Quantity in stock:</label>
                                    <input type="text" name="quantityInStock" id="quantityInStock" value="" class="form-control" required/>
                                </div>
                            </td>
                            
                            <td>
                                <div class="form-group">
                                    <label for="buyPrice">Buy price:</label>
                                    <input type="text" name="buyPrice" id="buyPrice" value="" class="form-control" required/>
                                </div>
                            </td>
                            
                            <td>
                                <div class="form-group">
                                    <label for="productLine">Product line:</label>
                                    <select name="productLine" class="form-control" id="productLine">
                                    </select>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="3">
                                <div class="form-group">
                                    <label for="productDescription">Product description</label>
                                    <textarea name="productDescription" id="productDescription" value="" class="form-control" style="resize: none" required></textarea>
                                </div>
                            </td>
                        </tr>
                        
                        <tr class="d-flex flex-wrap align-content-end">
                            <td colspan="3">
                                <input type="submit" value="Create" class="apply-btn lg-btn"/>
                            </td>
                        </tr>
                        
                    </table>
                </form>
            </div>
        </div>
        
        
        
        <jsp:include page="footer.jsp"/>
        
        
        
        <!--script goes here-->
        <script type="text/javascript">
            $(document).ready(function(){
                let pCode = '${pCode}';
                
                $.ajax({
                    type:'post',
                    url:'GetProductlines',
                    async:false,
                    success:function(data){
                        let prodlines = JSON.parse(data.productlines);
                        $.each(prodlines, function(i, e){
                           $("#productLine").append("<option>"+e+"</option>"); 
                        });
                    }
                });
                
                $("#prodCreateForm").submit(function(e) {
                    $.ajax({
                        type:'post',
                        url:'CreateProduct',
                        data:$("#prodCreateForm").serialize(),
                        async:false,
                        success: function(data) {
                            if(data.success) {
                                alert("Create product success");
                                window.location.replace("showProducts.jsp");
                            }
                            else {
                                alert("Create fail...")
                            }
                        }
                    });
                    e.preventDefault();
                });

                
            });
        </script>
    </body>
</html>
