package com.over.onlineshop.controllers;

import com.over.onlineshop.entities.User;
import com.over.onlineshop.services.CartService;
import com.over.onlineshop.services.CategoryService;
import com.over.onlineshop.services.login.SecurityService;
import com.over.onlineshop.services.login.UserService;
import com.over.onlineshop.validators.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    private CategoryService categoryService;
    private CartService cartService;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @ModelAttribute
    public void sectionsAndCart(Model model, HttpServletRequest request){
        model.addAttribute("cart", this.cartService.getCartInfo());
        model.addAttribute("totalPrice", this.cartService.getTotalPrice());
        model.addAttribute("sections",this.categoryService.getSections());
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/afterRegistration", method = RequestMethod.GET)
    public String AfterRegistration(Model model) {

        return "thanksForRegistration";
    }



    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());

        return "redirect:/afterRegistration";
    }


    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public String login(Model model, String error, String logout){
        if(error != null){
            model.addAttribute("error", "Username or password is incorrect");
        }
        if(logout != null){
            model.addAttribute("message", "Logout successfully");
        }
        return "login";
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String welcome(Model model){
        return "redirect:/";
    }

    @Autowired(required = true)
    @Qualifier(value = "categoryService")
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }


    @Autowired(required = true)
    @Qualifier(value = "cartService")
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }


}
