package com.tqhdl.api.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "Product")
@AttributeOverride(name = "id", column = @Column(name = "ID_product"))
@Getter
@Setter
public class Product extends AbstractEntity{

    @JoinColumn(name = "ID_category")
    @ManyToOne(fetch = FetchType.LAZY)
    private Category category;

    @JoinColumn(name = "ID_shop")
    @ManyToOne(fetch = FetchType.LAZY)
    private Shop shop;

    @Column(name = "product_name")
    private String productName;

    @Column(name = "price")
    private Integer price;

    @Column(name = "quantity")
    private Integer quantity;
}
