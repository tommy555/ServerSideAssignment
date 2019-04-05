<%-- 
    Document   : deleteOrder
    Created on : Apr 5, 2019, 11:05:09 AM
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
    <h1>${orderNum}!</h1>

    <script>
        $(document).ready(function () {
            $.ajax({
                type: 'get',
                url: 'DeleteOrder',
                data: {orderNum: '${orderNum}'},
                async: false,
                success: function (data) {
                    if (data.success) {
                        alert("Delete success");
                        window.location.replace("userCenter.jsp");
                    } else {
                        alert("Delete fail");
                    }
                }
            });
        });
    </script>
</body>
</html>
