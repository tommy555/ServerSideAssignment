<%-- 
    Document   : createCustomer
    Created on : Apr 5, 2019, 9:04:18 AM
    Author     : TOMMY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="headscript.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="row">
                <form method="post" id="createCustForm"> 
                    <input type="hidden" name="customerNumber" value="  customer.customerNumber  "/> 
                    <table class="d-flex justify-content-center"> 
                        <tr> 
                            <td colspan="2"> 
                                <div class="form-group"> 
                                    <label for="customerName">Customer name:</label> 
                                    <input type="text" name="customerName" value="" class="form-control" id="customerName" required/> 
                                </div> 
                            </td> 
                            <td> 
                                <div class="form-group"> 
                                    <label for="phone">Phone:</label> 
                                    <input type="text" name="phone" value="" class="form-control" id="phone" required/> 
                                </div> 
                            </td> 
                            <td> 
                                <div class="form-group"> 
                                    <label for="salesRepEmployeeNumber">Sales representative:</label> 
                                    <select name="salesRepEmployeeNumber" id="salesRepEmployeeNumber" class="form-control"</select>
                                </div> 
                            </td> 
                        </tr> 

                        <tr> 
                            <td colspan="2"> 
                                <div class="form-group"> 
                                    <label for="customerName">Contact first name:</label> 
                                    <input type="text" name="contactFirstName" value="" class="form-control" id="contactFirstName" required/> 
                                </div> 
                            </td> 
                            <td colspan="2"> 
                                <div class="form-group"> 
                                    <label for="contactLastName">Contact last name:</label> 
                                    <input type="text" name="contactLastName" value="" class="form-control" id="contactLastName" required/> 
                                </div>   
                            </td> 
                        </tr> 

                        <tr> 
                            <td colspan="4"> 
                                <div class="form-group"> 
                                    <label for="addressLine1">Address line 1:</label> 
                                    <input type="text" name="addressLine1" value="" class="form-control" id="addressLine1" required/> 
                                </div> 
                            </td> 
                        </tr> 

                        <tr> 
                            <td colspan="4"> 
                                <div class="form-group"> 
                                    <label for="addressLine2">Address line 2:</label> 
                                    <input type="text" name="addressLine2" value="" class="form-control" id="addressLine2" required/> 
                                </div> 
                            </td> 
                        </tr> 

                        <tr> 
                            <td> 
                                <div class="form-group"> 
                                    <label for="country">Country:</label> 
                                    <input type="text" name="country" value="" class="form-control" id="country" required/> 
                                </div> 
                            </td> 
                            <td> 
                                <div class="form-group"> 
                                    <label for="city">City:</label> 
                                    <input type="text" name="city" value="" class="form-control" id="city" required/> 
                                </div> 
                            </td> 
                            <td> 
                                <div class="form-group"> 
                                    <label for="state">State:</label> 
                                    <input type="text" name="state" value="" class="form-control" id="state" required/> 
                                </div> 
                            </td> 
                            <td> 
                                <div class="form-group"> 
                                    <label for="postalCode">Postal code:</label> 
                                    <input type="text" name="postalCode" value="" class="form-control" id="postalCode" required/> 
                                </div> 
                            </td> 
                        </tr> 

                        <tr class="d-flex justify-content-end"> 

                            <td> 
                                <input type="submit" value="Create" class="apply-btn lg-btn ml-2"/> 
                            </td> 
                        </tr> 
                    </table> 

                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>


        <script type="text/javascript">
            $(document).ready(function () {
                $.ajax({
                    type: 'get',
                    url: 'GetSalesRepresentativeList',
                    async: false,
                    success: function (data) {
                        let list = JSON.parse(data.representatives);
                        $.each(list, function (i, e) {
                            $("#salesRepEmployeeNumber").append("<option>" + e + "</option>");
                        });
                    }
                });

                $("#createCustForm").submit(function (e) {
                    $.ajax({
                        type: 'post',
                        url: 'CreateCustomer',
                        data:$("#createCustForm").serialize(),
                        async: false,
                        success: function (data) {
                            if(data.success) {
                                alert("Success");
                                window.location.replace("userCenter.jsp");
                            }
                            else{
                                alert("Fail");
                            }
                        }
                    });
                    
                    e.preventDefault();
                });
            });
        </script>

    </body>
</html>
