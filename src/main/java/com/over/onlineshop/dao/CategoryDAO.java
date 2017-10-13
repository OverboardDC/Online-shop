package com.over.onlineshop.dao;

import com.over.onlineshop.entities.Brand;
import com.over.onlineshop.entities.Category;
import com.over.onlineshop.entities.Section;

import java.util.List;

/**
 * Created by Admin on 09.07.2017.
 */
public interface CategoryDAO {

    public List<Section> getSections();

    public List<Category> getCategories();

    public List<Brand> getBrands();

    public Category getCategory(Long id);

    public Section getSection(Long id);

    public Brand getBrand(Long id);
}
