package titan.shop.service;

import titan.shop.model.ShippingAddress;

public interface ShippingAddressService {

	public void addShippingAddress(ShippingAddress shippingAddress);
	
	ShippingAddress getShippingAddressById(long shippingAddressId);
}
