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
        <title>Register</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="container">

            <div class="row">

                <!--register form goes here-->
                <div class="col-sm-5 top-margin">
                    <h3>Registration</h3>
                    <form id="registerForm" action="Register" method="POST">

                        <div class="form-group">
                            <label for="registerEmail">Email:</label>
                            <input class="form-control" type="email" id="registerEmail" name="registerEmail" required/>
                        </div>

                        <div class="form-group">
                            <label for="registerName">Name:</label>
                            <input class="form-control" type="text" id="registerName" name="registerName" required/>
                        </div>

                        <div class="form-group">
                            <label for="registerPassword">Password:</label>
                            <input class="form-control" type="password" id="registerPassword" name="registerPassword" required/>
                        </div>

                        <div class="form-group">
                            <label for="registerPassword2">Re-type password:</label>
                            <input class="form-control" type="password" id="registerPassword2" name="registerPassword2" required/>
                        </div>


                        <input class="form-control apply-btn" type="submit" value="Register"/>

                    </form>
                </div>

                <!--for spacing purpose-->
                <div class="col-sm-2"></div>

                <!--login form goes here-->
                <div class="col-sm-5 top-margin">
                    <h3>Login</h3>
                    <form id="loginForm" action="Login" method="POST">

                        <div class="form-group">
                            <label for="loginEmail">Email:</label>
                            <input class="form-control" type="email" id="loginEmail" name="loginEmail" required/>
                        </div>

                        <div class="form-group">
                            <label for='loginPassword'>Password:</label>
                            <input class="form-control" type="password" id="loginPassword" name="loginPassword" required/>
                        </div>


                        <input class="form-control apply-btn" type="submit" value="Login"/>
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>




        <!--javascript goes here-->
        <script type="text/javascript">
            //set register form onsubmit behavior
            $("#registerForm").submit(function (e) {
                let pass1 = $("#registerPassword").val();
                let pass2 = $("#registerPassword2").val();
                let email = $("#registerEmail").val();
                let name = $("#registerName").val();

                //validating pass1 and pass2
                var passMatched = true;
                if (pass1 != pass2) {
                    alert("password1 is not same as password 2");
                    $("#registerPassword").focus();
                    $("#registerPassword").val("");
                    $("#registerPassword2").val("");
                    return false;
                } else {
                    //checking if email exist in db
                    let emailExist = false;
                    if (emailExist) {
                        alert("Email already exist in database!!");
                        $("#registerEmail").val("");
                        $("#registerEmail").focus();
                        return false;
                    }
                }
            });

            //set login form onsubmit behavior
            $("#loginForm").submit(function (e) {
                let pass = $("#loginPassword").val();
                let email = $("#loginEmail").val();

                //validating account existence and password
                let emailFound = false;
                let passwordCorrect = false;

                if (!emailFound) {
                    //email not found bahavior
                    alert("Email is not exist in our database!");
                    $("#loginEmail").val("");
                    $("#loginPassword").val("");

                    $("#loginEmail").focus();
                }

                if (!passwordCorrect) {
                    //password wrong behavior
                    alert("Password not correct!");
                    $("#loginPassword").val("");
                    $("#loginPassword").focus();
                }

                //login user
                e.preventDefault();
            });
        </script>
    </body>
</html>
