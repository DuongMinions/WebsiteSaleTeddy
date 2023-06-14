package com.example.assignment_java5.service.impl;

import com.example.assignment_java5.model.Product;
import com.example.assignment_java5.repository.IProductRepository;
import com.example.assignment_java5.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ProductServiceImpl implements IProductService {
    @Autowired
    private IProductRepository iProductRepository;

    @Override
    public List<Product> getAll() {
        return iProductRepository.findAll();
    }

    @Override
    public Page<Product> pageProduct(int pageNumber) {
        Pageable pageable = PageRequest.of(
                pageNumber - 1, 6
        );
        return iProductRepository.findAll(pageable);
    }

    @Override
    public Product addProduct(Product product) {
        return iProductRepository.save(product);
    }

    @Override
    public Product updateProduct(String id, Product product) {
        Product updatePr = iProductRepository.findById(id).get();
        updatePr.setProductName(product.getProductName());
        updatePr.setColor(product.getColor());
        updatePr.setDescribe(product.getDescribe());
        updatePr.setImage(product.getImage());
        updatePr.setImportPrice(product.getImportPrice());
        updatePr.setMaterial(product.getMaterial());
        updatePr.setNamBh(product.getNamBh());
        updatePr.setPrice(product.getPrice());
        updatePr.setQuantity(product.getQuantity());
        updatePr.setSize(product.getSize());
        updatePr.setStatus(product.getStatus());
        return iProductRepository.save(updatePr);
    }

    @Override
    public void deleteProduct(String id) {
        Product deleteProduct = iProductRepository.findById(id).get();
        iProductRepository.delete(deleteProduct);
    }

    @Override
    public Product detailProduct(String id) {
        return iProductRepository.findById(id).get();
    }

    @Override
    public List<Product> searchName(String keyword) {
        return iProductRepository.findByProductNameContains(keyword);
    }
}
