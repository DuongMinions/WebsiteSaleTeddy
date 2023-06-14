package com.example.assignment_java5.controller;

import com.example.assignment_java5.model.Product;
import com.example.assignment_java5.service.IProductService;
import com.example.assignment_java5.util.UploadImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/mon-gau-bong")
public class ProductManagementController {
    @Autowired
    private IProductService productService;
    @Autowired
    private UploadImage uploadImage;

    //Lấy dữ liệu bên data lên table
    @GetMapping("/quan-li-san-pham")
    public String viewQuanLiSanPham(Model model) {
        List<Product> productList = productService.getAll();
        model.addAttribute("productList", productList);
        return "product-management";
    }

    // Thêm sản phẩm vào data
    @PostMapping("/quan-li-san-pham/add")
    public String addSanPham(Model model, @RequestParam(name = "image") MultipartFile multipartFile,
                             @RequestParam(name = "productCode") String productCode,
                             @RequestParam(name = "productName") String productName,
                             @RequestParam(name = "color") String color,
                             @RequestParam(name = "size") String size,
                             @RequestParam(name = "quantity") Integer quantity,
                             @RequestParam(name = "price") BigDecimal price,
                             @RequestParam(name = "importPrice") BigDecimal importPrice,
                             @RequestParam(name = "material") String material,
                             @RequestParam(name = "describe") String describe,
                             @RequestParam(name = "status") Boolean status,
                             @RequestParam(name = "namBh") Integer namBh
    ) {
        Product product = Product.builder()
                .image(multipartFile.getOriginalFilename())
                .productCode(productCode)
                .productName(productName)
                .color(color)
                .quantity(quantity)
                .size(size)
                .price(price)
                .importPrice(importPrice)
                .material(material)
                .describe(describe)
                .status(status)
                .namBh(namBh)
                .build();
        uploadImage.handerUpLoadFile(multipartFile);
        productService.addProduct(product);
        List<Product> productList = productService.getAll();
        model.addAttribute("productList", productList);
        return "product-management";
    }

    //
    @GetMapping("/quan-li-san-pham/delete/{productId}")
    public String deleteSanPham(@PathVariable("productId") String productId) {
        productService.deleteProduct(productId);
        return "redirect:/mon-gau-bong/quan-li-san-pham";
    }

    //Show sản phẩm chi tiết
    @GetMapping("/detail/{productId}")
    public String detailSP(Model model, @PathVariable("productId") String productId) {
        Product product = productService.detailProduct(productId);
        model.addAttribute("detail", product);
        List<Product> listProduct = productService.getAll();
        model.addAttribute("productList", listProduct);
        return "detail-product";
    }


    //
    @GetMapping("/quan-li-san-pham/update/{productId}")
    public String update(Model model, @PathVariable("productId") String productId) {
        Product product = productService.detailProduct(productId);
        model.addAttribute("detail", product);
        return "update-product";
    }

    //
    @PostMapping("/quan-li-san-pham/update/{productId}")
    public String update(Model model, @RequestParam(name = "productId") String productId, @ModelAttribute("product")
            Product product) {
        productService.updateProduct(productId,product);
        model.addAttribute("thongBao", "sửa thành công");
        return "redirect:/mon-gau-bong/quan-li-san-pham";
    }
//
    @GetMapping("/quan-li-san-pham/search")
    public String viewSearch(Model model, @RequestParam("products") String keyword) {
        List<Product> listSearch = productService.searchName(keyword);
        model.addAttribute("productList", listSearch);
        return "product-management";
    }
//
//    @GetMapping("/quan-li-san-pham/findByGiaBanBetween")
//    public String findByGiaBanBetween(Model model, @RequestParam("min") Integer min, @RequestParam("max") Integer max) {
//        List<SanPham> listSearch = iSanPhamService.findByGiaBanBetween(min, max);
//        model.addAttribute("listSP", listSearch);
//        return "quan-li-san-pham";
//    }
//    }
}
