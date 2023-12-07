package Controller.User;

import Model.BEAN.Product;
import Model.BO.CategoryBO;
import Model.BO.ProductBO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet("")
public class ShowProduct extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
        if (request.getParameter("categoryId") != null){
            filterCategory(request, response);
        } else {
            request.setAttribute("categoryList", CategoryBO.getInstance().getAllCategory());
            request.setAttribute("productList", ProductBO.getInstance().getAllProduct());
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void filterCategory(HttpServletRequest request, HttpServletResponse response) {
        String categoryId = request.getParameter("categoryId");
        ArrayList<Product> productList;
        if (Objects.equals(categoryId, "All")){
            productList = ProductBO.getInstance().getAllProduct();
        } else {
            productList = ProductBO.getInstance().getProductByCategoryId(categoryId);
        }
        Gson gson = new GsonBuilder().create();
        String productListJson = gson.toJson(productList);

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("categoryId") != null){
            filterCategory(request, response);
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher;
        ArrayList<Product> productList = new ArrayList<>();
        productList = ProductBO.getInstance().getAllProduct();
        request.setAttribute("productList", productList);
        requestDispatcher = request.getRequestDispatcher("index.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
