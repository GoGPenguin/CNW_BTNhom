package Model.DAO;

import Database.ConnectDB;
import Ultilities.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
    private Connection cnn;
    private static LoginDAO instance;
    private LoginDAO() {
        this.cnn = ConnectDB.getCnn();
    }
    public static synchronized LoginDAO getInstance() {
        if (instance == null) {
            instance = new LoginDAO();
        }
        return instance;
    }
    public Role checkLogin(String username, String password) {
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
}
