package com.example.assignment_java5.controller;

import com.example.assignment_java5.model.Product;
import com.example.assignment_java5.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mon-gau-bong")
public class HomeController {
    //    Phân trang bên trang chủ
    @Autowired
    private IProductService productService;
    @GetMapping("/trang-chu")
    public String viewTrangChu(Model model) {
        return listTrangChu(model, 1);
    }

    @GetMapping(value = "/trang-chu/page/{pageNumber}")
    public String listTrangChu(Model model, @PathVariable("pageNumber") int currentPage) {
        Page<Product> page = productService.pageProduct(currentPage);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("listSP", page.getContent());
        return "home";
    }

}
