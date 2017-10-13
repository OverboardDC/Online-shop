package com.over.onlineshop.controllers;


import com.over.onlineshop.dao.ProductDAOImpl;
import com.over.onlineshop.services.CartService;
import com.over.onlineshop.services.CategoryService;
import com.over.onlineshop.services.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    private CategoryService categoryService;
    private ProductService productService;
    private CartService cartService;
    private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model){
        model.addAttribute("specialProducts", this.productService.getSpecialProducts());
        model.addAttribute("latestProducts", this.productService.getLatestProducts());
        return "home";
    }
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String homePage(Model model){
        model.addAttribute("specialProducts", this.productService.getSpecialProducts());
        model.addAttribute("latestProducts", this.productService.getLatestProducts());
        return "home";
    }

    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public String contacts(Model model){
        model.addAttribute("bestsellers", this.productService.getBestsellers());
        model.addAttribute("featuredProducts", this.productService.getFeaturedProducts());
        return "contacts";
    }
    @ModelAttribute
    public void sectionsAndCart(Model model, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if(session==null){
            cartService.clearCart();
            logger.info("This is a new session!!!");
        } else {
            logger.info("This is an old session...");
        }
        model.addAttribute("cart", this.cartService.getCartInfo());
        model.addAttribute("totalPrice", this.cartService.getTotalPrice());
        model.addAttribute("sections",this.categoryService.getSections());
    }

    @Autowired(required = true)
    @Qualifier(value = "categoryService")
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Autowired(required = true)
    @Qualifier(value = "productService")
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @Autowired(required = true)
    @Qualifier(value = "cartService")
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }
}
