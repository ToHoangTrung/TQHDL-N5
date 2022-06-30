package com.tqhdl.api.util;

import com.tqhdl.api.domain.Category;
import com.tqhdl.api.domain.dto.CategoryDto;

public class CategoryMapper {

    public static CategoryDto toCategoryDto(Category entity) {
        CategoryDto dto = new CategoryDto();
        dto.setCategoryName(entity.getTitle());
        return dto;
    }
}
