package com.over.onlineshop.dao;

import com.over.onlineshop.entities.Cart;
import com.over.onlineshop.entities.Order;

import java.util.List;

public interface CartDAO {

    List<Cart> getCartInfo();

    void addToCart(Long id);

    void removeFromCart(Long id);

    void clearCart();

    void updateQuantity(Long id, Integer quantity);

    void createOrder(Order order);

    Order getOrder(Long id);

    List<Order> getFormedOrders(int page);

    void changeOrderState(Long id);

    void rollback(Long id);

    void deleteOrder(Long id);

    List<Integer> getPagination(int page);

    double getTotalPrice();

    double getTotalOrderPrice();
}
