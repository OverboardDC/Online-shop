package com.over.onlineshop.entities;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.*;

@Entity
@Table(name = "product", schema = "onlineshop")
public class Product {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    @NotEmpty(message = "Should not be empty")
    private String name;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name = "category_id", table = "product")
    private Category category;

    @ManyToOne(fetch = FetchType.EAGER , cascade = CascadeType.MERGE)
    @JoinColumn(name = "brand_id", table = "product")
    private Brand brand;

    @Column(name = "image")
    private byte[] image;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    private Set<Image> images;

    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    private Set<Cart> carts;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    private Set<OrderedProduct> orderedProducts;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    private List<Commentary> commentaries;

    @Column(name = "description")
    private String description;

    @Column(name = "amount")
    @NotNull
    private int amount;

    @Column(name = "price")
    @NotNull
    private double price;

    @Column(name = "isDiscount")
    private boolean isDiscount;

    @Column(name = "oldPrice")
    private double oldPrice;

    @Column(name = "selled")
    private int selled;

    @Column(name = "addingDate", updatable = false)
    private Date addingDate;

    @OneToMany(mappedBy = "product")
    private Set<SpecialProduct> specialProductSet = new HashSet<>();

    @Transient
    private MultipartFile file;

    public Product() {
    }

    public Product(String name, Category category, Brand brand, byte[] image, String description, int amount, double price, boolean isDiscount, double oldPrice) {
        this.name = name;
        this.category = category;
        this.brand = brand;
        this.image = image;
        this.description = description;
        this.amount = amount;
        this.price = price;
        this.isDiscount = isDiscount;
        this.oldPrice = oldPrice;
    }

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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isDiscount() {
        return isDiscount;
    }

    public void setDiscount(boolean discount) {
        isDiscount = discount;
    }

    public double getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(double oldPrice) {
        this.oldPrice = oldPrice;
    }

    public Set<SpecialProduct> getSpecialProductSet() {
        return specialProductSet;
    }

    public void setSpecialProductSet(Set<SpecialProduct> specialProductSet) {
        this.specialProductSet = specialProductSet;
    }

    public Date getAddingDate() {
        return addingDate;
    }

    public void setAddingDate(Date addingDate) {
        this.addingDate = addingDate;
    }

    public int getSelled() {
        return selled;
    }

    public void setSelled(int selled) {
        this.selled = selled;
    }

    public Set<Image> getImages() {
        return images;
    }

    public void setImages(Set<Image> images) {
        this.images = images;
    }

    public Set<Cart> getCarts() {
        return carts;
    }

    public void setCarts(Set<Cart> carts) {
        this.carts = carts;
    }

    public Set<OrderedProduct> getOrderedProducts() {
        return orderedProducts;
    }

    public void setOrderedProducts(Set<OrderedProduct> orderedProducts) {
        this.orderedProducts = orderedProducts;
    }

    public List<Commentary> getCommentaries() {
        return commentaries;
    }

    public void setCommentaries(List<Commentary> commentaries) {
        this.commentaries = commentaries;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", category=" + category +
                ", brand=" + brand +
                ", image=" + Arrays.toString(image) +
                ", images=" + images +
                ", carts=" + carts +
                ", orderedProducts=" + orderedProducts +
                ", commentaries=" + commentaries +
                ", description='" + description + '\'' +
                ", amount=" + amount +
                ", price=" + price +
                ", isDiscount=" + isDiscount +
                ", oldPrice=" + oldPrice +
                ", selled=" + selled +
                ", addingDate=" + addingDate +
                ", specialProductSet=" + specialProductSet +
                ", file=" + file +
                '}';
    }
}
