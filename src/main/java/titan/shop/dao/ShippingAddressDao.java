package titan.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import titan.shop.model.ShippingAddress;

@Repository

public interface ShippingAddressDao extends JpaRepository<ShippingAddress, Long>{

}
