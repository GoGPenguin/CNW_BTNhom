package Model.BO;

import Model.BEAN.Category;
import Model.DAO.CategoryDAO;
import Model.DAO.LoginDAO;

import java.util.ArrayList;

public class CategoryBO {
    private static CategoryBO instance;
    private CategoryDAO categoryDAO = null;
    private CategoryBO() {
        categoryDAO = CategoryDAO.getInstance();
    }
    public static synchronized CategoryBO getInstance() {
        if (instance == null) {
            instance = new CategoryBO();
        }
        return instance;
    }

    public ArrayList<Category> getAllCategory() {
        return categoryDAO.getAllCategory();
    }

    public Category getCategoryById(String idCategory) {
        return categoryDAO.getCategoryById(idCategory);
    }

    public void addCategory(String nameCategory) {
        categoryDAO.addCategory(nameCategory);
    }

    public void updateCategory(String idCategory, String nameCategory) {
        categoryDAO.updateCategory(idCategory, nameCategory);
    }

    public void deleteCatergory(String idCategory) {
        deleteCatergory(idCategory);
    }
    public ArrayList<Category> filterCategory(String id, String name)
    {
        return categoryDAO.filterCategory(id,name);
    }

}
