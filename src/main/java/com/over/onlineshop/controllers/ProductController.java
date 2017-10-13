package com.over.onlineshop.controllers;

import com.over.onlineshop.entities.Commentary;
import com.over.onlineshop.entities.Image;
import com.over.onlineshop.entities.Product;
import com.over.onlineshop.services.CartService;
import com.over.onlineshop.services.CategoryService;
import com.over.onlineshop.services.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.IOException;

@Controller
public class ProductController {

    private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

    private CategoryService categoryService;
    private ProductService productService;
    private CartService cartService;
    private String lastSearch;
    private String lastSorting;
    private boolean lastSortingType;
    private String lastBrand;
    private String lastGettingType = "";

    @ModelAttribute
    public void submitAttributes(Model model) {
        model.addAttribute("cart", this.cartService.getCartInfo());
        model.addAttribute("totalPrice", this.cartService.getTotalPrice());
        model.addAttribute("sections", this.categoryService.getSections());
        model.addAttribute("bestsellers", this.productService.getBestsellers());
        model.addAttribute("featuredProducts", this.productService.getFeaturedProducts());
    }

    @RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
    public String productsByCategory(@PathVariable("id") Long id,
                                     @RequestParam(value = "sort", required = false) String sort,
                                     @RequestParam(value = "isAsc", required = false) boolean isAsc,
                                     @RequestParam(value = "brand", required = false) String brand,
                                     @RequestParam(value = "page", defaultValue = "1") int page,
                                     Model model) {
        String gettingType = "category" + id;
        if (sort != null) {
            lastSorting = sort;
            lastSortingType = isAsc;
        }

        if (!lastGettingType.equals(gettingType)) {
            lastBrand = null;
        }
        if (brand != null) {
            lastBrand = brand;
        }

        model.addAttribute("products", this.productService.getProductsByCategory(id, lastSorting, lastSortingType, lastBrand, page));
        model.addAttribute("category", this.categoryService.getCategories(id));
        model.addAttribute("brands", this.categoryService.getCategories(id).getBrands());
        model.addAttribute("pages", this.productService.getPagination(page));
        model.addAttribute("selectedPage", page);
        lastGettingType = gettingType;
        return "products";
    }

    @RequestMapping(value = "/section/{id}", method = RequestMethod.GET)
    public String productsBySection(@PathVariable("id") Long id,
                                    @RequestParam(value = "sort", required = false) String sort,
                                    @RequestParam(value = "isAsc", required = false) boolean isAsc,
                                    @RequestParam(value = "brand", required = false) String brand,
                                    @RequestParam(value = "page", defaultValue = "1") int page,
                                    Model model) {

        String gettingType = "section" + id;

        if (sort != null) {
            lastSorting = sort;
            lastSortingType = isAsc;
        }
        if (!lastGettingType.equals(gettingType)) {
            lastBrand = null;
        }
        if (brand != null) {
            lastBrand = brand;
        }

        model.addAttribute("products", this.productService.getProductsBySection(id, lastSorting, lastSortingType, lastBrand, page));
        model.addAttribute("category", this.categoryService.getSection(id));
        model.addAttribute("brands", this.categoryService.getSection(id).getBrands());
        model.addAttribute("pages", this.productService.getPagination(page));
        model.addAttribute("selectedPage", page);
        lastGettingType = gettingType;
        return "products";
    }

    @RequestMapping(value = "/brand/{id}", method = RequestMethod.GET)
    public String productsByBrand(@PathVariable("id") Long id,
                                  @RequestParam(value = "sort", required = false) String sort,
                                  @RequestParam(value = "isAsc", required = false) boolean isAsc,
                                  @RequestParam(value = "brand", required = false) String brand,
                                  @RequestParam(value = "page", defaultValue = "1") int page,
                                  Model model) {
        String gettingType = "brand" + id;
        if (sort != null) {
            lastSorting = sort;
            lastSortingType = isAsc;
        }
        if (!lastGettingType.equals(gettingType)) {
            lastBrand = null;
        }
        if (brand != null) {
            lastBrand = brand;
        }
        model.addAttribute("products", this.productService.getProductsByBrand(id, lastSorting, lastSortingType, lastBrand, page));
        model.addAttribute("category", this.categoryService.getBrand(id));
        model.addAttribute("brands", null);
        model.addAttribute("pages", this.productService.getPagination(page));
        model.addAttribute("selectedPage", page);
        lastGettingType = gettingType;
        return "products";
    }


    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String productsBySearch(@RequestParam(value = "searchString", required = false) String searchString,
                                   @RequestParam(value = "sort", required = false) String sort,
                                   @RequestParam(value = "isAsc", required = false) boolean isAsc,
                                   @RequestParam(value = "page", defaultValue = "1") int page,
                                   Model model) {
        if (sort != null) {
            lastSorting = sort;
            lastSortingType = isAsc;
        }
        if (searchString != null) {
            lastSearch = searchString;
        }
        model.addAttribute("products", this.productService.getProductsBySearch(lastSearch, lastSorting, lastSortingType, page));
        model.addAttribute("brands", null);
        model.addAttribute("pages", this.productService.getPagination(page));
        model.addAttribute("selectedPage", page);
        return "products";
    }

    @RequestMapping(value = "/admin/addProductPage", method = RequestMethod.GET)
    public String addProductPage(@ModelAttribute("product") Product product, Model model) {
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("brands", this.categoryService.getBrands());
        return "addProduct";
    }

    @RequestMapping(value = "/admin/addNewProduct", method = RequestMethod.POST)
    public String addProduct(@Valid Product product, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return addProductPage(product, model);
        }
        try {
            product.setImage(product.getFile().getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.productService.addProduct(product);
        return "redirect:/";
    }

    @RequestMapping(value = "/admin/editProduct/{id}", method = RequestMethod.GET)
    public String editProductPage(@PathVariable("id") Long id, @ModelAttribute("product") Product product, Model model) {
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("brands", this.categoryService.getBrands());
        model.addAttribute("product", this.productService.getProduct(id));
        return "editProduct";
    }

    @RequestMapping(value = "/admin/editTheProduct", method = RequestMethod.POST)
    public String editProduct(@Valid Product product, Model model) {
        productService.editProduct(product);
        return "redirect:/product/" + product.getId();
    }

    @RequestMapping(value = "/admin/removeProduct/{id}")
    public String removeProduct(@PathVariable("id") Long id) {
        this.productService.removeProduct(id);
        return "redirect:/";
    }

    @RequestMapping(value = "/admin/addImage", method = RequestMethod.POST)
    public String addImage(@ModelAttribute("image") Image image, @RequestParam("product_id") Long productId) {
        Product product = this.productService.getProduct(productId);
        logger.info("/////////////////////////////////////////////////////////////Image adding testing: " + product.getId() + " image: "+image.getId()  );
        productService.addOtherImage(image, product);

        return "redirect:/product/" +productId;
    }

    @RequestMapping(value = "/admin/removeImage/{id}")
    public String removeImage(@PathVariable("id") Long id, @RequestParam("product_id") Long product_id){
        this.productService.removeOtherImage(id);
        return "redirect:/product/"+product_id;
    }

    @RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
    public String getProduct(@ModelAttribute("commentary") Commentary commentary,
                             @ModelAttribute("image") Image image,
                             @PathVariable("id") Long id, Model model) {
        model.addAttribute("product", this.productService.getProduct(id));
        return "product";
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
