package Controller.Admin;

import Model.BEAN.Order;
import Model.BO.OrderBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ManageOrder" , urlPatterns = {"/ManageOrder"})

public class ManageOrder extends HttpServlet {

    private OrderBO orderBO;

    public ManageOrder()
    {
        orderBO = OrderBO.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action)
        {
            case "getListOrder":
            {
                try {
                    getListOrder(req,resp);
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
//            case "getListOrder":
//            {
//                try {
//                    getListOrder(req,resp);
//                } catch (SQLException e) {
//                    throw new RuntimeException(e);
//                }
//                break;
//            }
            case "filterOrder":
            {
                try {
                    filterOrder(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
        }

    }
    public void getListOrder(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        ArrayList<Order> listOrder = orderBO.getAllOrderNew();
        ArrayList<Order> listOrderDetail = orderBO.getAllOrder();
        req.setAttribute("listOrder",listOrder);
        req.setAttribute("listOrderDetail",listOrderDetail);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageOrderPage.jsp");
        dispatcher.forward(req, resp);
    }
    public void filterOrder(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String idOrderSearch = req.getParameter("idOrderSearch");
        String fullnameSearch = req.getParameter("fullnameSearch");
        String dateSearch = req.getParameter("dateSearch");
        System.out.println(idOrderSearch + fullnameSearch + dateSearch );
        ArrayList<Order> listOrder = orderBO.getFilterOrderMultipleColumn(idOrderSearch,fullnameSearch,dateSearch);
        ArrayList<Order> listOrderDetail = orderBO.getAllOrder();
        req.setAttribute("listOrder",listOrder);
        req.setAttribute("listOrderDetail",listOrderDetail);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageOrderPage.jsp");
        dispatcher.forward(req, resp);
    }


}
