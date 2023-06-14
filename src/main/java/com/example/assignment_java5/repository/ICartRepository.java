package com.example.assignment_java5.repository;

import com.example.assignment_java5.model.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ICartRepository extends JpaRepository<Cart, String> {
}
