package Model.BEAN;

import java.util.Date;

public class Order {
    private String idOrder;
    private String idUser;
    private String idProduct;
    private int amount;
    private Date date;

    public Order() {
        super();
    }

    public Order(String idOrder, String idUser, String idProduct, int amount, Date date) {
        this.idOrder = idOrder;
        this.idUser = idUser;
        this.idProduct = idProduct;
        this.amount = amount;
        this.date = date;
    }

    public String getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(String idOrder) {
        this.idOrder = idOrder;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
