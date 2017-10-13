package com.over.onlineshop.services;

import com.over.onlineshop.dao.CartDAO;
import com.over.onlineshop.entities.Cart;
import com.over.onlineshop.entities.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    private CartDAO cartDAO;

    @Override
    @Transactional
    public List<Cart> getCartInfo() {
        return this.cartDAO.getCartInfo();
    }

    @Override
    @Transactional
    public void addToCart(Long id) {
        this.cartDAO.addToCart(id);
    }

    @Override
    @Transactional
    public void removeFromCart(Long id) {
        this.cartDAO.removeFromCart(id);
    }

    @Override
    @Transactional
    public void clearCart() {
        this.cartDAO.clearCart();
    }

    @Override
    @Transactional
    public void updateQuantity(Long id, Integer quantity) {
        this.cartDAO.updateQuantity(id, quantity);
    }

    @Override
    @Transactional
    public void createOrder(Order order) {
        this.cartDAO.createOrder(order);
    }

    @Override
    @Transactional
    public Order getOrder(Long id) {
        return this.cartDAO.getOrder(id);
    }

    @Override
    @Transactional
    public List<Order> getFormedOrders(int page) {
        return this.cartDAO.getFormedOrders(page);
    }

    @Override
    @Transactional
    public void changeOrderState(Long id) {
        this.cartDAO.changeOrderState(id);
    }

    @Override
    @Transactional
    public void rollback(Long id) {
        this.cartDAO.rollback(id);
    }

    @Override
    @Transactional
    public void deleteOrder(Long id) {
        this.cartDAO.deleteOrder(id);
    }

    @Override
    @Transactional
    public List<Integer> getPagination(int page) {
        return this.cartDAO.getPagination(page);
    }

    @Override
    @Transactional
    public double getTotalPrice() {
        return this.cartDAO.getTotalPrice();
    }

    @Override
    @Transactional
    public double getTotalOrderPrice() {
        return this.cartDAO.getTotalOrderPrice();
    }

    public void setCartDAO(CartDAO cartDAO) {
        this.cartDAO = cartDAO;
    }
}
