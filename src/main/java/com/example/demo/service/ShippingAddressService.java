package com.example.demo.service;

import com.example.demo.model.ShippingAddress;

public interface ShippingAddressService {

	public void addShippingAddress(ShippingAddress shippingAddress);
	
	ShippingAddress getShippingAddressById(long shippingAddressId);
}
