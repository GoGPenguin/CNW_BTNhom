package Model.DAO;

import Database.ConnectDB;
import Model.BEAN.User;
import Ultilities.GenerateID;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
    private Connection cnn;
    private static UserDAO instance;
    private UserDAO() {
        this.cnn = ConnectDB.getCnn();
    }
    public static synchronized UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }
    public ArrayList<User> getListUser() {
        ArrayList<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM user";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setIdUser(rs.getString("idUser"));
                user.setNameUser(rs.getString("nameUser"));
                user.setPhoneUser(rs.getString("phoneUser"));
                user.setAddressUser(rs.getString("addressUser"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));

                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    public ArrayList<User> getFilterListUser(String filterInput) {
        ArrayList<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM user WHERE idUser = ? OR nameUser = ?";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, filterInput);
            pre.setString(2, filterInput);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setIdUser(rs.getString("idUser"));
                user.setNameUser(rs.getString("nameUser"));
                user.setPhoneUser(rs.getString("phoneUser"));
                user.setAddressUser(rs.getString("addressUser"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));

                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    public User getUserById(String id) {
        User user = new User();
        String sql = "SELECT  * FROM user where idUser = ?";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                user.setIdUser(id);
                user.setNameUser(rs.getString("nameUser"));
                user.setPhoneUser(rs.getString("phoneUser"));
                user.setAddressUser(rs.getString("addressUser"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    public void addUser(String nameUser, String phoneUser, String addressUser, String username, String password) {
        String sql = "INSERT INTO user (idUser, nameUser, phoneUser, addressUser, username, password) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pre = this.cnn.prepareStatement(sql)) {
            pre.setString(1, new GenerateID("user").generateID());
            pre.setString(2, nameUser);
            pre.setString(3, phoneUser);
            pre.setString(4, addressUser);
            pre.setString(5, username);
            pre.setString(6, password);

            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateUser(String idUser, String nameUser, String phoneUser, String addressUser, String username, String password) {
        String sql = "UPDATE user SET nameUser = ?, phoneUser = ?, addressUser = ?, password = ? WHERE idUser = ?";
        try (PreparedStatement pre = this.cnn.prepareStatement(sql)) {
            pre.setString(1, nameUser);
            pre.setString(2, phoneUser);
            pre.setString(3, addressUser);
            pre.setString(4, password);
            pre.setString(5, idUser);

            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Có thể không dùng xóa User
    public void deleteUser(String idUser) {
        String sql = "DELETE FROM user WHERE idUser = ?";
        try (PreparedStatement pre = this.cnn.prepareStatement(sql)) {
            pre.setString(1, idUser);

            pre.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
