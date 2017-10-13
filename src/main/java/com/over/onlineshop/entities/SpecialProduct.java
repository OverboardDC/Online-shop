package com.over.onlineshop.entities;

import javax.persistence.*;

/**
 * Created by Admin on 22.07.2017.
 */
@Entity
@Table(name = "specialproducts", schema = "onlineshop")
public class SpecialProduct {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id", table = "specialproducts")
    private Product product;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
