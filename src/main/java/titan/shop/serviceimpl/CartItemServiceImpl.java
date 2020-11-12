package titan.shop.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import titan.shop.dao.CartItemDao;
import titan.shop.model.Cart;
import titan.shop.model.CartItem;
import titan.shop.service.CartItemService;
import titan.shop.service.ProductService;

@Service

public class CartItemServiceImpl implements CartItemService{

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartItemDao cartItemDao;
	
	
	
	@Transactional()
	@Override
	public void addCartItem(CartItem cartItem) {
		
		cartItemDao.save(cartItem);
	}
	@Transactional()
	@Override
	public void deleteCartItem(CartItem cartItem) {
		
		
		
	
			
			
			
			cartItemDao.deleteCartItemById(cartItem.getCartItemId());
			
		
		
	}

	
	@Override
	public void removeAllCartItems(Cart cart) {
	
		List<CartItem> cartItems = cart.getCartItems();

        for (CartItem item : cartItems){
           deleteCartItem(item);
        }
		
	}
	@Transactional(readOnly = true)
	@Override
	public CartItem getCartItemByProduct(long productId) {
		
		List<CartItem> cartItems=cartItemDao.findUserByProduct(productService.getProductById(productId));
		
		return cartItems.get(0);
	}
	@Transactional(readOnly = true)
	@Override
	public List<CartItem> findAllCartItemsBycart(Cart cart) {
		
		return cartItemDao.findAllCartItemsBycart(cart);
	}

	

	

	
}
