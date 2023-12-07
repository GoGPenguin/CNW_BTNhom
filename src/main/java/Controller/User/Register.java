package Controller.User;

import Model.BEAN.User;
import Model.BO.UserBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameUser = request.getParameter("nameUser");
        String phoneNum = request.getParameter("phoneNum");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = UserBO.getInstance().getUserByUsername(username);
        if (user != null){
            request.setAttribute("error", "Tên đăng nhập đã tồn tại!");
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
        } else {
            UserBO.getInstance().addUser(nameUser, phoneNum, address, username, password);
            response.sendRedirect("http://localhost:8080/login");
        }
    }
}
