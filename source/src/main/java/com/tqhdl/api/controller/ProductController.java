package com.tqhdl.api.controller;

import com.tqhdl.api.domain.dto.ProductDto;
import com.tqhdl.api.domain.dto.criteria.TrendProductCriteria;
import com.tqhdl.api.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @PostMapping("/get-trend-products")
    public List<ProductDto> getProductsByCatalogId(@RequestBody TrendProductCriteria criteria) {
        return productService.getTrendProducts(criteria.getCategoryId(), criteria.getStartDate(), criteria.getEndDate());
    }

    @GetMapping("/get-trend-products-demo")
    public List<ProductDto> getProductsByCatalogIdDemo() {
        return productService.getTrendProducts(0, LocalDate.of(2022,5,1), LocalDate.of(2022,6,27));
    }
}
