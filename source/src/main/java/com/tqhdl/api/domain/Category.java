package com.tqhdl.api.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Category")
@AttributeOverride(name = "id", column = @Column(name = "ID_category"))
@Getter
@Setter
public class Category extends AbstractEntity {

    @Column(name = "Title")
    private String title;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
    private Set<Product> products = new HashSet<>();
}
