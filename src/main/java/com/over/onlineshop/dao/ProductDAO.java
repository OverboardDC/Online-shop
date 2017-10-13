package com.over.onlineshop.dao;

import com.over.onlineshop.entities.Image;
import com.over.onlineshop.entities.Product;
import com.over.onlineshop.entities.SpecialProduct;

import java.util.List;

/**
 * Created by Admin on 15.07.2017.
 */
public interface ProductDAO {

    Product getProduct(Long id);

    List<Product> getProducts();

    List<Product> getProductsByCategory(Long id, String sort, boolean isAsc, String brand, int page);

    List<Product> getProductsBySection(Long id, String sort, boolean isAsc, String brand, int page);

    List<Product> getProductsByBrand(Long id, String sort, boolean isAsc, String brand, int page);

    List<Product> getProductsBySearch(String searchString, String sort, boolean isAsc,int page);

    List<SpecialProduct> getSpecialProducts();

    List<Product> getLatestProducts();

    List<Product> getBestsellers();

    List<Product> getFeaturedProducts();

    List<Integer> getPagination(int page);

    void addProduct(Product product);

    void editProduct(Product product);

    void removeProduct(Long id);

    byte[] getImage(Long id);

    void addOtherImage(Image image, Product product);

    void removeOtherImage(Long id);

    byte[] getOtherImage(Long id);
}
