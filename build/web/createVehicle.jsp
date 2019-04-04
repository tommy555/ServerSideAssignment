<%-- 
    Document   : createVehicle
    Created on : Apr 2, 2019, 3:56:49 PM
    Author     : TOMMY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new vehicle</title>
        <jsp:include page="headscript.jsp"/>

    </head>
    <body>
        <jsp:include page="header.jsp"/>


        <div class="container">
            <div class="row">
                <div class="col-sm-8">


                    <form action="CreateVehicle" method="POST">
                        <div class="form-group">
                            <label for="vehicleName">New vehicle name:</label>
                            <input type="text" class="form-control" name="vehicleName" required>
                        </div>

                        <div class="form-group">
                            <label for="vehicleType">Select type:</label>
                            <select class="form-control" name="vehicleType" required>
                                <option>Car</option>
                                <option>Motorbike</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="vehicleModel">Select type:</label>
                            <select class="form-control" name="vehicleModel" required>
                                <option>Saga</option>
                                <option>Mustang</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="vehicleBrand">Select type:</label>
                            <select class="form-control" name="vehicleBrand" required>
                                <option>Proton</option>
                                <option>Ford</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="vehicleManufactureYear">Manufacture year:</label>
                            <select class="form-control" name="vehicleManufactureYear" required="">
                                <option>1996</option>
                                <option>1997</option>
                                <option>1998</option>
                                <option>1999</option>
                                <option>2000</option>
                                <option>2001</option>
                                <option>2002</option>
                                <option>2003</option>
                                <option>2004</option>
                                <option>2005</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="vehiclePrice">Vehicle price:</label>
                            <input type="number" name="vehiclePrice" required/>
                        </div>

                        <div class="form-group">
                            <label for="vehicleAmount">Amount: </label>
                            <input type="number" name="vehicleAmount" required/>
                        </div>

                        <input type="submit" value="Create" class="apply-btn lg-btn"/>
                    </form>


                </div>
            </div>
        </div>



        <jsp:include page="footer.jsp"/>
    </body>
</html>
