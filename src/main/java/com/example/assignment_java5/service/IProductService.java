package com.example.assignment_java5.service;

import com.example.assignment_java5.model.Product;
import org.springframework.data.domain.Page;

import java.util.List;

public interface IProductService {
    //getAll
    List<Product> getAll();

    //page
    Page<Product> pageProduct(int pageNumber);

    //add
    Product addProduct(Product product);

    //update
    Product updateProduct(String id, Product product);

    //delete
    void deleteProduct(String id);

    //detail
    Product detailProduct(String id);

    //search by name
    List<Product> searchName(String keyword);
}
