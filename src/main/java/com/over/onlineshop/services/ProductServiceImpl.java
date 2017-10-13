package com.over.onlineshop.services;

import com.over.onlineshop.dao.ProductDAO;
import com.over.onlineshop.entities.Image;
import com.over.onlineshop.entities.Product;
import com.over.onlineshop.entities.SpecialProduct;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Admin on 15.07.2017.
 */
@Service
public class ProductServiceImpl implements ProductService {

    private ProductDAO productDAO;

    @Override
    @Transactional
    public Product getProduct(Long id) {
        return this.productDAO.getProduct(id);
    }

    @Override
    @Transactional
    public List<Product> getProducts() {
        return this.productDAO.getProducts();
    }

    @Override
    @Transactional
    public List<Product> getProductsByCategory(Long id, String sort, boolean isAsc, String brand, int page) {
        return this.productDAO.getProductsByCategory(id, sort, isAsc, brand, page);
    }

    @Override
    @Transactional
    public List<Product> getProductsBySection(Long id, String sort, boolean isAsc, String brand, int page) {
        return this.productDAO.getProductsBySection(id, sort, isAsc, brand, page);
    }

    @Override
    @Transactional
    public List<Product> getProductsByBrand(Long id, String sort, boolean isAsc, String brand, int page) {
        return this.productDAO.getProductsByBrand(id, sort, isAsc, brand, page);
    }

    @Override
    @Transactional
    public List<Product> getProductsBySearch(String searchString, String sort, boolean isAsc, int page) {
        return this.productDAO.getProductsBySearch(searchString, sort, isAsc, page);
    }

    @Override
    @Transactional
    public List<SpecialProduct> getSpecialProducts() {
        return this.productDAO.getSpecialProducts();
    }

    @Override
    @Transactional
    public List<Product> getLatestProducts() {
        return this.productDAO.getLatestProducts();
    }

    @Override
    @Transactional
    public List<Product> getBestsellers() {
        return this.productDAO.getBestsellers();
    }

    @Override
    @Transactional
    public List<Product> getFeaturedProducts() {
        return this.productDAO.getFeaturedProducts();
    }

    @Override
    @Transactional
    public List<Integer> getPagination(int page) {
        return this.productDAO.getPagination(page);
    }

    @Override
    @Transactional
    public void addProduct(Product product) {
        this.productDAO.addProduct(product);
    }

    @Override
    @Transactional
    public void removeProduct(Long id) {
        this.productDAO.removeProduct(id);
    }

    @Override
    @Transactional
    public void editProduct(Product product) {
        this.productDAO.editProduct(product);
    }


    @Override
    @Transactional
    public byte[] getProductImage(Long id) {
        return this.productDAO.getImage(id);
    }

    @Override
    @Transactional
    public void addOtherImage(Image image, Product product) {
        this.productDAO.addOtherImage(image, product);
    }

    @Override
    @Transactional
    public void removeOtherImage(Long id) {
        this.productDAO.removeOtherImage(id);
    }

    @Override
    @Transactional
    public byte[] getOtherImage(Long id) {
        return this.productDAO.getOtherImage(id);
    }


    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }
}
