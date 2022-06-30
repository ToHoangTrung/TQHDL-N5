package com.tqhdl.api.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "Cart")
@AttributeOverride(name = "id", column = @Column(name = "ID_cart"))
@Getter
@Setter
public class Cart extends AbstractEntity{

    @JoinColumn(name = "ID_product")
    @ManyToOne(fetch = FetchType.LAZY)
    private Product product;

    @JoinColumn(name = "ID_user")
    @ManyToOne(fetch = FetchType.LAZY)
    private User user;

    @Column(name = "countProduct")
    private Integer countProduct;
}
