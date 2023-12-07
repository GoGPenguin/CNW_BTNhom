package Controller.User;

import Model.BEAN.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = "/buy")
public class BuyProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Lấy thông tin user từ session
            User user = (User) session.getAttribute("user");
            if (user != null) {
                session.setAttribute("user", user);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("order.jsp");
                requestDispatcher.forward(request, response);
            } else {
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            }
        } else {
            // Session không tồn tại, có thể yêu cầu đăng nhập
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
