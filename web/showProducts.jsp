<%-- 
    Document   : displayVehicles
    Created on : Mar 30, 2019, 1:22:03 PM
    Author     : TOMMY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>All Products</title>
        <jsp:include page="headscript.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <!--display area-->
        <div class="container">
            <!--vehicles display area-->
            <!--iterate over the vehicles-->
            <h1 class="top-margin">All products</h1>

            <div class="row">
                <div class="col-sm-7">

                    <!--loading spinners-->
                    <jsp:include page="spinner.html"/>

                    <!--set hidden value-->
                    <input type='hidden' value="${type}" id='vehicleType'/>

                    <div id="vehiclesDisplay"></div>
                </div>

                <!--for spacing purpose-->
                <div class="col-sm-1"></div>

                <!--side navigation - filter and order-->
                <div class="col-sm-4">
                    <h5 class="top-margin">Filter</h5>
                    <div class="row border">
                        <jsp:include page="minispinner.html"/>
                        <ul class="nav flex-column" id="brandsList"></ul>
                    </div>

                    <div class="row border">
                        <a href="CreateProduct.jsp">Create new product</a>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>

    </body>

    <!--javascript goes here-->
    <script type="text/javascript">
        $(document).ready(function () {
            let vtype = $("#vehicleType").val();
            var retrievedVehicles = [];
            var filterList = [];

            //get brands from API
            $.ajax({
                type: "get",
                url: "GetProductlines",
                data: {type: vtype},
                async: false,
                success: function (data) {
                    $("#miniSpinners").toggle();
                    var brands = JSON.parse(data.productlines);
                    $.each(brands, function (i, e) {
                        $("#brandsList").append('<li><input type="checkbox" class="chekcboxes" value="' + e + '">' + e + '<br></li>');
                    });
                }
            });

            //define clear display function
            let clearDisplay = function () {
                $("#vehiclesDisplay").html("");
            }

            //define getVehicles function
            let getVehicles = function (type, order, orderBy) {
                if ($("#spinners").is(":hidden")) {
                    $("#spinners").toggle()
                }
                $.ajax({
                    type: "get",
                    url: "GetAllProducts",
                    async: false,
                    success: function (data) {
                        $("#spinners").toggle();
                        retrievedVehicles = data.products;

                        //clear display and show vehicles
                        clearDisplay();
                        $.each(retrievedVehicles, function (i, e) {
                            showVehicle(e);
                        });
                    }
                });
            }

            //define showVehicles function
            let showVehicle = function (e) {
                let vehiclesDisplay = $("#vehiclesDisplay");
                vehiclesDisplay.append('\
                <a href="getProduct.jsp?pCode=' + e.productCode + '" class="row no-list-style list-items border">\n\
                    <div class="col-sm-4">\n\
                        <img src="Image/vehicles/' + e.productCode + '.png" class="rounded list-thumbnail" alt="' + e.productName + '">\n\
                    </div>\n\
                    <div class="col-sm-8">\n\
                        <h5><small><b>' + e.productName + ' by ' + e.productVendor + '</b></small></h5>\n\
                        <p class="text-secondary"><small><i>' + e.productLine.productLine + '</i></small></p>\n\
                        <h5 class="text-success" id="price">USD ' + e.buyPrice + '</h5>\n\
                    </div>\n\
                </a>');
            }

            //get vehicles from API
            getVehicles(vtype, "ASC", "ALL");



            //brands checkboxes event
            var checkBoxListener = function () {

                //get all checked boxes
                let checkedBoxes = $("input:checked");
                if ($(this).prop("checked") == true) {
                    //if current checkbox is checked
                    filterList.push($(this).val());
                } else {
                    //if current checkbox is unchecked
                    //find the unchecked value in the list
                    var index = filterList.indexOf($(this).val());
                    if (index > -1) {
                        //remove the item from list if the item exist
                        filterList.splice(index, 1);
                    }
                }


                //show the vehilces based on user selection
                if (filterList.length == 0) {
                    //if nothing is checked, show all
                    clearDisplay();
                    $.each(retrievedVehicles, function (i, e) {
                        showVehicle(e);
                    });
                } else {
                    //show selected brand
                    var str = filterList.toString();
                    clearDisplay();
                    $.each(retrievedVehicles, function (i, e) {
                        if (str.includes(e.productLine.productLine)) {
                            showVehicle(e)
                        }
                    })
                }

            }

            //define check box behavior to all the checkboxes in currrent page
            $("input[type=checkbox]").on("click", checkBoxListener);
        });
    </script>
</html>
