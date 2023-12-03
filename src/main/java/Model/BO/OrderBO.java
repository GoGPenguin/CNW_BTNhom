package Model.BO;

import Model.BEAN.Order;
import Model.DAO.OrderDAO;
import Model.DAO.ProductDAO;

import java.util.ArrayList;
import java.util.Date;

public class OrderBO {
    private static OrderBO instance;
    private OrderDAO orderDAO = null;
    private OrderBO() {
        orderDAO =OrderDAO.getInstance();
    }
    public static synchronized OrderBO getInstance() {
        if (instance == null) {
            instance = new OrderBO();
        }
        return instance;
    }

    public ArrayList<Order> getAllOrder() {
        return orderDAO.getAllOrder();
    }
    public ArrayList<Order> getFilterOrder(String filterInput) {
        return orderDAO.getFilterOrder(filterInput);
    }
    public Order getDetailOrderById(String idOrder) {
        return orderDAO.getDetailOrderById(idOrder);
    }

    public int getAllIncome() {
        return orderDAO.getAllIncome();
    }
    public int getIncomeById(String idOrder) {
        return orderDAO.getIncomeById(idOrder);
    }
    public void addOrder(String idProduct, String idUser, int amount, Date date) {
        orderDAO.addOrder(idProduct, idUser, amount, date);
    }
    public void deleteOrder(String idOrder) {
        deleteOrder(idOrder);
    }
}
