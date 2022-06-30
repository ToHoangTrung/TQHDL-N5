package com.tqhdl.api.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "_User")
@AttributeOverride(name = "id", column = @Column(name = "ID_user"))
@Getter
@Setter
public class User extends AbstractEntity{

    @JoinColumn(name = "ID_shop")
    @ManyToOne(fetch = FetchType.LAZY)
    private Shop shop;

    @Column(name = "ID_ship")
    private Integer shipId;

    @JoinColumn(name = "ID_role")
    @ManyToOne(fetch = FetchType.LAZY)
    private Role role;

    @Column(name = "age")
    private Integer age;

    @Column(name = "UserName")
    private String username;

    @Column(name = "phone")
    private String phone;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userShop")
    private Set<Contract> contracts = new HashSet<>();

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private Set<Account> accounts = new HashSet<>();

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private Set<Bill> bills = new HashSet<>();

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private Set<Cart> carts = new HashSet<>();
}
