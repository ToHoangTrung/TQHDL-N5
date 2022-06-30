package com.tqhdl.api.service.impl;

import com.tqhdl.api.domain.Bill;
import com.tqhdl.api.domain.Category;
import com.tqhdl.api.domain.DescriptionBill;
import com.tqhdl.api.domain.Product;
import com.tqhdl.api.domain.dto.ProductDto;
import com.tqhdl.api.repository.BillRepository;
import com.tqhdl.api.repository.CategoryRepository;
import com.tqhdl.api.repository.DescriptionBillRepository;
import com.tqhdl.api.service.ProductService;
import com.tqhdl.api.util.ProductMapper;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private BillRepository billRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private DescriptionBillRepository descriptionBillRepository;

    @Override
    public List<ProductDto> getTrendProducts(Integer categoryId, LocalDate startDate, LocalDate endDate) {

        List<DescriptionBill> descriptionBills;

        Category category = categoryRepository.findById(categoryId).orElseGet(() -> null);

        if (startDate != null && endDate != null) {
            descriptionBills = billRepository.findByDatePurchasedBetween(startDate, endDate)
                    .stream().map(bill -> descriptionBillRepository.findByBillId(bill.getId())).flatMap(Collection::stream).collect(Collectors.toList());
        } else {
            descriptionBills = billRepository.findAll()
                    .stream().map(bill -> descriptionBillRepository.findByBillId(bill.getId())).flatMap(Collection::stream).collect(Collectors.toList());
        }

        if (category != null) {
            descriptionBills = descriptionBills.stream()
                    .filter(descriptionBill -> descriptionBill.getProduct().getCategory() == category)
                    .collect(Collectors.toList());
        }

        Map<Product, Integer> trendProductsByAmountPurchased = new HashMap<>();

        descriptionBills.forEach(descriptionBill -> {
            Integer amountPurchased = trendProductsByAmountPurchased.get(descriptionBill.getProduct());
            if (amountPurchased == null) {
                amountPurchased = 0;
            }
            trendProductsByAmountPurchased.put(descriptionBill.getProduct(), amountPurchased + descriptionBill.getCountProduct());
        });

        List<ProductDto> trendProducts = new ArrayList<>();

        trendProductsByAmountPurchased.forEach((product, amountPurchased) -> {
            ProductDto productDto = ProductMapper.toProductDto(product);
            productDto.setAmountPurchased(amountPurchased);
            trendProducts.add(productDto);
        });
        return trendProducts.stream()
                .sorted(Comparator.comparing(ProductDto::getAmountPurchased).reversed())
                .limit(10)
                .collect(Collectors.toList());
    };
}
