package com.example.assignment_java5.service;

import com.example.assignment_java5.model.Cart;

import java.util.Map;

public interface ICartService {
    void addProductToCart(String productId, Integer quantity);
    Map<String, Integer> laySanPhamTrongGio();
    Cart getOne(String cartId);
    void deleteCart(String id);
}
