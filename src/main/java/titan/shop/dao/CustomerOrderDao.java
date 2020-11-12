package titan.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import titan.shop.model.Cart;
import titan.shop.model.CustomerOrder;

@Repository

public interface CustomerOrderDao extends JpaRepository<CustomerOrder, Long>{

	CustomerOrder getCustomerOrderBycart(Cart cart);
}
