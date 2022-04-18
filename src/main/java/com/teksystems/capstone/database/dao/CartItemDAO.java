package com.teksystems.capstone.database.dao;

import com.teksystems.capstone.database.entity.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface CartItemDAO extends JpaRepository<CartItem, Long> {

}
