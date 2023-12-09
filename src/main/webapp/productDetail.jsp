<%@ page import="Model.BEAN.Product" %><%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 07/12/2023
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="css/css.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
    Product product = (Product) request.getAttribute("product");
    if (product == null) {
%>
<h1>Không tìm thấy sản phẩm!</h1>
<%} else {%>
<div class="row" style="max-width: 100%;">
    <div class="col-2"></div>
    <div class="col-8 d-flex"
         style="margin: 0 auto; min-height: calc(100vh - 150px); padding: 10px 20px; border: 5px solid gainsboro">
        <div class="col-5" style="text-align: center">
            <img src="uploads/<%=product.getUrlImage()%>" height="400" width="275" alt="Cover" border="2px">
        </div>
        <div class="col-7">
            <form action="" method="post">
                <div id="nameProduct" style="font-size: 30px; font-weight: 200; padding: 10px 0;">
                    <%=product.getNameProduct()%>
                </div>
                <div id="price"
                     style="font-size: 20px; padding: 30px 0 25px 20px; background-color: #f7f7f8;">
                    <span>Giá: </span><span style=" color: red"><%=product.getPrice()%>&nbsp;₫</span>
                </div>
                <div id="delivery" style="padding: 10px 0; display: flex; gap: 10px;">
                <span class="divDelivery_left" style="font-size: 16px; font-weight: 200;">
                    Vận chuyển:
                </span>
                    <span class="divDelivery_right" style="font-size: 16px; font-weight: 400;">
                    Miễn phí vận chuyển
                </span>
                </div>
                <div>
                    <label for="amount">Số lượng: </label>
                    <button class="btn btn-primary" type="button" onclick="decreaseAmount()">-</button>
                    <input id="amount" type="number" name="amount" style="width: 100px" value="1" oninput="isNumber()">
                    <button class="btn btn-primary" type="button" onclick="increaseAmount()">+</button>
                </div>
                <div style="margin-top: 10px">
                    <input type="hidden" name="idProduct" value="<%=product.getIdProduct()%>">
                    <button type="submit" formaction="/buy" name="action" value="cart" class="btn btn-outline-danger"
                            id="cartBtn">
                        Thêm vào giỏ hàng
                    </button>
                    <button type="submit" formaction="/buy" name="action" value="buy" class="btn btn-outline-primary"
                            id="buyBtn">
                        Mua ngay
                    </button>
                </div>
            </form>

        </div>
    </div>
    <div class="col-2"></div>
</div>
<%}%>
</body>
<script>
    function decreaseAmount() {
        let amount = parseInt(document.getElementById("amount").value);
        if (!isNaN(amount) && amount >= 1) {
            amount -= 1;
            document.getElementById("amount").value = amount;
        } else {
            amount = 0;
            document.getElementById("amount").value = amount;
            document.getElementById("cartBtn").disabled = true;
            document.getElementById("buyBtn").disabled = true;
        }
        if (amount <= 0) {
            document.getElementById("cartBtn").disabled = true;
            document.getElementById("buyBtn").disabled = true;
        } else {
            document.getElementById("cartBtn").disabled = false;
            document.getElementById("buyBtn").disabled = false;
        }
    }

    function increaseAmount() {
        let amount = parseInt(document.getElementById("amount").value);
        if (!isNaN(amount)) {
            amount += 1;
            document.getElementById("amount").value = amount;
        } else {
            amount = 0;
            document.getElementById("amount").value = amount;
            document.getElementById("cartBtn").disabled = true;
            document.getElementById("buyBtn").disabled = true;
        }

        if (amount <= 0) {
            document.getElementById("cartBtn").disabled = true;
            document.getElementById("buyBtn").disabled = true;
        } else {
            document.getElementById("cartBtn").disabled = false;
            document.getElementById("buyBtn").disabled = false;
        }
    }

    function isNumber() {
        let amount = parseInt(document.getElementById("amount").value);
        if (amount <= 0) {
            document.getElementById("cartBtn").disabled = true;
            document.getElementById("buyBtn").disabled = true;
        } else {
            document.getElementById("cartBtn").disabled = false;
            document.getElementById("buyBtn").disabled = false;
        }
    }
</script>
</html>
