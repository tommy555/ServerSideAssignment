<%-- 
    Document   : updateOrder
    Created on : Apr 5, 2019, 10:30:53 AM
    Author     : TOMMY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:set var="orderNum" value="${param.orderNum}"/>
        <title>JSP Page</title>
        <jsp:include page="headscript.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="row mt-4">
                <div class="col-sm-12">
                    <form id="updateOrderForm">
                        <div class="form-group">
                            <label for="shippingStatus">Update shipping status:</label>
                            <select id="shippingStatus" name="shippingStatus" class="form-control">
                                <option>pending</option>
                                <option>Shipped</option>
                                <option>Cancelled</option>
                            </select>
                        </div>
                        
                        <input type="submit" value="Update status" class="apply-btn lg-btn"/>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>

    </body>


    <script>
        $(document).ready(function () {
            $.ajax({
                type: 'get',
                url: 'GetSingleOrder',
                data: {orderNum: '${orderNum}'},
                async: false,
                success: function (data) {
                    $("#shippingStatus").val(data.status);
                }
            });

            $("#updateOrderForm").submit(function () {
                $.ajax({
                    type: 'post',
                    url: 'UpdateOrder',
                    data: {
                        shippingstatus:$("#shippingStatus").val(),
                        orderNum:${orderNum}
                    },
                    async: false,
                    success: function (data) {
                        if(data.success) {
                            alert("Update success");
                            window.location.replace("userCenter.jsp");
                        }
                        else{
                            alert("Update fail");
                        }
                    }
                });
            });
        });
    </script>
</html>
