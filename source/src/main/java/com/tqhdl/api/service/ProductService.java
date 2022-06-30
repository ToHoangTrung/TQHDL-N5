package com.tqhdl.api.service;

import com.tqhdl.api.domain.Category;
import com.tqhdl.api.domain.dto.ProductDto;

import java.time.LocalDate;
import java.util.List;

public interface ProductService {

    List<ProductDto> getTrendProducts(Integer categoryId, LocalDate startDate, LocalDate endDate);
}
