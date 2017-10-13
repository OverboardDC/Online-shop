package com.over.onlineshop.entities;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "category", schema = "onlineshop")
public class Category {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn( name = "section_id")
    private Section section;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "categorybrand", joinColumns = {
            @JoinColumn(name = "category_id")}, inverseJoinColumns = {
            @JoinColumn(name = "brand_id")
    })
    private Set<Brand> brands;


    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    private Set<Product> products;


    @Column(name = "name")
    private String name;

    public Long getId() {
        return id;
    }

    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.section = section;
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

    public Set<Brand> getBrands() {
        return brands;
    }

    public void setBrands(Set<Brand> brands) {
        this.brands = brands;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }
}
