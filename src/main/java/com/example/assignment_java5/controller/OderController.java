package com.example.assignment_java5.controller;

import com.example.assignment_java5.model.Account;
import com.example.assignment_java5.model.Bill;
import com.example.assignment_java5.model.Cart;
import com.example.assignment_java5.model.Product;
import com.example.assignment_java5.service.BillService;
import com.example.assignment_java5.service.ICartService;
import com.example.assignment_java5.service.IProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/mon-gau-bong")
public class OderController {
    @Autowired
    private IProductService productService;
    @Autowired
    private ICartService iCartService;
    @Autowired
    private BillService billService;

    @Autowired
    private HttpSession httpSession;

    @PostMapping("/add-bill")
    public String addBill(Model model, @RequestParam(name = "nameClient") String nameClient,
                          @RequestParam(name = "phoneClient") String phoneNumber,
                          @RequestParam(name = "address") String address) {

        Account account = (Account) httpSession.getAttribute("accuont");
        Map<String, Integer> productInCart = iCartService.laySanPhamTrongGio();
        Set<String> key = productInCart.keySet();
        Map<Product, Integer> listCart = new HashMap<>();
        int tongTienHang = 0;
        int quantityProductInToCart = 0;
        for (String keyPro : key) {
            Integer value = productInCart.get(keyPro);
            Product product = productService.detailProduct(keyPro);
            listCart.put(product, value);
            tongTienHang += product.getPrice().intValue() * value;
            quantityProductInToCart += value;
            java.util.Date date = new java.util.Date();
            Cart cart = iCartService.getOne("333736C5-B3F3-433A-92BA-11CC89A06374");
            product.setQuantity(product.getQuantity() - quantityProductInToCart);
            Bill bill = new Bill(null, account, product, cart, new java.sql.Date(date.getTime()),
                    new java.sql.Date(date.getTime()), new java.sql.Date(date.getTime()),
                    new java.sql.Date(date.getTime()), 1, nameClient, address, phoneNumber,
                    quantityProductInToCart, null, BigDecimal.valueOf(tongTienHang));
            billService.addBill(bill);
            productInCart.clear();
        }
        model.addAttribute("hoaDon", "Thanh toán thành công");
        return "cart";
    }

//    @GetMapping("/buy-now/add/{productId}")
//    public String addBuyNow(@PathVariable("productId") String productId) {
//        iCartService.addProductToCart(productId, 1);
//        return "redirect:/mon-gau-bong/buy-now";
//    }

    //giỏ hàng
    @GetMapping("/buy-now/add/{productId}")
    public String buyNowProduct(Model model, @PathVariable("productId")String productId) {
        Product product = productService.detailProduct(productId);
        model.addAttribute("detailBuyNow", product);
        return "buy-now";
    }

    @PostMapping("/add-buy-now")
    public String addBuyNow(Model model, @RequestParam(name = "nameClient") String nameClient,
                            @RequestParam(name = "phoneClient") String phoneNumber,
                            @RequestParam(name = "address") String address,
                            @RequestParam(name = "quantity") Integer quantity) {

        Account account = (Account) httpSession.getAttribute("account");
        List<Bill> list = new ArrayList<>();
        int tongTienHang = 0;
        for (Bill billList : list) {
            Integer value = quantity;
            Product product = productService.detailProduct(billList.getBillId());
            tongTienHang += product.getPrice().intValue() * value;
            java.util.Date date = new java.util.Date();
            Cart cart = iCartService.getOne("333736C5-B3F3-433A-92BA-11CC89A06374");
            product.setQuantity(product.getQuantity() - value);
            Bill bill = new Bill(null, account, product, cart, new java.sql.Date(date.getTime()),
                    new java.sql.Date(date.getTime()), new java.sql.Date(date.getTime()),
                    new java.sql.Date(date.getTime()), 1, nameClient, address, phoneNumber,
                    quantity, null, BigDecimal.valueOf(tongTienHang));
            billService.addBill(bill);
        }
        model.addAttribute("sumBill", tongTienHang);
        model.addAttribute("hoaDon", "Thanh toán thành công");
        return "redirect:/mon-gau-bong/trang-chu";
    }
}
