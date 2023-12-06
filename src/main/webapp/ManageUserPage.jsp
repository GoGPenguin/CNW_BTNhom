<%@ page import="Model.BEAN.User" %>
<%@ page import="java.util.ArrayList" %><%--
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
            <div style="display: flex;align-items: center;justify-content: flex-end; padding: 5px 10px;">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Welcome, I'm Admin
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
<div class="div-Search">
    <form method="post" action = "/ManageUser?action=filterUser">
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label for="exampleInputEmail1">Email</label>
                    <input type="text" class="form-control" id="exampleInputEmail1"  name = "exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label for="exampleInputName1">Name</label>
                    <input type="text" class="form-control" id="exampleInputName1" placeholder="Enter fullname" name = "exampleInputName1">
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label for="exampleInputSDT">Số điện thoại</label>
                    <input type="text" class="form-control" id="exampleInputSDT" placeholder="Enter phonenumber" name = "exampleInputSDT">
                </div>
            </div>
        </div>
        <div class="row justify-content-end" style="margin: 15px 0px 5px 0px;">
            <div class="col-4 text-end">
                <button type="submit" class="btn btn-primary btn-sm">Search</button>
                <button type="submit" class="btn btn-primary btn-sm">Reset</button>
            </div>
        </div>
    </form>
</div>

<div class="modal-addnew">
    <form action="/ManageUser?action=handleAddNewUser" method="post">
        <div class="row justify-content-end" style="margin: 10px 10px;">
            <div class="col-4 text-end">
                <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='/ManageUser?action=getListUser'">Xem danh sách</button>
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="fa-sharp fa-solid fa-plus" style="margin: 0px 5px;"></i>Thêm mới
                </button>

            </div>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm mới user</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="InputEmailAddNew" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="InputEmailAddNew"  name = "InputEmailAddNew" aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                            <label for="InputPasswordAddNew" class="form-label">Password</label>
                            <input type="password" class="form-control" id="InputPasswordAddNew" name = "InputPasswordAddNew">
                        </div>
                        <div class="mb-3">
                            <label for="InputFullNameAddNew" class="form-label">FullName</label>
                            <input type="text" class="form-control" id="InputFullNameAddNew" name = "InputFullNameAddNew">
                        </div>
                        <div class="mb-3">
                            <label for="InputPhoneNumberAddNew" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" id="InputPhoneNumberAddNew" name = "InputPhoneNumberAddNew">
                        </div>
                        <div class="mb-3">
                            <label for="InputAddressAddNew" class="form-label">Address</label>
                            <input type="text" class="form-control" id="InputAddressAddNew" name = "InputAddressAddNew">
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
            <th scope="col">Email</th>
            <th scope="col">Password</th>
            <th scope="col">Phone</th>
            <th scope="col">Address</th>
            <th scope="col">Action</th>
        </tr>
        <%
            ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");
            if (listUser != null && !listUser.isEmpty())
                for (int i = 0; i < listUser.size(); i++) {
                    User user = listUser.get(i);
        %>
        <tr>
            <td><%= user.getIdUser() %></td>
            <td><%= user.getNameUser() %></td>
            <td><%= user.getUsername() %></td>
            <td><%= user.getPassword() %></td>
            <td><%= user.getPhoneUser() %></td>
            <td><%= user.getAddressUser() %></td>
            <td>
                <div class="modal-updateUser" style="display: flex;gap:10px;">
                    <form action="/ManageUser?action=handleUpdateUser&ID=<%= user.getIdUser()%>" method="post">
                        <div class="row">
                            <div class="col-4">
                                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalUpdateUser<%= user.getIdUser() %>">
                                    Update
                                </button>
                            </div>
                        </div>
                        <div class="modal fade" id="modalUpdateUser<%= user.getIdUser() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="modalAddNewProductLabel">Update a user</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="InputEmailUpdate" class="form-label">Email address</label>
                                            <input type="text" class="form-control" id="InputEmailUpdate" name = "InputEmailUpdate" aria-describedby="emailHelp" value="<%= user.getUsername() %>" disabled>
                                        </div>
                                        <div class="mb-3">
                                            <label for="InputPasswordUpdate" class="form-label">Password</label>
                                            <input type="text" class="form-control" id="InputPasswordUpdate" name = "InputPasswordUpdate"  value="<%= user.getPassword() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="InputFullNameUpdate" class="form-label">FullName</label>
                                            <input type="text" class="form-control" id="InputFullNameUpdate" name = "InputFullNameUpdate" value="<%= user.getNameUser() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="InputPhoneNumberUpdate" class="form-label">Phone Number</label>
                                            <input type="text" class="form-control" id="InputPhoneNumberUpdate" name = "InputPhoneNumberUpdate" value="<%= user.getPhoneUser() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="InputAddressUpdate" class="form-label">Address</label>
                                            <input type="text" class="form-control" id="InputAddressUpdate" name = "InputAddressUpdate" value="<%= user.getAddressUser() %>">
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
                    <button style="height:31px;" type="button" class="btn btn-danger btn-sm" onclick="window.location.href='/ManageUser?action=handleDeleteUser&ID=<%= user.getIdUser()%>'">Delete</button>
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
