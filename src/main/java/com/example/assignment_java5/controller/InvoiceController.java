package com.example.assignment_java5.controller;

import com.example.assignment_java5.model.Bill;
import com.example.assignment_java5.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/mon-gau-bong")
public class InvoiceController {
    @Autowired
    private BillService billService;

    @GetMapping("/quan-li-hoa-don")
    public String viewQuanLiHoaDon(Model model) {
        List<Bill> listBill = billService.getAll();
        model.addAttribute("listBill", listBill);
        return "invoice-management";
    }

    @GetMapping("/quan-li-hoa-don/chi-tiet/{billId}")
    public String detailBill(Model model, @PathVariable("billId") String billId) {
        Bill bill = billService.getOne(billId);
        model.addAttribute("detailBill", bill);
        return "invoice-details";
    }

}
