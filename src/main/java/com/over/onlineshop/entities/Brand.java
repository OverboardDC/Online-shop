package com.over.onlineshop.entities;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "brand", schema = "onlineshop")
public class Brand {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name", unique = true)
    private String name;

    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "brands")
    private Set<Category> categories;

    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "brands")
    private Set<Section> sections;

    @OneToMany(mappedBy = "brand", fetch = FetchType.LAZY)
    private Set<Product> products;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    public Set<Section> getSections() {
        return sections;
    }

    public void setSections(Set<Section> sections) {
        this.sections = sections;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }
}
