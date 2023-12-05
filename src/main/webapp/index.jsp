<%@ page import="Model.BEAN.Product" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/5/2023
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
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
            <%--            <div class="ant-tabs-content-holder">--%>
            <%--                <div class="ant-tabs-content ant-tabs-content-top">--%>
            <%--                    <div id="rc-tabs-1-panel-&amp;sort=-sold" role="tabpanel" tabindex="0"--%>
            <%--                         aria-labelledby="rc-tabs-1-tab-&amp;sort=-sold" aria-hidden="false"--%>
            <%--                         class="ant-tabs-tabpane ant-tabs-tabpane-active"></div>--%>
            <%--                    <div id="rc-tabs-1-panel-&amp;sort=updateAt" role="tabpanel" tabindex="-1"--%>
            <%--                         aria-labelledby="rc-tabs-1-tab-&amp;sort=updateAt" aria-hidden="true"--%>
            <%--                         class="ant-tabs-tabpane ant-tabs-tabpane-hidden"></div>--%>
            <%--                    <div id="rc-tabs-1-panel-&amp;sort=price" role="tabpanel" tabindex="-1"--%>
            <%--                         aria-labelledby="rc-tabs-1-tab-&amp;sort=price" aria-hidden="true"--%>
            <%--                         class="ant-tabs-tabpane ant-tabs-tabpane-hidden"></div>--%>
            <%--                    <div id="rc-tabs-1-panel-&amp;sort=-price" role="tabpanel" tabindex="-1"--%>
            <%--                         aria-labelledby="rc-tabs-1-tab-&amp;sort=-price" aria-hidden="true"--%>
            <%--                         class="ant-tabs-tabpane ant-tabs-tabpane-hidden"></div>--%>
            <%--                </div>--%>
            <%--            </div>--%>

            <div class="containerBook">
                <%
                    ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("productList");
                    for (int i = 0; i < productList.size(); i++){

                %>
                <div class="wrapper">
                    <div class="thumbnail">
                        <img src="<%=productList.get(i).getUrlImage()%>>" alt="cover">
                    </div>
                    <div class="text"><%=productList.get(i).getNameProduct()%></div>
                    <div class="price"><%=productList.get(i).getPrice()%>>&nbsp;₫</div>
                </div>
                <%}%>
                <%--                <div class="wrapper">--%>
                <%--                    <div class="thumbnail">--%>
                <%--                        <img src="/image/bánh%20mặn.jpg" alt="cover">--%>
                <%--                    </div>--%>
                <%--                    <div class="text">Bánh mặn</div>--%>
                <%--                    <div class="price">10.000&nbsp;₫<span>51</span></div>--%>
                <%--                </div>--%>
                <%--                <div class="wrapper">--%>
                <%--                    <div class="thumbnail">--%>
                <%--                        <img src="/image/bánh%20ngọt.jpg" alt="Cover">--%>
                <%--                    </div>--%>
                <%--                    <div class="text">Bánh ngọt</div>--%>

                <%--                    <div class="price">40.000&nbsp;₫<span>29</span></div>--%>
                <%--                </div>--%>
                <%--                <div class="wrapper">--%>
                <%--                    <div class="thumbnail">--%>
                <%--                        <img src="/image/bánh%20kem.jpg" alt="Cover">--%>
                <%--                    </div>--%>
                <%--                    <div class="text">Bánh kem</div>--%>
                <%--                    <div class="price">100.000&nbsp;₫<span>20</span></div>--%>
                <%--                </div>--%>
                <%--                <div class="wrapper">--%>
                <%--                    <div class="thumbnail">--%>
                <%--                        <img src="/image/bánh%20mì.jpg" alt="Cover">--%>
                <%--                    </div>--%>
                <%--                    <div class="text">Bánh mì</div>--%>
                <%--                    <div class="price">10.000&nbsp;₫<span>17</span></div>--%>
                <%--                </div>--%>
                <%--                <div class="wrapper">--%>
                <%--                    <div class="thumbnail">--%>
                <%--                        <img src="/image/bánh%20bông%20lan.jpg" alt="Cover">--%>
                <%--                    </div>--%>
                <%--                    <div class="text">Bánh bông lan</div>--%>
                <%--                    <div class="price">20.000&nbsp;₫<span>17</span></div>--%>
                <%--                </div>--%>
                <%--            </div>--%>
                <%--            <div style="display: flex; justify-content: center;">--%>
                <%--                <ul class="ant-pagination css-mxhywb list-group list-group-horizontal" style="padding: 20px 0 10px;">--%>
                <%--                    <li title="Previous Page" class="list-group-item ant-pagination-prev ant-pagination-disabled"--%>
                <%--                        aria-disabled="true">--%>
                <%--                        <button class="ant-pagination-item-link" type="button" tabindex="-1" disabled=""><span--%>
                <%--                                role="img" aria-label="left" class="anticon anticon-left"><svg viewBox="64 64 896 896"--%>
                <%--                                                                                               focusable="false"--%>
                <%--                                                                                               data-icon="left"--%>
                <%--                                                                                               width="1em" height="1em"--%>
                <%--                                                                                               fill="currentColor"--%>
                <%--                                                                                               aria-hidden="true"><path--%>
                <%--                                d="M724 218.3V141c0-6.7-7.7-10.4-12.9-6.3L260.3 486.8a31.86 31.86 0 000 50.3l450.8 352.1c5.3 4.1 12.9.4 12.9-6.3v-77.3c0-4.9-2.3-9.6-6.1-12.6l-360-281 360-281.1c3.8-3 6.1-7.7 6.1-12.6z"></path></svg></span>--%>
                <%--                        </button>--%>
                <%--                    </li>--%>
                <%--                    <li title="1" class="list-group-item"--%>
                <%--                        tabindex="0"><a rel="nofollow">1</a></li>--%>
                <%--                    <li title="2" class="list-group-item ant-pagination-item ant-pagination-item-2" tabindex="0"><a--%>
                <%--                            rel="nofollow">2</a>--%>
                <%--                    </li>--%>
                <%--                    <li title="3" class=" list-group-item ant-pagination-item ant-pagination-item-3" tabindex="0"><a--%>
                <%--                            rel="nofollow">3</a>--%>
                <%--                    </li>--%>
                <%--                    <li title="Next Page" class="list-group-item ant-pagination-next" aria-disabled="false"--%>
                <%--                        tabindex="0">--%>
                <%--                        <button class="ant-pagination-item-link" type="button" tabindex="-1"><span role="img"--%>
                <%--                                                                                                   aria-label="right"--%>
                <%--                                                                                                   class="anticon anticon-right"><svg--%>
                <%--                                viewBox="64 64 896 896" focusable="false" data-icon="right" width="1em" height="1em"--%>
                <%--                                fill="currentColor" aria-hidden="true"><path--%>
                <%--                                d="M765.7 486.8L314.9 134.7A7.97 7.97 0 00302 141v77.3c0 4.9 2.3 9.6 6.1 12.6l360 281.1-360 281.1c-3.9 3-6.1 7.7-6.1 12.6V883c0 6.7 7.7 10.4 12.9 6.3l450.8-352.1a31.96 31.96 0 000-50.4z"></path></svg></span>--%>
                <%--                        </button>--%>
                <%--                    </li>--%>
                <%--                </ul>--%>
                <%--            </div>--%>
            </div>
        </div>
    </div>
</div>

</body>
</html>
