package com.over.onlineshop.controllers;

import com.over.onlineshop.services.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Admin on 19.07.2017.
 */
@Controller
@RequestMapping(value = "/image")
public class ImageController {

    private static final Logger logger = LoggerFactory.getLogger(ImageController.class);

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/showImage", method = RequestMethod.GET)
    public void showImage(@RequestParam("index") Long id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        byte[] image = this.productService.getProductImage(id);
        logger.info("Image for product: "+ id);
        writeImage(image, response);
    }

    @RequestMapping(value = "/showOtherImage", method = RequestMethod.GET)
    public void showOtherImage(@RequestParam("index") Long id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        byte[] image = this.productService.getOtherImage(id);
        logger.info("Image for product: "+ id);
        writeImage(image, response);
    }

    private void writeImage(byte[] image, HttpServletResponse response) throws IOException {
        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        try {
            response.setContentLength(image.length);
            response.getOutputStream().write(image);
        } catch (IOException ex){
            ex.printStackTrace();
        } finally {
            response.getOutputStream().close();
        }
    }

    @Autowired(required = true)
    @Qualifier(value = "productService")
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }
}
