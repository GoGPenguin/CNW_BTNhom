package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    private static Connection cnn;
    static String url = "jdbc:mysql://localhost:3306/cnw_btnhom";
    static String user = "root";
    static String password = "";

    // Private constructor to prevent instantiation from outside the class
    private ConnectDB() {
    }

    public static Connection getCnn() {
        if (cnn == null) {
            synchronized (ConnectDB.class) {
                if (cnn == null) {
                    createConnection();
                }
            }
        }
        return cnn;
    }

    private static void createConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cnn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}