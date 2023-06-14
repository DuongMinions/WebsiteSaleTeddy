package com.example.assignment_java5.service.impl;

import com.example.assignment_java5.model.Cart;
import com.example.assignment_java5.model.Product;
import com.example.assignment_java5.repository.ICartRepository;
import com.example.assignment_java5.service.ICartService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class CartServiceImpl implements ICartService {
    @Autowired
    private HttpSession httpSession;
    @Autowired
    private ICartRepository iCartRepository;
    private Map<String, Integer> productInCart = new HashMap<>();

    private Map<String, Integer> productInCart(){
        return productInCart;
    }

    public Map<String, Integer> getProductInCart() {
        return productInCart;
    }

    public void setProductInCart(Map<String, Integer> productInCart) {
        this.productInCart = productInCart;
    }


    @Override
    public void addProductToCart(String productId, Integer quantity) {
            Map<String, Integer> productInCart = getProductInCart();

            // Kiểm tra trong giỏ có sản phẩm muốn thêm chưa
            if (productInCart.containsKey(productId)) { // Nếu có rồi thì cộng dồn
                // Lấy số lượng sản phẩm hiện có
                Integer soLuongHienCo = productInCart.get(productId);

                // Cộng dồn
                Integer soLuongMoi = soLuongHienCo + quantity;

                // Cập nhập lại giỏ hàng
                productInCart.put(productId, soLuongMoi);
                httpSession.invalidate();
            } else { // Sản phẩm không có trong giỏ, thêm mới vào
                productInCart.put(productId, quantity);
            }
    }

    @Override
    public Map<String, Integer> laySanPhamTrongGio() {
        return getProductInCart();
    }

    @Override
    public Cart getOne(String cartId) {
        return iCartRepository.findById(cartId).get();
    }

    @Override
    public void deleteCart(String id) {
        Cart cart = iCartRepository.findById(id).get();
        iCartRepository.delete(cart);
    }

}
