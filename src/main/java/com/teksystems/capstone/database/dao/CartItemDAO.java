package com.teksystems.capstone.database.dao;

import com.teksystems.capstone.database.entity.CartItem;
import com.teksystems.capstone.database.entity.ShoppingCart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CartItemDAO extends JpaRepository<CartItem, Long> {

    List<CartItem> findAllByShoppingCart(ShoppingCart shoppingCart);

    CartItem findCartItemById(Integer cartItemId);

    @Query(value = "SELECT sum(c.quantity) FROM Capstone.cart_item c JOIN Capstone.shopping_cart s ON c.cart_id = s.id WHERE s.user_id = :userId", nativeQuery = true)
    Integer cartCount(@Param("userId") Integer userId);
}
