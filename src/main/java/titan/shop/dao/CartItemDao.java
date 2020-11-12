package titan.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import titan.shop.model.Cart;
import titan.shop.model.CartItem;
import titan.shop.model.Product;

@Repository

public interface CartItemDao extends CrudRepository<CartItem, Long>{

	List<CartItem> findUserByProduct(Product product);
	
	void removeByCart(Cart cart);
	
	List<CartItem> findAllCartItemsBycart(Cart cart);
	
	@Modifying
	@Transactional
	@Query(value="DELETE  FROM cartItem  WHERE cartItemId = :cartItemId ",nativeQuery=true)
    void deleteCartItemById(@Param("cartItemId")long cartItemId);
	
	
	
	
}
