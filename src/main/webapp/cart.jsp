<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.BEAN.Order" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 08/12/2023
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Giỏ hàng</title>
    <title>Thanh toán</title>
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
<body onload="zero()">
<jsp:include page="header.jsp"></jsp:include>
<div class="row" style="background-color: rgb(247, 247, 248);">
    <div class="col-1"></div>
    <div class="col-10 d-flex" style="background-color: white">
        <div class="col-9">
            <table class="table table-striped">
                <tr>
                    <th>STT</th>
                    <th>Ảnh</th>
                    <th>Tên mặt hàng</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th>Xóa</th>
                </tr>
                <%
                    ArrayList<Order> orderList = (ArrayList<Order>) session.getAttribute("orderList");
                    int payment = (int) session.getAttribute("payment");
                    if (orderList == null) {
                %>
                <tr>
                    <td colspan="6" style="text-align: center">Không có dữ liệu!</td>
                </tr>
                <%
                } else {
                    for (int i = 0; i < orderList.size(); i++) {
                %>
                <tr>
                    <td><%=i + 1%>
                    </td>
                    <td>
                        <img src="/uploads/<%=orderList.get(i).getProduct().getUrlImage()%>" alt="cover" height="50" width="50">
                    </td>
                    <td><%=orderList.get(i).getProduct().getNameProduct()%></td>
                    <td><%=orderList.get(i).getProduct().getPrice()%>&nbsp;₫</td>
                    <td><%=orderList.get(i).getAmount()%></td>
                    <td><%=orderList.get(i).getTotalCost()%>&nbsp;₫</td>
                    <td>
                        <form action="/buy" method="post">
                            <input type="hidden" name="order" value="<%=i%>">
                            <button class="btn btn-danger" name="action" value="delete">Xóa</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
        <div class="col-3" id="payment">
            <div id="payment1">
                <form action="/buy" method="post" style="width: 100%; margin-left: 10px">
                    <div style="display: flex; justify-content: space-around; align-items: center;">
                        <span style="font-size: 15px; text-align: left">Thành tiền: </span>
                        <span style="font-size: 20px; font-weight: 500; color: blue; text-align: right" id="totalPayment"><%=payment%>&nbsp;₫</span>
                    </div>
                    <br><hr>
                    <div>
                        <button id="paymentBtn" type="submit" class="btn btn-primary w-100" name="action" value="pay">Thanh toán</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-1"></div>
</div>
</body>
<script src="js/cart.js"></script>
</html>
