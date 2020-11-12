package titan.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import titan.shop.model.BillingAddress;

@Repository
public interface BillingAddressDao extends JpaRepository<BillingAddress, Long>{
	
	
	 
}
