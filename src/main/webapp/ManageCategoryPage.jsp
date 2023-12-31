<%@ page import="Model.BEAN.User" %>
<%@ page import="java.util.ArrayList" %>
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
    <form method="post" action = "/ManageCategory?action=filterCategory">
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="InputIDCategorySearch">Mã loại hàng</label>
                    <input type="text" class="form-control" id="InputIDCategorySearch"  name = "InputIDCategorySearch" aria-describedby="emailHelp" placeholder="Nhập mã loại hàng">
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="InputNameCategorySearch">Tên loại hàng</label>
                    <input type="text" class="form-control" id="InputNameCategorySearch" placeholder="Nhập tên loại hàng" name = "InputNameCategorySearch">
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
    <form action="/ManageCategory?action=handleAddNewCategory" method="post">
        <div class="row justify-content-end" style="margin: 10px 10px;">
            <div class="col-4 text-end">
                <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='/ManageCategory?action=getListCategory'">Xem danh sách</button>
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="fa-sharp fa-solid fa-plus" style="margin: 0px 5px;"></i>Thêm mới
                </button>

            </div>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm mới loại hàng</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="InputNameCategoryAddNew" class="form-label">Tên loại hàng</label>
                            <input type="text" class="form-control" id="InputNameCategoryAddNew"  name = "InputNameCategoryAddNew" aria-describedby="emailHelp">
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
            <th scope="col">FullName</th>
            <th scope="col">Action</th>
        </tr>
        <%
            ArrayList<Category> listCategory = (ArrayList<Category>) request.getAttribute("listCategory");
            if (listCategory != null && !listCategory.isEmpty())
                for (int i = 0; i < listCategory.size(); i++) {
                    Category category = listCategory.get(i);
        %>
        <tr>
            <td><%= category.getIdCategory() %></td>
            <td><%= category.getNameCategory() %></td>
            <td>
                <div class="modal-updateUser" style="display: flex;gap:10px;">
                    <form action="/ManageCategory?action=handleUpdateCategory&idCategory=<%= category.getIdCategory()%>" method="post">
                        <div class="row">
                            <div class="col-4">
                                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalUpdateUser<%= category.getIdCategory() %>">
                                    Update
                                </button>
                            </div>
                        </div>
                        <div class="modal fade" id="modalUpdateUser<%= category.getIdCategory() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="modalAddNewProductLabel">Update a category</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="InputIDCategoryUpdate" class="form-label">ID</label>
                                            <input type="text" class="form-control" id="InputIDCategoryUpdate" name = "InputIDCategoryUpdate" aria-describedby="emailHelp" value="<%= category.getIdCategory() %>" disabled>
                                        </div>
                                        <div class="mb-3">
                                            <label for="InputNameCategoryUpdate" class="form-label">Tên loại hàng</label>
                                            <input type="text" class="form-control" id="InputNameCategoryUpdate" name = "InputNameCategoryUpdate"  value="<%= category.getNameCategory() %>">
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
            </td>
        </tr>
        <%
                }
        %>
    </table>
</div>
</body>
</html>
