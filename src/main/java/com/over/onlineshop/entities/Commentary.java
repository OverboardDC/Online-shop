package com.over.onlineshop.entities;


import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "commentary", schema = "onlineshop")
public class Commentary {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", table = "commentary")
    private User user;

    @ManyToOne
    @JoinColumn(name = "product_id", table = "commentary")
    private Product product;

    @Column(name = "commentary")
    private String commentary;

    @Column(name = "date")
    private Date date;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCommentary() {
        return commentary;
    }

    public void setCommentary(String commentary) {
        this.commentary = commentary;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
