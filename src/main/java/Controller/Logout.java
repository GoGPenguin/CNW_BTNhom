package Controller;

import Model.BEAN.Product;
import Model.BO.CategoryBO;
import Model.BO.ProductBO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet("/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Trong servlet xử lý đăng xuất
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // hủy phiên
        }
        // Chuyển hướng đến trang đăng nhập hoặc trang chính
        response.sendRedirect("http://localhost:8080/login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
