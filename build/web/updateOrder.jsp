<%-- 
    Document   : updateOrder.jsp
    Created on : Apr 5, 2019, 10:08:21 AM
    Author     : TOMMY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:set var="orderNum" value="${param.orderNum}"/>
        <title>Update ${orderNum}</title>
        <jsp:include page="headscript.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <jsp:include page="footer.jsp"/>

    </body>


</html>
