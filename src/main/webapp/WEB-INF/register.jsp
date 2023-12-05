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
            <form id="basic" autocomplete="off" class="ant-form ant-form-vertical css-mxhywb" style="max-width: 600px;">
                <div class="ant-form-item css-mxhywb">
                    <div class="ant-row ant-form-item-row css-mxhywb">
                        <div class="ant-col ant-col-8 ant-form-item-label css-mxhywb"><label for="basic_Fullname"
                                                                                             class="ant-form-item-required"
                                                                                             title="Fullname">Fullname</label>
                        </div>
                        <div class="ant-col ant-col-24 ant-form-item-control css-mxhywb">
                            <div class="ant-form-item-control-input">
                                <div class="ant-form-item-control-input-content"><input id="basic_Fullname"
                                                                                        aria-required="true"
                                                                                        class="ant-input css-mxhywb"
                                                                                        type="text" value=""></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-form-item css-mxhywb">
                    <div class="ant-row ant-form-item-row css-mxhywb">
                        <div class="ant-col ant-col-8 ant-form-item-label css-mxhywb"><label for="basic_Email"
                                                                                             class="ant-form-item-required"
                                                                                             title="Email">Email</label>
                        </div>
                        <div class="ant-col ant-col-24 ant-form-item-control css-mxhywb">
                            <div class="ant-form-item-control-input">
                                <div class="ant-form-item-control-input-content"><input id="basic_Email"
                                                                                        aria-required="true"
                                                                                        class="ant-input css-mxhywb"
                                                                                        type="text" value=""></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-form-item css-mxhywb">
                    <div class="ant-row ant-form-item-row css-mxhywb">
                        <div class="ant-col ant-col-8 ant-form-item-label css-mxhywb"><label for="basic_password"
                                                                                             class="ant-form-item-required"
                                                                                             title="Password">Password</label>
                        </div>
                        <div class="ant-col ant-col-24 ant-form-item-control css-mxhywb">
                            <div class="ant-form-item-control-input">
                                <div class="ant-form-item-control-input-content"><span
                                        class="ant-input-affix-wrapper ant-input-password css-mxhywb"><input
                                        id="basic_password" aria-required="true" type="password"
                                        class="ant-input css-mxhywb"><span class="ant-input-suffix"><span role="img"
                                                                                                          aria-label="eye-invisible"
                                                                                                          tabindex="-1"
                                                                                                          class="anticon anticon-eye-invisible ant-input-password-icon"><svg
                                        viewBox="64 64 896 896" focusable="false" data-icon="eye-invisible" width="1em"
                                        height="1em" fill="currentColor" aria-hidden="true"><path
                                        d="M942.2 486.2Q889.47 375.11 816.7 305l-50.88 50.88C807.31 395.53 843.45 447.4 874.7 512 791.5 684.2 673.4 766 512 766q-72.67 0-133.87-22.38L323 798.75Q408 838 512 838q288.3 0 430.2-300.3a60.29 60.29 0 000-51.5zm-63.57-320.64L836 122.88a8 8 0 00-11.32 0L715.31 232.2Q624.86 186 512 186q-288.3 0-430.2 300.3a60.3 60.3 0 000 51.5q56.69 119.4 136.5 191.41L112.48 835a8 8 0 000 11.31L155.17 889a8 8 0 0011.31 0l712.15-712.12a8 8 0 000-11.32zM149.3 512C232.6 339.8 350.7 258 512 258c54.54 0 104.13 9.36 149.12 28.39l-70.3 70.3a176 176 0 00-238.13 238.13l-83.42 83.42C223.1 637.49 183.3 582.28 149.3 512zm246.7 0a112.11 112.11 0 01146.2-106.69L401.31 546.2A112 112 0 01396 512z"></path><path
                                        d="M508 624c-3.46 0-6.87-.16-10.25-.47l-52.82 52.82a176.09 176.09 0 00227.42-227.42l-52.82 52.82c.31 3.38.47 6.79.47 10.25a111.94 111.94 0 01-112 112z"></path></svg></span></span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-form-item css-mxhywb">
                    <div class="ant-row ant-form-item-row css-mxhywb">
                        <div class="ant-col ant-col-8 ant-form-item-label css-mxhywb"><label
                                for="basic_Telephone_number" class="ant-form-item-required" title="Phone">Phone</label>
                        </div>
                        <div class="ant-col ant-col-24 ant-form-item-control css-mxhywb">
                            <div class="ant-form-item-control-input">
                                <div class="ant-form-item-control-input-content"><input id="basic_Telephone_number"
                                                                                        aria-required="true"
                                                                                        class="ant-input css-mxhywb"
                                                                                        type="text" value=""></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-form-item css-mxhywb">
                    <div class="ant-row ant-form-item-row css-mxhywb">
                        <div class="ant-col ant-col-16 ant-form-item-control css-mxhywb">
                            <div class="ant-form-item-control-input">
                                <div class="ant-form-item-control-input-content">
                                    <button type="submit" class="ant-btn css-mxhywb ant-btn-primary"
                                            style="height: 35px;"><span>Sign up</span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="div-Or"><span>OR</span></div>
            <div class="register-footer">Bạn đã có tài khoản?
                <span><a href="/login">Đăng nhập ngay</a></span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
