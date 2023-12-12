<%@ page import="Model.BEAN.Product" %>
<%@ page import="Model.BEAN.User" %><%--
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
    User user = null;
    user = (User) session.getAttribute("user");
    if (product == null) {
%>
<h1>Không tìm thấy sản phẩm!</h1>
<%} else {%>
<div class="row" style="max-width: 100%;">
    <div class="col-2"></div>
    <div class="col-8 d-flex"
         style="min-height: calc(100vh - 150px); padding: 10px 20px; border: 5px solid gainsboro">
        <div class="col-5" style="text-align: center">
            <img src="data:image/png;base64,<%=product.getUrlImage()%>" height="400" width="275" alt="Cover" border="2px">
        </div>
        <div class="col-7">
            <form action="" method="post" id="form">
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
                    <button class="btn btn-primary" type="button" onclick="decreaseAmount(<%=product.getPrice()%>)">-
                    </button>
                    <input id="amount" type="number" name="amount" style="width: 100px" value="1"
                           oninput="isNumber(<%=product.getPrice()%>)">
                    <button class="btn btn-primary" type="button" onclick="increaseAmount(<%=product.getPrice()%>)">+
                    </button>
                </div>
                <div style="margin-top: 10px; font-size: 20px;">
                    <span>Tạm tính: </span>
                    <span id="totalCost" style="color: red"><%=product.getPrice()%>&nbsp;₫</span>
                </div>
                <div style="margin-top: 10px">
                    <input type="hidden" name="idProduct" value="<%=product.getIdProduct()%>">
                    <button type="submit" formaction="/buy" name="action" value="cart" class="btn btn-outline-danger"
                            id="cartBtn">
                        Thêm vào giỏ hàng
                    </button>
                    <button type="button" formaction="/buy" name="action" value="buy" class="btn btn-outline-primary"
                            id="buyBtn" data-bs-toggle="modal" data-bs-target="#modalUser"
                            onclick="showDetailForm1('<%=product.getIdProduct()%>')">
                        Mua ngay
                    </button>
                </div>
            </form>

        </div>
    </div>
    <div class="col-2"></div>
</div>
<%}%>

<div class="modal fade" id="modalUser" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Chi tiết đơn hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/buy?action=buy" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <table class="table table-striped">
                            <tr>
                                <th>Ảnh</th>
                                <th>Tên mặt hàng</th>
                                <th>Đơn giá</th>
                                <th>Số lượng</th>
                                <th>Tổng tiền</th>
                            </tr>
                            <tr>
                                <td><img src="data:image/png;base64,<%=product.getUrlImage()%>" alt="Cover" height="50"
                                         width="50"></td>
                                <td><%=product.getNameProduct()%></td>
                                <td><%=product.getPrice()%>&nbsp;₫</td>
                                <td id="amountProduct"></td>
                                <td id="totalCost1"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="mb-3">
                        <label for="InputFullName" class="form-label">Họ tên</label>
                        <input type="text" class="form-control" id="InputFullName" name="InputFullNameUpdate" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="InputPhoneNumber" class="form-label">Số điện thoại</label>
                        <input type="text" class="form-control" id="InputPhoneNumber" name="InputPhoneNumberUpdate"
                               disabled>
                    </div>
                    <div class="mb-3">
                        <label for="InputAddress" class="form-label">Địa chỉ</label>
                        <input type="text" class="form-control" id="InputAddress" name="InputAddressUpdate" disabled>
                    </div>
                </div>

                <div class="modal-footer">
                    <input type="hidden" name="idUser" value="" id="idUser">
                    <input type="hidden" name="idProduct" value="" id="idProduct">
                    <input type="hidden" name="amount" value="" id="amount1">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Thanh toán</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script src="js/productDetail.js"></script>
</html>
