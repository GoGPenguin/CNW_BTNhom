package Controller.Admin;

import Model.BEAN.Category;
import Model.BEAN.Product;
import Model.BO.ProductBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.commons.codec.binary.Base64;


@WebServlet(name = "ManageProduct" , urlPatterns = {"/ManageProduct"})
@MultipartConfig(
        fileSizeThreshold = 1024*1024*1,maxFileSize = 1014*1024*10,maxRequestSize = 1024*1024*100
)
public class ManageProduct extends HttpServlet {
    private ProductBO productBO;

    public ManageProduct()
    {
        productBO = ProductBO.getInstance();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action)
        {

            case "getListProduct": {
                try {
                    getListProduct(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
            case "handleDeleteProduct": {
                try {
                    handleDeleteProduct(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action)
        {
            case "filterProduct": {
                try {
                    filterProduct(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
//            case "getListProduct": {
//                try {
//                    getListProduct(req, resp);
//                } catch (SQLException e) {
//                    throw new RuntimeException(e);
//                }
//                break;
//            }
            case "handleAddNewProduct": {
                try {
                    handleAddNewProduct(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
//            case "handleDeleteProduct": {
//                try {
//                    handleDeleteProduct(req, resp);
//                } catch (SQLException e) {
//                    throw new RuntimeException(e);
//                }
//                break;
//            }
            case "handleUpdateProduct": {
                try {
                    handleUpdateProduct(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            }



        }
    }
    public void filterProduct(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String nameProduct = req.getParameter("nameProduct");
        String nameCategory = req.getParameter("nameCategory");
        String priceSearch = req.getParameter("priceSearch");
        ArrayList<Category> listNameCategory = productBO.getListNameCategory();
        req.setAttribute("listNameCategory",listNameCategory);
        ArrayList<Product> listProduct = productBO.filterProductMultipleColumn(nameProduct,nameCategory,priceSearch);
        req.setAttribute("listProduct",listProduct);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageProductPage.jsp");
        dispatcher.forward(req, resp);
    }
    public void getListProduct(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        ArrayList<Product> listProduct = productBO.getAllProduct();
        ArrayList<Category> listNameCategory = productBO.getListNameCategory();
        req.setAttribute("listNameCategory",listNameCategory);
        req.setAttribute("listProduct",listProduct);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageProductPage.jsp");
        dispatcher.forward(req, resp);
    }
    public void handleAddNewProduct(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String InputNameProductAddNew = req.getParameter("InputNameProductAddNew");
        String InputCategoryAddNew = req.getParameter("InputCategoryAddNew");
        String InputPriceProductAddNew = req.getParameter("InputPriceProductAddNew");
//        Part part = req.getPart("imageAddNewImageProduct");
//        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//        String path = req.getServletContext().getRealPath( "/" + "uploads" + File.separator + fileName);
//        InputStream is = part.getInputStream();
//        uploadFile(is,path);


        //base64
        Part filePart = req.getPart("imageAddNewImageProduct");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        InputStream fileContent = filePart.getInputStream();
        byte[] fileBytes = fileContent.readAllBytes();
        String base64String = Base64.encodeBase64String(fileBytes);

        productBO.addProduct(InputNameProductAddNew,InputCategoryAddNew,Integer.parseInt(InputPriceProductAddNew),base64String);
        ArrayList<Product> listProduct = productBO.getAllProduct();
        req.setAttribute("listProduct",listProduct);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageProductPage.jsp");
        dispatcher.forward(req, resp);
    }
    public void handleDeleteProduct(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String idProduct = req.getParameter("idProduct");
        productBO.deleteProduct(idProduct);
//        ArrayList<Product> listProduct = productBO.getAllProduct();
//        req.setAttribute("listProduct",listProduct);
//        RequestDispatcher dispatcher = req.getRequestDispatcher("ManageProductPage.jsp");
//        dispatcher.forward(req, resp);
        getListProduct(req, resp);
    }

    public void handleUpdateProduct(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
//            Part part = req.getPart("image");
//            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//            String path = req.getServletContext().getRealPath( "/" + "uploads" + File.separator + fileName);
//            InputStream is = part.getInputStream();
//            uploadFile(is,path);
        //base64
        Part filePart = req.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        InputStream fileContent = filePart.getInputStream();
        byte[] fileBytes = fileContent.readAllBytes();
        String base64String = Base64.encodeBase64String(fileBytes);

            String idProduct = req.getParameter("idProduct");
            String InputProductNameUpdate = req.getParameter("InputProductNameUpdate");
            String InputProductCategoryUpdate = req.getParameter("InputProductCategoryUpdate");
            String InputPriceProductUpdate = req.getParameter("InputPriceProductUpdate");
            productBO.updateProduct(idProduct,InputProductNameUpdate,InputProductCategoryUpdate,Integer.parseInt(InputPriceProductUpdate),base64String);
            getListProduct(req,resp);

    }
    public void uploadFile(InputStream is, String path) {
        try {
            byte[] buffer = new byte[1024];
            int bytesRead;
            FileOutputStream fops = new FileOutputStream(path);

            while ((bytesRead = is.read(buffer)) != -1) {
                fops.write(buffer, 0, bytesRead);
            }

            fops.flush();
            fops.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }





}
