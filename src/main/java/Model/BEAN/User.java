package Model.BEAN;

public class User {
    private String idUser;
    private String username;
    private String password;
    private String nameUser;
    private String phoneUser;
    private String addressUser;

    public User() {
        super();
    }

    public User(String idUser, String username, String password, String nameUser, String phoneUser, String addressUser) {
        this.idUser = idUser;
        this.username = username;
        this.password = password;
        this.nameUser = nameUser;
        this.phoneUser = phoneUser;
        this.addressUser = addressUser;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getPhoneUser() {
        return phoneUser;
    }

    public void setPhoneUser(String phoneUser) {
        this.phoneUser = phoneUser;
    }

    public String getAddressUser() {
        return addressUser;
    }

    public void setAddressUser(String addressUser) {
        this.addressUser = addressUser;
    }
}
