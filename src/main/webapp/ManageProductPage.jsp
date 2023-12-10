<%@ page import="Model.BEAN.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.BEAN.Product" %>
<%@ page import="Model.BEAN.Category" %><%--
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



    </script>
    <script>
        const check = () =>
        {
            var listNameCategory = <%=request.getAttribute("listNameCategory")%>
                console.log(listNameCategory);
        }
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
    <form method="post" action = "/ManageProduct?action=filterProduct">
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label for="nameProduct">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="nameProduct"  name = "nameProduct" aria-describedby="emailHelp" placeholder="Nhập tên sản phẩm">
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label for="nameCategory">Tên loại hàng</label>
                    <input type="text" class="form-control" id="nameCategory" placeholder="Nhập tên loại hàng" name = "nameCategory">
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label for="priceSearch">Giá</label>
                    <input type="text" class="form-control" id="priceSearch" placeholder="Nhập giá" name = "priceSearch">
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

<div class="modal-addnew">
    <form action="/ManageProduct?action=handleAddNewProduct" method="post" enctype="multipart/form-data">
        <div class="row justify-content-end" style="margin: 10px 10px;">
            <div class="col-4 text-end">
                <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='/ManageProduct?action=getListProduct'">Xem danh sách</button>
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="check()">
                    <i class="fa-sharp fa-solid fa-plus" style="margin: 0px 5px;"></i>Thêm mới
                </button>

            </div>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm mới sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="InputNameProductAddNew" class="form-label">Tên sản phẩm</label>
                            <input type="text" class="form-control" id="InputNameProductAddNew"  name = "InputNameProductAddNew" aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                            <label for="InputCategoryAddNew" class="form-label">Loại sản phẩm</label>
                            <select class="form-select" aria-label="Default select example" id="InputCategoryAddNew" name="InputCategoryAddNew">
                                <%
                                    ArrayList<Category> listNameCategory = (ArrayList<Category>) request.getAttribute("listNameCategory");
                                    if (listNameCategory != null && !listNameCategory.isEmpty()) {
                                        for (int i = 0; i < listNameCategory.size(); i++) {
                                            Category category = listNameCategory.get(i);
                                %>
                                <option value="<%=category.getIdCategory()%>"><%=category.getNameCategory()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="InputPriceProductAddNew" class="form-label">Price</label>
                            <input type="number" class="form-control" id="InputPriceProductAddNew" name = "InputPriceProductAddNew">
                        </div>
                        <div class="input-group">
                            <input type="file" name = "imageAddNewImageProduct">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="div-Table">
    <table class="table">
        <tr class="table-light">
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Image</th>
            <th scope="col">Price</th>
            <th scope="col">Action</th>
        </tr>
        <%
            ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("listProduct");
            if (listProduct != null && !listProduct.isEmpty())
                for (int i = 0; i < listProduct.size(); i++) {
                    Product product = listProduct.get(i);
        %>
        <tr>
            <td><%= product.getIdProduct() %></td>
            <td><%= product.getNameProduct() %></td>
            <td><%= product.getIdCategory() %></td>
            <td>
                <div style="width: 70px;
        height: 40px;
        overflow: hidden;
        border-radius: 5px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);">
<%--                    <img style=" width: 100%;--%>
<%--         height: 100%;--%>
<%--        object-fit: cover;--%>
<%--        border-radius: 5px;" src="${pageContext.request.contextPath}/uploads/<%= product.getUrlImage()%>" alt="">--%>
                    <img style=" width: 100%;
         height: 100%;
        object-fit: cover;
        border-radius: 5px;" src="data:image/png;base64,<%= product.getUrlImage()%>" alt="">
                </div>
            </td>
            <td><%= product.getPrice() %></td>
            <td>
                <div class="modal-updateUser" style="display: flex;gap:10px;">
                    <form action="/ManageProduct?action=handleUpdateProduct&idProduct=<%= product.getIdProduct()%>" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-4">
                                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalUpdateUser<%= product.getIdProduct() %>">
                                    Update
                                </button>
                            </div>
                        </div>
                        <div class="modal fade" id="modalUpdateUser<%= product.getIdProduct() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="modalAddNewProductLabel">Update a product</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="InputProductIDUpdate" class="form-label">ID</label>
                                            <input type="text" class="form-control" id="InputProductIDUpdate" name = "InputProductIDUpdate" aria-describedby="emailHelp" value="<%= product.getIdProduct() %>" disabled>
                                        </div>
                                        <div class="mb-3">
                                            <label for="InputProductNameUpdate" class="form-label">Name</label>
                                            <input type="text" class="form-control" id="InputProductNameUpdate" name = "InputProductNameUpdate"  value="<%= product.getNameProduct() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="InputProductCategoryUpdate" class="form-label">Loại sản phẩm</label>
                                            <select class="form-select" aria-label="Default select example" id="InputProductCategoryUpdate" name="InputProductCategoryUpdate">
                                                <%
                                                    ArrayList<Category> listNameCategoryUpdate = (ArrayList<Category>) request.getAttribute("listNameCategory");
                                                    if (listNameCategoryUpdate != null && !listNameCategoryUpdate.isEmpty()) {
                                                        for (int j = 0; j < listNameCategoryUpdate.size(); j++) {
                                                            Category category = listNameCategoryUpdate.get(j);
                                                %>
                                                <option value="<%= category.getIdCategory() %>" <%= category.getIdCategory().equals(product.getIdCategory()) ? "selected" : "" %>><%= category.getNameCategory() %></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="input-group">
                                            <input type="file" name = "image">
                                        </div>
                                        <div class="mb-3">
                                            <label for="InputPriceProductUpdate" class="form-label">Phone Number</label>
                                            <input type="number" class="form-control" id="InputPriceProductUpdate" name = "InputPriceProductUpdate" value="<%= product.getPrice() %>">
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary" value = "Upload">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <button style="height:31px;" type="button" class="btn btn-danger btn-sm" onclick="window.location.href='/ManageProduct?action=handleDeleteProduct&idProduct=<%= product.getIdProduct()%>'">Delete</button>
                </div>
            </td>
        </tr>
        <%
                }
        %>
    </table>

</div>
</body>
</html>
