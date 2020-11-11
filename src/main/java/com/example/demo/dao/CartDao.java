package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Cart;

@Repository

public interface CartDao extends JpaRepository<Cart, Long> {

	Cart findUserBycartId(long cartId);
}
