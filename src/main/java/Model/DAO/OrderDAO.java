package Model.DAO;

import Database.ConnectDB;
import Model.BEAN.Order;
import Ultilities.GenerateID;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class OrderDAO {
    private static OrderDAO instance;
    private Connection cnn;

    private OrderDAO() {
        this.cnn = ConnectDB.getCnn();
    }

    public static synchronized OrderDAO getInstance() {
        if (instance == null) {
            instance = new OrderDAO();
        }
        return instance;
    }

    public ArrayList<Order> getAllOrder() {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM `order`";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Order order = new Order();

                order.setIdOrder(rs.getString("idOrder"));
                order.setIdUser(rs.getString("idUser"));
                order.setIdProduct(rs.getString("idProduct"));
                order.setAmount(rs.getInt("amount"));
                order.setDate(rs.getDate("date"));

                orderList.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderList;
    }

    public ArrayList<Order> getFilterOrder(String filterInput) {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM `order` WHERE STR_TO_DATE(date, '%Y-%m-%d') = ?";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, filterInput);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Order order = new Order();

                order.setIdOrder(rs.getString("idOrder"));
                order.setIdUser(rs.getString("idUser"));
                order.setIdProduct(rs.getString("idProduct"));
                order.setAmount(rs.getInt("amount"));
                order.setDate(rs.getDate("date"));

                orderList.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderList;
    }

    public Order getDetailOrderById(String idOrder) {
        Order order = new Order();
        String sql = "SELECT * FROM `order` WHERE idOrder = ?";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                order.setIdOrder(idOrder);
                order.setIdUser(rs.getString("idUser"));
                order.setIdProduct(rs.getString("idProduct"));
                order.setAmount(rs.getInt("amount"));
                order.setDate(rs.getDate("date"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return order;
    }

    public int getAllIncome() {
        String sql = "SELECT SUM(product.price * order.amount) AS totalCost\n" +
                "FROM product\n" +
                "JOIN `order` ON product.idProduct = order.idProduct";
        int summaryIncome = 0;
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                summaryIncome = rs.getInt("totalCost");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return summaryIncome;
    }

    public int getIncomeById(String idOrder) {
        String sql = "SELECT product.price * order.amount AS totalCost\n" +
                "FROM product\n" +
                "JOIN `order` ON product.idProduct = order.idProduct AND idOrder = ?";
        int income = 0;
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, idOrder);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                income = rs.getInt("totalCost");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return income;
    }

    public void addOrder(String idProduct, String idUser, int amount, Date date) {
        String sql = "INSERT INTO `order` (idOrder, idProduct, idUser, amount, date " +
                "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pre = this.cnn.prepareStatement(sql)) {
            pre.setString(1, new GenerateID("order").generateID());
            pre.setString(2, idProduct);
            pre.setString(3, idUser);
            pre.setInt(4, amount);
            pre.setDate(5, (java.sql.Date) date);

            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addOrderMultipleProduct(String idOrder, String idProduct, String idUser, int amount, String date) {
        String sql = "INSERT INTO `order` (idOrder, idProduct, idUser, amount, date) " +
                "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pre = this.cnn.prepareStatement(sql)) {
            pre.setString(1, idOrder);
            pre.setString(2, idProduct);
            pre.setString(3, idUser);
            pre.setInt(4, amount);
            pre.setString(5, date);

            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteOrder(String idOrder) {
        String sql = "DELETE FROM `order` WHERE idOrder = ?";
        try (PreparedStatement pre = this.cnn.prepareStatement(sql)) {
            pre.setString(1, idOrder);

            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Order> getAllOrderNew() {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql = "SELECT o.idOrder, u.nameUser, u.phoneUser, u.addressUser, SUM(p.Price * o.amount) AS TotalCost, o.date FROM `order` o JOIN user u ON o.idUser = u.idUser JOIN product p ON o.idProduct = p.idProduct GROUP BY o.idOrder, u.nameUser, u.phoneUser, u.addressUser, o.date";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getString("idOrder"), rs.getString("nameUser"), rs.getString("addressUser"), rs.getString("phoneUser"), rs.getInt("TotalCost"), rs.getDate("date"));
                orderList.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderList;
    }

    public ArrayList<Order> getFilterOrderMultipleColumn(String idOrder, String fullname, String dateSearch) {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql;
        if (!dateSearch.equals("")) {
            sql = "SELECT o.idOrder, u.nameUser, u.phoneUser, u.addressUser, SUM(p.Price * o.amount) AS TotalCost, o.date " +
                    "FROM `order` o " +
                    "JOIN user u ON o.idUser = u.idUser " +
                    "JOIN product p ON o.idProduct = p.idProduct " +
                    "WHERE " +
                    "    o.idOrder LIKE ? " +
                    "    AND u.nameUser LIKE ? " +
                    "    AND STR_TO_DATE(o.date, '%Y-%m-%d') = ? " +
                    "GROUP BY o.idOrder, u.nameUser, u.phoneUser, u.addressUser, o.date";
            try {
                PreparedStatement pre = this.cnn.prepareStatement(sql);
                pre.setString(1, "%" + idOrder + "%");
                pre.setString(2, "%" + fullname + "%");
                pre.setString(3, dateSearch);
                ResultSet rs = pre.executeQuery();
                while (rs.next()) {
                    Order order = new Order(
                            rs.getString("idOrder"),
                            rs.getString("nameUser"),
                            rs.getString("addressUser"),
                            rs.getString("phoneUser"),
                            rs.getInt("TotalCost"),
                            rs.getDate("date")
                    );
                    orderList.add(order);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return orderList;

        } else {
            sql = "SELECT o.idOrder, u.nameUser, u.phoneUser, u.addressUser, SUM(p.Price * o.amount) AS TotalCost, o.date " +
                    "FROM `order` o " +
                    "JOIN user u ON o.idUser = u.idUser " +
                    "JOIN product p ON o.idProduct = p.idProduct " +
                    "WHERE " +
                    "    o.idOrder LIKE ? " +
                    "    AND u.nameUser LIKE ? " +
                    "GROUP BY o.idOrder, u.nameUser, u.phoneUser, u.addressUser, o.date";
            try {
                PreparedStatement pre = this.cnn.prepareStatement(sql);
                pre.setString(1, "%" + idOrder + "%");
                pre.setString(2, "%" + fullname + "%");
                ResultSet rs = pre.executeQuery();
                while (rs.next()) {
                    Order order = new Order(
                            rs.getString("idOrder"),
                            rs.getString("nameUser"),
                            rs.getString("addressUser"),
                            rs.getString("phoneUser"),
                            rs.getInt("TotalCost"),
                            rs.getDate("date")
                    );
                    orderList.add(order);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return orderList;
        }

    }
}
