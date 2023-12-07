package Controller;


import Model.BEAN.Admin;
import Model.BEAN.User;
import Model.BO.CategoryBO;
import Model.BO.LoginBO;
import Model.BO.ProductBO;
import Ultilities.Role;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Objects;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()){
            try {
                request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
                return;
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

        Object object = LoginBO.getInstance().checkLogin(username, password);
        if (object instanceof User) {
            User user = (User) object;
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            request.setAttribute("categoryList", CategoryBO.getInstance().getAllCategory());
            request.setAttribute("productList", ProductBO.getInstance().getAllProduct());
            response.sendRedirect("http://localhost:8080/");
        } else if (object instanceof Admin) {
            Admin admin = (Admin) object;
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("HomepageAdmin.jsp");
        } else {
            try {
                request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
