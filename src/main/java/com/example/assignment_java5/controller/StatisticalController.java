package com.example.assignment_java5.controller;

import com.example.assignment_java5.model.customer.Top10BanChay;
import com.example.assignment_java5.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/mon-gau-bong")
public class StatisticalController {
    @Autowired
    private BillService billService;

    @GetMapping("/thong-ke")
    public String viewThongKe(Model model) {
        List<Top10BanChay> top3SPBC = billService.findTopByQuantity();
        model.addAttribute("listTop3", top3SPBC);
        List<Integer>listSum = billService.getSum();
        model.addAttribute("listSum", listSum);
        List<String>listNameProduct = billService.getNameProduct();
        model.addAttribute("listName", listNameProduct);
        return "statistical";
    }
}
