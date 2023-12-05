<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.BEAN.Product" %><%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 04/12/2023
  Time: 8:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Trang chủ</title>
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
<div class="navbar header-container container row">
    <div style="width: 100%">
        <ul class="list-group list-group-horizontal" style="width: 100%; justify-content: space-around">
            <li class="list-group-item" style="border: none">
                <div>
                    <a href="index.jsp"><img src="image/logo.png" alt="Logo" width="50" height="50"></a>
                </div>
            </li>
            <li class="list-group-item" style="border: none">
                <form>
                    <input type="text" placeholder="Tìm kiếm">
                    <button type="submit" class="btn btn-primary" style="height: 30px">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </li>
            <li class="list-group-item" style="border: none">
                <span style="">
                    <a href="/login">
                        <button style="padding: 0; border: none; background: none; color: blue">Đăng nhập</button>
                    </a>
                </span>
            </li>
            <li class="list-group-item" style="border: none">
                <span style="">
                    <a href="/register">
                        <button style="padding: 0; border: none; background: none; color: blue">Đăng kí</button>
                    </a>
                </span>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-2">
        <ul class="list-group">
            <li class="list-group-item"><b>Danh mục</b></li>
            <li class="list-group-item">
                <span style="color: blue">
                    <button style="padding: 0; border: none; background: none"> Tất cả</button>
                </span>
            </li>
            <li class="list-group-item">
                <span style="color: blue">
                    <button style="padding: 0; border: none; background: none">Bánh ngọt</button>
                </span>
            </li>
            <li class="list-group-item">
                <span style="color: blue">
                    <button style="padding: 0; border: none; background: none">Bánh bông lan</button>
                </span>
            </li>
            <li class="list-group-item">
                <span style="color: blue">
                    <button style="padding: 0; border: none; background: none">Bánh mì</button>
                </span>
            </li>
            <li class="list-group-item">
                <span style="color: blue">
                    <button style="padding: 0; border: none; background: none">Bánh mặn</button>
                </span>
            </li>
        </ul>
    </div>
    <div class="col-10">
        <div class="content-three"
             style="padding: 10px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 10px 5px; border-radius: 10px; margin-top: 20px;">
            <div class="containerBook">
                <%
                    ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("productList");
                    if (productList == null) {
                %>
                <p>Không có dữ liệu</p>
                <%
                    }
                    for (int i = 0; i < productList.size(); i++) {

                %>
                <div class="wrapper">
                    <div class="thumbnail">
                        <img src="<%=productList.get(i).getUrlImage()%>" alt="cover">
                    </div>
                    <div class="text"><%=productList.get(i).getNameProduct()%>
                    </div>
                    <div class="price"><%=productList.get(i).getPrice()%>&nbsp;₫</div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</div>
</body>
</html>
