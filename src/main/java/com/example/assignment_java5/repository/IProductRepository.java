package com.example.assignment_java5.repository;

import com.example.assignment_java5.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IProductRepository extends JpaRepository<Product, String> {
    List<Product> findByProductNameContains(String keyword);
}
