package com.example.assignment_java5.service.impl;

import com.example.assignment_java5.model.Bill;
import com.example.assignment_java5.model.customer.Top10BanChay;
import com.example.assignment_java5.repository.IBillRepository;
import com.example.assignment_java5.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BillServiceImpl implements BillService {
    @Autowired
    private IBillRepository iBillRepository;

    @Override
    public Bill addBill(Bill bill) {
        return iBillRepository.save(bill);
    }

    @Override
    public List<Bill> getAll() {
        return iBillRepository.findAll();
    }

    @Override
    public Bill getOne(String billId) {
        return iBillRepository.findById(billId).get();
    }

    @Override
    public List<Top10BanChay> findTopByQuantity() {
        return iBillRepository.findTopByQuantity();
    }

    @Override
    public List<Integer> getSum() {
        List<Integer> listSum = new ArrayList<>();
        List<Top10BanChay> top3SPBC = iBillRepository.findTopByQuantity();
        for (Top10BanChay dto : top3SPBC) {
            listSum.add(dto.getSum());
            System.out.println(dto.getSum());
        }
        return listSum;
    }

    @Override
    public List<String> getNameProduct() {
        List<String> listNameProduct = new ArrayList<>();
        List<Top10BanChay> top3SPBC = iBillRepository.findTopByQuantity();
        for (Top10BanChay dto : top3SPBC) {
            listNameProduct.add(dto.getNameProduct());
            System.out.println(dto.getNameProduct());
        }
        return listNameProduct;
    }
}
