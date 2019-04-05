<%-- 
    Document   : logout.jsp
    Created on : Apr 5, 2019, 12:47:52 PM
    Author     : TOMMY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <jsp:include page="headscript.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <h1>You have been logged out!</h1>
        <%
            request.logout();
        %>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
