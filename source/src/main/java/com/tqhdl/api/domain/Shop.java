package com.tqhdl.api.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Shop")
@AttributeOverride(name = "id", column = @Column(name = "ID_shop"))
@Getter
@Setter
public class Shop extends AbstractEntity{

    @Column(name = "ShopAddress")
    private String shopAddress;

    @Column(name = "ShopName")
    private String shopName;

    @Column(name = "hotline")
    private String hotline;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "shop")
    private Set<Bill> bills = new HashSet<>();

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "shop")
    private Set<Product> products = new HashSet<>();
}
