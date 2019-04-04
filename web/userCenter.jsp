<%-- 
    Document   : userCenter
    Created on : Apr 4, 2019, 10:02:13 AM
    Author     : TOMMY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User center</title>
        <jsp:include page="headscript.jsp"/>
    </head>
    <body>

        <jsp:include page="header.jsp"/>


        <div class="container">
            <div class="row mt-3">

                <!--panel goes here-->
                <div class="col-sm-2">
                    <ul class="navbar-nav flex-column">
                        <li class="nav-item">
                            <a class="" href="#viewProf" id="viewProf">View profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="" href="#updateProf" id="updateProf">Update profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="" href="#viewHistory" id="viewHistory">View history orders</a>
                        </li>
                    </ul>
                </div>

                <!--display goes here-->
                <div class="col-sm-9">
                    <div id="display">
                        <jsp:include page="spinner.html"/>

                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>

    <!--script goes here-->
    <script type="text/javascript">
        $(document).ready(function () {

            //global variable
            let custNum = 363;
            var customer = {};

            //def show customer function
            let showCustomer = function () {
                $("#display").html("");
                $("#display").append('<table class="table table-bordered">' +
                        '                        <tr>' +
                        '                            <td>#' + customer.customerNumber + '</td>' +
                        '                            <td>' + customer.customerName + '</td>' +
                        '                            <td>' + customer.phone + '</td>' +
                        '                            <td>' + customer.salesRepEmployeeNumber + '</td>' +
                        '                        </tr>' +
                        '                        <tr>' +
                        '                            <td colspan="2">' + customer.contactFirstName + ' ' + customer.contactLastName + '</td>' +
                        '                            <td colspan="2">' + customer.creditLimit + '</td>' +
                        '                        </tr>' +
                        '                        <tr>' +
                        '                            <td colspan="4">' + customer.addressLine1 + '</td>' +
                        '                        </tr>' +
                        '                        <tr>' +
                        '                            <td colspan="4">' + customer.addressLine2 + '</td>' +
                        '                        </tr>' +
                        '                        <tr>' +
                        '                            <td>' + customer.state + '</td>' +
                        '                            <td>' + customer.city + '</td>' +
                        '                            <td>' + customer.country + '</td>' +
                        '                            <td>' + customer.postalCode + '</td>' +
                        '                        </tr>' +
                        '                    </table>');
            }

            //get customer detail from api
            //get data from API
            $.ajax({
                type: 'post',
                url: 'GetSingleCustomer',
                data: {custNum: custNum},
                async: false,
                success: function (data) {
                    //display data
                    customer = data.customer;
                    //show customer after finish loading
                    showCustomer();
                }
            });

            //view history behavior
            $("#viewHistory").click(function () {
                //clear display
                $("#display").html("");

                //obtain data from API
                $.ajax({
                    type: "get",
                    url: "GetAllOrders",
                    data: {custNum: custNum},
                    async: false,
                    success: function (data) {
                        //display content
                        $("#spinners").toggle();
                        let orders = data.Orders.reverse();
                        $.each(orders, function (i, e) {
                            $("#display").append('<table class="table table-bordered">' +
                                    '                        <thead>' +
                                    '                            <tr>' +
                                    '                                <th colspan="5">Order number: ' + e.orderNumber + '</th>' +
                                    '                            </tr>' +
                                    '                            <tr>' +
                                    '                                <th colspan="5">Status: ' + e.status + '</th>' +
                                    '                            </tr>' +
                                    '                            <tr>' +
                                    '                                <th colspan="5">Order details:</th>' +
                                    '                            </tr>' +
                                    '                            <tr>' +
                                    '                                <th>Order number</th>' +
                                    '                                <th>Product code</th>' +
                                    '                                <th>Quantity order</th>' +
                                    '                                <th>Order line number</th>' +
                                    '                                <th>Price per each</th>' +
                                    '                            </tr>' +
                                    '                        </thead>' +
                                    '                        ' +
                                    '                        <tbody class="orderdetails">' +
                                    '                        </tbody>' +
                                    '                    </table>');
                            $.each(e.Orderdetails, function (a, b) {
                                $(".orderdetails").last().append(
                                        '                            <tr>' +
                                        '                                <td>' + b.orderNumber + '</td>' +
                                        '                                <td>' + b.productCode + '</td>' +
                                        '                                <td>' + b.quantityOrdered + '</td>' +
                                        '                                <td>' + b.orderLineNumber + '</td>' +
                                        '                                <td>' + b.priceEach + '</td>' +
                                        '                            </tr>');
                            });








                        });
                    }
                });
            });

            //view profile behavior
            $("#viewProf").click(function () {
                //clear display
                showCustomer();
            });

            //update profile behavior
            $("#updateProf").click(function () {
                $("#display").html("");
                $("#display").append('<form method="post" id="updateForm">' +
                        '<input type="hidden" name="customerNumber" value="' + customer.customerNumber + '"/>' +
                        '                        <table class="d-flex justify-content-center">' +
                        '                            <tr>' +
                        '                                <td colspan="2">' +
                        '                                    <div class="form-group">' +
                        '                                        <label for="customerName">Customer name:</label>' +
                        '                                        <input type="text" name="customerName" value="' + customer.customerName + '" class="form-control" id="customerName" required/>' +
                        '                                    </div>' +
                        '                                </td>' +
                        '                                <td>' +
                        '                                    <div class="form-group">' +
                        '                                        <label for="phone">Phone:</label>' +
                        '                                        <input type="text" name="phone" value="' + customer.phone + '" class="form-control" id="phone" required/>' +
                        '                                    </div>' +
                        '                                </td>' +
                        '                                <td>' +
                        '                                    <div class="form-group">' +
                        '                                        <label for="salesRepEmployeeNumber">Sales representative:</label>' +
                        '                                        <input type="text" name="salesRepEmployeeNumber" value="' + customer.salesRepEmployeeNumber + '" class="form-control" id="salesRepEmployeeNumber" required/>' +
                        '                                    </div>' +
                        '                                </td>' +
                        '                            </tr>' +
                        '' +
                        '                            <tr>' +
                        '                                <td colspan="2">' +
                        '                                    <div class="form-group">' +
                        '                                        <label for="customerName">Contact first name:</label>' +
                        '                                        <input type="text" name="customerName" value="' + customer.contactFirstName + '" class="form-control" id="contactFirstName" required/>' +
                        '                                    </div>' +
                        '                                </td>' +
                        '                                <td colspan="2">' +
                        '                                    <div class="form-group">' +
                        '                                        <label for="contactLastName">Contact last name:</label>' +
                        '                                        <input type="text" name="contactLastName" value="' + customer.contactLastName + '" class="form-control" id="contactLastName" required/>' +
                        '                                    </div>  ' +
                        '                                </td>' +
                        '                            </tr>' +
                        '' +
                        '                            <tr>' +
                        '                                <td colspan="4">' +
                        '                                    <div class="form-group">' +
                        '                                        <label for="addressLine1">Address line 1:</label>' +
                        '                                        <input type="text" name="addressLine1" value="' + customer.addressLine1 + '" class="form-control" id="addressLine1" required/>' +
                        '                                    </div>' +
                        '                                </td>' +
                        '                            </tr>' +
                        '' +
                        '                            <tr>' +
                        '                                <td colspan="4">' +
                        '                                    <div class="form-group">' +
                        '                                        <label for="addressLine2">Address line 2:</label>' +
                        '                                        <input type="text" name="addressLine2" value="' + customer.addressLine2 + '" class="form-control" id="addressLine2" required/>' +
                        '                                    </div>' +
                        '                                </td>' +
                        '                            </tr>' +
                        '' +
                        '                            <tr>' +
                        '                                <td>' +
                        '                                    <div class="form-group">' +
                        '                                        <label for="country">Country:</label>' +
                        '                                        <input type="text" name="country" value="' + customer.country + '" class="form-control" id="country" required/>' +
                        '                                    </div>' +
                        '                                </td>' +
                        '                                <td>' +
                        '                                    <div class="form-group">' +
                        '                                        <label for="city">City:</label>' +
                        '                                        <input type="text" name="city" value="' + customer.city + '" class="form-control" id="city" required/>' +
                        '                                    </div>' +
                        '                                </td>' +
                        '                                <td>' +
                        '                                    <div class="form-group">' +
                        '                                        <label for="state">State:</label>' +
                        '                                        <input type="text" name="state" value="' + customer.state + '" class="form-control" id="state" required/>' +
                        '                                    </div>' +
                        '                                </td>' +
                        '                                <td>' +
                        '                                    <div class="form-group">' +
                        '                                        <label for="postalCode">Postal code:</label>' +
                        '                                        <input type="text" name="postalCode" value="' + customer.postalCode + '" class="form-control" id="postalCode" required/>' +
                        '                                    </div>' +
                        '                                </td>' +
                        '                            </tr>' +
                        '                            ' +
                        '                            <tr class="d-flex justify-content-end">' +
                        '                                <td>' +
                        '                                    <input type="button" value="Delete account" class="apply-btn lg-btn" id="deleteAccount"/>' +
                        '                                </td>' +
                        '                                ' +
                        '                                <td>' +
                        '                                    <input type="button" value="Clear" class="apply-btn lg-btn ml-2" id="clearBtn"/>' +
                        '                                </td>' +
                        '                                ' +
                        '                                <td>' +
                        '                                    <input type="submit" value="Update" class="apply-btn lg-btn ml-2"/>' +
                        '                                </td>' +
                        '                            </tr>' +
                        '                        </table>' +
                        '                        ' +
                        '                    </form>');

                //clearBtn behavior
                $("#clearBtn").click(function () {
                    alert("clear field");
                });

                //deleteAccount behavior
                $("#deleteAccount").click(function () {
                    alert("Delete account");
                });

                //updateForm behavior
                $("#updateForm").submit(function (e) {
                    $.ajax({
                        type: 'post',
                        url: 'UpdateCustomer',
                        data: $(this).serialize(),
                        async: false,
                        success: function (data) {
                            if (data.success) {
                                alert("Update success");
                            } else {
                                alert("Update fail");
                            }
                        }
                    });
                    e.preventDefault();
                });
            });

        });
    </script>
</html>
