package Model.DAO;

import Database.ConnectDB;
import Model.BEAN.Category;
import Ultilities.GenerateID;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryDAO {
    private Connection cnn;
    private static CategoryDAO instance;
    private CategoryDAO() {
        this.cnn = ConnectDB.getCnn();
    }
    public static synchronized CategoryDAO getInstance() {
        if (instance == null) {
            instance = new CategoryDAO();
        }
        return instance;
    }

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM category";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while(rs.next()) {
                Category category = new Category();
                category.setIdCategory(rs.getString("idCategory"));
                category.setNameCategory(rs.getString("nameCategory"));

                categories.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return categories;
    }

    public Category getCategoryById(String idCategory) {
        Category category = new Category();
        String sql = "SELECT * FROM category WHERE idCategory = ?";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, idCategory);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                category.setIdCategory(idCategory);
                category.setNameCategory(rs.getString("nameCategory"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return category;
    }

    public void addCategory(String nameCategory) {
        String sql = "INSERT INTO category (idCategory, nameCategory) VALUES (?, ?)";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, new GenerateID("category").generateID());
            pre.setString(2, nameCategory);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateCategory(String idCategory, String nameCategory) {
        String sql = "UPDATE category SET nameCategory = ? WHERE idCategory = ?";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, nameCategory);
            pre.setString(2, idCategory);

            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteCategory(String idCategory) {
        String sql = "DELETE FROM category WHERE idCategory = ?";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, idCategory);

            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Category> filterCategory(String id,String name)
    {
        ArrayList<Category> listCategory = new ArrayList<>();
        String sql = "select * from category where idCategory like ? and nameCategory like ?";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, "%" + id + "%");
            pre.setString(2, "%" + name + "%");
            ResultSet rs = pre.executeQuery();
            while(rs.next())
            {
                listCategory.add(new Category(rs.getString("idCategory"), rs.getString("nameCategory")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listCategory;
    }

}
