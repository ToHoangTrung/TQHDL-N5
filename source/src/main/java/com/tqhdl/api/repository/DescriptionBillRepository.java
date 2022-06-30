package com.tqhdl.api.repository;

import com.tqhdl.api.domain.DescriptionBill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DescriptionBillRepository extends JpaRepository<DescriptionBill, Integer> {

    List<DescriptionBill> findByBillId(Integer billId);
}
