package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Cart;
import com.example.demo.model.CartItem;

public interface CartItemService {

	public void addCartItem(CartItem cartItem);
	
	public void deleteCartItem(CartItem cartItem);
	
	
	public void removeAllCartItems(Cart cart);
	
	CartItem getCartItemByProduct(long productId);
	List<CartItem> findAllCartItemsBycart(Cart cart);
}
