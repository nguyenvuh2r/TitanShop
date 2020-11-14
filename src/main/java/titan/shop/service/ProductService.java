package titan.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;

import titan.shop.model.Product;

public interface ProductService {

	void addProduct(Product product);
	
	Page<Product> getAllProduct(Integer pageNumber);
	
	List<Product> getAllProduct();
	
	Product getProductById(long productId);
	
	void updateProduct(Product product);
	
	void deleteProduct(long productId);
	
}
