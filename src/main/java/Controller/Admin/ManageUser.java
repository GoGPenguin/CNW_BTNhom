package Controller.Admin;

import Model.BEAN.User;
import Model.BO.UserBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet(name = "ManageUser" , urlPatterns = {"/ManageUser"})
public class ManageUser extends HttpServlet {
    private UserBO userBO;

    public ManageUser()
    {
       userBO = UserBO.getInstance();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action)
        {
            case "getListUser":
            {
                try {
                    getListUser(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
            case "handleDeleteUser":
            {
                try {
                    handleDeleteUser(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }


        }
//        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action)
        {
            case "handleAddNewUser":
            {
                try {
                    handleAddNewUser(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
            case "filterUser":
            {
                try {
                    filterUser(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
//            case "getListUser":
//            {
//                try {
//                    getListUser(req,resp);
//                } catch (SQLException e) {
//                    throw new RuntimeException(e);
//                }
//                break;
//            }
//            case "handleDeleteUser":
//            {
//                try {
//                    handleDeleteUser(req,resp);
//                } catch (SQLException e) {
//                    throw new RuntimeException(e);
//                }
//                break;
//            }
            case "handleUpdateUser":
            {
                try {
                    handleUpdateUser(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }


        }

    }

    public void getListUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        ArrayList<User> listUser = userBO.getAllUser();
        req.setAttribute("listUser",listUser);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageUserPage.jsp");
        dispatcher.forward(req, resp);
    }
    public void handleAddNewUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
            String email = req.getParameter("InputEmailAddNew");
            String password = req.getParameter("InputPasswordAddNew");
            String fullName = req.getParameter("InputFullNameAddNew");
            String phone = req.getParameter("InputPhoneNumberAddNew");
            String address = req.getParameter("InputAddressAddNew");
            userBO.addUser(fullName,phone,address,email,password);
            getListUser(req,resp);
    }
    public void filterUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
       String nameUser = req.getParameter("exampleInputName1");
       String username = req.getParameter("exampleInputEmail1");
        String phone = req.getParameter("exampleInputSDT");
        System.out.println(nameUser + username + phone);
        ArrayList<User> listUser = userBO.getFilterListUserMultipleColumn(username,nameUser,phone);
        req.setAttribute("listUser",listUser);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageUserPage.jsp");
        dispatcher.forward(req, resp);
    }
    public void handleDeleteUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String id = req.getParameter("ID");
        userBO.deleteUser(id);
        System.out.println(id);
        ArrayList<User> listUser = userBO.getAllUser();
        req.setAttribute("listUser",listUser);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageUserPage.jsp");
        dispatcher.forward(req, resp);
    }
    public void handleUpdateUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String id = req.getParameter("ID");
        String email = req.getParameter("InputEmailUpdate");
        String password = req.getParameter("InputPasswordUpdate");
        String fullName = req.getParameter("InputFullNameUpdate");
        String phone = req.getParameter("InputPhoneNumberUpdate");
        String address = req.getParameter("InputAddressUpdate");
        userBO.updateUser(id,fullName,phone,address,email,password);

        ArrayList<User> listUser = userBO.getAllUser();
        req.setAttribute("listUser",listUser);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageUserPage.jsp");
        dispatcher.forward(req, resp);
    }




}
