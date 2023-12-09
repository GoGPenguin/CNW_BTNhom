package Controller.User;

import Model.BEAN.Order;
import Model.BEAN.Product;
import Model.BEAN.User;
import Model.BO.ProductBO;
import Model.DAO.OrderDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.Objects;

@WebServlet(urlPatterns = "/buy")
public class BuyProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Lấy thông tin user từ session
            User user = (User) session.getAttribute("user");
            if (user != null) {
                session.setAttribute("user", user);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("order.jsp");
                requestDispatcher.forward(request, response);
            } else {
                response.sendRedirect("/login");
            }
        } else {
            // Session không tồn tại, có thể yêu cầu đăng nhập
//            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            response.sendRedirect("/login");

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Lấy thông tin user từ session
            User user = (User) session.getAttribute("user");
            if (user != null) {
                String action = request.getParameter("action");
                switch (action) {
                    case "cart":
                        int amount = Integer.parseInt(request.getParameter("amount"));
                        String idProduct = request.getParameter("idProduct");
                        Product product = ProductBO.getInstance().getProductById(idProduct);

                        Order order = new Order();
                        order.setIdUser(user.getIdUser());
                        order.setProduct(product);
                        order.setAmount(amount);
                        order.setTotalCost(product.getPrice() * amount);

                        ArrayList<Order> orderList = (ArrayList<Order>) session.getAttribute("orderList");
                        if (orderList == null) {
                            orderList = new ArrayList<>();
                        }
                        if (!orderList.isEmpty()) {
                            boolean found = false;
                            for (int i = 0; i < orderList.size(); i++) {
                                if (Objects.equals(product.getIdProduct(), orderList.get(i).getProduct().getIdProduct())) {
                                    int newAmount = orderList.get(i).getAmount() + order.getAmount();
                                    int newTotalCost = orderList.get(i).getProduct().getPrice() * newAmount;
                                    orderList.get(i).setAmount(newAmount);
                                    orderList.get(i).setTotalCost(newTotalCost);
                                    found = true;
                                    break;
                                }
                            }
                            if (!found) {
                                orderList.add(order);
                            }
                        } else {
                            orderList.add(order);
                        }

                        int payment = 0;
                        for (int i = 0; i < orderList.size(); i++) {
                            payment += orderList.get(i).getTotalCost();
                        }
                        session.setAttribute("orderList", orderList);
                        session.setAttribute("payment", payment);
                        session.setAttribute("user", user);
                        request.getRequestDispatcher("cart.jsp").forward(request, response);
                        break;

                    case "delete":
                        orderList = (ArrayList<Order>) session.getAttribute("orderList");
                        int index = Integer.parseInt(request.getParameter("order"));
                        for (int i = orderList.size() - 1; i >= 0; i--) {
                            if (i == index) {
                                orderList.remove(i);
                                break;
                            }
                        }
                        payment = 0;
                        for (int i = 0; i < orderList.size(); i++) {
                            payment += orderList.get(i).getTotalCost();
                        }
                        session.setAttribute("orderList", orderList);
                        session.setAttribute("payment", payment);
                        session.setAttribute("user", user);
                        request.getRequestDispatcher("cart.jsp").forward(request, response);
                        break;

                    case "buy":
                        session.setAttribute("user", user);
                        request.getRequestDispatcher("order.jsp").forward(request, response);
                        break;

                    case "pay":
                        orderList = (ArrayList<Order>) session.getAttribute("orderList");
                        LocalDateTime currentTime = LocalDateTime.now();

                        Date date = Date.from(currentTime.atZone(ZoneId.systemDefault()).toInstant());
                        for (int i = 0; i < orderList.size(); i++) {
                            orderList.get(i).setNameUser(user.getNameUser());
                            orderList.get(i).setPhoneUser(user.getPhoneUser());
                            orderList.get(i).setAddressUser(user.getAddressUser());
                            OrderDAO.getInstance().addOrder(orderList.get(i).getIdProduct(),
                                    user.getIdUser(), orderList.get(i).getAmount(), date);
                        }
//                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        response.sendRedirect("/");
                        break;
                }
            } else {
                response.sendRedirect("/login");
            }
        } else {
            // Session không tồn tại, có thể yêu cầu đăng nhập
            response.sendRedirect("/login");
        }
    }
}
