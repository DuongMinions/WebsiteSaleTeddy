package com.example.assignment_java5.controller;

import com.example.assignment_java5.model.Cart;
import com.example.assignment_java5.model.Product;
import com.example.assignment_java5.service.ICartService;
import com.example.assignment_java5.service.IProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/mon-gau-bong")
public class CartController {
    @Autowired
    private ICartService iCartService;
    @Autowired
    private HttpSession httpSession;
    @Autowired
    private IProductService productService;

    @GetMapping("/gio-hang/add-to-cart/{productId}")
    public String addToCart(@PathVariable("productId") String productId) {
        iCartService.addProductToCart(productId, 1);
//        httpSession.invalidate();
        return "redirect:/mon-gau-bong/gio-hang";
    }

    //giỏ hàng
    @GetMapping("/gio-hang")
    public String cartProduct(Model model) {
        Map<String, Integer> productInCart = iCartService.laySanPhamTrongGio();
        Set<String> key = productInCart.keySet();
        Map<Product, Integer> danhSachCart = new HashMap<>();
        int tongTienHang = 0;
        int quantityProductInToCart = 0;
        for (String keyPro : key) {
            Integer value = productInCart.get(keyPro);
            Product product = productService.detailProduct(keyPro);
            danhSachCart.put(product, value);
            tongTienHang += product.getPrice().intValue() * value;
            quantityProductInToCart += value;
        }
        model.addAttribute("listProductInCart", danhSachCart);
        model.addAttribute("quantity", quantityProductInToCart);
        model.addAttribute("quantityInCart", productInCart.size());
        model.addAttribute("sum", tongTienHang);
        return "cart";
    }
    @GetMapping("/delete-cart/{productId}")
    public String deleteCart(Model model, @PathVariable("productId")String id){
//        Cart id1 = iCartService.getOne(id);

        return "redirect:/mon-gau-bong/gio-hang";
    }
}
