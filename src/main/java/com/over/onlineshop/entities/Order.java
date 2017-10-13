package com.over.onlineshop.entities;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Size;
import java.sql.Timestamp;
import java.util.Set;

@Entity
@Table(name = "order" , schema = "onlineshop")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "adress")
    private String adress;

    @Column(name = "firstname")
    @NotEmpty(message = "Firstname could not be empty")
    private String firstName;

    @Column(name = "lastname")
    @NotEmpty(message = "Lastname could not be empty")
    private String lastName;

    @Column(name = "ordertime")
    private Timestamp orderTime;

    @Column(name = "phone")
    @NotEmpty
    @Size(min = 10, max = 12, message = "Incorrect phone number")
    private String phone;

    @Column(name = "delivery")
    @NotEmpty(message = "Choose the delivery option")
    private String delivery;

    @Column(name = "commentary")
    private String commentary;

    @OneToMany(mappedBy = "order", fetch = FetchType.LAZY)
    private Set<OrderedProduct> orderedProducts;

    @Column(name = "state")
    private String state;

    @Column(name = "totalPrice")
    private double totalPrice;

    @AssertTrue(message = "You have not agreed with the Terms and Conditions")
    @Transient
    private boolean licenseAgreement;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getCommentary() {
        return commentary;
    }

    public void setCommentary(String commentary) {
        this.commentary = commentary;
    }

    public Set<OrderedProduct> getOrderedProducts() {
        return orderedProducts;
    }

    public void setOrderedProducts(Set<OrderedProduct> orderedProducts) {
        this.orderedProducts = orderedProducts;
    }

    public boolean isLicenseAgreement() {
        return licenseAgreement;
    }

    public void setLicenseAgreement(boolean licenseAgreement) {
        this.licenseAgreement = licenseAgreement;
    }
}
