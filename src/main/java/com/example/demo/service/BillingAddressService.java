package com.example.demo.service;

import com.example.demo.model.BillingAddress;

public interface BillingAddressService {

	public void addBillingAddress(BillingAddress billingAddress);
	
	BillingAddress getBillingAddressbyId(long billingAddressId);
}
