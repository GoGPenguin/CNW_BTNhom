<%@ page import="Model.BEAN.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.BEAN.Order" %><%--
  Created by IntelliJ IDEA.
  User: Nho
  Date: 03/12/2023
  Time: 6:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .div-Search{
            padding:5px 10px;
            border-radius: 15px;
            background: #fafafa;
            margin-top: 15px;
            width:99%;
        }
        .collapse {
            &:not(.show) {
                display: none;
            }
        }

        .collapsing {
            height: 0;
            overflow: hidden;
            /*@include transition($transition-collapse);*/
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">

        var myModal = document.getElementById('myModal')
        var myInput = document.getElementById('myInput')

        myModal.addEventListener('shown.bs.modal', function () {
            myInput.focus()
        })
        var myCollapse = document.getElementById('myCollapse')
        var bsCollapse = new bootstrap.Collapse(myCollapse, {
            toggle: false
        })
    </script>

</head>
<body>
<%--<div style="display: flex;align-items: center;justify-content: flex-end; padding: 5px 10px;">--%>
<%--    <div class="btn-group">--%>
<%--        <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--            Welcome, I'm Admin--%>
<%--        </button>--%>
<%--        <ul class="dropdown-menu">--%>
<%--            <li><a class="dropdown-item" href="#">Đăng xuất</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="div-Search">
    <form method="post" action = "/ManageOrder?action=filterOrder">
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label for="idOrderSearch">Mã đơn hàng</label>
                    <input type="text" class="form-control" id="idOrderSearch"  name = "idOrderSearch" aria-describedby="emailHelp" placeholder="Mã đơn hàng">
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label for="fullnameSearch">Tên khách hàng</label>
                    <input type="text" class="form-control" id="fullnameSearch" placeholder="Enter fullname" name = "fullnameSearch">
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label for="dateSearch">Ngày</label>
                    <input id="dateSearch" class="form-control" type="date" name="dateSearch"/>
                </div>
            </div>
        </div>
        <div class="row justify-content-end" style="margin: 15px 0px 5px 0px;">
            <div class="col-4 text-end">
                <button type="submit" class="btn btn-primary btn-sm">Search</button>

            </div>
        </div>
    </form>
</div>

<%--<div class="modal-addnew">--%>
<%--    <form action="/ManageUser?action=handleAddNewUser" method="post">--%>
<%--        <div class="row justify-content-end" style="margin: 10px 10px;">--%>
<%--            <div class="col-4 text-end">--%>
<%--                <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='/ManageUser?action=getListUser'">Xem danh sách</button>--%>
<%--                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">--%>
<%--                    <i class="fa-sharp fa-solid fa-plus" style="margin: 0px 5px;"></i>Thêm mới--%>
<%--                </button>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--            <div class="modal-dialog">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header">--%>
<%--                        <h5 class="modal-title" id="exampleModalLabel">Thêm mới user</h5>--%>
<%--                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body">--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="InputEmailAddNew" class="form-label">Email address</label>--%>
<%--                            <input type="email" class="form-control" id="InputEmailAddNew"  name = "InputEmailAddNew" aria-describedby="emailHelp">--%>
<%--                        </div>--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="InputPasswordAddNew" class="form-label">Password</label>--%>
<%--                            <input type="password" class="form-control" id="InputPasswordAddNew" name = "InputPasswordAddNew">--%>
<%--                        </div>--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="InputFullNameAddNew" class="form-label">FullName</label>--%>
<%--                            <input type="text" class="form-control" id="InputFullNameAddNew" name = "InputFullNameAddNew">--%>
<%--                        </div>--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="InputPhoneNumberAddNew" class="form-label">Phone Number</label>--%>
<%--                            <input type="text" class="form-control" id="InputPhoneNumberAddNew" name = "InputPhoneNumberAddNew">--%>
<%--                        </div>--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="InputAddressAddNew" class="form-label">Address</label>--%>
<%--                            <input type="text" class="form-control" id="InputAddressAddNew" name = "InputAddressAddNew">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer">--%>
<%--                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
<%--                        <button type="submit" class="btn btn-primary">Save changes</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>
<div class="row justify-content-end" style="margin: 10px 10px;">
    <div class="col-4 text-end">
        <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='/ManageOrder?action=getListOrder'">Xem danh sách</button>
    </div>
</div>
<div class="div-Table">
    <table class="table">
        <thead class="table-light">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">FullName</th>
            <th scope="col">Address</th>
            <th scope="col">Phone</th>
            <th scope="col">Price</th>
            <th scope="col">Date</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Order> listOrder = (ArrayList<Order>) request.getAttribute("listOrder");
            if (listOrder != null && !listOrder.isEmpty()) {
                for (int i = 0; i < listOrder.size(); i++) {
                    Order order = listOrder.get(i);
        %>
        <tr data-bs-toggle="collapse" data-bs-target="#collapseExample<%= order.getIdOrder() %>"
            aria-expanded="false" aria-controls="collapseExample<%= order.getIdOrder() %>">
            <td style="color: mediumblue;cursor: pointer;"><%= order.getIdOrder() %></td>
            <td><%= order.getNameUser() %></td>
            <td><%= order.getAddressUser() %></td>
            <td><%= order.getPhoneUser() %></td>
            <td><%= order.getTotalCost() %></td>
            <td><%= order.getDate() %></td>
        </tr>
        <tr>
            <td colspan="6">
                <div class="collapse" id="collapseExample<%= order.getIdOrder() %>">
                    <div class="card card-body">
                        <table class="table">
                            <thead class="table-light">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">IDUser</th>
                                <th scope="col">IDProduct</th>
                                <th scope="col">Count</th>
                                <th scope="col">Date</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% ArrayList<Order> listOrderDetail = (ArrayList<Order>) request
                                    .getAttribute("listOrderDetail");
                                if (listOrderDetail != null && !listOrderDetail.isEmpty())
                                    for (int j = 0; j < listOrderDetail.size(); j++) {
                                        Order orderDetail = listOrderDetail.get(j);
                                        if (orderDetail.getIdOrder().equals(order.getIdOrder())) { %>
                            <tr>
                                <td><%= orderDetail.getIdOrder() %></td>
                                <td><%= orderDetail.getIdUser() %></td>
                                <td><%= orderDetail.getIdProduct() %></td>
                                <td><%= orderDetail.getAmount() %></td>
                                <td><%= orderDetail.getDate() %></td>
                            </tr>
                            <% }
                            } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
