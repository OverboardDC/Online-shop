package com.over.onlineshop.services;

import com.over.onlineshop.dao.CategoryDAO;
import com.over.onlineshop.entities.Brand;
import com.over.onlineshop.entities.Category;
import com.over.onlineshop.entities.Section;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Admin on 09.07.2017.
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    private CategoryDAO categoryDAO;

    @Override
    @Transactional
    public List<Section> getSections() {
        return this.categoryDAO.getSections();
    }

    @Override
    @Transactional
    public List<Category> getCategories() {
        return this.categoryDAO.getCategories();
    }

    @Override
    @Transactional
    public List<Brand> getBrands() {
        return this.categoryDAO.getBrands();
    }

    @Override
    @Transactional
    public Category getCategories(Long id) {
        return this.categoryDAO.getCategory(id);
    }

    @Override
    @Transactional
    public Section getSection(Long id) {
        return this.categoryDAO.getSection(id);
    }

    @Override
    @Transactional
    public Brand getBrand(Long id) {
        return this.categoryDAO.getBrand(id);
    }


    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }
}
