package Model.BEAN;

public class Product {
    private String idProduct;
    private String nameProduct;
    private String idCategory;
    private int price;

    public Product() {
        super();
    }

    public Product(String idProduct, String nameProduct, String idCategory, int price) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.idCategory = idCategory;
        this.price = price;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(String idCategory) {
        this.idCategory = idCategory;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
