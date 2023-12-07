<%@ page import="Model.BEAN.User" %>
<%@ page import="Model.BEAN.Admin" %><%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 06/12/2023
  Time: 7:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
</head>
<body>
<div class="row container-fluid" style="width: 100%; display: flex; justify-content: left" class="row">
    <div class="col-2">
        <div>
            <a href="index.jsp"><img src="uploads/logo.png" alt="Logo" width="50" height="50"></a>
        </div>
    </div>
    <div class="col-8" style="padding-top: 10px">
        <form action="" method="get">
            <input type="text" placeholder="Tìm kiếm" style="height: 30px; width: 70%">
            <button type="submit" class="btn btn-primary"
                    style="height: 30px; width: 10%; text-align: center; padding-top: 2px; margin-top: -1px">
                <i class="fas fa-search"></i>
            </button>
        </form>
    </div>
    <div class="col-2" style="padding-top: 10px">
        <%
            session = request.getSession(false);
//            if (user != null) {
            if (session != null && session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");
        %>
        <div class="btn-group">
            <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown"
                    aria-expanded="false">
                <%=user.getNameUser()%>
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/user?id=<%=user.getIdUser()%>"
                       data-bs-toggle="modal" data-bs-target="#modalDetail"
                       onclick="showDetailForm('<%=user.getIdUser()%>')">Thông tin cá nhân</a>
                </li>
                <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
            </ul>
            <a href="/buy"><i class="far fa-shopping-cart"></i></a>
        </div>
        <% }
            if (session != null && session.getAttribute("admin") != null) {
                Admin admin = (Admin) session.getAttribute("admin");
        %>
        <div class="btn-group">
            <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown"
                    aria-expanded="false">
                <%=admin.getNameAdmin()%>
            </button>
            <ul class="dropdown-menu">
<%--                <li><a class="dropdown-item"--%>
<%--                       data-bs-toggle="modal" data-bs-target="#modalDetail">Thông tin cá nhân</a>--%>
<%--                </li>--%>
                <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
            </ul>
        </div>
        <%
            }
            if (session.getAttribute("admin") == null && session.getAttribute("user") == null) {
        %>
        <a href="/login">
            <button class="btn btn-primary">
                Đăng nhập
            </button>
        </a>
        <a href="/register">
            <button class="btn btn-primary">
                Đăng kí <i class="fas fa-sign-in-alt"></i>
            </button>
        </a>
        <%}%>
    </div>
</div>
<div class="modal fade" id="modalDetail" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Chi tiết người dùng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/user?action=handleUpdateUser" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="InputEmailUpdate" class="form-label">Username</label>
                        <input type="text" class="form-control" id="InputEmailUpdate" name="InputEmailUpdate"
                               aria-describedby="emailHelp" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="InputPasswordUpdate" class="form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="InputPasswordUpdate" name="InputPasswordUpdate">
                    </div>
                    <div class="mb-3">
                        <label for="InputFullNameUpdate" class="form-label">Họ tên</label>
                        <input type="text" class="form-control" id="InputFullNameUpdate" name="InputFullNameUpdate">
                    </div>
                    <div class="mb-3">
                        <label for="InputPhoneNumberUpdate" class="form-label">Số điện thoại</label>
                        <input type="text" class="form-control" id="InputPhoneNumberUpdate" name="InputPhoneNumberUpdate">
                    </div>
                    <div class="mb-3">
                        <label for="InputAddressUpdate" class="form-label">Địa chỉ</label>
                        <input type="text" class="form-control" id="InputAddressUpdate" name="InputAddressUpdate">
                    </div>
                </div>

                <div class="modal-footer">
                    <input type="hidden" name="ID" value="" id="InputUpdateId">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script src="js/userDetail.js"></script>
</html>
