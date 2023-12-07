<%@ page import="Model.BEAN.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.BEAN.Admin" %><%--
  Created by IntelliJ IDEA.
  User: Nho
  Date: 01/12/2023
  Time: 5:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%
    session = request.getSession(false);
    if (session != null && session.getAttribute("admin") != null) {
        Admin admin = (Admin) session.getAttribute("admin");
%>
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        var myModal = document.getElementById('myModal')
        var myInput = document.getElementById('myInput')

        myModal.addEventListener('shown.bs.modal', function () {
            myInput.focus()
        })

    </script>

    <style>

        .div-left {
            width: 20%;
            height: 100vh;
        }

        h2 {
            text-align: center;
            margin: 20px 0px;
        }

        .div-left--item {
            display: flex;
            flex-direction: column;
            gap: 10px;
            align-items: center;
            margin: 20px 0px;
        }

        .div-right {
            width: 80%;
            height: 100vh;
            border-top: 5px solid #fafafa;
            border-left: 5px solid #fafafa;
        }

        .nav-link {
            color: black;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            gap: 15px;
            font-size: 17px;
            margin: 5px;
        }

    </style>
    <script>
        function loadManagerUserPage() {
            var iframe = document.getElementById('myIframe');
            iframe.src = 'ManageUserPage.jsp';
        }

        const loadManagerOrderPage = () => {
            var iframe = document.getElementById('myIframe');
            iframe.src = 'ManageOrderPage.jsp';
        }
        const loadManagerProductPage = () => {
            var iframe = document.getElementById('myIframe');
            iframe.src = 'ManageProductPage.jsp';

        }
        const loadManagerCategoryPage = () => {
            var iframe = document.getElementById('myIframe');
            iframe.src = 'ManageCategoryPage.jsp';

        }


    </script>
</head>
<body>
<div class="d-flex">
    <div class="div-left">
        <h2>Admin</h2>
        <div class="div-left--item">
            <div class="d-flex align-items-start">
                <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill"
                            data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home"
                            aria-selected="true" onclick="loadManagerUserPage()"><i class="fa-solid fa-user"></i>Manage
                        User
                    </button>
                    <button class="nav-link" data-bs-toggle="pill" type="button" role="tab"
                            aria-controls="v-pills-messages" aria-selected="false" onclick="loadManagerProductPage()"><i
                            class="fa-brands fa-slack"></i>Manage Product
                    </button>
                    <button class="nav-link" data-bs-toggle="pill" type="button" role="tab"
                            aria-controls="v-pills-messages" aria-selected="false" onclick="loadManagerCategoryPage()">
                        <i class="fa-solid fa-list"></i>Manage Categogy
                    </button>
                    <button class="nav-link" data-bs-toggle="pill" type="button" role="tab"
                            aria-controls="v-pills-messages" aria-selected="false" onclick="loadManagerOrderPage()"><i
                            class="fa-solid fa-cart-shopping"></i>Manage Order
                    </button>

                </div>
            </div>
        </div>
    </div>
    <div class="div-right">
        <div style="display: flex;align-items: center;justify-content: flex-end; padding: 5px 10px;">
            <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown"
                        aria-expanded="false">
                    Welcome, <%= admin.getNameAdmin()%>>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
                    <%--                    goi controller roi redirect login--%>
                </ul>
            </div>
        </div>
        <iframe id="myIframe" src="ManageUserPage.jsp" frameborder="0" style="width:100%;height:100%;"></iframe>
    </div>
</div>

</body>
<%
    }
    else {
        response.sendRedirect("/login");
    }
%>
</html>
