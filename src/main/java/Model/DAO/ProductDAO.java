package Model.DAO;

import Database.ConnectDB;
import Model.BEAN.Category;
import Model.BEAN.Product;
import Ultilities.GenerateID;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO {
    private Connection cnn;
    private static ProductDAO instance;
    private ProductDAO() {
        this.cnn = ConnectDB.getCnn();
    }
    public static synchronized ProductDAO getInstance() {
        if (instance == null) {
            instance = new ProductDAO();
        }
        return instance;
    }
    public ArrayList<Product> getListProduct() {
        ArrayList<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM product";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setIdProduct(rs.getString("idProduct"));
                product.setNameProduct(rs.getString("nameProduct"));
                product.setPrice(rs.getInt("price"));
                product.setIdCategory(rs.getString("idCategory"));
                product.setUrlImage(rs.getString("urlImage"));

                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }
    public ArrayList<Product> filterProduct(String filterInput) {
        ArrayList<Product> productList = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM product " +
                "JOIN category ON product.idCategory = category.idCategory " +
                "WHERE nameProduct like ? OR " +
                "CAST(price AS CHAR) = ? OR " +
                "category.nameCategory = ?";

        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, "%" + filterInput + "%");
            pre.setString(2, filterInput);
            pre.setString(3, filterInput);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setIdProduct(rs.getString("idProduct"));
                product.setNameProduct(rs.getString("nameProduct"));
                product.setPrice(rs.getInt("price"));
                product.setIdCategory(rs.getString("idCategory"));
                product.setUrlImage(rs.getString("urlImage"));

                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }
    public ArrayList<Product> filterProductByCategoryId(String categoryId) {
        ArrayList<Product> productList = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM product " +
                "JOIN category ON product.idCategory = category.idCategory " +
                "WHERE product.idCategory=?; ";

        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, categoryId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setIdProduct(rs.getString("idProduct"));
                product.setNameProduct(rs.getString("nameProduct"));
                product.setPrice(rs.getInt("price"));
                product.setIdCategory(rs.getString("idCategory"));
                product.setUrlImage(rs.getString("urlImage"));

                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }
    public Product getDetailProductById(String id) {
        Product product = new Product();
        String sql = "SELECT * FROM product WHERE idProduct = ?";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                product.setIdCategory(id);
                product.setNameProduct(rs.getString("nameProduct"));
                product.setPrice(rs.getInt("price"));
                product.setIdCategory(rs.getString("idCategory"));
                product.setUrlImage(rs.getString("urlImage"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }
    public void addProduct(String nameProduct, String idCategory, int price, String urlImage) {
        String sql = "INSERT INTO product (idProduct, nameProduct, idCategory, price, urlImage) " +
                "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pre = this.cnn.prepareStatement(sql)) {
            pre.setString(1, new GenerateID("product").generateID());
            pre.setString(2, nameProduct);
            pre.setString(3, idCategory);
            pre.setInt(4, price);
            pre.setString(5, urlImage);

            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateProduct(String idProduct, String nameProduct, String idCategory, int price, String urlImage) {
        String sql = "UPDATE product SET nameProduct = ?, idCategory = ?, price = ?, urlImage = ? WHERE idProduct = ?";
        try (PreparedStatement pre = this.cnn.prepareStatement(sql)) {
            pre.setString(1, nameProduct);
            pre.setString(2, idCategory);
            pre.setInt(3, price);
            pre.setString(4, urlImage);
            pre.setString(5, idProduct);


            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteProduct(String idProduct) {
        String sql = "DELETE FROM product WHERE idProduct = ?";
        try (PreparedStatement pre = this.cnn.prepareStatement(sql)) {
            pre.setString(1, idProduct);

            pre.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Product> filterProductMultipleColumn(String nameProduct,String nameCategory,String priceSearch) {

        ArrayList<Product> productList = new ArrayList<>();
        if(!priceSearch.equals(""))
        {
            String sql = "SELECT * " +
                    "FROM product " +
                    "JOIN category ON product.idCategory = category.idCategory " +
                    "WHERE nameProduct like ? and " +
                    "CAST(price AS CHAR) = ? and " +
                    "category.nameCategory like ?";

            try {
                PreparedStatement pre = this.cnn.prepareStatement(sql);
                pre.setString(1, "%" + nameProduct + "%" );
                pre.setString(2, priceSearch);
                pre.setString(3, "%" + nameCategory + "%");
                ResultSet rs = pre.executeQuery();
                while (rs.next()) {
                    Product product = new Product();
                    product.setIdProduct(rs.getString("idProduct"));
                    product.setNameProduct(rs.getString("nameProduct"));
                    product.setPrice(rs.getInt("price"));
                    product.setIdCategory(rs.getString("idCategory"));
                    product.setUrlImage(rs.getString("urlImage"));
                    productList.add(product);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return productList;
        }
        else {
            String sql = "SELECT * " +
                    "FROM product " +
                    "JOIN category ON product.idCategory = category.idCategory " +
                    "WHERE nameProduct like ? and " +
                    "category.nameCategory  like ?";

            try {
                PreparedStatement pre = this.cnn.prepareStatement(sql);
                pre.setString(1, "%" + nameProduct + "%" );
                pre.setString(2, "%" + nameCategory + "%");
                ResultSet rs = pre.executeQuery();
                while (rs.next()) {
                    Product product = new Product();
                    product.setIdProduct(rs.getString("idProduct"));
                    product.setNameProduct(rs.getString("nameProduct"));
                    product.setPrice(rs.getInt("price"));
                    product.setIdCategory(rs.getString("idCategory"));
                    product.setUrlImage(rs.getString("urlImage"));
                    productList.add(product);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return productList;
        }

    }
    public ArrayList<Category> getListNameCategory() {
        ArrayList<Category> nameCategoryList = new ArrayList<>();
        String sql = "SELECT * FROM category";
        try {
            PreparedStatement pre = this.cnn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                nameCategoryList.add(new Category(rs.getString("idCategory"),rs.getString("nameCategory")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nameCategoryList;
    }

}
