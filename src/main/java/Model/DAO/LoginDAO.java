package Model.DAO;

import Database.ConnectDB;
import Model.BEAN.Admin;
import Model.BEAN.User;
import Ultilities.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
    private static LoginDAO instance;
    private Connection cnn;

    private LoginDAO() {
        this.cnn = ConnectDB.getCnn();
    }

    public static synchronized LoginDAO getInstance() {
        if (instance == null) {
            instance = new LoginDAO();
        }
        return instance;
    }

    public Role getRole(String username, String password) {
        String adminSql = "SELECT * FROM admin WHERE username = ? AND password = ?";
        String userSql = "SELECT * FROM user WHERE username = ? AND password = ?";

        try {
            // Check for admin login
            try (PreparedStatement adminPre = this.cnn.prepareStatement(adminSql)) {
                adminPre.setString(1, username);
                adminPre.setString(2, password);
                try (ResultSet adminRs = adminPre.executeQuery()) {
                    if (adminRs.next()) {
                        return Role.ADMIN;
                    }
                }
            }

            // Check for user login
            try (PreparedStatement userPre = this.cnn.prepareStatement(userSql)) {
                userPre.setString(1, username);
                userPre.setString(2, password);
                try (ResultSet userRs = userPre.executeQuery()) {
                    if (userRs.next()) {
                        return Role.USER;
                    }
                }
            }

            // If no match found, return Role.WRONG
            return Role.WRONG;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Object checkLogin(String username, String password) {
        String adminSql = "SELECT * FROM admin WHERE username = ? AND password = ?";
        String userSql = "SELECT * FROM user WHERE username = ? AND password = ?";

        try {
            // Check for admin login
            try (PreparedStatement adminPre = this.cnn.prepareStatement(adminSql)) {
                adminPre.setString(1, username);
                adminPre.setString(2, password);
                try (ResultSet adminRs = adminPre.executeQuery()) {
                    if (adminRs.next()) {
                        String idAdmin = adminRs.getString("idAdmin");
                        String nameAdmin = adminRs.getString("username");
                        Admin admin = new Admin(idAdmin, nameAdmin);
                        return admin;
                    }
                }
            }

            // Check for user login
            try (PreparedStatement userPre = this.cnn.prepareStatement(userSql)) {
                userPre.setString(1, username);
                userPre.setString(2, password);
                try (ResultSet userRs = userPre.executeQuery()) {
                    if (userRs.next()) {
                        String idUser = userRs.getString("idUser");
                        String nameUser = userRs.getString("nameUser");
                        User user = new User(idUser, nameUser);
                        return user;
                    }
                }
            }
            // If no match found, return null
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
