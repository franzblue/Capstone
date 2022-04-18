package com.teksystems.capstone.database.dao;

import com.teksystems.capstone.database.entity.ShoppingCart;
import com.teksystems.capstone.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ShoppingCartDAO extends JpaRepository<ShoppingCart, Long> {

    ShoppingCart findByUser(@Param("user") User user);
}
