package com.over.onlineshop.dao;

import com.over.onlineshop.entities.Commentary;
import com.over.onlineshop.entities.Image;
import com.over.onlineshop.entities.Product;
import com.over.onlineshop.entities.SpecialProduct;
import com.over.onlineshop.objects.Paginator;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO {

    private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);


    @Autowired
    private SessionFactory sessionFactory;
    private List<Product> products;
    private Long totalRows;  //For pagination
    private int productsOnPage = 10;

    @Override
    public Product getProduct(Long id) {
        Criteria criteria = getSession().createCriteria(Product.class).add(Restrictions.eq("id", id)).
                createAlias("brand", "brand").createAlias("category", "category");
        Product product = (Product) criteria.uniqueResult();
        for (Image image : product.getImages()) {
            logger.info("Product info: " + product.getName() + "Image id: " + image.getId());
        }
        for (Commentary commentary : product.getCommentaries()) {
            logger.info("Commentators: " + commentary.getUser());
        }
        return product;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> getProducts() {
        return getSession().createCriteria(Product.class).list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> getProductsByCategory(Long id, String sort, boolean isAsc, String brand, int page) {
        Criteria criteria = createProductCriteria(page).add(Restrictions.eq("category.id", id));
        criteria = sortProducts(criteria, sort, isAsc);
        if (brand != null) {
            criteria.add(addBrandCriterion(brand));
        }
        totalRows = (Long) getSession().createCriteria(Product.class).setProjection(Projections.rowCount()).add(Restrictions.eq("category.id", id)).uniqueResult();
        products = criteria.list();
        for (Product product : products) {
            logger.info("Products: " + product.getName() + " Index: " + products.indexOf(product) + " Category: " + product.getCategory().getName() +
                    " Section " + product.getCategory().getSection().getName());
        }
        logger.info("PAGINATION RESULTS: Page: " + page + " TotalRows: " + totalRows);
        return products;

    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> getProductsBySection(Long id, String sort, boolean isAsc, String brand, int page) {
        Criteria criteria = getSession().createCriteria(Product.class).createAlias("brand", "brand").createAlias("category", "category").createAlias("category.section", "section")
                .add(Restrictions.eq("section.id", id));
        criteria = sortProducts(criteria, sort, isAsc);
        if (brand != null) {
            criteria.add(addBrandCriterion(brand));
        }
        totalRows = Long.valueOf(criteria.list().size());
        criteria.setFirstResult((page * productsOnPage) - productsOnPage).setMaxResults(productsOnPage);
        products = criteria.list();
        logger.info("PAGINATION RESULTS: Page: " + page + " TotalRows: " + totalRows);
        return products;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> getProductsByBrand(Long id, String sort, boolean isAsc, String brand, int page) {
        Criteria criteria = createProductCriteria(page).add(Restrictions.eq("brand.id", id));
        criteria = sortProducts(criteria, sort, isAsc);
        if (brand != null) {
            criteria.add(addBrandCriterion(brand));
        }
        totalRows = (Long) getSession().createCriteria(Product.class).setProjection(Projections.rowCount()).add(Restrictions.eq("brand.id", id)).uniqueResult();
        logger.info("PAGINATION RESULTS: Page: " + page + " TotalRows: " + totalRows);
        products = criteria.list();
        for (Product product : products) {
            logger.info("Products: " + product.getName() + "Index: " + products.indexOf(product));
        }
        return products;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> getProductsBySearch(String searchString, String sort, boolean isAsc, int page) {
        Criteria criteria = createProductCriteria(page);
        Criterion brandCriterion = Restrictions.ilike("brand.name", searchString, MatchMode.ANYWHERE);
        Criterion nameCriterion = Restrictions.ilike("name", searchString, MatchMode.ANYWHERE);
        criteria.add(Restrictions.or(brandCriterion, nameCriterion));
        totalRows = (Long) getSession().createCriteria(Product.class).createAlias("brand", "brand").setProjection(Projections.rowCount()).add(Restrictions.or(brandCriterion, nameCriterion)).uniqueResult();
        criteria = sortProducts(criteria, sort, isAsc);
        products = criteria.list();
        for (Product product : products) {
            logger.info("Products: " + product.getName() + "Index: " + products.indexOf(product));
        }
        return products;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<SpecialProduct> getSpecialProducts() {
        return getSession().createCriteria(SpecialProduct.class).createAlias("product.brand", "brand").list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> getLatestProducts() {
        List<Product> latestProducts;
        Criteria criteria = getSession().createCriteria(Product.class).setMaxResults(6);
        criteria.addOrder(Order.desc("addingDate"));
        latestProducts = criteria.list();
        return latestProducts;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> getBestsellers() {
        List<Product> bestsellers;
        Criteria criteria = getSession().createCriteria(Product.class).setMaxResults(6);
        criteria.addOrder(Order.desc("selled"));
        bestsellers = criteria.list();
        return bestsellers;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> getFeaturedProducts() {
        List<Product> featuredProducts;
        Criteria criteria = getSession().createCriteria(Product.class).setMaxResults(6);
        criteria.addOrder(Order.asc("selled"));
        featuredProducts = criteria.list();
        return featuredProducts;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Integer> getPagination(int page) {
        Paginator paginator = new Paginator();
        return paginator.getPages(totalRows, productsOnPage, page);
    }

    @Override
    public void addProduct(Product product) {
        if (!product.getFile().isEmpty()) {
            try {
                product.setImage(product.getFile().getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        product = checkDiscount(product);

        product.setAddingDate(new Date());
        getSession().persist(product);
        logger.info("Product " + product.getName() + " " + product.getBrand().getName() + " was updated");
    }

    @Override
    public void editProduct(Product product) {
        if (!product.getFile().isEmpty()) {
            try {
                product.setImage(product.getFile().getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            product.setImage(product.getImage());
        }


        product = checkDiscount(product);

        getSession().update(product);
        logger.info("Product " + product.getName() + " " + product.getBrand().getName() + " was updated");
    }


    @Override
    public void removeProduct(Long id) {
        Product product = (Product) getSession().createCriteria(Product.class).add(Restrictions.eq("id", id)).uniqueResult();
        if (product.getImages().size() != 0) {
            List images = getSession().createCriteria(Image.class).add(Restrictions.eq("product", product)).list();
            for (Object image : images) {
                getSession().delete(image);
            }
        }
        getSession().delete(product);
        logger.info("Product with id: " + id + " Name: " + product.getBrand().getName() + " " + product.getName() + " was successfully removed");
    }


    @Override
    public byte[] getImage(Long id) {
        return (byte[]) getFieldValue(id, "image");
    }

    @Override
    public void addOtherImage(Image image, Product product) {
        image.setProduct(product);
        try {
            image.setImage(image.getFile().getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        getSession().persist(image);
    }

    @Override
    public void removeOtherImage(Long id) {
        Image image = (Image) getSession().createCriteria(Image.class).add(Restrictions.eq("id", id)).uniqueResult();
        getSession().delete(image);
        logger.info("Image " + image.getId() + " from product " + image.getProduct().getId() + " was removed");
    }

    @Override
    public byte[] getOtherImage(Long id) {
        Criteria criteria = getSession().createCriteria(Image.class);
        criteria.setProjection(Projections.property("image"));
        criteria.add(Restrictions.eq("id", id));
        return (byte[]) criteria.uniqueResult();
    }

    private Object getFieldValue(Long id, String field) {
        Criteria criteria = getSession().createCriteria(Product.class);
        criteria.setProjection(Projections.property(field));
        criteria.add(Restrictions.eq("id", id));
        return criteria.uniqueResult();
    }

    private Criteria createProductCriteria(int page) {
        return getSession().createCriteria(Product.class).createAlias("brand", "brand").setFirstResult((page * productsOnPage) - productsOnPage).setMaxResults(productsOnPage);
    }

    private Criteria sortProducts(Criteria criteria, String sort, boolean isAsc) {
        if (sort != null) {
            if (isAsc) {
                return criteria.addOrder(Order.asc(sort));
            } else {
                return criteria.addOrder(Order.desc(sort));
            }
        } else return criteria;
    }

    //Checks the discount field value
    private Product checkDiscount(Product product) {
        if (product.getOldPrice() != 0) {
            product.setDiscount(true);
        } else {
            product.setDiscount(false);
        }
        return product;
    }

    private Criterion addBrandCriterion(String brand) {
        return Restrictions.eq("brand.name", brand);
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
