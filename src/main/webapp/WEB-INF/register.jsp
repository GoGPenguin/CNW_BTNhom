<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 05/12/2023
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Đăng ký</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="../css/css.css">
</head>
<body>
<div id="root">
    <div class="register-container">
        <div class="div-register">
            <div class="title">Đăng Ký</div>
            <hr>
            <form method="post" action="/register" autocomplete="off">
                <p>
                    <label for="username">Username <span class="text-danger">(*)</span></label>
                    <input type="text" class="form-control" name="username" id="username"
                           style="width: 100%; height: 30px"
                           oninput="emptyRegisterUsername()">
                </p>
                <span id="errorUsername" class="text-danger"></span>
                <p>
                    <label for="password">Tên người dùng <span class="text-danger">(*)</span></label>
                    <input type="text" class="form-control" name="nameUser" id="nameUser" style="width: 100%; height: 30px"
                           oninput="emptyRegisterNameUser()">
                </p>
                <span id="errorNameUser" class="text-danger"></span>
                <p>
                    <label for="phoneNum">Số điện thoại <span class="text-danger">(*)</span></label>
                    <input type="text" class="form-control" name="phoneNum" id="phoneNum" style="width: 100%; height: 30px"
                           oninput="emptyRegisterPhoneNum()">
                </p>
                <span id="errorPhoneNum" class="text-danger"></span>
                <p>
                    <label for="address">Địa chỉ <span class="text-danger">(*)</span></label>
                    <input type="text" class="form-control" name="address" id="address" style="width: 100%; height: 30px"
                           oninput="emptyRegisterAddress()">
                </p>
                <span id="errorAddress" class="text-danger"></span>
                <p>
                    <label for="password">Password <span class="text-danger">(*)</span></label>
                    <input type="text" class="form-control" name="password" id="password" style="width: 100%; height: 30px"
                           oninput="emptyRegisterPassword(); checkPassword()">
                </p>
                <span id="errorPassword" class="text-danger"></span>
                <p>
                    <label for="confirmPassword">Xác nhận mật khẩu <span class="text-danger">(*)</span></label>
                    <input type="text" class="form-control" name="confirmPassword" id="confirmPassword"
                           style="width: 100%; height: 30px"
                           oninput="emptyRegisterConfirmPassword(); checkPassword()">
                </p>
                <span id="errorConfirmPassword" class="text-danger"></span>
                <% String error = (String) request.getAttribute("error");
                    if (error != null) {%>
                <span id="error" class="text-danger"><%=error%></span>
                <%}%>
                <button type="submit" class="btn btn-primary" style="width: 100%" id="registerBtn">Đăng ký</button>
            </form>
            <div class="div-Or"><span>OR</span></div>
            <div class="register-footer">Bạn đã có tài khoản?
                <span><a href="/login">Đăng nhập ngay</a></span>
                <a href="/">
                    <button class="btn btn-primary">Quay lại trang chủ</button>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function checkPassword() {
        let password = document.getElementById("password").value;
        let confirmPassword = document.getElementById("confirmPassword").value;
        if (password !== confirmPassword && confirmPassword !== "") {
            document.getElementById("errorConfirmPassword").innerHTML = "Mật khẩu phải trùng với xác nhận mật khẩu!";
            document.getElementById("registerBtn").disabled = true;
        } else if (password === confirmPassword  && confirmPassword !== ""){
            document.getElementById("errorConfirmPassword").innerHTML = "";
            document.getElementById("registerBtn").disabled = false;
        }
    }
    function emptyRegisterUsername() {
        let username = document.getElementById("username").value;
        if (username === "") {
            document.getElementById("errorUsername").innerHTML = "Chưa nhập username!";
            document.getElementById("registerBtn").disabled = true;
        }
        else {
            document.getElementById("errorUsername").innerHTML = "";
            document.getElementById("registerBtn").disabled = false;
        }
    }
    function emptyRegisterNameUser(){
        let nameUser = document.getElementById("nameUser").value;
        if (nameUser === "") {
            document.getElementById("errorNameUser").innerHTML = "Chưa nhập tên người dùng!";
            document.getElementById("registerBtn").disabled = true;
        } else {
            document.getElementById("errorNameUser").innerHTML = "";
            document.getElementById("registerBtn").disabled = false;
        }
    }
    function emptyRegisterPhoneNum(){
        let phoneNum = document.getElementById("phoneNum").value;
        if (phoneNum === "") {
            document.getElementById("errorPhoneNum").innerHTML = "Chưa nhập số điện thoại!";
            document.getElementById("registerBtn").disabled = true;
        } else {
            document.getElementById("errorPhoneNum").innerHTML = "";
            document.getElementById("registerBtn").disabled = false;
        }
    }
    function emptyRegisterAddress(){
        let address = document.getElementById("address").value;
        if (address === "") {
            document.getElementById("errorAddress").innerHTML = "Chưa nhập địa chỉ!";
            document.getElementById("registerBtn").disabled = true;
        } else {
            document.getElementById("errorAddress").innerHTML = "";
            document.getElementById("registerBtn").disabled = false;
        }
    }
    function emptyRegisterPassword(){
        let password = document.getElementById("password").value;
        if (password === "") {
            document.getElementById("errorPassword").innerHTML = "Chưa nhập mật khẩu!";
            document.getElementById("registerBtn").disabled = true;
        } else {
            document.getElementById("errorPassword").innerHTML = "";
            document.getElementById("registerBtn").disabled = false;
        }
    }
    function emptyRegisterConfirmPassword(){
        let confirmPassword = document.getElementById("confirmPassword").value;
        if (confirmPassword === "") {
            document.getElementById("errorConfirmPassword").innerHTML = "Chưa nhập xác nhận mật khẩu!";
            document.getElementById("registerBtn").disabled = true;
        } else {
            document.getElementById("errorConfirmPassword").innerHTML = "";
            document.getElementById("registerBtn").disabled = false;
        }
    }
</script>
</html>
