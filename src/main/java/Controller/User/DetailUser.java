package Controller.User;

import Model.BEAN.User;
import Model.BO.CategoryBO;
import Model.BO.ProductBO;
import Model.BO.UserBO;
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

@WebServlet("/user")
public class DetailUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "handleUpdateUser":
                handleUpdateUser(request, response);
                break;
            case "getUser":
                getUserById(request, response);
                break;
        }
    }

    private void getUserById(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("userId");
        User user = UserBO.getInstance().getUserById(id);
        if (user == null) {
            // Trả về lỗi hoặc thông báo nếu không tìm thấy user
            response.setContentType("text/plain");
            response.getWriter().write("User not found");
            return;
        } else {
            // Convert User thành đối tượng JSON bằng Gson
            Gson gson = new GsonBuilder().create();
            String productListJson = gson.toJson(user);

            response.setContentType("application/json");
            PrintWriter out = null;
            try {
                out = response.getWriter();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            out.print(productListJson);
            out.flush();
        }
    }

    private void handleUpdateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("ID");
        String email = request.getParameter("InputEmailUpdate");
        String password = request.getParameter("InputPasswordUpdate");
        String fullName = request.getParameter("InputFullNameUpdate");
        String phone = request.getParameter("InputPhoneNumberUpdate");
        String address = request.getParameter("InputAddressUpdate");
        UserBO.getInstance().updateUser(id, fullName, phone, address, email, password);

        User user = UserBO.getInstance().getUserById(id);
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        request.setAttribute("categoryList", CategoryBO.getInstance().getAllCategory());
        request.setAttribute("productList", ProductBO.getInstance().getAllProduct());
        response.sendRedirect("http://localhost:8080/");
    }
}
