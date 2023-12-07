<%@ page import="Model.BEAN.User" %><%--
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
                <li><a class="dropdown-item" href="/user?id=<%=user.getIdUser()%>">Thông tin cá nhân</a></li>
                <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
            </ul>
        </div>
        <%} else {%>
        <a href="/login">
            <button class="btn btn-primary">
                Đăng nhập <i class="fas fa-sign-in-alt"></i>
            </button>
        </a>
        <a href="/register">
            <button class="btn btn-primary">
                Đăng kí
            </button>
        </a>
        <%}%>
    </div>
</div>
</body>
</html>
