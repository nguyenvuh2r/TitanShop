package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Cart;
import com.example.demo.model.CustomerOrder;

public interface CustomerOrderService {

	public void addCustomerOrder(CustomerOrder customerOrder);

	

	double getCustomerOrderGrandTotal(long cartId);
	
	CustomerOrder getCustomerOrderBycart(Cart cart);
	
	List<CustomerOrder> getAllCustomerOrder();
	
	
	public CustomerOrder getCustomerOrderById(long customerOrderId);
	
	public void deleteCustomerOrderById(long customerOrderId);
	
}
