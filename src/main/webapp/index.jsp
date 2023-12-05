<%--
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
    <div>
        <ul class="list-group list-group-horizontal">
            <li class="list-group-item">
                <div>
                    <a href="index.jsp"><img src="image/logo.png" alt="Logo" width="50" height="50"></a>
                </div>
            </li>
            <li class="list-group-item">
                <form>
                    <input type="text" placeholder="Tìm kiếm">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </li>
            <li>
                <span></span>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-2">
        <ul class="list-group">
            <li class="list-group-item"><b>Danh mục</b></li>
            <li class="list-group-item">
                <span style="color: blue"><button class="">Tất cả</button></span>
            </li>
            <li class="list-group-item">
                <span>Nghệ thuật</span>
            </li>
            <li class="list-group-item">
                <span>Kinh doanh</span>
            </li>
            <li class="list-group-item">
                <span>Truyện tranh</span>
            </li>
            <li class="list-group-item">
                <span>Thể thao</span>
            </li>
        </ul>
    </div>
    <div class="col-10">
        <div class="content-three"
             style="padding: 10px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 10px 5px; border-radius: 10px; margin-top: 20px;">
                <div class="ant-tabs-content-holder">
                    <div class="ant-tabs-content ant-tabs-content-top">
                        <div id="rc-tabs-1-panel-&amp;sort=-sold" role="tabpanel" tabindex="0"
                             aria-labelledby="rc-tabs-1-tab-&amp;sort=-sold" aria-hidden="false"
                             class="ant-tabs-tabpane ant-tabs-tabpane-active"></div>
                        <div id="rc-tabs-1-panel-&amp;sort=updateAt" role="tabpanel" tabindex="-1"
                             aria-labelledby="rc-tabs-1-tab-&amp;sort=updateAt" aria-hidden="true"
                             class="ant-tabs-tabpane ant-tabs-tabpane-hidden"></div>
                        <div id="rc-tabs-1-panel-&amp;sort=price" role="tabpanel" tabindex="-1"
                             aria-labelledby="rc-tabs-1-tab-&amp;sort=price" aria-hidden="true"
                             class="ant-tabs-tabpane ant-tabs-tabpane-hidden"></div>
                        <div id="rc-tabs-1-panel-&amp;sort=-price" role="tabpanel" tabindex="-1"
                             aria-labelledby="rc-tabs-1-tab-&amp;sort=-price" aria-hidden="true"
                             class="ant-tabs-tabpane ant-tabs-tabpane-hidden"></div>
                    </div>
                </div>
            </div>
            <div class="containerBook">
                <div class="wrapper">
                    <div class="thumbnail">
                        <img src="https://bookstore-2dvw.onrender.com/images/book/15-afa213ab31cefd06d49b977a2f4ab594.jpg" alt="cover">
                    </div>
                    <div class="text">Truyện Tranh Đam Mỹ - Làm Dâu Nhà Sói - Hana Inu</div>
                    <div class="price">52.000&nbsp;₫<span>51</span></div>
                </div>
                <div class="wrapper">
                    <div class="thumbnail">
                        <img src="https://bookstore-2dvw.onrender.com/images/book/11-dc801dd2a968c1a43ec9270728555fbe.jpg" alt="Cover">
                    </div>
                    <div class="text">Tự Học Nhạc Lý Cơ Bản</div>

                    <div class="price">60.000&nbsp;₫<span>29</span></div>
                </div>
                <div class="wrapper">
                    <div class="thumbnail">
                        <img src="https://bookstore-2dvw.onrender.com/images/book/3-931186dd6dcd231da1032c8220332fea.jpg" alt="Cover">
                    </div>
                    <div class="text">Tư Duy Về Tiền Bạc - Những Lựa Chọn Tài Chính Đúng Đắn Và Sáng Suốt Hơn</div>
                    <div class="price">70.000&nbsp;₫<span>20</span></div>
                </div>
                <div class="wrapper">
                    <div class="thumbnail">
                        <img src="https://bookstore-2dvw.onrender.com/images/book/1-5e81d7f66dada42752efb220d7b2956c.jpg" alt="Cover">
                    </div>
                    <div class="text">Tiền Đẻ Ra Tiền: Đầu Tư Tài Chính Thông Minh</div>
                    <div class="price">80.000&nbsp;₫<span>17</span></div>
                </div>
            </div>
            <div style="display: flex; justify-content: center;">
                <ul class="ant-pagination css-mxhywb list-group list-group-horizontal" style="padding: 20px 0px 10px;">
                    <li title="Previous Page" class="list-group-item ant-pagination-prev ant-pagination-disabled" aria-disabled="true">
                        <button class="ant-pagination-item-link" type="button" tabindex="-1" disabled=""><span
                                role="img" aria-label="left" class="anticon anticon-left"><svg viewBox="64 64 896 896"
                                                                                               focusable="false"
                                                                                               data-icon="left"
                                                                                               width="1em" height="1em"
                                                                                               fill="currentColor"
                                                                                               aria-hidden="true"><path
                                d="M724 218.3V141c0-6.7-7.7-10.4-12.9-6.3L260.3 486.8a31.86 31.86 0 000 50.3l450.8 352.1c5.3 4.1 12.9.4 12.9-6.3v-77.3c0-4.9-2.3-9.6-6.1-12.6l-360-281 360-281.1c3.8-3 6.1-7.7 6.1-12.6z"></path></svg></span>
                        </button>
                    </li>
                    <li title="1" class="list-group-item"
                        tabindex="0"><a rel="nofollow">1</a></li>
                    <li title="2" class="list-group-item ant-pagination-item ant-pagination-item-2" tabindex="0"><a rel="nofollow">2</a>
                    </li>
                    <li title="3" class=" list-group-item ant-pagination-item ant-pagination-item-3" tabindex="0"><a rel="nofollow">3</a>
                    </li>
                    <li title="Next Page" class="list-group-item ant-pagination-next" aria-disabled="false" tabindex="0">
                        <button class="ant-pagination-item-link" type="button" tabindex="-1"><span role="img"
                                                                                                   aria-label="right"
                                                                                                   class="anticon anticon-right"><svg
                                viewBox="64 64 896 896" focusable="false" data-icon="right" width="1em" height="1em"
                                fill="currentColor" aria-hidden="true"><path
                                d="M765.7 486.8L314.9 134.7A7.97 7.97 0 00302 141v77.3c0 4.9 2.3 9.6 6.1 12.6l360 281.1-360 281.1c-3.9 3-6.1 7.7-6.1 12.6V883c0 6.7 7.7 10.4 12.9 6.3l450.8-352.1a31.96 31.96 0 000-50.4z"></path></svg></span>
                        </button>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
