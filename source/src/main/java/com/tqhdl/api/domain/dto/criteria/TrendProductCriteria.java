package com.tqhdl.api.domain.dto.criteria;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class TrendProductCriteria {
    private Integer categoryId;
    private LocalDate startDate;
    private LocalDate endDate;
}
