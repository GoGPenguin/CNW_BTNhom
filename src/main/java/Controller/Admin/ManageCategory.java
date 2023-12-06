package Controller.Admin;

import Model.BEAN.Category;
import Model.BO.CategoryBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ManageCategory" , urlPatterns = {"/ManageCategory"})

public class ManageCategory extends HttpServlet {

    private CategoryBO categoryBO;

    public ManageCategory()
    {
        categoryBO = CategoryBO.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "getListCategory": {
                try {
                    getListCategory(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action)
        {
            case "filterCategory" :
            {
                try {
                    filterCategory(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
//            case "getListCategory" :
//            {
//                try {
//                    getListCategory(req,resp);
//                } catch (SQLException e) {
//                    throw new RuntimeException(e);
//                }
//                break;
//            }
            case "handleAddNewCategory" :
            {
                try {
                    handleAddNewCategory(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
            case "handleUpdateCategory" :
            {
                try {
                    handleUpdateCategory(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }


        }
    }
    public void filterCategory(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String InputIDCategorySearch = req.getParameter("InputIDCategorySearch");
        String InputNameCategorySearch = req.getParameter("InputNameCategorySearch");
        ArrayList<Category> listCategory = categoryBO.filterCategory(InputIDCategorySearch,InputNameCategorySearch);
        req.setAttribute("listCategory",listCategory);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageCategoryPage.jsp");
        dispatcher.forward(req, resp);
    }
    public void getListCategory(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        ArrayList<Category> listCategory = categoryBO.getAllCategory();
        req.setAttribute("listCategory",listCategory);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageCategoryPage.jsp");
        dispatcher.forward(req, resp);
    }
    public void handleAddNewCategory(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String nameCategory = req.getParameter("InputNameCategoryAddNew");
        categoryBO.addCategory(nameCategory);
        ArrayList<Category> listCategory = categoryBO.getAllCategory();
        req.setAttribute("listCategory",listCategory);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageCategoryPage.jsp");
        dispatcher.forward(req, resp);
    }
    public void handleUpdateCategory(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String idCategory = req.getParameter("idCategory");
        String nameCategory = req.getParameter("InputNameCategoryUpdate");
        categoryBO.updateCategory(idCategory,nameCategory);
        ArrayList<Category> listCategory = categoryBO.getAllCategory();
        req.setAttribute("listCategory",listCategory);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageCategoryPage.jsp");
        dispatcher.forward(req, resp);
    }

}
