<%-- 
    Document   : register
    Created on : Mar 30, 2019, 2:57:51 AM
    Author     : TOMMY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="headscript.jsp"/>
        <title>Login</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="container">

            <div class="row">

                <!--login form goes here-->
                <div class="col-sm-5 top-margin">
                    <h3>Login</h3>
                    <form id="loginForm" action="<%=response.encodeURL("j_security_check")%>" method="POST">

                        <div class="form-group">
                            <label for="loginEmail">Username:</label>
                            <input class="form-control" type="text" id="loginEmail" name="j_username" required/>
                        </div>

                        <div class="form-group">
                            <label for='loginPassword'>Password:</label>
                            <input class="form-control" type="password" id="loginPassword" name="j_password" required/>
                        </div>


                        <input class="form-control apply-btn" type="submit" value="Login"/>
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
