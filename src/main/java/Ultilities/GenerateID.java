package Ultilities;

import Database.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GenerateID {
    private String tableName;
    private String field;
    private String prefix;
    private final Connection cnn = ConnectDB.getCnn();

    public GenerateID(String tableName) {
        this.tableName = tableName;
        if ("product".equals(this.tableName)) {
            this.field = "idProduct";
            this.prefix = "PD";
        } else if ("user".equals(this.tableName)) {
            this.field = "idUser";
            this.prefix = "US";
        } else if ("category".equals(this.tableName)) {
            this.field = "idCategory";
            this.prefix = "CG";
        } else {
            this.field = "idOrder";
            this.prefix = "OD";
        }
    }

    public String generateID() {
        String sql = String.format("SELECT CAST(SUBSTRING(%s, 2) AS UNSIGNED) FROM %s ORDER BY %s DESC LIMIT 1", field, tableName, field);
        String idSuffix = "";
        try (PreparedStatement pre = this.cnn.prepareStatement(sql);
             ResultSet rs = pre.executeQuery()) {

            if (rs.next()) {
                int count = rs.getInt(1) + 1;
                idSuffix = (count > 9) ? prefix + count : prefix + "0" + count;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.println(idSuffix);
        return idSuffix;
    }
}
