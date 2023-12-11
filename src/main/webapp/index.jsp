<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.BEAN.Product" %>
<%@ page import="Model.BEAN.User" %>
<%@ page import="Model.BEAN.Category" %>
<%@ page import="Model.BO.ProductBO" %>
<%@ page import="Model.BO.CategoryBO" %><%--
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
    <style>
        .list-group-item {
            transition: background-color 0.3s;
        }
        .list-group-item.active {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row d-flex" style="max-width: 100%">
    <div class="col-2" style="margin-top: 10px;">
        <ul class="list-group" style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 10px 5px;">
            <li class="list-group-item" style="text-align: center; border: 2px solid grey; border-top-left-radius: 10px;
                                                border-top-right-radius: 10px;">
                <b>Danh mục</b>
            </li>
            <li class="list-group-item" style=" border: 2px solid grey;">
                <span style="color: blue">
                    <button class="categoryBtn" style="padding: 0; border: none; background: none; width: 100%; height: 100%; "
                            onclick="filterProduct('All')">Tất cả
                    </button>
                </span>
            </li>
            <%
                ArrayList<Category> categoryList = (ArrayList<Category>) request.getAttribute("categoryList");
                if (categoryList == null) {
            %>
            <p>Không có dữ liệu</p>
            <%
            } else {
                for (int i = 0; i < categoryList.size() - 1; i++) {
            %>
            <li class="list-group-item" style=" border: 2px solid grey;">
                <span style="color: blue">
                    <button class="categoryBtn" style="padding: 0; border: none; background: none; width: 100%; height: 100%"
                            onclick="filterProduct('<%=categoryList.get(i).getIdCategory()%>')">
                        <%=categoryList.get(i).getNameCategory()%>
                    </button>
                </span>
            </li>
            <%
                }
                Category category = categoryList.get(categoryList.size() - 1);
            %>
            <li class="list-group-item" style=" border: 2px solid grey; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                <span style="color: blue;">
                    <button class="categoryBtn" style="padding: 0; border: none; background: none; width: 100%; height: 100%"
                            onclick="filterProduct('<%=category.getIdCategory()%>')">
                        <%=category.getNameCategory()%>
                    </button>
                </span>
            </li>
            <%
                }
            %>
        </ul>
    </div>
    <div class="col-9">
        <div class="content-three"
             style="padding: 10px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 10px 5px; border-radius: 10px; margin-top: 20px;">
            <div class="containerBook" id="productList" style="justify-content: flex-start;">
                <%
                    ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("productList");
                    if (productList == null) {
                %>
                <p>Không có dữ liệu</p>
                <%
                } else {
                    for (int i = 0; i < productList.size(); i++) {
                %>
                <div class="wrapper">
                    <a href="/product?idProduct=<%=productList.get(i).getIdProduct()%>"
                       style="color: black; text-decoration: none">
                        <div class="thumbnail">
                            <img src="data:image/png;base64,<%=productList.get(i).getUrlImage()%>" alt="cover">
                        </div>
                        <div class="text fw-bold"><%=productList.get(i).getNameProduct()%>
                        </div>
                        <div class="price"><%=productList.get(i).getPrice()%>&nbsp;₫</div>
                    </a>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
    <div class="col-1"></div>
</div>
</body>
<script src="js/filterProduct.js"></script>
</html>
