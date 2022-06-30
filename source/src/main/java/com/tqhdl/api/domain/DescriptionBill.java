package com.tqhdl.api.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "Description_Bill")
@AttributeOverride(name = "id", column = @Column(name = "ID_des"))
@Getter
@Setter
public class DescriptionBill extends AbstractEntity{

    @JoinColumn(name = "ID_bill")
    @ManyToOne(fetch = FetchType.LAZY)
    private Bill bill;

    @JoinColumn(name = "id_product")
    @ManyToOne(fetch = FetchType.LAZY)
    private Product product;

    @Column(name = "Count_product")
    private Integer countProduct;
}
