package Model.BO;

import Model.BEAN.Category;
import Model.BEAN.Product;
import Model.DAO.LoginDAO;
import Model.DAO.ProductDAO;

import java.util.ArrayList;

public class ProductBO {
    private static ProductBO instance;
    private ProductDAO productDAO = null;
    private ProductBO() {
        productDAO = ProductDAO.getInstance();
    }
    public static synchronized ProductBO getInstance() {
        if (instance == null) {
            instance = new ProductBO();
        }
        return instance;
    }
    public ArrayList<Product> getAllProduct() {
        return productDAO.getListProduct();
    }
    public ArrayList<Product> getFilterListProduct(String filterInput) {
        return productDAO.filterProduct(filterInput);
    }
    public Product getProductById(String id) {
        return productDAO.getDetailProductById(id);
    }
    public void addProduct(String nameProduct, String idCategory, int price, String urlImage) {
        productDAO.addProduct(nameProduct, idCategory, price, urlImage);
    }
    public void updateProduct(String idProduct, String nameProduct, String idCategory, int price, String urlImage) {
        productDAO.updateProduct(idProduct, nameProduct, idCategory, price, urlImage);
    }
    public void deleteProduct(String idProduct) {
        productDAO.deleteProduct(idProduct);
    }

    public ArrayList<Product> filterProductMultipleColumn(String nameProduct,String nameCategory,String priceSearch) {
        return productDAO.filterProductMultipleColumn(nameProduct,nameCategory,priceSearch);
    }
    public ArrayList<Category> getListNameCategory() {
        return productDAO.getListNameCategory();
    }
}
