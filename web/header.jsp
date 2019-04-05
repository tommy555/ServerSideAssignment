<%-- 
    Document   : header
    Created on : Mar 30, 2019, 1:06:26 AM
    Author     : TOMMY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header style="background-color: grey">
    
    <!--user fixed-top to fixed the nav bar on top-->
    <nav class="navbar navbar-expand-sm theme-primary"> 
        <!-- Links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Home</a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="showProducts.jsp">Show products</a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="userCenter.jsp">User center</a>
            </li>
            
            <%
                if(request.isUserInRole("admin")) {
                    out.println("<li class='nav-item'>");
                    out.println("<a  class='nav-link' href='logout.jsp'>Logout</a>");
                    out.println("</li>");
                    
                
            
                }
                else {
                    
                    out.println("<li class='nav-item'>");
                    out.println("<a  class='nav-link' href='login.jsp'>Login</a>");
                    out.println("</li>");
                }
            %>
        </ul>

    </nav>
</header>
