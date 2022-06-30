package com.tqhdl.api.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Bill")
@AttributeOverride(name = "id", column = @Column(name = "ID_bill"))
@Getter
@Setter
public class Bill extends AbstractEntity{

    @Column(name = "ID_ship")
    private Integer shipId;

    @JoinColumn(name = "ID_user")
    @ManyToOne(fetch = FetchType.LAZY)
    private User user;

    @JoinColumn(name = "ID_shop")
    @ManyToOne(fetch = FetchType.LAZY)
    private Shop shop;

    @Column(name = "Total_count")
    private Integer totalCount;

    @Column(name = "Total_money")
    private Integer totalMoney;

    @Column(name = "activity")
    private Integer activity;

    @Column(name = "date_purchased")
    private LocalDate datePurchased;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "bill")
    private Set<DescriptionBill> descriptionBills = new HashSet<>();
}
