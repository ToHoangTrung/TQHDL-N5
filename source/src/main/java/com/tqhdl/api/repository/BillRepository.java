package com.tqhdl.api.repository;

import com.tqhdl.api.domain.Bill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface BillRepository extends JpaRepository<Bill, Integer> {

    List<Bill> findByDatePurchasedBetween(LocalDate startDate, LocalDate endDate);
}
