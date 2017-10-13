package com.over.onlineshop.dao;

import com.over.onlineshop.entities.Brand;
import com.over.onlineshop.entities.Category;
import com.over.onlineshop.entities.Section;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

    private static final Logger logger = LoggerFactory.getLogger(CategoryDAOImpl.class);


    @Autowired
    private SessionFactory sessionFactory;


    @Override
    @SuppressWarnings("unchecked")
    public List<Section> getSections() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Section> sections = new ArrayList<>();
        sections = session.createCriteria(Section.class).list();
        List<Category> categories;
        Set<Brand> brands;

        for (Section section : sections) {
            logger.info("Section " + section.getName());
            categories = section.getCategories();
            brands = section.getBrands();
            for (Brand brand : brands) {
                logger.info("Brand of section " + brand.getName());
            }
            for (Category category : categories) {
                logger.info("Category " + category.getName());

                for (Brand brand : category.getBrands()) {
                    logger.info("Brand " + brand.getName());
                }
            }
        }
        return sections;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Category> getCategories() {
        return this.sessionFactory.getCurrentSession().createCriteria(Category.class).list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Brand> getBrands() {
        return this.sessionFactory.getCurrentSession().createCriteria(Brand.class).list();
    }

    @Override
    public Category getCategory(Long id) {
        Category category;
        category = (Category) this.sessionFactory.getCurrentSession().createCriteria(Category.class).add(Restrictions.eq("id", id)).uniqueResult();
        for (Brand brand : category.getBrands()) {
            logger.info("INFO BRAND CATEGORY: " + category.getName() + "BRAND: " + brand.getName() + " SECTION " + category.getSection().getName());
        }
        return category;
    }

    @Override
    public Section getSection(Long id) {
        Section section;
        section = (Section) this.sessionFactory.getCurrentSession().createCriteria(Section.class).add(Restrictions.eq("id", id)).uniqueResult();
        for (Brand brand : section.getBrands()) {
            logger.info("INFO BRAND CATEGORY: " + section.getName() + "BRAND: " + brand.getName());
        }
        return section;
    }

    @Override
    public Brand getBrand(Long id) {
        Brand brand;
        brand = (Brand) this.sessionFactory.getCurrentSession().createCriteria(Brand.class).add(Restrictions.eq("id", id)).uniqueResult();
        logger.info("BRAND: " + brand.getName());
        return brand;
    }


    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
