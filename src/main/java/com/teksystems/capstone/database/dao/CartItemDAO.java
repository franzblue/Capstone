package com.teksystems.capstone.database.dao;

import com.teksystems.capstone.database.entity.Animal;
import com.teksystems.capstone.database.entity.CartItem;
import com.teksystems.capstone.database.entity.ShoppingCart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CartItemDAO extends JpaRepository<CartItem, Long> {

    List<CartItem> findAllByShoppingCart(ShoppingCart shoppingCart);
}
