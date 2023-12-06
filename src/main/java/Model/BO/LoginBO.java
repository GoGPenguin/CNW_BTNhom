package Model.BO;

import Model.DAO.LoginDAO;
import Ultilities.Role;

public class LoginBO {
    private static LoginBO instance;
    private LoginDAO loginDAO = null;
    private LoginBO() {
        loginDAO = LoginDAO.getInstance();
    }
    public static synchronized LoginBO getInstance() {
        if (instance == null) {
            instance = new LoginBO();
        }
        return instance;
    }
    public Role getRole(String username, String password) {
        return loginDAO.getRole(username, password);
    }
    public Object checkLogin(String username, String password) {
        return loginDAO.checkLogin(username, password);
    }
}
