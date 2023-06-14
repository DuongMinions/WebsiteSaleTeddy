package com.example.assignment_java5.service;

import com.example.assignment_java5.model.Bill;
import com.example.assignment_java5.model.customer.Top10BanChay;

import java.util.List;

public interface BillService {
    Bill addBill(Bill bill);
    List<Bill> getAll();
    Bill getOne(String billId);
    List<Top10BanChay> findTopByQuantity();
    List<Integer>getSum();
    List<String> getNameProduct();
}
