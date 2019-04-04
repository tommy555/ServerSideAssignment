<%-- 
    Document   : getVehicle
    Created on : Mar 30, 2019, 6:52:59 PM
    Author     : TOMMY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title id="title">empty</title>
        <c:set var="id" value="${param.pCode}"/>
        <jsp:include page="headscript.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <!--main display goes here-->
        <div class="container">

            <div class="row top-margin" id="display">
                <!--show spinner while loading data-->
                <jsp:include page="spinner.html"/>

                <div class="col-sm-6" id="vehicleImg"></div>

                <div class="col-sm-6" id="vehicleDetails">

                </div>

            </div>
        </div>


        <jsp:include page="footer.jsp"/>
    </body>

    <!--javascript goes here-->
    <script type="text/javascript">

        $(document).ready(function () {
            $.ajax({
                type: "get",
                url: "GetSingleProduct",
                async: false,
                data: {pCode: '${id}'},
                success: function (jsonData) {
                    $("#spinners").toggle();
                    let vehicleDetail = $("#vehicleDetails");
                    let data = jsonData.product;
                    $("#vehicleImg").html('<img src="Image/vehicles/' + data.productCode + '.png" class="display-thumbnail" alt="' + data.productName + '"/>');
                    vehicleDetail.append("<h2 class='text-uppercase font-weight-bold'>" + data.productName + "</h2>");
                    vehicleDetail.append("<a href='updateProduct.jsp?prodCode="+data.productCode+"'>Update this product</a>");
                    vehicleDetail.append("<a href='DeleteProduct?prodCode="+data.productCode+"' class='ml-2'>Delete this product</a>");
                    vehicleDetail.append("<h5 class='text-secondary font-italic'><small>By " + data.productVendor + "</small></h5>");
                    vehicleDetail.append("<br><br><br>");
                    vehicleDetail.append("<h5><strong>Price: <span class='fontcolor-primary'>USD " + data.buyPrice + "</span></strong></h5>");
                    vehicleDetail.append('<input type="hidden" value="' + data.productCode + '" id="pcode">');
                    vehicleDetail.append('<form>'+
'                    <div class="form-group">'+
'                        <label for="customerslist">Select customer:</label>'+
'                        <select class="form-control" id="customerslist" name="customerslist">'+
'                        </select>'+
'                    </div> '+
'                </form>');

                    //deceide which btn to append
                    if (data.quantityInStock > 0) {
                        vehicleDetail.append('<input type="button" value="Make order" id="purchaseBtn" class="btn apply-btn lg-btn"/>');
                    } else {
                        vehicleDetail.append('<input type="button" value="SOLD OUT" class="btn alert-btn lg-btn"/>');
                    }
                }
            });
            
            //get customer list
            $.ajax({
                type:'post',
                url:'GetCustomerNamelist',
                async:false,
                success:function(data) {
                    let customers = JSON.parse(data.customers);
                    $.each(customers, function(i, e){
                        $("#customerslist").append("<option>"+e+"</option>");
                    });
                }
            });

            $("#purchaseBtn").click(function () {
                $.ajax({
                    type: 'post',
                    url: 'PurchaseProduct',
                    data: {pCode: $("#pcode").val(), customerName:$("#customerslist").val()},
                    async: false,
                    success: function (data) {
                        if (data.success) {
                            alert("Order created");
                        } else {
                            alert("Fail to create order....");
                        }
                    }
                });
            });
        });


    </script>
</html>
