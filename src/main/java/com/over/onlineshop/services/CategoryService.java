package com.over.onlineshop.services;

import com.over.onlineshop.entities.Brand;
import com.over.onlineshop.entities.Category;
import com.over.onlineshop.entities.Section;

import java.util.List;

/**
 * Created by Admin on 09.07.2017.
 */
public interface CategoryService {

    public List<Section> getSections();

    public List<Category> getCategories();

    public List<Brand> getBrands();

    public Category getCategories(Long id);

    public Section getSection(Long id);

    public Brand getBrand(Long id);

}
