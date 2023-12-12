package Controller.User;

import Model.BEAN.Product;
import Model.BEAN.User;
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
import java.util.Objects;

@WebServlet("/product")
public class DetailProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idProduct");
        Product product = ProductBO.getInstance().getProductById(id);
        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("productDetail.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (Objects.equals(action, "user")){
            HttpSession session = request.getSession(false);
            if (session != null) {
                // Lấy thông tin user từ session
                User user = (User) session.getAttribute("user");
                if (user != null) {
                    Gson gson = new GsonBuilder().create();
                    String userJSON = gson.toJson(user);

                    response.setContentType("application/json");
                    PrintWriter out = null;
                    try {
                        out = response.getWriter();
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                    out.print(userJSON);
                    out.flush();
                } else {
                    Gson gson = new GsonBuilder().create();
                    String userJSON = gson.toJson("User not found");
                    response.setContentType("application/json");
                    response.getWriter().write(userJSON);
                }
            } else {
                // Session không tồn tại, có thể yêu cầu đăng nhập
                Gson gson = new GsonBuilder().create();
                String userJSON = gson.toJson("User not found");
                response.setContentType("application/json");
                response.getWriter().write(userJSON);
            }
        }
    }
}
