package Model.BO;

import Model.BEAN.User;
import Model.DAO.UserDAO;

import java.util.ArrayList;

public class UserBO {
    private static UserBO instance;
    private UserDAO userDAO = null;
    private UserBO() {
        userDAO = UserDAO.getInstance();
    }
    public static synchronized UserBO getInstance() {
        if (instance == null) {
            instance = new UserBO();
        }
        return instance;
    }
    public ArrayList<User> getAllUser() {
        return userDAO.getListUser();
    }
    public ArrayList<User> getFilterListUser(String filterInput) {
        return userDAO.getFilterListUser(filterInput);
    }
    public User getUserById(String id) {
        return userDAO.getUserById(id);
    }
    public void addUser(String nameUser, String phoneUser, String addressUser, String username, String password) {
        userDAO.addUser(nameUser, phoneUser, addressUser, username, password);
    }
    public void updateUser(String idUser, String nameUser, String phoneUser, String addressUser, String username, String password) {
        userDAO.updateUser(idUser, nameUser, phoneUser, addressUser, username, password);
    }
    public void deleteUser(String idUser) {
        userDAO.deleteUser(idUser);
    }
}
