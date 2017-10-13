package com.over.onlineshop.entities;

import javax.persistence.*;
import java.util.List;
import java.util.Set;


@Entity
@Table(name = "section", schema = "onlineshop")
public class Section {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "section", fetch = FetchType.LAZY)
    private List<Category> categories;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "sectionbrand", joinColumns = {
            @JoinColumn(name = "section_id")}, inverseJoinColumns = {
            @JoinColumn(name = "brand_id")
    })
    private Set<Brand> brands;

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

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public Set<Brand> getBrands() {
        return brands;
    }

    public void setBrands(Set<Brand> brands) {
        this.brands = brands;
    }
}
