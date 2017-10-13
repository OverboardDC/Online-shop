package com.over.onlineshop.dao;

import com.over.onlineshop.entities.Cart;
import com.over.onlineshop.entities.Order;
import com.over.onlineshop.entities.OrderedProduct;
import com.over.onlineshop.entities.Product;
import com.over.onlineshop.objects.Paginator;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class CartDAOImpl implements CartDAO {

    private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);


    @Autowired
    private SessionFactory sessionFactory;
    private double totalPrice = 0;
    private double totalOrderPrice = 0;
    private Long totalRows;
    private int productsOnPage = 12;

    @Override
    @SuppressWarnings("unchecked")
    public List<Cart> getCartInfo() {
        List<Cart> cartList = getSession().createCriteria(Cart.class).list();
        totalPrice = 0;
        for (Cart cart : cartList) {
            totalPrice = totalPrice + (cart.getProduct().getPrice() * cart.getQuantity());
        }
        return cartList;
    }

    @Override
    public void addToCart(Long id) {
        Product product = (Product) getSession().createCriteria(Product.class).add(Restrictions.eq("id", id)).uniqueResult();
        Cart cart = new Cart();
        cart.setProduct(product);
        getSession().persist(cart);
    }

    @Override
    public void removeFromCart(Long id) {
        Cart cart = (Cart) getSession().createCriteria(Cart.class).add(Restrictions.eq("id", id)).uniqueResult();

        getSession().delete(cart);

    }

    public void updateQuantity(Long id, Integer quantity) {
        Cart cart = (Cart) getSession().createCriteria(Cart.class).add(Restrictions.eq("id", id)).uniqueResult();
        cart.setQuantity(quantity);
        getSession().update(cart);
    }

    @Override
    public void clearCart() {
        getSession().createQuery("delete  from Cart ").executeUpdate();
    }

    @Override
    @SuppressWarnings("unchecked")
    public void createOrder(Order order) {
        List<Cart> cartList = getSession().createCriteria(Cart.class).list();
        order = persistOrder(order);
        List<OrderedProduct> orderedProductList = new ArrayList<>();
        for (Cart cart : cartList) {
            updateCurrentProduct(cart);
            OrderedProduct product = new OrderedProduct();
            product.setProduct(cart.getProduct());
            product.setQuantity(cart.getQuantity());
            product.setOrder(order);
            orderedProductList.add(product);
            for (OrderedProduct orderedProduct : orderedProductList) {
                getSession().persist(orderedProduct);
                totalOrderPrice = totalOrderPrice + (orderedProduct.getProduct().getPrice() * orderedProduct.getQuantity());
            }
        }
        order.setTotalPrice(priceFinalCalculations(order, totalOrderPrice));
        getSession().update(order);
        totalOrderPrice = 0;
        clearCart();
    }

    @Override
    public Order getOrder(Long id) {
        Order order = (Order) getSession().createCriteria(Order.class).add(Restrictions.eq("id", id)).uniqueResult();
        for (OrderedProduct orderedProduct : order.getOrderedProducts()) {
            logger.info("Ordered products: " + orderedProduct.getProduct().getName());
        }
        return order;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Order> getFormedOrders(int page) {
        List<Order> orderList = getSession().createCriteria(Order.class).addOrder(org.hibernate.criterion.Order.desc("orderTime"))
                .setFirstResult((page * productsOnPage) - productsOnPage).setMaxResults(productsOnPage).list();
        totalRows = (Long) getSession().createCriteria(Order.class).setProjection(Projections.rowCount()).uniqueResult();
        for (Order order : orderList) {
            for (OrderedProduct orderedProduct : order.getOrderedProducts())
                logger.debug("Ordered products: " + orderedProduct.getProduct().getName());
        }
        logger.info("PAGINATION RESULTS: Page: " + page + " TotalRows: " + totalRows);
        return orderList;
    }

    @Override
    public void changeOrderState(Long id) {
        Order order = (Order) getSession().createCriteria(Order.class).add(Restrictions.eq("id", id)).uniqueResult();
        String state = null;
        if (order.getState().equals("Pending")) {
            state = "Shipping";
        }
        if (order.getState().equals("Shipping")) {
            state = "Complete";
        }
        order.setState(state);
        order.setLicenseAgreement(true);
        getSession().update(order);
    }

    @Override
    public void rollback(Long id) {
        Order order = (Order) getSession().createCriteria(Order.class).add(Restrictions.eq("id", id)).uniqueResult();
        String state = null;
        if (order.getState().equals("Shipping")) {
            state = "Pending";
        }
        if (order.getState().equals("Complete")) {
            state = "Shipping";
        }
        order.setState(state);
        order.setLicenseAgreement(true);
        getSession().update(order);
    }

    @Override
    @SuppressWarnings("unchecked")
    public void deleteOrder(Long id) {
        Order order = (Order) getSession().createCriteria(Order.class).add(Restrictions.eq("id", id)).uniqueResult();
        List<OrderedProduct> orderedProducts = getSession().createCriteria(OrderedProduct.class).add(Restrictions.eq("order", order)).list();
        for (OrderedProduct orderedProduct : orderedProducts) {
            getSession().delete(orderedProduct);
        }
        getSession().delete(order);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Integer> getPagination(int page) {
        Paginator paginator = new Paginator();
        return paginator.getPages(totalRows, productsOnPage, page);
    }

    @Override
    public double getTotalPrice() {
        return totalPrice;
    }

    @Override
    public double getTotalOrderPrice() {
        return totalOrderPrice;
    }

    private double priceFinalCalculations(Order order, double totalOrderPrice) {
        double deliveryPrice = 0;
        if (order.getDelivery().equals("Pickup")) {
            deliveryPrice = 0;
        } else {
            deliveryPrice = 10;
        }
        totalOrderPrice = totalOrderPrice + deliveryPrice;
        return totalOrderPrice;
    }

    private Order persistOrder(Order order) {
        java.util.Date date = new Date();
        Timestamp dateTime = new java.sql.Timestamp(date.getTime());
        order.setOrderTime(dateTime);
        order.setState("Pending");
        getSession().persist(order);
        return order;
    }

    private void updateCurrentProduct(Cart cart) {
        Product currentProduct = (Product) getSession().createCriteria(Product.class).add(Restrictions.eq("id", cart.getProduct().getId())).uniqueResult();
        currentProduct.setAmount(currentProduct.getAmount() - cart.getQuantity());
        currentProduct.setSelled(currentProduct.getSelled() + cart.getQuantity());
        getSession().update(currentProduct);
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
