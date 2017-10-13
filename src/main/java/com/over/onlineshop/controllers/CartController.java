package com.over.onlineshop.controllers;

import com.over.onlineshop.entities.Cart;
import com.over.onlineshop.entities.Order;
import com.over.onlineshop.services.CartService;
import com.over.onlineshop.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class CartController {

    private CartService cartService;
    private CategoryService categoryService;

    @ModelAttribute
    public void sectionsAndCart(Model model) {
        model.addAttribute("cart", this.cartService.getCartInfo());
        model.addAttribute("totalPrice", this.cartService.getTotalPrice());
        model.addAttribute("sections", this.categoryService.getSections());
    }

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String cart() {
        return "cart";
    }

    @RequestMapping(value = "/addToCart/{id}", method = RequestMethod.GET)
    public String addToCart(@PathVariable("id") Long id) {
        cartService.addToCart(id);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/removeFromCart/{id}", method = RequestMethod.GET)
    public String removeFromCart(@PathVariable("id") Long id) {
        cartService.removeFromCart(id);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/clearCart", method = RequestMethod.GET)
    public String clearCart() {
        cartService.clearCart();
        return "redirect:/cart";
    }

    @RequestMapping(value = "updateQuantity/{id}", method = RequestMethod.GET)
    public String updateQuantity(@PathVariable("id") Long id, @RequestParam("quantity") Integer quantity) {
        cartService.updateQuantity(id, quantity);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkout(@ModelAttribute("order") Order order, Model model) {
        model.addAttribute("cart", this.cartService.getCartInfo());
        return "checkout";
    }

    @RequestMapping(value = "/createOrder", method = RequestMethod.POST)
    public String createOrder(@Valid Order order, BindingResult bindingResult) {
        List<Cart> cartList = this.cartService.getCartInfo();
        if (bindingResult.hasErrors() || cartList.size() == 0) {
            return "checkout";
        } else {
            this.cartService.createOrder(order);
            return "redirect:/order/" + order.getId();
        }
    }

    @RequestMapping(value = "/order/{id}")
    public String confirmOrder(@PathVariable("id") Long id, Model model) {
        model.addAttribute("order", this.cartService.getOrder(id));
        model.addAttribute("totalOrderPrice", this.cartService.getTotalOrderPrice());
        return "order";
    }

    @RequestMapping(value = "/admin/formedOrders", method = RequestMethod.GET)
    public String formedOrders(@RequestParam(name = "page", defaultValue = "1") int page, Model model){

        model.addAttribute("orders", this.cartService.getFormedOrders(page));
        model.addAttribute("pages", this.cartService.getPagination(page));
        model.addAttribute("selectedPage", page);
        return "formedOrders";
    }

    @RequestMapping(value = "/admin/viewOrder/{id}", method = RequestMethod.GET)
    public String viewOrder(@PathVariable("id") Long id ,Model model){
            model.addAttribute("order", this.cartService.getOrder(id));
            return "formedOrder";
    }

    @RequestMapping(value = "/admin/changeStatus/{id}")
    public String changeOrderStatus(@PathVariable("id") Long id){
        this.cartService.changeOrderState(id);
        return "redirect:/admin/viewOrder/"+id;
    }

    @RequestMapping(value = "/admin/rollbackOrder/{id}")
    public String rollback(@PathVariable("id") Long id){
        this.cartService.rollback(id);
        return "redirect:/admin/viewOrder/"+id;
    }

    @RequestMapping(value = "/admin/removeOrder/{id}")
    public String removeOrder(@PathVariable("id") Long id){
        this.cartService.deleteOrder(id);
        return "redirect:/admin/formedOrders";
    }


    @Autowired(required = true)
    @Qualifier(value = "cartService")
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    @Autowired(required = true)
    @Qualifier(value = "categoryService")
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }
}
