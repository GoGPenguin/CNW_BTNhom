package Model.BEAN;

public class Admin {
    private String idAdmin;
    private String nameAdmin;

    public Admin() {
    }

    public Admin(String idAdmin, String nameAdmin) {
        this.idAdmin = idAdmin;
        this.nameAdmin = nameAdmin;
    }

    public String getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(String idAdmin) {
        this.idAdmin = idAdmin;
    }

    public String getNameAdmin() {
        return nameAdmin;
    }

    public void setNameAdmin(String nameAdmin) {
        this.nameAdmin = nameAdmin;
    }
}
