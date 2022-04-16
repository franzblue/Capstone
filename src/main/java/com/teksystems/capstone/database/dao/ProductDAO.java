package com.teksystems.capstone.database.dao;

import com.teksystems.capstone.database.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDAO extends JpaRepository<Product, Long> {
    Product findProductById(Integer productId);

    List<Product> findAll();
}
