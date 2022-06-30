package com.tqhdl.api.util;

import com.tqhdl.api.domain.DescriptionBill;
import com.tqhdl.api.domain.Product;
import com.tqhdl.api.domain.dto.ProductDto;

public class ProductMapper {

    public static ProductDto toProductDto(Product entity) {
        ProductDto dto = new ProductDto();
        dto.setProductName(entity.getProductName());
        if (entity.getCategory() != null) {
            dto.setCategory(CategoryMapper.toCategoryDto(entity.getCategory()));
        }
        return dto;
    }
}
