<%-- 
    Document   : login
    Created on : Mar 30, 2019, 2:57:41 AM
    Author     : TOMMY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <jsp:include page="headscript.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <h3>Login</h3>
        <form action='Login' method='post' id="loginForm">
            <p>Email</p>
            <input type='email' id="email" name="email" required/>
            <p>Password</p>
            <input type="password" id='password' name='password' required/>
            <input type="submit" value="Log in"/>
        </form>
        <jsp:include page="footer.jsp"/>
        
        <!--javascript goes here-->
        <script type="text/javascript">
            $(document).ready(function() {
                $("#loginForm").submit(function(e) {
                    let email = $("#email").val();
                    let pass = $("#password").val();
                    $.ajax({
                        type:"post",
                        url:"GetUser",
                        data:{
                            email:email,
                            password:pass
                        },
                        async:false,
                        success:function(data){
                            alert("Success send");
//                            if(data.isExist) {
//                                alert("User is exist in database");
//                            }
//                            else {
//                                alert("User doesn't exist in databse")l;
//                            }
//                            
//                            if(data.passCorrect) {
//                                alert("Password is correct");
//                            }
//                            else{
//                                alert("Password is wrong");
//                            }
                        }
                    });
                    return false;
                });
            });
        </script>
    </body>
</html>
