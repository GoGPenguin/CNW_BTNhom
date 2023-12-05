<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 05/12/2023
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Đăng nhập</title>
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
    <div class="login-container">
        <div class="div-login">
            <div class="title">Đăng Nhập</div>
            <hr>
            <form method="post" action="/login">
                <label for="email">Email</label>
                <input type="text" name="email" id="email" style="width: 100%">
                <br><br>
                <label for="password">Password</label>
                <input type="password" name="email" id="password" style="width: 100%">
                <br><br>
                <button type="submit" class="btn btn-primary" style="width: 100%">Đăng nhập</button>
            </form>
            <div class="div-Or"><span>OR</span></div>
            <div class="login-footer">Bạn chưa có tài khoản?
                <span><a href="/register">Đăng ký ngay</a></span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
