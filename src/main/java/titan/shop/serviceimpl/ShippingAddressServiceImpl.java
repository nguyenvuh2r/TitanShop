package titan.shop.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import titan.shop.dao.ShippingAddressDao;
import titan.shop.model.ShippingAddress;
import titan.shop.service.ShippingAddressService;

@Service

public class ShippingAddressServiceImpl implements ShippingAddressService{

	@Autowired
	private ShippingAddressDao shippingAddressDao;
	@Transactional()
	@Override
	public void addShippingAddress(ShippingAddress shippingAddress) {
		
		shippingAddressDao.save(shippingAddress);
		
	}
	@Transactional(readOnly = true)
	@Override
	public ShippingAddress getShippingAddressById(long shippingAddressId) {
		
		return shippingAddressDao.getOne(shippingAddressId);
	}

}
