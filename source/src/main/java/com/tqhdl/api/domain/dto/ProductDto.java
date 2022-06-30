package com.tqhdl.api.domain.dto;

import com.tqhdl.api.domain.Category;
import com.tqhdl.api.domain.Shop;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Getter
@Setter
public class ProductDto {
    private String productName;
    private Integer productPrice;
    private Integer amountPurchased;
    private CategoryDto category;
}
